--[[//////////////////////////////////////////////////////////////////////////////////////////
㊕ teacher : Zark
㊕ school : goblinlab.org
㊕ Time : 2016/09/05
㊕ Author : Adler Lei
㊕ operation : 隨意創作，練習入門班所學習到的知識。
--//////////////////////////////////////////////////////////////////////////////////////////]]

-- ㊣ 引入各種函式庫 ///////////////////////////////////////////////////////////////////////////
composer = require( "composer" ) -- ㊟ 載入生成場景函式
widget = require( "widget" ) -- ㊟ 載入生成按鈕函式
local lineRectGroup = display.newGroup() -- ㊟ 創建一個程式生成線條方塊圖形群組
local imgGroup = display.newGroup() -- ㊟ 創建一個圖片群組
local fontGroup = display.newGroup() -- ㊟ 創建一個文字群組

-- ㊣ 宣告各種全域變數 /////////////////////////////////////////////////////////////////////////
_SCREEN = { -- ㊟ 自動抓取屏幕寬高
	WIDTH = display.contentWidth,
	HEIGHT = display.contentHeight
}

_SCREEN.CENTER = { -- ㊟ 自動抓取屏幕 X Y 中心點座標
	X = display.contentCenterX,
	Y = display.contentCenterY
}

-- ㊣ 宣告各種區域變數 //////////////////////////////////////////////////////////////////////////
local varBgImg  -- ㊟ 變數名稱｜使用引入圖片函式來生成圖片
local varNumberText -- ㊟ 變數名稱｜使用引入文字函式來生成文字
local varTableText -- ㊟ 用來生成文字的 table 名稱
local varIndex -- ㊟ 變數名稱｜用來計算 table 資料並且+1
local tb_count = {'壹','貳','參','肆','伍'}
local count = #tb_count
local tm
local varMainBackground = "images/mainBackground.png" -- ㊟ main 背景圖片

-- ㊣ 宣告各種區域函式 //////////////////////////////////////////////////////////////////////////
local funOpenCloseBar
local funInit -- ㊟ 初始化元件
local funMain -- ㊟ main 函式名稱
local funMainImg -- ㊟ 引入圖片函式名稱
local funNumberText -- ㊟ 引入文字函式名稱
local funEvent

-- ㊣ 宣告與定義main()函式 //////////////////////////////////////////////////////////////////////
funMain = function()
	funOpenCloseBar( false )
	funInit()
end

-- ㊣ 定義其他函式 //////////////////////////////////////////////////////////////////////////////
funInit = function() -- ㊟ 初始化函式，建立元件，設定初始值，部署元件等工作，最終在 main() 中調用

	-- ㊟ 使用程式畫白色底圖
	display.newRect( lineRectGroup , 160 , 240 , _SCREEN.WIDTH , _SCREEN.HEIGHT )

	-- ㊟ 生成背景底圖
	varBgImg = funMainImg( imgGroup , "images/mainBackground.png" , _SCREEN.WIDTH , _SCREEN.HEIGHT )
	varBgImg.x , varBgImg.y = _SCREEN.CENTER.X , _SCREEN.CENTER.Y

	-- ㊟ 不透過函式直接生成標題文字
	display.newText( fontGroup , "Zark" , 160 , -20 , native.systemFontBold , 20 )

	-- ㊟ 不透過含是直接生成底部文字
	display.newText( fontGroup , "GOBLINLAB.ORG" , 160 , 500 , native.systemFontBold , 20 )

	funNumberText()
	tm = timer.performWithDelay( 1000, funNumberText , -1 )
	-- funEvent()
	-- funNumberText( fontGroup , varTableText[1] )

end

-- ㊡ 分隔線 ㊡ ---------------------------------------------------------------------------------
-- ㊟ 將顯示｜隱藏手機功能欄位包裝成函式在 init 調用
funOpenCloseBar = function( isOpen )
	if ( isOpen ) then
		display.setStatusBar( display.TranslucentStatusBar )
	else
		display.setStatusBar( display.HiddenStatusBar )
	end
end

-- ㊟ 引入圖片函式
funMainImg = function( _group , _path , _width , _height , _x , _y )
	local img = display.newImageRect( _group , _path , _width , _height )
	img.x , img.y = _x , _y
	return img
end

-- ㊡ 分隔線 ㊡ ---------------------------------------------------------------------------------
-- ㊟ 引入文字函式
funNumberText = function( )
	if ( varNumberText == nil ) then
		varNumberText = display.newText( fontGroup , "倒數計時開始 .. ".. tb_count[count] , 160 , 400 , native.systemFontBold , 15 )
		varNumberText:setFillColor( 0 , 0 , 0 )
	else
		count = count - 1
		if (count == 0) then
			lineRectGroup:removeSelf( )
			imgGroup:removeSelf( )
			fontGroup:removeSelf( )
			timer.cancel( tm )

			local options = {
				effect = "fade",
				time = 400
			}
			composer.gotoScene( "scene1" , options )

		else
			varNumberText.text = "倒數計時開始 .." .. tb_count[count]
		end
		
	end
end


-- ㊡ 分隔線 ㊡ ---------------------------------------------------------------------------------

-- ㊣ 呼叫主函式 /////////////////////////////////////////////////////////////////////////////////
funMain()

-- local date = os.date( "%s" )
-- local oo = display.newText( "" , 160 , 400 , native.systemFontBold , 15 )
-- oo:setFillColor( 0 , 0 , 0 )
-- oo.text = date

-- local date = os.date( "*t" )    -- Returns table of date & time values
-- print( date.year, date.month )  -- Print year and month
-- print( date.hour, date.min )    -- Print hour and minutes
-- print( os.date( "%c" ) )        -- Print time/date string, for example "Thu Oct 23 14:55:02 2010"

