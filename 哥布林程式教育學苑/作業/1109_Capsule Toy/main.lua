--[[
DATA : 2016 / 11 / 09
OPERATION : 扭蛋玩具
AUTHOR : Adler Lei
ACADEMY : GoblinLab.org
TEACHER : Zark
--]]

--=======================================================================================
--引入各種函式庫
--=======================================================================================
math.randomseed( os.time(  ) )

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
local CapsuleToy = {}
CapsuleToy.bg = "images/CapsuleToy.png" -- 扭蛋機圖片
CapsuleToy.btn = "images/button.png" -- 投幣按鈕
CapsuleToy.head = "images/head.png" -- 扭轉圖片
CapsuleToy.logo = "images/logo.png" -- 哥布林扭蛋機logo
CapsuleToy.arrow = "images/arrow.png" -- 提示扭轉箭頭
CapsuleToy.btnAudio = audio.loadSound( "sound/button.mp3"  )-- 投幣按鈕音效
--宣告各種區域函式
local funMain
local funInit
local openCloseBar
local funTable
local textTable


--=======================================================================================
--宣告與定義main()函式
--=======================================================================================
funMain = function (  )

	-- 建立一個子群組
	funInit(  )

	-- openCloseBar
	openCloseBar( false )

end

--=======================================================================================
--定義其他函式
--=======================================================================================
--初始化函式，一般用於建立元件，設定初始值，部署元件等工作...
funInit = function (  )

	-- 投幣按鈕音效
	audio.play( CapsuleToy.btnAudio , { channel = 2 } )

	-- 輸出扭蛋機圖片
	local bg = display.newImageRect( CapsuleToy.bg , 350 , 565 )
	bg.x , bg.y = 160 , 240

	-- 遊戲標題文字
	local title = display.newText( "哥布林扭蛋機" , 170 , -10 , native.systemFont , 30 )

	-- 輸出旋轉鈕圖片
	local head = display.newImageRect( CapsuleToy.head , 108 , 88 )
	head.x , head.y = 160 , 325

	-- 輸出投幣按鈕圖片
	local btn = display.newImageRect( CapsuleToy.btn , 45 , 45 )
	btn.x , btn.y = 273 , 368

	-- 輸出提示箭頭圖片
	local arrow = display.newImageRect( CapsuleToy.arrow , 110 , 110 )
	arrow.x , arrow.y = 160 , 319

	-- 輸出哥布林logo圖片
	local logo = display.newImageRect( CapsuleToy.logo , 50 , 50 )
	logo.x , logo.y = 55 , -10

	-- 隨機輸出文字
	funTable = function()

		local rdm = math.random(  )
		textTable = {
			
		}

	end

end

-- 打開關閉手機上方功能欄位
openCloseBar = function( idOpen )
	if ( isOpen ) then
		display.setStatusBar( display.TranslucentStatusBar )
	else
		display.setStatusBar( display.HiddenStatusBar )
	end
end

-- 分隔線 ---------------------------------------------------------------------------------



-- 分隔線 ---------------------------------------------------------------------------------
funMain()