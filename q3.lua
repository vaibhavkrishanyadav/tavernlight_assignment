
--[[
	Q3 - Fix or improve the name and the implementation of the below method

	function do_sth_with_PlayerParty(playerId, membername)
	player = Player(playerId)
	local party = player:getParty()

	for k,v in pairs(party:getMembers()) do
	if v == Player(membername) then
	party:removeMember(Player(membername))
	end
	end
	end
]]--



-- Function to remove a specific member from a player's party
function removeMemberFromPlayerParty(playerId, membername)
	-- Get the player using the provided playerId
	local player = Player(playerId)
	-- Get the party of the player
	local party = player:getParty()

	-- Iterate through all members of the party
	for _, member in pairs(party:getMembers()) do
		-- Check if the name of the current member matches the specified membername
		if member.getName() == membername then
			-- Remove the member from the party
			party:removeMember(member)
		end
	end
end
