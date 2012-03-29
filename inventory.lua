-- Set up variables
selectedItem = 1
selectedBarItem = 1


function inventoryKey(k)
	if k == 'up' then
		if selectedItem == 1 then 
			selectedItem = 10
			return
		end
		selectedItem = selectedItem - 1
	end
	if k == 'down' then 
		if selectedItem == 10 then 
			selectedItem = 1
			return
		end
		selectedItem = selectedItem + 1
	end
	if k == 'w' then
		if selectedItem == 1 then 
			selectedItem = 10
			return
		end
		selectedItem = selectedItem - 1
	end
	if k == 's' then 
		if selectedItem == 10 then 
			selectedItem = 1
			return
		end
		selectedItem = selectedItem + 1
	end

	
end

function inventoryDraw()
	-- Background and Outline
	love.graphics.setColor(223, 212, 229, 255)
	love.graphics.rectangle("fill", 100, 100, 440, 280)
	love.graphics.setColor(91, 64, 105, 255)		love.graphics.rectangle("line", 100, 100, 440, 280)
	love.graphics.setColor(255, 255, 255, 255)

	-- Title
	love.graphics.setFont(titleFont)
	love.graphics.printf("INVENTORY", 115, 120, 200)
	love.graphics.setFont(selectedFont)
	love.graphics.printf("DESCRIPTION", 250, 150, 200)
	love.graphics.setFont(blackFont)


	if selectedItem == 1 then 
		love.graphics.setFont(selectedFont)
		love.graphics.printf(item1.name, 120, 150, 200)
		love.graphics.setFont(blackFont)
		love.graphics.printf(item1.description, 250, 170, 200)
		love.graphics.draw(arrowImage, 100, 150)
	else
		love.graphics.printf(item1.name, 120, 150, 200)
	end
	if selectedItem == 2 then 
		love.graphics.setFont(selectedFont)
		love.graphics.printf(item2.name, 120, 172, 200)
		love.graphics.setFont(blackFont)
		love.graphics.printf(item2.description, 250, 170, 200)
		love.graphics.draw(arrowImage, 100, 172)
	else
		love.graphics.printf(item2.name, 120, 172, 200)
	end
	if selectedItem == 3 then 
		love.graphics.setFont(selectedFont)
		love.graphics.printf(item3.name, 120, 194, 200)
		love.graphics.setFont(blackFont)
		love.graphics.printf(item3.description, 250, 170, 200)
		love.graphics.draw(arrowImage, 100, 194)
	else
		love.graphics.printf(item3.name, 120, 194, 200)
	end
	if selectedItem == 4 then 
		love.graphics.setFont(selectedFont)
		love.graphics.printf(item4.name, 120, 216, 200)
		love.graphics.setFont(blackFont)
		love.graphics.printf(item4.description, 250, 170, 200)
		love.graphics.draw(arrowImage, 100, 216)
	else
		love.graphics.printf(item4.name, 120, 216, 200)
	end
	if selectedItem == 5 then 
		love.graphics.setFont(selectedFont)
		love.graphics.printf(item5.name, 120, 238, 200)
		love.graphics.setFont(blackFont)
		love.graphics.printf(item5.description, 250, 170, 200)
		love.graphics.draw(arrowImage, 100, 238)
	else
		love.graphics.printf(item5.name, 120, 238, 200)	
	end
	if selectedItem == 6 then 
		love.graphics.setFont(selectedFont)
		love.graphics.printf(item6.name, 120, 260, 200)
		love.graphics.setFont(blackFont)
		love.graphics.printf(item6.description, 250, 170, 200)
		love.graphics.draw(arrowImage, 100, 260)
	else
		love.graphics.printf(item6.name, 120, 260, 200)
	end
	if selectedItem == 7 then 
		love.graphics.setFont(selectedFont)
		love.graphics.printf(item7.name, 120, 282, 200)
		love.graphics.setFont(blackFont)
		love.graphics.printf(item7.description, 250, 170, 200)
		love.graphics.draw(arrowImage, 100, 282)
	else
		love.graphics.printf(item7.name, 120, 282, 200)
	end
	if selectedItem == 8 then 
		love.graphics.setFont(selectedFont)
		love.graphics.printf(item8.name, 120, 304, 200)
		love.graphics.setFont(blackFont)
		love.graphics.printf(item8.description, 250, 170, 200)
		love.graphics.draw(arrowImage, 100, 304)
	else
		love.graphics.printf(item8.name, 120, 304, 200)
	end
	if selectedItem == 9 then 
		love.graphics.setFont(selectedFont)
		love.graphics.printf(item9.name, 120, 326, 200)
		love.graphics.setFont(blackFont)
		love.graphics.printf(item9.description, 250, 170, 200)
		love.graphics.draw(arrowImage, 100, 326)
	else
		love.graphics.printf(item9.name, 120, 326, 200)
	end
	if selectedItem == 10 then 
		love.graphics.setFont(selectedFont)
		love.graphics.printf(item0.name, 120, 348, 200)
		love.graphics.setFont(blackFont)
		love.graphics.printf(item0.description, 250, 170, 200)
		love.graphics.draw(arrowImage, 100, 348)
	else
		love.graphics.printf(item0.name, 120, 348, 200)
	end

end

function loadItemData()

	item1 = {
			name = "Sword",
			x = 92,
			image = love.graphics.newImage("images/items/item1.png"),
			description = "This is a very sharp sword, with which you can slay monsters of all kinds.",
			quantity = 0,
			}
	item2 = {
			name = "Pick Axe",
			x = 134,
			image = love.graphics.newImage("images/items/item2.png"),
			description = "This is a heavy duty Pick Axe, so you can mine through stone and collect valuable minerals.",
			quantity = 0,
			}
	item3 = {
			name = "Axe",
			x = 176,
			image = love.graphics.newImage("images/items/item3.png"),
			description = "This is a hand crafted Axe, with which you can harvest all you wood you wish.",
			quantity = 0,
			}
	item4 = {
			name = "Shovel",
			x = 218,
			image = love.graphics.newImage("images/items/item4.png"),
			description = "This is a shovel, so you can dig however much dirt you wish.",
			quantity = 0,
			}
	item5 = {
			name = "item5",
			x = 260,
			image = love.graphics.newImage("images/items/item5.png"),
			description = "this is the description for this item number 5 blah blah blah",
			quantity = 0,
			}
	item6 = {
			name = "item6",
			x = 302,
			image = love.graphics.newImage("images/items/item6.png"),
			description = "this is the description for this item number 6 blah blah blah",
			quantity = 0,
			}
	item7 = {
			name = "item7",
			x = 344,
			image = love.graphics.newImage("images/items/item7.png"),
			description = "this is the description for this item number 7 blah blah blah",
			quantity = 0,
			}
	item8 = {
			name = "item8",
			x = 386,
			image = love.graphics.newImage("images/items/item8.png"),
			description = "this is the description for this item number 8 blah blah blah",
			quantity = 0,
			}
	item9 = {
			name = "item9",
			x = 428,
			image = love.graphics.newImage("images/items/item9.png"),
			description = "this is the description for this item number 9 blah blah blah",
			quantity = 0,
			}
	item0 = {
			name = "item0",
			x = 470,
			image = love.graphics.newImage("images/items/item0.png"),
			description = "this is the description for this item number 10 blah blah blah",
			quantity = 0,
			}
end

function itemQuads()
	i1e = love.graphics.newQuad(0, 0, 36, 36, 360, 72)
	i1d = love.graphics.newQuad(0, 36, 36, 36, 360, 72)
	i2e = love.graphics.newQuad(36, 0, 36, 36, 360, 72)
	i2d = love.graphics.newQuad(36, 36, 36, 36, 360, 72)
	i3e = love.graphics.newQuad(72, 0, 36, 36, 360, 72)
	i3d = love.graphics.newQuad(72, 36, 36, 36, 360, 72)
	i4e = love.graphics.newQuad(108, 0, 36, 36, 360, 72)
	i4d = love.graphics.newQuad(108, 36, 36, 36, 360, 72)
	i5e = love.graphics.newQuad(144, 0, 36, 36, 360, 72)
	i5d = love.graphics.newQuad(144, 36, 36, 36, 360, 72)
	i6e = love.graphics.newQuad(180, 0, 36, 36, 360, 72)
	i6d = love.graphics.newQuad(180, 36, 36, 36, 360, 72)
	i7e = love.graphics.newQuad(216, 0, 36, 36, 360, 72)
	i7d = love.graphics.newQuad(216, 36, 36, 36, 360, 72)
	i8e = love.graphics.newQuad(252, 0, 36, 36, 360, 72)
	i8d = love.graphics.newQuad(252, 36, 36, 36, 360, 72)
	i9e = love.graphics.newQuad(288, 0, 36, 36, 360, 72)
	i9d = love.graphics.newQuad(288, 36, 36, 36, 360, 72)
	i0e = love.graphics.newQuad(324, 0, 36, 36, 360, 72)
	i0d = love.graphics.newQuad(324, 36, 36, 36, 360, 72)
end

function drawItemQuantities()
	love.graphics.setFont(whiteFont)
	love.graphics.printf(item1.quantity, item1.x + 30, itemY + 2, 10)
	love.graphics.printf(item2.quantity, item2.x + 30, itemY + 2, 10)
	love.graphics.printf(item3.quantity, item3.x + 30, itemY + 2, 10)
	love.graphics.printf(item4.quantity, item4.x + 30, itemY + 2, 10)
	love.graphics.printf(item5.quantity, item5.x + 30, itemY + 2, 10)
	love.graphics.printf(item6.quantity, item6.x + 30, itemY + 2, 10)
	love.graphics.printf(item7.quantity, item7.x + 30, itemY + 2, 10)
	love.graphics.printf(item8.quantity, item8.x + 30, itemY + 2, 10)
	love.graphics.printf(item9.quantity, item9.x + 30, itemY + 2, 10)
	love.graphics.printf(item0.quantity, item0.x + 30, itemY + 2, 10)
end

function enableItem(k)
	if k == '1' then selectedBarItem = 1 end
	if k == '2' then selectedBarItem = 2 end
	if k == '3' then selectedBarItem = 3 end
	if k == '4' then selectedBarItem = 4 end
	if k == '5' then selectedBarItem = 5 end
	if k == '6' then selectedBarItem = 6 end
	if k == '7' then selectedBarItem = 7 end
	if k == '8' then selectedBarItem = 8 end
	if k == '9' then selectedBarItem = 9 end
	if k == '0' then selectedBarItem = 0 end
end
