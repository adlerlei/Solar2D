--[[
➳➳ 題目：Group 作業練習 ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
➳➳ 單位：哥布林程式設計學苑 ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
➳➳ 教師：聯盟指揮官：Zark 老師 ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
➳➳ 目標：使用Group群組來練習圖層概念 ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
➳➳ 日期：2016 / 08 / 17 ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
➳➳ 學生：Adler Lei ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
]]
-- Your money in here

-- 使用 末日錘 攪拌表格
math.randomseed( os.time() )

-- 先將所有圖片路徑指定給宣告變數
-- 背景圖片 .. images/oneBackgroundGroup/
local varBackground = "images/oneBackgroundGroup/background.png" -- 背景圖片（拿相機的女孩）
local varBgRight = "images/oneBackgroundGroup/bgRight.png" -- 背景圖片（右邊綠色三角形箭頭）
local varBgLeft = "images/oneBackgroundGroup/bgLeft.png" -- 背景圖片（左邊綠色三角形箭頭）
-- 手機下方播放音樂組件圖片 .. images/twoAudioGroup/
local varAudioPlay = "images/twoAudioGroup/play.png" -- 黑色播放按鈕（點擊前）
local varAudioClickPlay = "images/twoAudioGroup/clickPlay.png" -- 橘色播放按鈕（點擊後）
local varAudioPause = "images/twoAudioGroup/pause.png" -- 黑色暫停按鈕（點擊前）
local varAudioClickPause = "images/twoAudioGroup/clickPause.png" -- 橘色暫停按鈕（點擊後）
local varAudioNext = "images/twoAudioGroup/next.png" -- 黑色下一首按鈕（點擊前）
local varAudioClickNext = "images/twoAudioGroup/clickNext.png" -- 橘色下一首按鈕（點擊後）
local varAudiolast = "images/twoAudioGroup/last.png" -- 黑色上一首按鈕（點擊前）
local varAudioClickLast = "images/twoAudioGroup/clickLast.png" -- 橘色上一首按鈕（點擊後）
-- 宣告 threeImgGroup 圖片路徑
local varThreeImg1 = "images/threeImgGroup/1.png"
local varThreeImg2 = "images/threeImgGroup/2.png"
local varThreeImg3 = "images/threeImgGroup/3.png"
local varThreeImg4 = "images/threeImgGroup/4.png"
local varThreeImg5 = "images/threeImgGroup/5.png"
-- 手機下方模擬手機上一頁｜首頁｜功能鍵｜裝飾圖片
local varNavHome = "images/threeNavUi/home.png" -- 回首頁（裝飾用）
local varNavBack = "images/threeNavUi/back.png" -- 上一頁（裝飾用）
local varNavRecent = "images/threeNavUi/recent.png" -- 功能鍵（裝飾用）
-- 預先載入音樂檔案
local varMusicG = audio.loadSound( "music/mc/guobao.mp3" ) -- 海角七號國寶
local varMusicS = audio.loadSound( "music/mc/speed.mp3" ) -- 極速快感
local varMusicWk = audio.loadSound( "music/mc/wowKing.mp3" ) -- wow
local varMusicWr = audio.loadSound( "music/mc/wowRoom.mp3" ) -- wow
local varMusicWs = audio.loadSound( "music/mc/wowSilvermoon.mp3" ) -- wow
local varMusicBtn = audio.loadSound( "music/button.mp3" ) -- 按鈕音效
local varMusicSmile = audio.loadSound( "music/smile.mp3" ) -- 奸笑
-- 預先宣告變數，並給予 布林值 false，用來後面判斷避免連續點擊播放按鈕，音樂不斷播放
local donRePlay = false

-- 隱藏或顯示背景圖片
function closeOrOpen( isOpen )
	if ( isOpen ) then
		display.setStatusBar( display.TranslucentStatusBar )
	else
		display.setStatusBar( display.HiddenStatusBar )
	end
end

-- 使用函式引入圖片，並給予參數做圖片設定
function makeUiImg( _path , _width , _height , _x , _y )
	local img = display.newImageRect( _path , _width , _height )
	img.x , img.y = _x , _y
	return img
end

-- 使用函式引入音效
function makeSound( _path , _channel , _complete )
	return audio.play( _path , { channel = _channel } )
end

function onCompleteAudio()
	donRePlay = false
end

-- 手機圖片 寬 高 X Y 參數設定
local AUTO_SCREEN_WIDTH = display.viewableContentWidth -- 自動抓取螢幕寬度
local AUTO_SCREEN_HEIGHT = display.viewableContentHeight -- 自動抓取螢幕高度
local imgX = display.contentCenterX -- 設定X座標為正中心
local imgY = display.contentCenterY -- 設定Y座標為正中心

-- 背景圖片｜最底層 oneGroup 群組 ----------------------------------------------
-- 使用 makeUiImg 函式並給予相關值來生成三張 background , bgRight , bgLeft 背景圖片
local background = makeUiImg( varBackground , 400 , 570 )
background.x , background.y = imgX , imgY

local bgRight = makeUiImg( varBgRight , 90 , 150 )
bgRight.x , bgRight.y = 275 , 300

local bgLeft = makeUiImg( varBgLeft , 100 , 130 )
bgLeft.x , bgLeft.y = 50 , 20

-- 建立最底層 oneGroup 群組，並將所有背景圖片放入 oneGroup群組 裡面 ----------------
local oneGroup = display.newGroup( ) -- 建立一個新的 Group 群組
oneGroup:insert( background ) -- 將 background 背景底圖放入 oneGroup 群組(1)
oneGroup:insert( bgRight ) -- 將 bgRight 右邊綠色箭頭背景圖片放入 oneGroup 群組(2)
oneGroup:insert( bgLeft ) -- 將 bgLeft 左邊綠色箭頭背景圖片放入 onrGroup 群組(3)
-- (3)會覆蓋(2)跟(1)，(2)會覆蓋(1)，但會被(3)覆蓋。!! 與 PhotoShop 圖層概念一樣 !!!
------------------------------------------------------------------------------

-- 偵聽 audioButtonPlay 按鈕活動
function makeAudioPlay( e )
	if ( e.phase == "began" and audioButtonPlay.id == 1 ) then
		makeSound( varMusicBtn , 1 )
		audio.resume( varMusicG )
	elseif ( e.phase == "ended" ) then
		if ( donRePlay == false ) then
			makeSound( varMusicG , 2 )
			donRePlay = true
		end
	end
end

-- 音樂播放按鈕 play -----------------------------------------------------------------
local widget = require( "widget" ) -- 需要先宣告變數，並引入生成按鈕的函式
local audioButtonPlay = widget.newButton( -- 宣告變數，並將生成按鈕 widget.newButton() 賦值給變數
	{ -- 在生成按鈕 widgetButton() 當中，直接寫一個按鈕參數值的 table
		 id = 1, -- id 要如何使用？??????????????????????????????????
		 width = 21, -- 設定按鈕圖片寬度（可以不需要，直接使用圖片本身寬度）
		 height = 21, -- 設定按鈕圖片高度（可以不需要，直接圖片本身高度）
		 x = 160, -- 設定按鈕圖片的 X 軸位置
		 y = 467, -- 設定按鈕圖片的 Y 軸位置
		 defaultFile = varAudioPlay, -- 設定按鈕按下去之前顯示的圖片
		 overFile = varAudioClickPlay, -- 設定按鈕按下去之後顯示的圖片
		 -- onPress = makeAudioClick, -- 按鈕點擊下去要執行的函式
		 -- onRelease = makeAudioPlay, -- 按鈕放開之後要執行的韓式
		 onEvent = makeAudioPlay -- 按鈕 touch 事件一旦觸發，要執行的函式，如上 function play(e) 自己寫的函式
	}
)
-------------------------------------------------------------------------------------
-- 偵聽 audioButtonPause 按鈕活動
function makeAudioPause( e )
	if ( e.pause == "began" ) then
		makeSound( varMusicBtn , 1 )
	elseif ( e.phase == "ended" ) then
		audio.pause(varMusicG)
	end
end

-- 音樂暫停按鈕 pause -----------------------------------------------------------------
local audioButtonPause = widget.newButton(
	{
		id = pause,
		width = 21,
		height = 21,
		x = 210,
		y = 467,
		defaultFile = varAudioPause,
		overFile = varAudioClickPause,
		-- onPress = play,
		-- onRelease = play,
		onEvent = makeAudioPause
	}	
)
--------------------------------------------------------------------------------------
-- 音樂上一首按鈕 last -----------------------------------------------------------------
local audioButtonLast = widget.newButton(
	{
		id = last,
		width = 21,
		height = 21,
		x = 110,
		y = 467,
		defaultFile = varAudiolast,
		overFile = varAudioClickLast,
		-- onPress = play,
		-- onRelease = play,
		onEvent = play
	}	
)
--------------------------------------------------------------------------------------
-- 音樂上一首按鈕 last -----------------------------------------------------------------
local audioButtonNext = widget.newButton(
	{
		id = next,
		width = 21,
		height = 21,
		x = 260,
		y = 467,
		defaultFile = varAudioNext,
		overFile = varAudioClickNext,
		-- onPress = play,
		-- onRelease = play,
		onEvent = play
	}
)
--------------------------------------------------------------------------------------

-- 建立第二層 twoAudioGroup 群組，並將所有音樂播放圖片放入 twoAudioGroup 群組 裡面 ----------
local twoAudioGroup = display.newGroup() -- 建立一個新的 Group 群組
twoAudioGroup:insert( audioButtonPlay )
twoAudioGroup:insert( audioButtonPause )
twoAudioGroup:insert( audioButtonLast )
twoAudioGroup:insert( audioButtonNext )
twoAudioGroup.anchorChildren = true -- 開啟 twoAudioGroup X Y 軸使用內建定位
twoAudioGroup.x = 165 -- 將 twoAudioGroup 群組X坐標定位到水平160
twoAudioGroup.y = 500 -- 將 twoAudioGroup 群組Y坐標定位到水平467
--------------------------------------------------------------------------------------

-- 建立第三個 threeImgGroup 群組，並將所有背景圖片放入 threeImgGroup群組 裡面 -----
local threeImg1 = makeUiImg( varThreeImg1 , 47 , 48 )
threeImg1.x , threeImg1.y = 260 , 440

local threeImg2 = makeUiImg( varThreeImg2 , 47 , 48 )
threeImg2.x , threeImg2.y = 110 , 440

local threeImg3 = makeUiImg( varThreeImg3 , 47 , 48 )
threeImg3.x , threeImg3.y = 60 , 440

local threeImg4 = makeUiImg( varThreeImg4 , 47 , 48 )
threeImg4.x , threeImg4.y = 210 , 440

local threeImg5 = makeUiImg( varThreeImg5 , 47 , 48 )
threeImg5.x , threeImg5.y = 160 , 440

local threeImgGroup = display.newGroup()
threeImgGroup:insert( threeImg1 )
threeImgGroup:insert( threeImg2 )
threeImgGroup:insert( threeImg3 )
threeImgGroup:insert( threeImg4 )
threeImgGroup:insert( threeImg5 )
------------------------------------------------------------------------------




local init = function ()

	closeOrOpen( true ) -- 手機上方功能欄位：true為顯示｜false為隱藏

end
init()