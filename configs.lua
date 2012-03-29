function configureWindow()
	love.graphics.setBackgroundColor( 91, 64, 105)
	love.audio.setVolume(0.8)
	love.keyboard.setKeyRepeat( 0.25, 0.25)



end

function loadFonts()
	whiteFont = love.graphics.newImageFont("fonts/white.png", " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`_*#=[]'{}", 0)
	blackFont = love.graphics.newImageFont("fonts/black.png", " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`_*#=[]'{}", 0)
	fpsFont = love.graphics.newImageFont("fonts/fpsText.png", " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`_*#=[]'{}", 0)
	titleFont = love.graphics.newImageFont("fonts/titleFont.png", " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`_*#=[]'{}", 0)
	selectedFont = love.graphics.newImageFont("fonts/selectedFont.png", " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`_*#=[]'{}", 0)
	selectedFont:setLineHeight(.6)
	titleFont:setLineHeight(.6)
	fpsFont:setLineHeight(.6)
	whiteFont:setLineHeight(.6)
	blackFont:setLineHeight(.6)
	love.graphics.setFont(blackFont)
end

function loadImages()
	hudImage = love.graphics.newImage("images/hud.png")
	arrowImage = love.graphics.newImage("images/arrow.png")
	itemsImage = love.graphics.newImage("images/items.png")
end

function loadTileIDs()
	closedDoorTile = map.tileLayers.tileids.tileData[2][5]
	openDoorTile = map.tileLayers.tileids.tileData[2][6]
	torchOffTile = map.tileLayers.tileids.tileData[2][4]
	torchOnTile = map.tileLayers.tileids.tileData[2][7]
end