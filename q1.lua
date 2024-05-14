--[[
  Q1 - Fix or improve the implementation of the below methods

  local function releaseStorage(player)
  player:setStorageValue(1000, -1)
  end
  
  function onLogout(player)
  if player:getStorageValue(1000) == 1 then
  addEvent(releaseStorage, 1000, player)
  end
  return true
  end
]]--



-- Function to release storage for a player 
local function releaseStorage(player)
    -- set the storage value to -1 and capture the success status
    local success = player:setStorageValue(1000, -1)
     -- check if the storage value was successfully set
    if success == true then 
        return true -- if successful return true
    else 
        return false  -- if unsuccessful return false
    end
end

-- Function called when a player logs out
function onLogout(player)
    -- Check if the player's storage value is 1
    if player:getStorageValue(1000) == 1 then
        -- Call the releaseStorage function to release the storage value
        local result = releaseStorage(player)
        return result  -- Return the result of releaseStorage directly
    else
        return false  -- If the condition is not met, return false
    end
end
