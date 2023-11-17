-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local img1
local img2
local tmr


-- local onTimer
-- onTimer = function( event )
-- 	if (event.count == 1) then
-- 		img1.isVisible = true
-- 	elseif (event.count == 2) then
-- 		img2.isVisible = true
-- 	end
-- 	print( "Adler" )
-- end

tmr = timer.performWithDelay( 1000 , onTimer , -1 )

local function onTap ( event)
	if ( event.target == img1 ) then
		timer.pause( tmr )
	else
		timer.resume( tmr )
	end
end

img1 = display.newImageRect( "images/1.png" , 100 , 100 )
img1.adler = "img1"
img1.isVisible = false
img1.x , img1.y = 160 , 240

img2 = display.newImageRect( "images/2.png" , 100 , 100 )
img2.isVisible = false
img2.adler = "img2"
img2.x , img2.y = 160 , 440

img1:addEventListener( "tap" , onTap )
img2:addEventListener( "tap" , onTap )

-- timer.performWithDelay( 1000, function ( event )
-- 	print("zack")
-- end , -1)


