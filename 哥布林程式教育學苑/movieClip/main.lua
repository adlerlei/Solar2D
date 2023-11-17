-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local movieClip = require( "movieclip" )
local mc

mc = movieClip.newAnim({"images/horse-0.gif","images/horse-1.gif","images/horse-2.gif","images/horse-3.gif","images/horse-4.gif","images/horse-5.gif","images/horse-6.gif","images/horse-7.gif"})
mc.x , mc.y = 160 , 240

mc:play( { startFrame = 1 , endFrame = 8 , loop = 0 , remove = false } )
mc:stopAtFrame() -- 設定停在第幾真
mc:setSpeed(0.5)

-- movieClip

-- movieImage sheet