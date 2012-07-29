require "inventory"

-- Main Input System -- 

function keyboardInput(key)

	if key == "f" then love.graphics.toggleFullscreen() end -- Toggle Fullscreen
	if key == "escape" then love.event.push('q') end -- Quit
	if key == "i" then toggleInventory() end -- Toggle Inventory 
	if key == "up" then volumeUp() end -- Volume Up
	if key == "down" then volumeDown() end -- Volume Down

	if global.inventory == false then
		if key == 'w' then moveTile(0, -1) end -- Up
		if key == 'a' then moveTile(-1, 0) end -- Left
		if key == 's' then moveTile(0, 1) end -- Down
		if key == 'd' then moveTile(1, 0)	end -- Right
		if key == ' ' then
			getNextTile()
			if nextTile then
				if nextTile.properties.openDoor then 
					TEsound.play("sounds/door.wav")
					map.tileLayers.walls.tileData[nextY][nextX] = closedDoorTile
				end
				if nextTile.properties.closedDoor then
					TEsound.play("sounds/door.wav")
					map.tileLayers.walls.tileData[nextY][nextX] = openDoorTile
				end
				if nextTile.properties.torchOff then 
					map.tileLayers.walls.tileData[nextY][nextX] = torchOnTile
				end
				if nextTile.properties.torchOn then 
					map.tileLayers.walls.tileData[nextY][nextX] = torchOffTile
				end
				if character.weapon == "sword" then
					if nextTile.properties.slug then
						monsterHit("slug")
					end
				end
			end
		end
	end

	if global.inventory == true then inventoryKey(key) end

	enableItem(key)
end
