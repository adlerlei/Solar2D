--[[
DATA : 2016 / 09 / 12 
OPERATION : Piano Game
AUTHOR : Adler Lei
ACADEMY : GoblinLab.org
TEACHER : Zark
--]]

--=======================================================================================
--引入各種函式庫
--=======================================================================================
composer = require( "composer" ) --要使用Composer架構必須要先用require指令來匯入Lib
widget = require( "widget" ) --要使用Widget架構必須要先用require指令來匯入Lib
local bgGroup = display.newGroup( )
local fontGroup = display.newGroup( )

--=======================================================================================
--宣告各種全域變數
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
--宣告各種區域變數
local background -- 使用程式製作背景顏色
local bgImg -- 哥布林logo圖片變數
local rectUser -- 帳號輸入欄位底色
local fontUser -- 帳號文字
local rectPass -- 密碼輸入欄位底色
local fontPass -- 密碼文字
local inputUser -- 儲存帳號文字輸入欄位
local inputPass -- 儲存密碼文字輸入欄位
local logBtn -- 登入按鈕table名稱
local playAudio -- 儲存按鈕音效
local btnAudioPath = "sound/button.mp3" -- 按鈕音效路徑
local inputBtn = "images/login.png" -- 登入按鈕（點擊前）
local inputBtnClick = "images/loginClick.png" -- 登入按鈕（點擊後）
local goblinLogo = "images/goblinLogo.png" -- 哥布林程式教育學苑logo
local fontLogo = "images/fontLogo.png" -- 哥布林文字logo
local pianoGame = "images/pianoGame.png" -- 鋼琴遊戲文字圖片
local play = "images/play.png" -- 開始遊戲文字圖片
-- 宣告9個區域變數使用同一張圖片
-- local varPianoKey1 , varPianoKey2 , varPianoKey3 , varPianoKey4 , varPianoKey5 , varPianoKey6
-- 	  varPianoKey7 , varPianoKey8 , varPianoKey9
-- 	  = display.newImageRect( "images/pianoKey.png" )

--宣告各種區域函式
local funInit -- 建立子群組函示名稱
local funMain -- 主要內容main函示名稱
local funOpenCloseBar -- 隱藏或顯示手機欄位函示名稱
local funImages -- 生成圖片函示名稱
local funRect -- 繪製圖型函示名稱
local funFont -- 生成文字函示名稱
local funInput -- 生成文字輸入框函示名稱
local funSound -- 按鈕音效
local funBtnOnClick -- 偵聽按鈕點擊函示

--=======================================================================================
--宣告與定義main()函式
--=======================================================================================
funMain = function (  )

	funOpenCloseBar( false ) -- 打開｜關閉手機上方功能欄

	-- 建立一個子群組
	funInit()

end

--=======================================================================================
--定義其他函式
--=======================================================================================
--初始化函式，一般用於建立元件，設定初始值，部署元件等工作...
funInit = function ()

	-- 程式生成白色背景圖
	background = display.newRect( bgGroup , _SCREEN.CENTER.X , _SCREEN.CENTER.Y , 590 , _SCREEN.HEIGHT )
	background:setFillColor( 255/255 , 198/255 , 104/255 )

	-- 哥布林logo圖片
	bgImg = display.newImageRect( bgGroup , goblinLogo , 200 , 120 )
	bgImg.x , bgImg.y = _SCREEN.CENTER.X , 70

	-- 帳號輸入欄位底色
	rectUser = display.newRect( bgGroup , 255 , 160 , 200 , 40 )
	rectUser:setFillColor( 188/255 , 217/255 , 121/255 )

	-- 生成帳號文字
	fontUser = display.newText( fontGroup , "帳號" , 120 , 160 , native.systemFont , 30 )
	fontUser:setFillColor( 106/255 , 185/255 , 179/255 )

	-- 密碼輸入欄位底色
	rectPass = display.newRect( bgGroup , 255 , 230 , 200 , 1 )
	rectPass:setFillColor( 88/255 , 200/255 , 12/255 )

	-- 生成密碼文字
	fontPass = display.newText( fontGroup , "密碼" , 120 , 210 , native.systemFont , 30 )
	fontPass:setFillColor( 106/255 , 185/255 , 179/255 )

	-- 生成帳號文字輸入欄位
	inputUser = native.newTextField( 255 , 160 , 200 , 40 ) -- 生成輸入框
	inputUser.hasBackground = true -- 是否顯示欄位底圖
	inputUser:setTextColor( 255/255 , 198/255 , 104/255 ) -- 輸入文字顏色
	inputUser.placeholder = "學員帳號" -- 欄位提示文字
	inputUser.size = 25 -- 欄位文字大小
	inputUser.align = "center" -- 欄位居中對齊

	-- 生成密碼文字輸入欄位
	inputPass = native.newTextField( 255 , 210 , 200 , 40 )
	inputPass.hasBackground = false -- 是否顯示欄位底圖
	inputPass:setTextColor( 255/255 , 198/255 , 104/255 ) -- 輸入文字顏色
	inputPass.placeholder = "學員密碼" -- 欄位提示文字
	inputPass.size = 25 -- 欄位文字大小
	inputPass.align = "center" -- 欄位居中對齊

	-- inputUser:addEventListener( "userInput", funBtnOnClick )


	-- 生成按鈕音效
	-- playAudio = funSound( btnAudioPath , 1 )

	-- 登入按鈕
	logBtn = widget.newButton( -- 生成按鈕
			{
				width = 150, -- 按鈕圖片的寬
				height = 50, -- 按鈕圖片的高
				x = 250, -- 按鈕圖片的X軸座標
				y = 280, -- 按鈕圖片的Y軸座標
				defaultFile = inputBtn, -- 點擊前顯示的圖片
				overFile = inputBtnClick, -- 點擊後顯示的圖片
				onEvent = funBtnOnClick -- 點擊按鈕後要執行的函式
			}
		)


end

-- 分隔線｜偵聽按鈕點擊觸發函式 ----------------------------------------------
funBtnOnClick = function( event )
	    if ( event.phase == "began" ) then
        -- User begins editing "defaultField"

        print( "點擊" )

    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- Output resulting text from "defaultField"
        print( "放開" )
        print( event.target.text )

    elseif ( event.phase == "editing" ) then
        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )
    end

end

-- 分隔線｜隱藏或顯示手機功能欄位 ----------------------------------------------------------
funOpenCloseBar = function( isOpen )
	if isOpen then
		display.setStatusBar( display.TranslucentStatusBar )
	else
		display.setStatusBar( display.HiddenStatusBar )
	end
end

-- 分隔線｜將引入圖片的方式放入函示方便調用 --------------------------------------------------


--=======================================================================================
--呼叫主函式
--=======================================================================================
funMain()