local _, ns = ...
local send = ns.modules.send

SlashCmdList.NPCSAY = send.say
SLASH_NPCSAY1 = "/npcsay"
SLASH_NPCSAY2 = "/npcs"

SlashCmdList.NPCEMOTE = send.emote
SLASH_NPCEMOTE1 = "/npce"
SLASH_NPCEMOTE2 = "/npcem"
SLASH_NPCEMOTE3 = "/npcme"
SLASH_NPCEMOTE4 = "/npcemote"

SlashCmdList.NPCTALK = function(msg)
	local cmd, args = strsplit(" ", msg, 2)
	cmd = cmd:lower()

	if cmd == "set" then
		if args then
			send.saved.name = args
			print("npcTalk: '"..send.saved.name.."' memorised.")
		elseif UnitName("target") then
			send.saved.name = UnitName("target")
			print("npcTalk: '"..send.saved.name.."' memorised.")
		else
			print("npcTalk: no name specified.")
		end
	elseif cmd == "get" then
		if send.saved.name ~= "" then
			print("npcTalk: '"..send.saved.name.."' is memorised.")
		else
			print("npcTalk: no name is currently memorised.")
		end
	elseif cmd == "clear" then
		send.saved.name = ""
		print("npcTalk: memory cleared.")
	else
		print("npcTalk v"..GetAddOnMetadata("npcTalk", "Version"))
		print("|cffaaaaaa/npcs|r, |cffaaaaaa/npcsay|r |cff00c2ffmessage|r: lets your target speak the message.")
		print("|cffaaaaaa/npce|r, |cffaaaaaa/npcem|r, |cffaaaaaa/npcme|r, |cffaaaaaa/npcemote|r |cff00c2ffemote|r: lets your target perform the emote.")
		print("|cffaaaaaa/npctalk|r |cff00ffc2set|r |cff00c2ffname|r: Use this name (existing or imaginary) when no target is selected.")
		print("|cffaaaaaa/npctalk|r |cff00ffc2get|r: Show the currently memorised NPC name.")
		print("|cffaaaaaa/npctalk|r |cff00ffc2clear|r: Clear the memorised NPC name.")
		print("|cffaaaaaa/npctalk|r: bring up these instructions.")
	end
end

SLASH_NPCTALK1 = "/npctalk"