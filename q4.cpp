
/*
	Q4 - Assume all method calls work fine. Fix the memory leak issue in below method

	void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
	{
	Player* player = g_game.getPlayerByName(recipient);
	if (!player) {
	player = new Player(nullptr);
	if (!IOLoginData::loadPlayerByName(player, recipient)) {
	return;
	}
	}

	Item* item = Item::CreateItem(itemId);
	if (!item) {
	return;
	}

	g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

	if (player->isOffline()) {
	IOLoginData::savePlayer(player);
	}
	}
	
*/




// Function to add an item to a player's inventory
void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    // Get the player object by name
    Player* player = g_game.getPlayerByName(recipient);
    // Flag to track if a new player object was created
    bool createdPlayer = false;
    
    // If player does not exist, attempt to load player from storage
    if (!player) {
        player = new Player(nullptr);    	// Create a new player object with null pointer
        
        if (!IOLoginData::loadPlayerByName(player, recipient)) {     // Load player from storage using the provided name
            // If loading fails, deallocate null player object from memory and return
            delete player;
            return;
        }
        createdPlayer = true;    			// Set flag to indicate that a new player object was created
    }
    
    Item* item = Item::CreateItem(itemId);  // Create the item object with the provided item ID
    if (!item) {     						// If item creation fails
        if(createdPlayer) {      			// If a new player object was created, deallocate it from memory
            delete player;
        }
        return;
    }
    // Add the item to the player's inbox
    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);
    
    if (player->isOffline()) {           	// If the player is offline, save the player data
        IOLoginData::savePlayer(player);
    }
    
    // Clean up memory if a new player was created
    if (createdPlayer) {
        delete player;
    }
    // Deallocate item object from memory
    delete item;
}
