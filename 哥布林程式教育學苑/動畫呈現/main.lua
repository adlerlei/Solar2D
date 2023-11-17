-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local img = display.newImageRect( "images/sun_4.png" , 60 , 70 )
img.x , img.y = 120 , 50

function playMovie()
	transition.to( img , { time = 6000 , x = 60 , y = 70 , transition = easing.inOutElastic  } )
end

local tran = transition.to( img , { time = 6000 , x = 200 , y = 400 , tag = "test", transition = easing.inOutElastic , onComplete = playMovie } )

timer.performWithDelay( 2000 , function ( )
	transition.cancel( "test" )
end )