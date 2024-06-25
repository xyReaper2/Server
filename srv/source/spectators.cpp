////////////////////////////////////////////////////////////////////////
// OpenTibia - an opensource roleplaying game
////////////////////////////////////////////////////////////////////////
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
////////////////////////////////////////////////////////////////////////
#include "otpch.h"
#include "spectators.h"

#include "player.h"

#include "chat.h"

#include "database.h"
#include "tools.h"

#include "game.h"
extern Game g_game;


extern Chat g_chat;


bool Spectators::check(const std::string& _password)
{
	if(password.empty())
		return true;

	std::string t = _password;
	return trimString(t) == password;
}

void Spectators::sendLook(ProtocolGame* client, const Position& pos, uint16_t spriteId, int16_t stackpos)
{
	if (!owner)
		return;

	SpectatorList::iterator sit = spectators.find(client);
	if (sit == spectators.end())
		return;

	Thing* thing = g_game.internalGetThing(client->player, pos, stackpos, spriteId, STACKPOS_LOOK);

	if (!thing)
	{
		return;
	}

	Position thingPos = pos;
	if (pos.x == 0xFFFF)
		thingPos = thing->getPosition();


	Position playerPos = client->player->getPosition();
	int32_t lookDistance = -1;
	if (thing != client->player)
	{
		lookDistance = std::max(std::abs(playerPos.x - thingPos.x), std::abs(playerPos.y - thingPos.y));
		if (playerPos.z != thingPos.z)
			lookDistance += 15;
	}


	std::ostringstream ss;
	ss << "You see " << thing->getDescription(lookDistance);

	if (Item * item = thing->getItem())//edited by matheus
	{

		if (client->player->hasCustomFlag(PlayerCustomFlag_CanSeeItemDetails))
		{
			ss << std::endl << "ItemID: [" << item->getID() << "]";
			if (item->getActionId() > 0)
				ss << ", ActionID: [" << item->getActionId() << "]";

			if (item->getUniqueId() > 0)
				ss << ", UniqueID: [" << item->getUniqueId() << "]";

			ss << ".";
			const ItemType& it = Item::items[item->getID()];
			if (it.transformEquipTo)
				ss << std::endl << "TransformTo: [" << it.transformEquipTo << "] (onEquip).";
			else if (it.transformDeEquipTo)
				ss << std::endl << "TransformTo: [" << it.transformDeEquipTo << "] (onDeEquip).";

			if (it.transformUseTo)
				ss << std::endl << "TransformTo: [" << it.transformUseTo << "] (onUse).";

			if (it.decayTo != -1)
				ss << std::endl << "DecayTo: [" << it.decayTo << "].";
		}
	}

	client->sendTextMessage(MSG_INFO_DESCR, ss.str());
	return;


}

void Spectators::handle(ProtocolGame* client, const std::string& text, uint16_t channelId)
{
	if(!owner)
		return;

	SpectatorList::iterator sit = spectators.find(client);
	if(sit == spectators.end())
		return;

	PrivateChatChannel* channel = g_chat.getPrivateChannel(owner->getPlayer());
	if(text[0] == '/')
	{
		StringVec t = explodeString(text.substr(1, text.length()), " ", true, 1);
		if(strcasecmp(t[0].c_str(), "show") == 0)
		{
			std::stringstream s;
			s << spectators.size() << " spectators. ";
			for(SpectatorList::const_iterator it = spectators.begin(); it != spectators.end(); ++it)
			{
				if(it != spectators.begin())
					s << " ,";

				s << it->second.first;
			}

			s << ".";
			client->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, s.str(), NULL, 0);
		}
		else if(strcasecmp(t[0].c_str(), "name") == 0)
		{
			if(t.size() > 1)
			{
				if(t[1].length() > 2)
				{
					if(t[1].length() < 26)
					{
						t[1] += " [G]";
						bool found = false;
						for(SpectatorList::iterator iit = spectators.begin(); iit != spectators.end(); ++iit)
						{
							if(strcasecmp(iit->second.first.c_str(), t[1].c_str()) != 0)
								continue;

							found = true;
							break;
						}

						if(!found)
						{
							client->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "Your name has been set to " + t[1] + ".", NULL, 0);
							if(!auth && channel)
								sendChannelMessage("", sit->second.first + " is now known as " + t[1] + ".", MSG_GAMEMASTER_CHANNEL, channel->getId());

							StringVec::iterator mit = std::find(mutes.begin(), mutes.end(), asLowerCaseString(sit->second.first));
							if(mit != mutes.end())
								(*mit) = asLowerCaseString(t[1]);

							sit->second.first = t[1];
							sit->second.second = false;
						}
						else
							client->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "Specified name is already taken.", NULL, 0);
					}
					else
						client->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "Specified name is too long.", NULL, 0);
				}
				else
					client->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "Specified name is too short.", NULL, 0);
			}
			else
				client->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "Not enough param(s) given.", NULL, 0);
		}
		else if(strcasecmp(t[0].c_str(), "auth") == 0)
		{
			if(t.size() > 1)
			{
				StringVec _t = explodeString(t[1], " ", true, 1);
				if(_t.size() > 1)
				{
					Database* db = Database::getInstance();
					DBQuery query;

					query << "SELECT `id`, `salt`, `password` FROM `accounts` WHERE `name` " << db->getStringComparer() << db->escapeString(_t[0]) << " LIMIT 1";
					if(DBResult_ptr result = db->storeQuery(query.str()))
					{
						std::string password = result->getDataString("salt") + _t[1],
							hash = result->getDataString("password");
						uint32_t id = result->getDataInt("id");

						if(encryptTest(password, hash))
						{
							query.str("");
							query << "SELECT `name` FROM `players` WHERE `account_id` = " << id << " ORDER BY `level` DESC LIMIT 1";
							if((result = db->storeQuery(query.str())))
							{
								std::string nickname = result->getDataString("name");

								client->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "You have authenticated as " + nickname + ".", NULL, 0);
								if(channel)
									sendChannelMessage("", sit->second.first + " authenticated as " + nickname + ".", MSG_GAMEMASTER_CHANNEL, channel->getId());

								StringVec::iterator mit = std::find(mutes.begin(), mutes.end(), asLowerCaseString(sit->second.first));
								if(mit != mutes.end())
									(*mit) = asLowerCaseString(nickname);

								sit->second.first = nickname;
								sit->second.second = true;
							}
							else
								client->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "Your account has no characters yet.", NULL, 0);
						}
						else
							client->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "Invalid password.", NULL, 0);
					}
					else
						client->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "Invalid account name.", NULL, 0);
				}
				else
					client->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "Not enough param(s) given.", NULL, 0);
			}
			else
				client->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "Not enough param(s) given.", NULL, 0);
		}
		else
			client->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "Command not found.", NULL, 0);

		return;
	}

	if(!auth || sit->second.second)
	{
		StringVec::const_iterator mit = std::find(mutes.begin(), mutes.end(), asLowerCaseString(sit->second.first));
		if(mit == mutes.end())
		{
			if(channel && channel->getId() == channelId) {
				if ((time(NULL) - client->lastCastMsg) < 10) {
					client->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "You are exhausted.", NULL, 0);
					return;
				}
				client->lastCastMsg = time(NULL);
				channel->talk(sit->second.first, MSG_CHANNEL_HIGHLIGHT, text);
			}
		}
		else
			client->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "You are muted.", NULL, 0);
	}
	else
		client->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "This chat is protected, you have to authenticate first.", NULL, 0);
}

void Spectators::chat(uint16_t channelId)
{
	if(!owner)
		return;

	PrivateChatChannel* tmp = g_chat.getPrivateChannel(owner->getPlayer());
	if(!tmp || tmp->getId() != channelId)
		return;

	for(SpectatorList::iterator it = spectators.begin(); it != spectators.end(); ++it)
	{
		it->first->sendClosePrivate(channelId);
		it->first->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "Chat has been disabled.", NULL, 0);
	}
}

void Spectators::kick(StringVec list)
{
	for(StringVec::const_iterator it = list.begin(); it != list.end(); ++it)
	{
		for(SpectatorList::iterator sit = spectators.begin(); sit != spectators.end(); ++sit)
		{
			if(strcasecmp(sit->second.first.c_str(), (*it).c_str()) == 0)
				sit->first->disconnect();
		}
	}
}

void Spectators::ban(StringVec _bans)
{
	StringVec::const_iterator it;
	for(DataList::iterator bit = bans.begin(); bit != bans.end(); )
	{
		it = std::find(_bans.begin(), _bans.end(), bit->first);
		if(it == _bans.end())
			bans.erase(bit++);
		else
			++bit;
	}

	for(it = _bans.begin(); it != _bans.end(); ++it)
	{
		for(SpectatorList::const_iterator sit = spectators.begin(); sit != spectators.end(); ++sit)
		{
			if(strcasecmp(sit->second.first.c_str(), (*it).c_str()) != 0)
				continue;

			bans[*it] = sit->first->getIP();
			sit->first->disconnect();
		}
	}
}

void Spectators::addSpectator(ProtocolGame* client)
{
	if(++id == 65536)
		id = 1;

	std::stringstream s;
	s << "Spectator [" << id << "]";

	spectators[client] = std::make_pair(s.str(), false);
	sendTextMessage(MSG_EVENT_ORANGE, s.str() + " joins your stream.");
}

void Spectators::removeSpectator(ProtocolGame* client)
{
	SpectatorList::iterator it = spectators.find(client);
	if(it == spectators.end())
		return;

	StringVec::iterator mit = std::find(mutes.begin(), mutes.end(), it->second.first);
	if(mit != mutes.end())
		mutes.erase(mit);

	sendTextMessage(MSG_EVENT_ORANGE, it->second.first + " leaves your stream.");
	spectators.erase(it);
}

void Spectators::sendChannelMessage(std::string author, std::string text, MessageClasses type, uint16_t channel)
{
	if(!owner)
		return;

	owner->sendChannelMessage(author, text, type, channel);
	PrivateChatChannel* tmp = g_chat.getPrivateChannel(owner->getPlayer());
	if(!tmp || tmp->getId() != channel)
		return;

	for(SpectatorList::iterator it = spectators.begin(); it != spectators.end(); ++it)
		it->first->sendChannelMessage(author, text, type, channel);
}

void Spectators::sendCreatureChannelSay(const Creature* creature, MessageClasses type, const std::string& text, uint16_t channelId, uint32_t statementId)
{
	if(!owner)
		return;

	owner->sendCreatureChannelSay(creature, type, text, channelId, statementId);
	PrivateChatChannel* tmp = g_chat.getPrivateChannel(owner->getPlayer());
	if(!tmp || tmp->getId() != channelId)
		return;

	for(SpectatorList::iterator it = spectators.begin(); it != spectators.end(); ++it)
		it->first->sendCreatureChannelSay(creature, type, text, channelId, statementId);
}

void Spectators::sendClosePrivate(uint16_t channelId)
{
	if(!owner)
		return;

	owner->sendClosePrivate(channelId);
	PrivateChatChannel* tmp = g_chat.getPrivateChannel(owner->getPlayer());
	if(!tmp || tmp->getId() != channelId)
		return;

	for(SpectatorList::iterator it = spectators.begin(); it != spectators.end(); ++it)
	{
		it->first->sendClosePrivate(channelId);
		it->first->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "Chat has been disabled.", NULL, 0);
	}
}

void Spectators::sendCreatePrivateChannel(uint16_t channelId, const std::string& channelName)
{
	if(!owner)
		return;

	owner->sendCreatePrivateChannel(channelId, channelName);
	PrivateChatChannel* tmp = g_chat.getPrivateChannel(owner->getPlayer());
	if(!tmp || tmp->getId() != channelId)
		return;

	for(SpectatorList::iterator it = spectators.begin(); it != spectators.end(); ++it)
	{
		it->first->sendCreatePrivateChannel(channelId, channelName);
		it->first->sendCreatureSay(owner->getPlayer(), MSG_PRIVATE, "Chat has been enabled.", NULL, 0);
	}
}
