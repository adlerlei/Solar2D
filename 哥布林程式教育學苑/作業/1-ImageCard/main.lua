-----------------------------------------------------------------------------------------
-- 圖文卡片內容
-- 哥布林程式設計學苑
-- 聯盟指揮官：Zark 老師
-- 第二節課後作業：APP卡片
-- 2016 / 07 / 04
-- 學生：律 澗隱
-----------------------------------------------------------------------------------------
-- 使用函式引入圖片（底圖）
local bg = display.newImageRect(  "images/bg.jpg" ,  700 , 600 )
-- 調整圖片X.Y軸的對其位置（地圖）
bg.x = 160
bg.y = 240

bg.x , bg.y = 160 , 240

-- 使用函式引入圖片（文字底圖）
local wbg = display.newImageRect( "images/1.png" , 320 , 150 )
-- 調整圖片x.y位置（文字底圖）
wbg.x = 160
wbg.y = 300

local about1 = display.newText( "培養孩子與中年人的未來競爭力，並輔" , 160 , 250 , native.systemFont , 17 )
local about2 = display.newText( "導他們成為國際人才！" , 100 , 280 , native.systemFont , 17 )
about1:setFillColor( 0,0,0 )
about2:setFillColor( 0,0,0 )

--使用函式引入圖片（哥布林）
local gbl = display.newImageRect(  "images/gbl.png" ,  330 , 190 )
-- 調整圖片X.Y軸的對齊位置（哥布林）
gbl.x = 160
gbl.y = 400

-- 使用函式加入文字
local text = display.newText(  "哥布林程式教育學\n苑" , 160, 40 , native.systemFont, 20 )
-- 更改文字顏色
text:setTextColor( 182/255 , 144/255 , 104/255 )
-- 使用函式加入文字
local textGbl = display.newText( "ZARK指揮官" , 160 , 410 , native.systemFont, 17 )

funNumberText = function( _group , _text )
	varNumberText = display.newText( fontGroup , "倒數計時開始 .. ".. _text , 160 , 400 , native.systemFontBold , 15 )
	varNumberText:setFillColor( 0 , 0 , 0 )
end



varTableText = { "1" , "2" , "3" , "4" , "5" }

funNumberText( varTableText[1] )

