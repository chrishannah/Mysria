-- Set up
loader = require("AdvTiledLoader/Loader")
loader.path = "maps/"
map = loader.load("tilemap.tmx")
floorLayer = map.tl["grnd"]
local objectLayer = map.tl["obj"]
layer = map.tl["walls"]
displayTime = 0
displayMax = 2

-- Load the player
character = map.ol["obj"]:newObject("Player", "Entity", 0, 0, 32, 32)
character.tileX = 5
character.tileY = 5
character.facing = "down"
character.health = 100

-- Make sure he is drawn correctly	
character.moveTile(0, 0)
character.facing = "down"

function character.draw()
	if character.facing == "up" then
		character.image = love.graphics.newImage("images/up.png")
	end
	if character.facing == "down" then
		character.image = love.graphics.newImage("images/down.png")
	end
	if character.facing == "left" then
		character.image = love.graphics.newImage("images/left.png")
	end
	if character.facing == "right" then
		character.image = love.graphics.newImage("images/right.png")
	end
end

-- gameMap
Map1 = {}

function Map1.reset()
	global.tx = 0
	global.ty = 0
	character.tileX = 5
	character.tileY = 5
	character.moveTile(0, 0)
	character.facing = "down"
	displayTime = 0
end

function Map1.draw()
	-- Set sprite batches if they are different than the settings.
	map.useSpriteBatch = global.useBatch
	-- Scale and translate the game screen for map drawing
	local ftx, fty = math.floor(global.tx), math.floor(global.ty)
	love.graphics.push()
	love.graphics.scale(global.scale)
	love.graphics.translate(ftx, fty)
	
	map:draw() -- Draw map
	
	-- Reset the scale and translation.
	love.graphics.pop()
end

function Map1.update(dt)
	displayTime = displayTime + dt
end

function Map1.keypressed(k)

end

return Map1

