--[[
➳➳ 題目：	動畫製作｜場景轉換 作業練習 ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
➳➳ 單位：哥布林程式設計學苑 ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
➳➳ 教師：聯盟指揮官：Zark 老師 ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
➳➳ 目標：熟練動畫使用及場景轉換 ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
➳➳ 日期：2016 / 08 / 21 ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
➳➳ 學生：Adler Lei ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
]]
--=======================================================================================
-- 引入各種函式庫
--=======================================================================================
-- local oneBgGroup = display.newGroup() -- 第一層背景圖片群組
-- local twoAudioGroup = display.newGroup() -- 第二層音樂播放組件群組
-- local threeFeaturesGroup = display.newGroup()  -- 第三層場景按鈕圖片群組
-- local fourSunGroup = display.newGroup() -- 第四層太陽圖片群組
mainGroup = display.newGroup( ) -- main 所有物件群組，用來轉換場景時隱藏所有 main 的物件（全域變數）
local widget = require( "widget" ) -- 生成按鈕
composer = require( "composer" ) -- 生成場景

--=======================================================================================
-- 宣告各種全域變數
--=======================================================================================
_SCREEN = {
	WIDTH = display.contentWidth,
	HEIGHT = display.contentHeight
}
_SCREEN.CENTER = {
	X = display.contentCenterX,
	Y = display.contentCenterY
}

--=======================================================================================
-- 宣告各種區域變數
--=======================================================================================
local varBgImg -- main 函式中用於儲存 background 背景圖片的變數
local varBgRightImg -- main 函式中用於儲存 bgRight 背景圖片的變數
local varBgLeftImg -- main 函式中用於儲存 bgLeft 背景圖片的變數
local varScene1 -- main 函式中用來儲存 場景1 按鈕圖片
local varScene2 -- main 函式中用來儲存 場景2 按鈕圖片
local varScene3 -- main 函式中用來儲存 場景3 按鈕圖片
local varScene4 -- main 函式中用來儲存 場景4 按鈕圖片
local varFeaturesImg -- main 函式中用來儲存 功能 按鈕圖片
local varAudioBtnPlay -- table 名稱｜播放按鈕
local varAudioBtnPause -- table 名稱｜暫停按鈕
local varAudioNext -- table 名稱｜下一首按鈕
local varAudioLast -- table 名稱｜上一首按鈕

-- 第一群組（背景圖片）
local varBg = "images/oneBgGroup/background.png" -- 人物背景底圖
local varBgRight = "images/oneBgGroup/bgRight.png" -- 右邊綠色三角形箭頭背景圖片
local varBgLeft = "images/oneBgGroup/bgLeft.png" -- 左邊綠色三角形箭頭背景圖片
-- 第二群組（音樂播放按鈕圖片）
local varAudioPlay = "images/twoAudioGroup/play.png" -- 播放按鈕圖片（點擊前）
local varAudioClickPlay = "images/twoAudioGroup/clickPlay.png" -- 播放按鈕圖片（點擊後）
local varAudioPause = "images/twoAudioGroup/pause.png" -- 暫停播放按鈕圖片（點擊前）
local varAudioClickPause = "images/twoAudioGroup/clickPlay.png" -- 暫停播放按鈕圖片（點擊後）
local varAudioNext = "images/twoAudioGroup/next.png" -- 下一首按鈕圖片（點擊前）
local varAudioClickNext = "images/twoAudioGroup/clickNext.png" -- 下一首按鈕圖片（點擊後）
local varAudioLast = "images/twoAudioGroup/last.png" -- 上一首按鈕圖片（點擊前）
local varAudioClickLast = "images/twoAudioGroup/clickLast.png" -- 上一首按鈕圖片（點擊後）
-- 第三群組（場景按鈕｜手機功能圖片）
local varScene1Btn = "images/threeFeaturesGroup/1.png"
local varScene2Btn = "images/threeFeaturesGroup/2.png"
local varScene3Btn = "images/threeFeaturesGroup/3.png"
local varScene4Btn = "images/threeFeaturesGroup/4.png"
local varFeaturesBtn = "images/threeFeaturesGroup/5.png"
-- 第四群組（太陽圖片）
local varSun1 = "images/fourSunGroup/1.png"
local varSun2 = "images/fourSunGroup/2.png"
local varSun3 = "images/fourSunGroup/3.png"
local varSun4 = "images/fourSunGroup/4.png"
local varSun5 = "images/fourSunGroup/5.png"
-- 音樂｜音效 檔案
local varAudioBtn = audio.loadSound( "music/button.mp3" ) -- 音效｜按鈕
local varAudioSmile = audio.loadSound( "music/smile.mp3" ) -- 音效｜尖笑
local varMusicG = audio.loadSound( "music/mc/guobao.mp3" ) -- 音樂｜海角七號-國寶
local varMusicS = audio.loadSound( "music/mc/speed.mp3" ) -- 音樂｜極速快感
local varMusicWk = audio.loadSound( "music/mc/wowKing.mp3" ) -- 音樂｜魔獸世界1
local varMusicWr = audio.loadSound( "music/mc/wowRoom.mp3" ) -- 音樂｜魔獸世界2
local varMusicWs = audio.loadSound( "music/mc/wowSilvermoon.mp3" ) -- 音樂｜魔獸世界3

--=======================================================================================
-- 宣告各種區域函式
--=======================================================================================
local funCloseOpenBar -- 隱藏｜顯示 手機功能欄位函式名稱
local funImg -- 引入圖片專用的函式名稱
local funAudio -- 引入音樂｜音效的函式名稱
local funPlayAudio -- 偵聽按鈕 play 執行函式名稱
local funPauseAudio -- 偵聽按鈕 pause 執行函式名稱
local funNextAudio -- 偵聽按鈕 next 執行函式名稱
local funLastAudio -- 偵聽按鈕 last 執行韓式名稱
local funClickBtnSound -- 按鈕點擊音效
local funMovieBgLeft -- 背景圖片動畫函式
local funMovieBgLeftRe -- 背景圖片動畫函式重複
local funMovieBgRight -- 背景圖片動畫函式
local funMovieBgRightRe -- 背景圖片動畫函式重複
local funScene -- 偵聽按鈕處發轉換場景的函式名稱
local funOnClickScene -- 按鈕處發轉換場景的函式名稱

--=======================================================================================
-- 宣告與定義main()函式
--=======================================================================================
local main = function (  )
	-- 顯示｜隱藏手機上方功能欄位
	funCloseOpenBar( false )

	-- 生成 bckground 背景圖片
	varBgImg = funImg( mainGroup , varBg , _SCREEN.WIDTH , _SCREEN.HEIGHT )
	varBgImg.x , varBgImg.y = _SCREEN.CENTER.X , _SCREEN.CENTER.Y
	-- 生成 bgRight 背景圖片
	varBgRightImg = funImg( mainGroup , varBgRight , 70 , 130 )
	varBgRightImg.x , varBgRightImg.y = 285 , 300
	-- 生成 bgLeft 背景圖片
	varBgLeftImg = funImg( mainGroup , varBgLeft , 70 , 100 )
	varBgLeftImg.x , varBgLeftImg.y = 30 , 50

	-- 生成手機功能按鈕（下面五個圓形按鈕）
	varFeaturesImg = funImg( mainGroup , varFeaturesBtn , 50 , 50 )
	varFeaturesImg.x , varFeaturesImg.y = 160 , 50
	-- 生成場景1按鈕（下面五個圓形按鈕）
	varScene1 = funImg( mainGroup , varScene1Btn , 50 , 50 )
	varScene1.x , varScene1.y = 100 , 50
	-- 生成場景2按鈕（下面五個圓形按鈕）
	varScene2 = funImg( mainGroup , varScene2Btn , 50 , 50 )
	varScene2.x , varScene2.y = 40 , 50
	-- 生成場景3按鈕（下面五個圓形按鈕）
	varScene3 = funImg( mainGroup , varScene3Btn , 50 , 50 )
	varScene3.x , varScene3.y = 220 , 50
	-- 生成場景4按鈕（下面五個圓形按鈕）
	varScene4 = funImg( mainGroup , varScene4Btn , 50 , 50 )
	varScene4.x , varScene4.y = 280 , 50

	-- 產生動畫｜左邊綠色三角形背景圖片
	transition.to( varBgLeftImg,
	{
		time = 3000,
		x = 0,
		y = 50,
		transition = easing.inBounce,
		onComplete = funMovieBgLeft
	})

	-- 產生動畫｜右邊綠色三角形背景圖片
	transition.to( varBgRightImg,
	{
		time = 3000,
		x = 350,
		y = 300,
		transition = easing.inOutBounce,
		onComplete = funMovieBgRight
	})

	-- 產生動畫｜手機功能按鈕（中間白色）
	transition.to( varFeaturesImg,
	{
		time = 10000,
		x = 160,
		y = 450,
		transition = easing.outInElastic,
		onComplete = funClickBtnSound
	})

	-- 產生動畫｜場景4按鈕（藍色）
	transition.to( varScene4,
	{ 
		time = 10000,
		x = 280,
		y = 450,
		transition = easing.outElastic,
		onComplete = funClickBtnSound
	})
	-- 產生動畫｜場景3按鈕（綠色）
	transition.to( varScene3,
	{
		time = 10000,
		x = 220,
		y = 450,
		transition = easing.outInBounce,
		onComplete = funClickBtnSound
	})
	-- 產生動畫｜場景2按鈕（左邊google瀏覽器圖案）
	transition.to( varScene2,
	{
		time = 10000,
		x = 40,
		y = 450,
		transition = easing.inBounce,
		onComplete = funClickBtnSound
	})
	-- 產生動畫｜場景1按鈕（左邊第二個）
	transition.to( varScene1,
	{
		time = 10000,
		x = 100,
		y = 450,
		transition = easing.outBack,
		onComplete = funClickBtnSound
	})

	funScene()

end

--=======================================================================================
-- 定義其他函式
--=======================================================================================
-- 初始化函式，一般用於建立元件，設定初始值，部署元件等工作...
-- 隱藏｜顯示手機上方功能欄位
funCloseOpenBar = function ( isOpen )
	if ( idOpen ) then
		display.setStatusBar( display.TranslucentStatusBar )
	else 
		display.setStatusBar( display.HiddenStatusBar )
	end
end

-- 引入圖片函式並給予參數
funImg = function( _group , _path , _width , _height , _x , _y )
	local img = display.newImageRect( _group , _path , _width , _height )
	img.x , img.y = _x , _y
	return img
end

-- 引入音樂｜音效並給予參數
funAudio = function( _path , _channel )
	return audio.play( _path , { channel = _channel } )
end

-- 按鈕點擊觸發音效
-- funClickBtnSound = function( e )
-- 	-- audio.play( varAudioBtn , 1 )
-- 	print( "到了！" )
-- 	-- if ( e.phase == "began" ) then
-- 	-- 	audio.play( varAudioBtn , 1 )
-- 	-- end
-- end

-- 以下兩個函式互相循環播放動畫｜左邊綠色箭頭 -----------------
-- 左邊三角形動畫觸發函式
funMovieBgLeft = function()
	transition.to( varBgLeftImg,
	{
		time = 3000,
		x = 30,
		y = 50,
		transition = easing.inBounce,
		onComplete = funMovieBgLeftRe
	})
end
funMovieBgLeftRe = function()
	transition.to( varBgLeftImg,
	{
		time = 3000,
		x = 0,
		y = 50,
		transition = easing.inBounce,
		onComplete = funMovieBgLeft
	})
end
-----------------------------------------------

-- 以下兩個韓式互相循環播放動畫｜右邊綠色箭頭 -----------------
-- 右邊三角形動畫觸發函式
funMovieBgRight = function()
	transition.to( varBgRightImg,
	{
		time = 3000,
		x = 285,
		y = 300,
		transition = easing.inOutBounce,
		onComplete = funMovieBgRightRe
	})
end
funMovieBgRightRe = function()
	transition.to( varBgRightImg,
	{
		time = 3000,
		x = 350,
		y = 300,
		transition = easing.inBounce,
		onComplete = funMovieBgRight
	})
end
-----------------------------------------------

-- 場景
funScene = function()
	varScene1:addEventListener( "tap", funOnClickScene )
end

funOnClickScene = function()
	local options = {
		effect = "fade",
		time = 400
	}
	composer.gotoScene( "scene1" , options )
	varScene1:removeEventListener( "tap", funOnClickScene )
	-- mainGroup:removeSelf() -- 當轉換到場景二時，隱藏所有 main 的元件｜物件
	-- varScene1 = nil
	mainGroup.isVisible = false -- 當轉換到場景二時，隱藏所有 main 的元件｜物件
end

--=======================================================================================
-- 定義Table
--=======================================================================================
-- varAudioBtnPlay = widget.newButton(
-- 	{
--  		width = 21,
--  		height = 21,
--  		x = 160,
--  		y = 505,
--  		defaultFile = varAudioPlay,
--  		overFile = varAudioClickPlay,
--  		onPress = funClickBtnSound,
--  		onRelease = playAudioFun
-- 	}
-- )

--=======================================================================================
-- 呼叫主函式
--=======================================================================================
main()