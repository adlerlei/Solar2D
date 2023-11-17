-----------------------------------------------------------------------------------------
-- 音樂圖形卡片
-- 哥布林程式教育學苑
-- 聯盟指揮官：Zark老師
-- 第三節課後作業：APP圖形音樂卡片
-- 2016 / 07 / 07
-- 學生：律 澗隱
-----------------------------------------------------------------------------------------

-- 手機背景圖片
-- 使用函式，並將引入背景圖片的結構體寫入函式裡面。
function appBg()
	-- 需要將引入圖片的結構體附值給一個變數，才可以使用變數來操作各項屬性。
	local bg = display.newImageRect(  "images/bg.jpg" , 940 , 588 )
	-- 因為上面有附值給變數 bg ，所以可以使用 bg,x/y 來試定圖片水平垂直屬性。
	bg.x , bg.y = 320 , 240
end
-- 直接在需要的頁面印出函式名稱即可在手機螢幕上輸出圖片
-- APPBG()｜更改為在 main.lua 頁面中輸出。
-- END

-- 哥布林人物
function goBlin_1()
	local goBlin_1 = display.newImageRect( "images/goBlin_1.png" , 110 , 100 )
	goBlin_1.x , goBlin_1.y = 40 , 480
    -- 旋轉圖片物件 ｜ 變數名稱.rotation = ?
	-- goBlin_1.rotation = 0
end

function goBlin_2()
	local goBlin_2 = display.newImageRect( "images/goblin_2.png" , 110 , 100 )
	goBlin_2.x , goBlin_2.y = 100 , 380
end

function goBlin_3()
	local goBlin_3 = display.newImageRect( "images/goblin_3.png" , 110 , 100 )
	goBlin_3.x , goBlin_3.y = 230 , 350
	goBlin_3.rotation = 20
end

function goBlin_4()
	local goBlin_4 = display.newImageRect( "images/goblin_4.png" , 190 , 120 )
	goBlin_4.x , goBlin_4.y = 200 , 470
end
-- END

-- 顯示文字
function goBlin_text()
	local goBlin_text = display.newText(  "哥布林程式教育學苑" , 160 , 20 , Hanzipen , 30 )
	goBlin_text:setFillColor( 227/255 , 23/255 , 13/255 )
end
-- END

-- 背景音樂
function bgMusic()
	local bgMusic = audio.loadSound( "music/bgMusic.mp3" ) -- 匯入音樂檔案，附值給變數 bgMusic
	audio.play( bgMusic , { channel = 1 } ) -- 指定背景音樂佔用第一聲到
	-- audio.fadeOut( { time = 9000 } ) -- 指定背景音樂 淡入 效果三秒
end
--END
