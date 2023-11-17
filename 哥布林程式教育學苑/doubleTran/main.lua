-----------------------------------------------------------------------------------------
-- 示範如何將兩個圖片接在一起跑
-- main.lua
-- Author: Zack Lin
-- Time: 2017/4/15
-----------------------------------------------------------------------------------------
_SCREEN = {
	WIDTH = display.contentWidth,
	HEIGHT = display.contentHeight
}


local rect1 = display.newRect( _SCREEN.WIDTH / 2 , _SCREEN.HEIGHT / 2 , _SCREEN.WIDTH * 1.2 , _SCREEN.HEIGHT )
rect1:setFillColor( 1 , 0 , 0 )
local rect2 = display.newRect( _SCREEN.WIDTH * 1.7 , _SCREEN.HEIGHT / 2 , _SCREEN.WIDTH * 1.2 , _SCREEN.HEIGHT)
rect2:setFillColor( 0 , 0 , 1 )

local function moveAndChk(displayObj)
	displayObj.x = displayObj.x - 10
	if (displayObj.x < _SCREEN.WIDTH * -0.7) then
		displayObj.x = _SCREEN.WIDTH * 1.7
	end
end

timer.performWithDelay( 30, function (  )
	
	moveAndChk(rect1)
	moveAndChk(rect2)
end , -1)
