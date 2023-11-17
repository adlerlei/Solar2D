-----------------------------------------------------------------------------------------
-- main.lua
-- 哥布林程式教育學苑｜課後作業
-- 互動式占卜遊戲代碼重置
-- 學生｜律 澗隱
-----------------------------------------------------------------------------------------

-- 攪亂表格
math.randomseed( os.time() )

--載入 function.lua
require( "function" )

-- 音效檔案參數
local smileGood = "music/smileGood.mp3"
local smileSmallGood = "music/smileSmallGood.mp3"
local smileVeryGood = "music/smileVeryGood.mp3"

local imgBtn = display.newImageRect( "images/goblin.png" , 100 , 120 )
imgBtn.x , imgBtn.y = 160 , 440
-- local m1 = makeGoblin1( "sadasd" , 160 , 240 , native.systemFont , 60 )
-- 輸出function.lua各項功能
local init

init = function()

	-- 關閉手機功能欄
	closeOpenBar(false)
	-- 設定每三秒自動變換背景圖片
	timer.performWithDelay( 1000 , playBgImg , -1 )
	imgBtn:addEventListener( "tap" , clickText )
	-- playGoblin()

	-- m1:addEventListener( "tap", clickText )

end

init()
