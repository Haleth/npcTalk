-- add the filter

local filter = function(self, event, msg, author, ...)
	if event == "CHAT_MSG_SAY" then
		if msg:find("%[npc: ?.*%]") then
			DEFAULT_CHAT_FRAME:AddMessage(gsub(msg, "%[npc: ?(.*)%]", "%1 says:"), 1, 1, .62)
			return true
		end
	else
		if msg:find("%[npc: ?.*%]") then
			DEFAULT_CHAT_FRAME:AddMessage(gsub(msg, "%[npc: ?(.*)%]", "%1"), 1, .5, .25)
			return true
		end	
	end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_EMOTE", filter)

-- slash commands with shortcuts instead of long format

local name = ""

SlashCmdList.NPCSAY = function(msg)
	if UnitName("target") then
		SendChatMessage("[npc:"..UnitName("target").."] "..msg, "SAY")
	elseif name ~= "" then
		SendChatMessage("[npc:"..name.."] "..msg, "SAY")
	else
		print("npcTalk: You have no target. No message sent.")
	end
end

SLASH_NPCSAY1 = "/npcsay"

SlashCmdList.NPCEMOTE = function(msg)
	if UnitName("target") then
		SendChatMessage("[npc:"..UnitName("target").."] "..msg, "EMOTE")
	elseif name ~= "" then
		SendChatMessage("[npc:"..name.."] "..msg, "EMOTE")
	else
		print("npcTalk: You have no target. No emote made.")
	end
end

SLASH_NPCEMOTE1 = "/npce"
SLASH_NPCEMOTE2 = "/npcem"
SLASH_NPCEMOTE3 = "/npcme"
SLASH_NPCEMOTE4 = "/npcemote"

SlashCmdList.NPCTALK = function(msg)
	local cmd, args = strsplit(" ", msg, 2)
	if cmd:lower() == "set" then
		if args then
			name = args
			print("npcTalk: '"..name.."' memorized.")
		else
			print("npcTalk: no name specified.")
		end
	elseif cmd:lower() == "clear" then
		name = ""
		print("npcTalk: memory cleared.")
	else
		print("npcTalk v."..GetAddOnMetadata("npcTalk", "Version"))
		print("|cffaaaaaa/npcsay|r |cff00c2ffmessage|r: lets your target speak the message.")
		print("(|cffaaaaaa/npce|r, |cffaaaaaa/npcem|r, |cffaaaaaa/npcme|r, |cffaaaaaa/npcemote|r) |cff00c2ffemote|r: lets your target perform the emote.")
		print("|cffaaaaaa/npctalk|r |cff00ffc2set|r |cff00c2ffname|r: Use the NPC name (existing or imaginary) when no target is selected.")
		print("|cffaaaaaa/npctalk|r |cff00c2ffclear|r: Clear the memorised NPC name.")
		print("|cffaaaaaa/npctalk|r: bring up these instructions.")
	end
end

SLASH_NPCTALK1 = "/npctalk"

-- GUI in case people forget slash command

local gui = CreateFrame("Frame", "npcTalkConfig", UIParent)
gui.name = "npcTalk"
InterfaceOptions_AddCategory(gui)

local title = gui:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOP", 0, -26)
title:SetText("npcTalk v."..GetAddOnMetadata("npcTalk", "Version"))

local desc = gui:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
desc:SetJustifyH("LEFT")
desc:SetPoint("TOP", 0, -80)
desc:SetText("|cffaaaaaa/npcsay|r |cff00c2ffmessage|r: lets your target speak the message.\n(|cffaaaaaa/npce|r, |cffaaaaaa/npcem|r, |cffaaaaaa/npcme|r, |cffaaaaaa/npcemote|r) |cff00c2ffemote|r: lets your target perform the emote.\n|cffaaaaaa/npctalk|r |cff00ffc2set|r |cff00c2ffname|r: Use the NPC name (existing or imaginary) when no target is selected.\n|cffaaaaaa/npctalk|r |cff00c2ffclear|r: Clear the memorised NPC name.\n|cffaaaaaa/npctalk|r: bring up these instructions.")

local credits = gui:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
credits:SetPoint("TOP", desc, "BOTTOM", 0, -54)
credits:SetText("npcTalk by Freethinker @ Steamwheedle Cartel - EU / Haleth on wowinterface.com")