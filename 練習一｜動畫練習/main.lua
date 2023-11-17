-----------------------------------------------------------------------------------------
--
-- 動畫練習
-- 物件控制方法請參考 物件控制說明.lua
-----------------------------------------------------------------------------------------

-- 宣告螢幕設備寬度及高度還有XY座標中心點 .. 這是全域變數
screen = {
	w = display.contentWidth ,
	h = display.contentHeight ,
	x = display.contentCenterX ,
	y = display.contentCenterY ,
}


-- 要使用按鈕元件，需要先引入 widget 函式庫
local widget = require( "widget" )

local gear1 = display.newImage( "images/gear1.png" )
	gear1.x = 130
	gear1.y = 105

local gear2 = display.newImage( "images/gear2.png" )
	gear2.x = 190
	gear2.y = 280
	-- gear2.xScale = .7 -- 將齒輪縮小0.7
	-- gear2.yScale = .7 -- 將齒輪縮小0.7
	gear2.rotation = 10 -- 將gear2齒輪旋轉10度

-- 設定動畫及宣告函示
local openClose -- 動畫開關，1為啟動，0為停止！
local rotateAmout = 1 -- 將用來控制旋轉速度，先設定為1，後面動畫的操作都會使用這個。
local function animate ( e )
	gear1.rotation = gear1.rotation + rotateAmout -- 設定gear1齒輪正轉
	gear2.rotation = gear2.rotation - rotateAmout -- 設定gear2齒輪反轉
end

Runtime:addEventListener( "enterFrame", animate ) -- 偵聽全螢幕 enterFrame 事件

-- 加入停止按鈕
local stop = function ( )
	openClose = 1
	if openClose == 1 then
	rotateAmout = 0
	openClose = 0
	end
end

local btn_stop = widget.newButton
{
	x = 90,
	y = 400,
	labelColor = { default = { 1,1,1 }, over = { 0,0,0 } },
	label = "齒輪停止",
	fontSize = 20,
	onRelease = stop,
}

-- 加入開始按鈕
local play = function()
	openClose = 0
	if openClose == 0 then
	rotateAmout = 1
	openClose = 1
	end
end
local btn_play = widget.newButton{
	x = 220,
	y = 400,
	labelColor = { default = { 1,1,1 }, over = { 0,0,0 } },
	label = "啟動齒輪",
	fontSize = 20,
	onRelease = play,
}

-- 加入加速旋轉按鈕
local speed = function()
	if openClose == 0 then
		print( "齒輪未啟動" )
	else
		rotateAmout = rotateAmout + 1
		print( "目前速度為：", rotateAmout )
	end
end

local btn_speed = widget.newButton{
	x = 90,
	y = 500,
	labelColor = { default = { 1,1,1 }, over = { 0,0,0 } },
	label = "齒輪加速",
	fontSize = 20,
	onRelease = speed,
}

-- 加入減速旋轉按鈕
local slowd = function()
	if openClose == 0 then
		print( "齒輪未啟動" )
	else
		rotateAmout = rotateAmout - 1
	end
end

local btn_slowd = widget.newButton{
	x = 220,
	y = 500,
	labelColor = { default = { 1,1,1 }, over = { 0,0,0 } },
	label = "齒輪減速",
	fontSize = 20,
	onRelease = slowd,
}





