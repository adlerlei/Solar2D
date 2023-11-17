--[[
DATA : 2016 / 09 / 14
OPERATION : newTableView
AUTHOR : Adler Lei
ACADEMY : GoblinLab.org
TEACHER : Zark
--]]


-- 引入各種函式庫 =======================================================
require( "official_document" )
widget = require( "widget" ) -- 引入官方組件函式庫(全域變數)
composer = require( "composer" ) -- 引入場景函式庫(全域變數)
local bgGroup = display.newGroup( ) -- 背景底圖群組
local leaf2Group = display.newGroup( ) -- 木板葉子圖片群組
local goblinGroup = display.newGroup( ) -- 哥布林logo群組
local boardGroup = display.newGroup( ) -- 木板圖片群組
local animalGroup = display.newGroup( ) -- 動物圖片群組
local leafGroup = display.newGroup( ) -- 葉子圖片群組
local fontGroup = display.newGroup( ) -- 文字圖片群組
local cloudGroup = display.newGroup( ) -- 雲朵圖片群組

-- 宣告各種全域變數 ======================================================
_SCREEN = { -- 自動抓取螢幕寬高
	WIDTH = display.contentWidth,
	HEIGHT = display.contentHeight
}
_SCREEN.CENTER = { -- 自動對齊螢幕 X Y 軸 中心點
	X = display.contentCenterX,
	Y = display.contentCenterY
}

-- 宣告各種區域變數 =======================================================
local reverseBird = 1 -- 小鳥翻轉動畫專用
local reverseLeaf = 1 -- 葉子循環動畫專用
local btn -- 按鈕table名稱

-- 宣告各種區域函式 =======================================================
local funOpenCloseBar -- 開啟或關閉手機上方功能欄位
local birdLoop -- 小鳥循環動畫
local leafLoop -- 葉子循環動畫
local btnClick -- 按鈕觸發函式

-- 宣告與定義main()函式 ===================================================
main = function (  )

	funOpenCloseBar( true ) -- 打開｜關閉手機上方功能欄

	-- 建立一個子群組
	init()

end

-- 定義其他函式 ===========================================================
-- 初始化函式，一般用於建立元件，設定初始值，部署元件等工作 ...
init = function ()

	-- 背景藍綠漸層圖片
	local bg = display.newImageRect( bgGroup , "images/bg.png" , _SCREEN.WIDTH , 570 )
	bg.x , bg.y = _SCREEN.CENTER.X , _SCREEN.CENTER.Y

	-- 斑馬圖片
	local zebra = display.newImageRect( animalGroup , "images/zebra.png" , 183 , 161 )
	zebra.x , zebra.y = 95 , 380

	-- 獅子圖片
	local lion = display.newImageRect( animalGroup , "images/lion.png" , 231 , 160 )
	lion.x , lion.y = 155 , 380

	-- 長頸鹿圖片
	local giraffe = display.newImageRect( animalGroup , "images/giraffe.png" , 121 , 206 )
	giraffe.x , giraffe.y = 257 , 355

	-- 練習移動群組圖層
	animalGroup.y = 15

	-- 木板圖片
	local board = display.newImageRect( boardGroup , "images/board.png" , 304 , 300 )
	board.x , board.y = 155 , 200

	-- 哥布林圖片
	local goblin = display.newImageRect( goblinGroup , "images/goblin.png" , 147 , 126 )
	goblin.x , goblin.y = 270 , 60

	-- 學生作業
	local student = display.newImageRect( fontGroup , "images/student.png" , 81 , 21 )
	student.x , student.y = 110 , 90

	-- 動物百科
	local animal = display.newImageRect( fontGroup , "images/animal.png" , 106 , 22 )
	animal.x , animal.y = 230 , 90

	-- email
	local email = display.newImageRect( fontGroup , "images/email.png" ,207 , 22 )
	email.x , email.y = 175 , 109

	-- zoo
	local zoo = display.newImageRect( fontGroup , "images/zoo.png" , 195 , 101 )
	zoo.x , zoo.y = 160 , 160

	-- fontGoblin
	local fontGoblin = display.newImageRect( fontGroup , "images/fontGoblin.png" , 190 , 22 )
	fontGoblin.x , fontGoblin.y = 160 , 507

	-- fontWeb
	local fontWeb = display.newImageRect( fontGroup , "images/fontWeb.png" , 145 , 30 )
	fontWeb.x , fontWeb.y = 160 , 480

	-- 按鈕觸發函式
	btnClick = function()
		local option = {
			effect = "fade",
			time = 400,
		}
		composer.gotoScene( "scene1" , option )
		leaf2Group.isVisible = false -- 當轉換到場景二時，隱藏所有 main 的元件｜物件
		goblinGroup.isVisible = false
		boardGroup.isVisible = false
		animalGroup.isVisible = false
		leafGroup.isVisible = false
		bgGroup.isVisible = false
		fontGroup.isVisible = false
		cloudGroup.isVisible = false
		btn:removeSelf( ) -- 轉換場景之後把按鈕刪除
	end

	-- 進入按鈕
	btn = widget.newButton( 
		{
			width = 200,
			height = 80,
			x = 160,
			y = 240,
			defaultFile = "images/btn.png",
			overFile = "images/btnClick.png",
			onRelease = btnClick,
		}
	)

	-- /// 下方葉子圖片動畫 //////////////////////////////////////////////////////////////////////
	local leafUp = display.newImageRect( leafGroup , "images/leafUp.png" , 489 , 138 ) -- 下面葉子
	leafUp.x , leafUp.y = 160 , 490
	local leaf = display.newImageRect( leafGroup , "images/leaf.png" , 401 , 84 ) -- 下面葉子
	leaf.x , leaf.y = 130 , 500
	local leaf2 = display.newImageRect( leaf2Group , "images/leaf2.png" , 167 , 113 ) -- 木板葉子
	leaf2.x , leaf2.y = 65 , 65

	leafLoop = function() -- 所有葉子循環動畫

		if ( reverseLeaf == 0 ) then
			reverseLeaf = 1
			transition.to( leafUp , { time = 2000 , x = 160 , transition = easing.outInBounce } )
			transition.to( leaf , { time = 2000 , x = 130 , transition = easing.inBack  } )
			transition.to( leaf2 , { time = 1000 , rotation = 15 } )
  		else
  			reverseLeaf = 0
  			transition.to( leafUp , { time = 2000 , x = 130 , transition = easing.inBack } )
  			transition.to( leaf , { time = 2000 , x = 160 , transition = easing.outInBounce } )
  			transition.to( leaf2 , { time = 1000 , rotation = - 15 } )
		end

	end

	timer.performWithDelay( 2000 , leafLoop , 0 ) -- 每兩秒去執行一次 leafLoop 函式
	-- /// 動畫結束 /////////////////////////////////////////////////////////////////////////////

	-- /// 小鳥圖片動畫 //////////////////////////////////////////////////////////////////////////
	local bird = display.newImageRect( animalGroup , "images/bird.png" , 88 , 112 ) -- 小鳥圖片
	bird.x , bird.y = 45 , 93

	birdLoop = function() -- 小鳥動畫

		if ( reverseBird == 0 ) then
			reverseBird = 1
			transition.to( bird , { time = 1000 , rotation = 20 } )
		else
			reverseBird = 0
			transition.to( bird , { time = 1000 , rotation = - 20 } )
		end

	end

	timer.performWithDelay( 1000 , birdLoop , 0 ) -- 每一秒執行一次 birdLoop 函式
	-- /// 動畫結束 //////////////////////////////////////////////////////////////////////////////

	-- /// 下方雲層圖片動畫 //////////////////////////////////////////////////////////////////////
	local cloud1 = display.newImageRect( cloudGroup , "images/cloud.png" , 101 , 44 ) -- 上面雲
	cloud1.x , cloud1.y = 300 , 20
	local cloud2 = display.newImageRect( cloudGroup , "images/cloud.png" , 101 , 44 ) -- 中間雲
	cloud2.x , cloud2.y = 300 , 90
	local cloud3 = display.newImageRect( cloudGroup , "images/cloud.png" , 101 , 44 ) -- 下面雲
	cloud3.x , cloud3.y = 300 , 160
	local aircraft = display.newImageRect( cloudGroup , "images/aircraft.png" , 146 , 73 ) -- 飛機圖片
	aircraft.x , aircraft.y = 400 , 100

	transition.to( cloud1 , { time = 25000 , x = -50 , y = 20 } ) -- 上面雲
	transition.to( cloud2 , { time = 35000 , x = -50 , y = 90 } ) -- 中間雲
	transition.to( cloud3 , { time = 40000 , x = -50 , y = 160 } ) -- 下面雲
	transition.to( aircraft , { time = 20000 , x = -100 , y = 20 } ) -- 飛機
	-- /// 動畫結束 /////////////////////////////////////////////////////////////////////////////

end

-- 分隔線｜顯示隱藏手機Bar --------------------------------------------------
funOpenCloseBar = function( isOpen )
	if ( isOpen ) then
		display.setStatusBar( display.TranslucentStatusBar )
	else
		display.setStatusBar( display.HiddenStatusBar )
	end
end

-- 分隔線 -----------------------------------------------------------------


-- 呼叫主函式 ==============================================================
main()
