require "configs"
require "draw"
require "TEsound"
require "inventory"
require "character"


function love.load()

	-- Set up game global variables
	global = {
		tx = 0,
		ty = 0,
		scale = 1,
		focus = true,
		limitDrawing  = false,
		benchmark = false,
		useBatch = false,
		inventory = false
	}

	-- FPS
	fps = 0
	fpsCount = 0
	fpsTime = 0

	-- Set up 
	configureWindow()
	loadFonts()
	loadImages()
	itemQuads()
	-- load items
	loadItemData()

	-- Load map
	loader = require("AdvTiledLoader.Loader")
  	loader.path = "maps/" --Change this to wherever your .tmx files are
 	map = loader.load("tilemap.tmx") --Change this to the name of your mapfile
 	grndLayer = map.tl["grnd"]
 	grnd2Layer = map.tl["grnd2"]
 	objLayer = map.ol["obj"]
 	layer = map.tl["walls"]
 	displayTime = 0
	displayMax = 2

	loadTileIDs()

	-- Load the player
	character = map.ol["obj"]:newObject("Player", "Entity", 320, 256, 32, 32, 90)
	character.tileX = 11
	character.tileY = 9
	character.facing = "down"
	character.health = 100
	character.weapon = "false"

	-- Start music
 	TEsound.playLooping("sounds/music.ogg")


end

function love.draw()

	local ftx, fty = math.floor(global.tx), math.floor(global.ty)
	love.graphics.push()
  	love.graphics.scale(global.scale)
  	love.graphics.translate(ftx, fty)

	-- Limit the draw range 
	map:autoDrawRange(ftx, fty, global.scale, 0) 

  	map:draw()
  	love.graphics.pop()
	if character then characterDraw() end

	if global.inventory == true then
		-- Draw Inventory
		inventoryDraw()
	end

	-- Draw HUD
	drawHUD(640, 480, 640, 52)
	-- Items
	drawItems()
	drawItemQuantities()



	love.graphics.setFont(fpsFont)
	love.graphics.print("fps:", 560, 448)
	love.graphics.print(fps, 610, 448)

end

function love.update(dt)

	fps = love.timer.getFPS( )

	displayTime = displayTime + dt
	
	updateCharacterStatus()

	TEsound.cleanup()

end

function love.keypressed(k)
	if k == 'f' then love.graphics.toggleFullscreen( ) end -- Toggle Fullscreen
	if k == 'escape' then love.event.push('q') end

	-- Inventory
	if k == 'i' then
		if global.inventory == true then 
			global.inventory = false
		else 
			global.inventory = true 
		end
			
	end

	if global.inventory == false then
		-- Move character
		if k == 'w' then 
			moveTile(0, -1) 
		end
		if k == 'a' then 
			moveTile(-1, 0) 
		end
		if k == 's' then 
			moveTile(0, 1) 
		end
		if k == 'd' then 
			moveTile(1, 0) 
		end
		if k == ' ' then
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

	if global.inventory == true then 
		inventoryKey(k)
	end

	enableItem(k)

end

function love.focus(f)
  if not f then
    global.focus = false
  else
    global.focus = true
  end
end

function getNextTile()
	if character.facing == "right" then
		nextX = character.tileX + 1
		nextY = character.tileY - 1
	end
	if character.facing == "left" then
		nextX = character.tileX - 1
		nextY = character.tileY - 1
	end
	if character.facing == "up" then
		nextX = character.tileX
		nextY = character.tileY - 2
	end
	if character.facing == "down" then
		nextX = character.tileX
		nextY = character.tileY
	end 
	
	nextTile = map.tiles[layer.tileData[nextY][nextX]]
end
function moveTile(x, y)
	-- Change character direction
		if x > 0 then 
			character.facing = "right"
		--	global.tx = global.tx - 32
		elseif x < 0 then 
			character.facing = "left"
			--global.tx = global.tx + 32
		elseif y > 0 then 
			character.facing = "down"
			--global.ty = global.ty - 32
		else 
			character.facing = "up" 
			--global.ty = global.ty + 32
		end

	-- Get the tile
	if layer.tileData[character.tileY + y] then 
		tile = map.tiles[layer.tileData[character.tileY + (y - 1)][character.tileX + x]]
		obj = map.tiles[objLayer]
	else
		tile = nil
	end

	if tile then
		if tile.properties.solid then 
			return
		end
	end

	-- Move it!
	character.tileX = character.tileX + x
	character.tileY = character.tileY + y

	if character.facing == "up" then 
		global.ty = global.ty + 32 
		character:move(0, -32)
		character:updateDrawInfo()
	end
	if character.facing == "down" then 
		global.ty = global.ty - 32 
		character:move(0, 32)
		character:updateDrawInfo()
	end
	if character.facing == "left" then 
		global.tx = global.tx + 32 
		character:move(-32, 0)
		character:updateDrawInfo()
	end
	if character.facing == "right" then 
		global.tx = global.tx - 32 
		character:move(32, 0)
		character:updateDrawInfo()
	end

end

function characterDraw()
	if character.facing == "up" then
		character.gid = 189
	end
	
	if character.facing == "down" then
		character.gid = 190
	end
	
	if character.facing == "left" then
		character.gid = 199
	end
	
	if character.facing == "right" then
		character.gid = 200
	end

end

function monsterHit(monster, tile)
	if monster == "slug" then
		-- Change slug to dead slug
		map.tileLayers.walls.tileData[nextY][nextX] = slugDeadTile
		-- Play noise
		-- Start a timer of 3 seconds
		-- Destroy slug tile
	end
end
		

function reset()
	global.tx = 0
	global.ty = 0
	character.tileX = 11
	character.tileY = 9
	character.moveTile(0, 0)
	character.facing = "down"
	displayTime = 0
end