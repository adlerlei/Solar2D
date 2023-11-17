-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local img = display.newImageRect( "images/backgroundRed.png" , 360 , 480 )
img.id = "背景"
img.x , img.y = 160 , 240

local img1 = display.newImageRect( "images/dishes.png" , 100 , 100 )
img1.id = "按鈕"
img1.x , img1.y = 160 , 240

local function onClickBtn( event )
	print( "target id:" .. event.target.id )
	--print("target phase:" .. event.phase)
	--if (event.phase == "ended") then
		print("執行")
	--end
	--return true
end

img:addEventListener( "touch", onClickBtn ) -- 拖移物件專用
img1:addEventListener( "touch", onClickBtn )
--img1:addEventListener( "tap" , onClickBtn )
-- img1:removeEventListener( "touch", onClickBtn )

-- display.getCurrentStage( ):setFocus( img1 ) -- 設定專注事件通知｜拖移物件專用！

local event = { 
	name = "touch",
	target = img1,
	phase = "began"
 }
 img1:dispatchEvent( event )
