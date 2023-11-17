-----------------------------------------------------------------------------------------
-- main.lua
-- 哥布林程式教育學苑｜課後作業
-- 偵聽事件地獄特訓
-- 學生｜律 澗隱
-----------------------------------------------------------------------------------------
local lastImg

-- 顯示隱藏手機功能欄位
function closeOpenBar( isOpen )
	if ( isOpen ) then
		display.setStatusBar( display.TranslucentStatusBar ) 
	else
		display.setStatusBar( display.HiddenStatusBar )
	end
end

-- 引入背景圖片
function makeImg( _pathName , _width , _height , _imgx , _imgy )
	local img = display.newImageRect( _pathName , _width , _height )
	img.x , img.y = _imgx , _imgy
	return img
end

-- 引入音效｜音樂
function makeSound( _pathName , _channel )
	local btnSound = audio.play( _pathName { _channel = 1 } )
end

-- 四個背景圖片 ----------------------------------------------------------------------------
-- function makeBg1()
	
-- end
-- function makeBg2()
-- 	if (lastImg ~= nil) then
-- 		lastImg:removeSelf( )
-- 	end
-- 	local img = display.newImageRect( "images/bgImg2.jpg" , imgAutoWidth , imgAutoHeight )
-- 	img.x , img.y = imgX , imgY
-- 	img:toBack( )
-- end
-- function makeBg3()
-- 	if (lastImg ~= nil) then
-- 		lastImg:removeSelf( )
-- 	end
-- 	local img = display.newImageRect( "images/bgImg3.jpg" , imgAutoWidth , imgAutoHeight )
-- 	img.x , img.y = imgX , imgY
-- 	img:toBack( )
-- end
-- function makeBg4()
-- 	if (lastImg ~= nil) then
-- 		lastImg:removeSelf( )
-- 	end
-- 	local img = display.newImageRect( "images/bgImg4.jpg" , imgAutoWidth , imgAutoHeight )
-- 	img.x , img.y = imgX , imgY
-- 	img:toBack( )
-- end

function makeBg( imgPath)
	if (lastImg ~= nil) then
		lastImg:removeSelf( )
	end
	local img = display.newImageRect( imgPath , imgAutoWidth , imgAutoHeight )
	lastImg = img
	img.x , img.y = imgX , imgY
	img:toBack( )
	return img
end
-- 將上面四個背景圖片韓式裝在table容器中，方便隨機取出背景圖片
function makeBgTable( isClose )
	--print("makeBgTable")
	local bgTable = {
		{
			text = "第1張背景圖片",
			img = "bgImg1.jpg",
		},
		{
			text = "第2張背景圖片",
			img = "bgImg2.jpg",
		},
		{
			text = "第3張背景圖片",
			img = "bgImg3.jpg",
		},
		{
			text = "第4張背景圖片",
			img = "bgImg4.jpg",
		}
	}
	local rdm = math.random( #bgTable )
	local whatBg = bgTable[rdm]
	makeBg("images/" .. whatBg.img)
end
-----------------------------------------------------------------------------------------------