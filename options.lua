local gui = CreateFrame("Frame", "npcTalkConfig", UIParent)
gui.name = "npcTalk"
InterfaceOptions_AddCategory(gui)

local title = gui:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOP", 0, -26)
title:SetText("npcTalk v"..GetAddOnMetadata("npcTalk", "Version"))

local desc = gui:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
desc:SetJustifyH("LEFT")
desc:SetPoint("TOP", 0, -80)
desc:SetText("|cffaaaaaa/npcs|r, |cffaaaaaa/npcsay|r |cff00c2ffmessage|r: lets your target speak the message.\n|cffaaaaaa/npce|r, |cffaaaaaa/npcem|r, |cffaaaaaa/npcme|r, |cffaaaaaa/npcemote|r |cff00c2ffemote|r: lets your target perform the emote.\n|cffaaaaaa/npctalk|r |cff00ffc2set|r |cff00c2ffname|r: Use this name (existing or imaginary) when no target is selected.\n|cffaaaaaa/npctalk|r |cff00ffc2get|r: Show the currently memorised NPC name.\n|cffaaaaaa/npctalk|r |cff00ffc2clear|r: Clear the memorised NPC name.\n|cffaaaaaa/npctalk|r: bring up these instructions.")

local credits = gui:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
credits:SetPoint("TOP", desc, "BOTTOM", 0, -54)
credits:SetText("npcTalk by Iyadriel @ Argent Dawn - EU / Haleth on wowinterface.com")