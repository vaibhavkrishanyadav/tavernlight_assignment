
--[[
	Q2 - Fix or improve the implementation of the below method

	function printSmallGuildNames(memberCount)
	-- this method is supposed to print names of all guilds that have less than memberCount max members
	local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
	local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
	local guildName = result.getString("name")
	print(guildName)
	end
]]--


-- Function to print names of guilds with less than memberCount
function printSmallGuildNames(memberCount)
    -- This method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
     -- Check if the query execution was successful
    local resultId = db:storeQuery(string.format(selectGuildQuery, memberCount))
    
    -- Check if the query result is valid
    if not resultId then
        print("Error: Unable to fetch guilds from the database")  -- Print error message if query fails
        return
    end
    
    -- Fetch guild names from the result and print them
    local row = resultId:fetch({},"a")  -- Fetch the first row from the result
    while row do
        print(row.name)  -- Print the name of the guild
        row = resultId:fetch(row, "a")  -- Fetch the next row from the result
    end
    
    -- Free the result object to release resources
    resultId:free()
end

