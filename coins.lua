function addCoin()
	global.coins = global.coins + 1

	getNextTile()
	map.tileLayers.walls.tileData[nextY][nextX] = nil
end

