-----------------------------------------------------------------------------------------
-- 哥布林音樂卡片
-- 哥布林程式教育學苑
-- 老師：zark
-- 學生：律 澗隱
-----------------------------------------------------------------------------------------

-- 載入 function 頁面
require( "function" )

-- 隱藏手機上方功能欄
-- display.setStatusBar( display.HiddenStatusBar ) -- 隱藏。
-- display.setStatusBar( display.TranslucentStatusBar ) -- 顯示。

-- 宣告變數並賦值
-- 載入音樂 
local bgMusic = audio.loadSound( "music/bgMusic.mp3" ) -- 載入第一首背景音樂。
local bgMusic1 = audio.loadSound( "music/bgMusic1.mp3" ) -- 載入第二首背景音樂。
local bgMusic2 = audio.loadSound( "music/bgMusic2.mp3" ) -- 載入第三首背景音樂。

-- 隱藏｜打開 手機上方功能欄位 
-- local closeBar = display.setStatusBar( display.HiddenStatusBar )
-- local openBar = display.setStatusBar( display.TranslucentStatusBar ) -- 沒有註解掉還是會顯示？

-- 背景圖片參數
local bgwidth = 940
local bgheight = 588
local bgimage = "images/bg.jpg"
local bgx = nil
local bgy = 240

-- 第一個哥布林圖片參數
local goblinImg1 = "images/goblin_1.png"
local goblinImgW = 60
local goblinImgH = 60
local goblinX = 160
local goblinY = 240

local bg

-- 宣告變數 init 準備給函式使用 
local init


-- 將 function 頁面中所有函式放入下面函式執行，除了美觀也方便後續修改維護。記得最後要使用 init()輸出 ..。
init = function (  )

	-- 若日後需要更換背景音樂，只需要修改後面兩個參數的值（17~19行變數｜聲道）即可。
	playBgMusic( bgMusic , 1 )
	-- 隱藏手機功能欄位
	openCloseBar( true )

	local args = { bgimage , bgwidth , bgheight }

	bg = bgImage( "images/bg.jpg" , 940 , 588 )
	--bg = bgImage( unpack(args) )
	--bg = bgImg
	--bg.isVisible = false
	local img = goblinMan( goblinImg1 , goblinImgW , goblinImgH , goblinX , goblinY )
	-- img.x , img.y = 100 , 300 -- 練習function回傳值操控

end

init()
-- 練習畫線條
local lin = display.newLine( 10 , 10, 50, 10 )
lin.x , lin.y = 30, 440
lin:append( 150 , 160 , 160 , 170)

function asd(num1 , num2)
	local qw = 7
	return num1+num2+qw
end
local w = asd(2,3,qw)
print( w )
--------------------------------
-- function rr (x1 , x2 , x3)
-- 	local img = display.newImageRect( x1 , x2 , x3 )
-- 	return x1 , x2 , x3
-- end
-- local xx1 = "images/goblin_2.png"
-- local xx2 = 80
-- local xx3 = 80
-- local  = rr(xx1,xx2,xx3)
--------------------------------
-- function rr (x1 , x2 , x3)
-- 	local img = display.newImageRect( x1 , x2 , x3 )
-- 	return x1 , x2 , x3
-- end
local tt = rr("images/goblin_2.png",100,100)
rr(tt)
