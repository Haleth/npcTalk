local colors = {
	say = {1, 1, .62},
	emote = {1, .5, .25}
}

local filter = function(self, event, msg, author, ...)
	if msg:find("%[NPC: ?.*%]") then
		self:AddMessage(gsub(msg, "%[NPC: ?(.*)%]", "%1 says:"), unpack(colors.say))
		return true
	elseif msg:find("%[npc: ?.*%]") then
		self:AddMessage(gsub(msg, "%[npc: ?(.*)%]", "%1"), unpack(colors.emote))
		return true
	end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_EMOTE", filter)