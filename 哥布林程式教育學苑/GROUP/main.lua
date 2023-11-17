-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local susiRed = display.newImageRect( "images/1.png" , 90 , 90 )
susiRed.x , susiRed.y = 100 , 140

local susiYellow = display.newImageRect( "images/2.png" , 90 , 90 )
susiYellow.x , susiYellow.y = 100 , 340

local rect = display.newRect( 0, 0, 10, 10 )
rect:setFillColor( 0.6 , 0.6 , 0.6  , 0.2)
rect.anchorX , rect.anchorY = 0 , 0

local myGroup = display.newGroup()
myGroup.x = 50 
myGroup.y = 130
-- myGroup.isVisible = false
-- myGroup.anchorChildren = true
-- myGroup.anchorX = 0 
-- print( myGroup.x , myGroup.y , myGroup.width , myGroup.height )
myGroup:insert(susiRed)
myGroup:insert(susiYellow)
myGroup:insert( rect)


print(susiRed.x , susiRed.y)
--susiRed.x = 10
rect.width , rect.height = myGroup.width , myGroup.height
rect.x , rect.y = 0 ,
print( myGroup.x , myGroup.y , myGroup.width , myGroup.height )
myGroup:removeSelf( )
