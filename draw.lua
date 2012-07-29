
function drawHUD(screenX, screenY, imageX, imageY)
	-- X + Y calculations
	HUDX = (screenX - imageX) / 2
	HUDY = screenY - imageY
	itemY = HUDY + 8

	-- Draw HUD background
	love.graphics.draw(hudImage, HUDX, HUDY)

	-- Draw Coins
	if global.coins then 
		-- Draw Coins
		love.graphics.setFont(fpsFont)
		love.graphics.print("Coins:", 540, 448)
		love.graphics.print(global.coins, 610, 448) 
	end
end

function drawItems()
	-- Draw items
	if selectedBarItem == 1 then
		love.graphics.drawq(itemsImage, i1e, item1.x, itemY)
	else
		love.graphics.drawq(itemsImage, i1d, item1.x, itemY)
	end
	if selectedBarItem == 2 then
		love.graphics.drawq(itemsImage, i2e, item2.x, itemY)
	else
		love.graphics.drawq(itemsImage, i2d, item2.x, itemY)
	end
	if selectedBarItem == 3 then
		love.graphics.drawq(itemsImage, i3e, item3.x, itemY)
	else
		love.graphics.drawq(itemsImage, i3d, item3.x, itemY)
	end
	if selectedBarItem == 4 then
		love.graphics.drawq(itemsImage, i4e, item4.x, itemY)
	else
		love.graphics.drawq(itemsImage, i4d, item4.x, itemY)
	end
	if selectedBarItem == 5 then
		love.graphics.drawq(itemsImage, i5e, item5.x, itemY)
	else
		love.graphics.drawq(itemsImage, i5d, item5.x, itemY)
	end
	if selectedBarItem == 6 then
		love.graphics.drawq(itemsImage, i6e, item6.x, itemY)
	else
		love.graphics.drawq(itemsImage, i6d, item6.x, itemY)
	end
	if selectedBarItem == 7 then
		love.graphics.drawq(itemsImage, i7e, item7.x, itemY)
	else
		love.graphics.drawq(itemsImage, i7d, item7.x, itemY)
	end
	if selectedBarItem == 8 then
		love.graphics.drawq(itemsImage, i8e, item8.x, itemY)
	else
		love.graphics.drawq(itemsImage, i8d, item8.x, itemY)
	end
	if selectedBarItem == 9 then
		love.graphics.drawq(itemsImage, i9e, item9.x, itemY)
	else
		love.graphics.drawq(itemsImage, i9d, item9.x, itemY)
	end
	if selectedBarItem == 0 then
		love.graphics.drawq(itemsImage, i0e, item0.x, itemY)
	else
		love.graphics.drawq(itemsImage, i0d, item0.x, itemY)
	end

end

