local _, ns = ...
local module = ns.modules.send

local say, emote, sendMessage
local saved = {
	name = ""
}

local prefixes = {
	say = "NPC:",
	emote = "npc:"
}

function say(msg)
	sendMessage(msg, "say")
end

function emote(msg)
	sendMessage(msg, "emote")
end

function sendMessage(msg, channel)
	local unit

	if UnitName("target") then
		unit = UnitName("target")
	elseif saved.name ~= "" then
		unit = saved.name
	end

	if unit then
		SendChatMessage("["..prefixes[channel]..unit.."] "..msg, "EMOTE")
	else
		print("npcTalk: You have no target. No message sent.")
	end
end

module.say = say
module.emote = emote
module.saved = saved