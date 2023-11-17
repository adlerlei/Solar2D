-----------------------------------------------------------------------------------------
-- 哥布林程式設計學苑 - 課後作業
-- 占卜遊戲進化版
-- 老師：Zark 老師
-- 學生：律 澗隱
-- 2016 / 07 / 25 / 星期一
-----------------------------------------------------------------------------------------

-- 載入 function.lua
require( "function" )

-- 攪亂表格
math.randomseed( os.time() )

-- 音效參數設定
-- local soundVeryGoodPathName = "music/smileVeryGood.mp3" -- 大吉奸笑聲
-- local soundGoodPathName = "music/smileGood.mp3" -- 吉笑聲
-- local soundsmallGoodPathName = "music/smileSmallGood.mp3" -- 小吉笑聲
-- local soundKen1PathName = "music/ken1.mp3" -- 北斗百裂拳
-- local soundKen2PathName = "music/ken2.mp3" -- 北斗柔破斬
-- local soundKen3PathName = "music/Ken3.mp3" -- 北斗碎骨拳

-- 圖片參數設定
autoScreenWidth = display.viewableContentWidth -- 自動取得螢幕寬度 - 全域變數 ( 不同場景可重複使用 )
autoScreenHeight = display.viewableContentHeight -- 自動取得螢幕高度 - 全域變數 ( 不同場景可重複使用 )
CenterX = display.contentCenterX -- X軸自動對齊螢幕中心點 - 全域變數（ 不同場景可重複使用 ）
CenterY = display.contentCenterY -- Y軸自動對齊螢幕中心點 - 全域變數（ 不同場景可重複使用 ）
local bgRedPathName = "images/bgRed.png" -- 紅色背景圖
local bgYellowPathName = "images/bgYellow.png" -- 黃色背景圖
local bgBluePathName = "images/bgBlue.png" -- 藍色背景圖
local navBarPathName = "images/navBar.png" -- 介面上方文字黑色底圖
local bgUpWritePathName = "images/bgUpWrite.png" -- 骰子白色方塊底圖

-- 骰子圖片
local badPathName = "images/BAD.png" -- 骰子圖片 - 壞
local smallGoodPathName = "images/smallGood.png" -- 骰子圖片 - 小吉
local goodPathName = "images/good.png" -- 骰子圖片 - 吉
local veryGoodPathName = "images/veryGood.png" -- 骰子圖片 - 大吉

-- 北斗文字圖片
local ken1PathName = "images/ken1.png" -- 北斗百裂拳圖片
local ken2PathName = "images/ken2.png" -- 北斗柔破斬圖片
local ken3PathName = "images/ken3.png" -- 北斗碎骨拳圖片

-- 下方四格功能圖片
local jianPuPathName = "images/jianPu.png" -- 占圖片
local colorPathName = "images/color.png" -- 顏圖片
local fontPathName = "images/font.png" -- 字圖片
local soundPathName = "images/sound.png" --  音圖片

-- titleText 文字參數
local titleTextX = 160 -- 文字x水平坐標
local titleTextY = 35 -- 文字垂直y坐標
local titleTextFont = "native.systemFont" -- 文字字體（內建字型）
local titleTextSize = 20 -- 文字大小

-- 問題：
-- 1. 背景圖片點擊按鈕隨機變換沒有問題，但是會遮住其他介面。
-- 2. 骰子如果點擊太快，會產生錯誤，錯誤訊息為 聲道1正在使用中。


-- 輸出界面
local init
init = function()

	-- 關閉｜開啟手機bar
	openCloseBar( false )

	-- 載入背景圖片 - 預設紅色
	local imgBg = loadImg( bgRedPathName , autoScreenWidth/0.8 , autoScreenHeight/0.8 )
	imgBg.x , imgBg.y = 160 , 240

	-- 介面上方文字黑色底圖
	local img = loadImg( navBarPathName , 280 , 40 )
	img.x , img.y = 160 , 35

	-- title 文字
	local titleText = titleText( "哥布林程式教育學苑 - 作業" , titleTextX , titleTextY , titleTextFont , titleTextSize )

	-- 骰子白色方塊底圖
	local img = loadImg( bgUpWritePathName , 287 , 200 )
	img.x , img.y = 160 , 160

	-- 下方四格功能圖片
	local jianPu = loadImg( jianPuPathName , 77 , 74 ) -- 占圖片
	jianPu.x , jianPu.y = 39 , 447
	local color = loadImg( colorPathName , 77 , 74 ) -- 顏圖片
	color.x , color.y = 120 , 447
	local font = loadImg( fontPathName , 77 , 74 ) -- 字圖片
	font.x , font.y = 201 , 447
	local sound = loadImg( soundPathName , 77 , 74 ) -- 音效圖
	sound.x , sound.y = 282 , 447

	-- 問題：
-- 1. 背景圖片點擊按鈕隨機變換沒有問題，但是會遮住其他介面。
-- 2. 骰子如果點擊太快，會產生錯誤，錯誤訊息為 聲道1正在使用中。

	-- 點擊 占｜顏｜字｜音 按鈕會隨機產生效果
	jianPu:addEventListener( "tap", playImgTable ) -- 點擊隨機丟骰子（function.lua 114行）
	color:addEventListener( "tap", playBgImg ) -- 點擊隨機更換背景（function.lua 154行）

end
init()
