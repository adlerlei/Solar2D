-----------------------------------------------------------------------------------------
-- 哥布林程式教育學苑課後作業
-- 作業項目：占卜遊戲
-- 老師：Zark 老師
-- 學生：律 澗隱
-- 時間：20160720
-----------------------------------------------------------------------------------------

-- 讀取 function.lua
require( "function" )

-- 攪亂表格
math.randomseed( os.time() )

-- 背景音樂參數
local bgMusic = audio.loadSound( "music/arrBg.mp3" )


-- 背景圖片 backgroundRed 參數設定
local bgRedPathName = "images/backgroundRed.png"
bgRedWidth = display.viewableContentWidth -- 自動取得螢幕寬度
bgRedHeight = display.viewableContentHeight -- 自動取得螢幕高度
-- 背景圖片 backgroundRed 參數設定
local bgBlackPathName = "images/backgroundBlack.png"
local bgBlackWidth = display.viewableContentWidth
local bgRBlackHeight = 120
-- 背景圖片 backgroundWhite 參數設定
local bgWhitePathName = "images/backgroundWhite.png"
local bgWhiteWidth = display.viewableContentWidth
local bgRWhiteHeight = 5
-- 占卜底圖參數
local imgDishesPathName = "images/dishes.png"
local imgDishesWidth = 250
local imgDishesHeight = 250
-- 燈籠圖片參數
local imgLanternPathName = "images/lantern.png"
local imgLanternWidth = 40
local imgLanternHeight = 110
-- 女人圖片參數
local imgWomanPathName = "images/woman.png"
local imgWomanWidth = 110
local imgWomanHeight = 180
-- 左邊小娃娃人物參數
local imgDollBigLeftPathName = "images/dollBigLeft.png"
local imgDollBigLeftWidth = 60
local imgDollBigLeftHeight = 130
-- 右邊小娃娃人物參數
local imgDollBigRightPathName = "images/dollBigRight.png"
local imgDollBigRightWidth = 60
local imgDollBigRightHeight = 130
-- 文字屬性參數
local myTextf = "哥布林程式教育學苑"
local myTextFont = "SentyPaperCut"
local myTextx = 160
local myTexty = 450
local myTextSize = 30

local init = function()

	-- 播放背景音樂
	playBgMusic( bgMusic , 1 )

	-- 隱藏｜開啟 手機功能欄( 打開為 true , 關閉為 false )
	openCloseBar( false )

	-- 載入背景圖片 -------------------------------------
	-- local imRed 宣告變數，並接收來自 function.lua 的 function backgroundRed() 回傳值！！！
	local imgRed = backgroundRed( bgRedPathName , bgRedWidth , bgRedHeight/0.8 )
	-- 因為在 function.lua 中的韓式 function backgroundRed() 有使用 return 回傳值，所以使用下面 imgRed 來操作參數！！！
	imgRed.x , imgRed.y = 160 , 240

	local imgBlack = backgroundBlack( bgBlackPathName , bgBlackWidth , bgRBlackHeight )
	imgBlack.x , imgBlack.y = 160 , 470

	local imgWhite = backgroundWhite( bgWhitePathName , bgWhiteWidth , bgRWhiteHeight )
	imgWhite.x , imgWhite.y = 160 , 410
	----------------------------------------------------

	-- 占卜底圖
	local imgDishes = imgDishes( imgDishesPathName , imgDishesWidth , imgDishesHeight )
	imgDishes.x , imgDishes.y = 160 , 100

	-- 燈籠圖片
	local imgLantern = imgLantern( imgLanternPathName , imgLanternWidth , imgLanternHeight )
	imgLantern.x , imgLantern.y = 30 , 50
	-- local imgLantern1 = imgLantern( imgLanternPathName , imgLanternWidth , imgLanternHeight )
	-- imgLantern1.x , imgLantern1.y = 30 , 10
	local imgLantern1 = imgLantern1( imgLanternPathName , imgLanternWidth , imgLanternHeight )
	imgLantern1.x , imgLantern1.y = 290 , 50

	-- 女人圖片
	local imgWoman = makeImageRect( imgWomanPathName , imgWomanWidth , imgWomanHeight )
	imgWoman.x , imgWoman.y = 160 , 318

	-- 左邊娃娃圖片
	-- local imgDollBigLeft = imgDollBigLeft( imgDollBigLeftPathName , imgDollBigLeftWidth , imgDollBigLeftHeight )
	local imgDollBigLeft = makeImageRect( imgDollBigLeftPathName , imgDollBigLeftWidth , imgDollBigLeftHeight )
	imgDollBigLeft.x , imgDollBigLeft.y = 50 , 360

	-- 右邊邊娃娃圖片
	local imgDollBigRight = makeImageRect( imgDollBigRightPathName , imgDollBigRightWidth , imgDollBigRightHeight )
	imgDollBigRight.x , imgDollBigRight.y = 275 , 360

	-- 下方文字區域
	local myText = myText( myTextf  , myTextx , myTexty , myTextFont , myTextSize )
	-- myText.x , myText.y = 160 , 450
	-- myText.text = "也可以透過這種方式修改文字內容"

	-- table 文字練習 ----------
	local myTextTab = display.newText(myTextTab)
	myTextTab.x , myTextTab.y = 40 , 200

	local myTextTab1 = display.newText(myTextTab1)
	myTextTab1.x , myTextTab1.y = 280 , 200
	--------------------------

	pickGood()
	
end
init()