-----------------------------------------------------------------------------------------
-- 音樂圖形卡片
-- 哥布林程式教育學苑
-- 聯盟指揮官：Zark老師
-- 第三節課後作業：APP圖形音樂卡片
-- 2016 / 07 / 07
-- 學生：律 澗隱
-----------------------------------------------------------------------------------------

-- 使用 require 引入 image.lua 
require( "image" )
-- END

local bg
local goblin1
local goblin2
local goblin3
local goblin4
local bgMusic = audio.loadSound( "music/bgMusic.mp3" ) -- 匯入音樂檔案，附值給變數 bgMusic
local bgMusic2 = audio.loadSound( "music/bgMusic2.mp3" ) -- 匯入音樂檔案，附值給變數 bgMusic

local init

init = function (  )
	-- 使用函式名稱 ( image.lua ) 輸出手機背景圖片
	appBg()
	--bg.isVisible = false

	-- 輸出哥布林圖片
	goblin1 = goBlin_1()
	goblin2 = goBlin_2()
	goblin3 = goBlin_3()
	goblin4 = goBlin_4()

	-- 輸出文字
	goBlin_text()

	-- 輸出背景音樂
	playBgMusic(bgMusic , 3 )
end

init()


