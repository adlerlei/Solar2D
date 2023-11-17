--[[//////////////////////////////////////////////////////////////////////////////////////////
㊕ teacher : Zark
㊕ school : goblinlab.org
㊕ Time : 2016/09/05
㊕ Author : Adler Lei
㊕ operation : 隨意創作，練習入門班所學習到的知識。
--//////////////////////////////////////////////////////////////////////////////////////////]]

-- ㊣ 引入各種函式庫 ///////////////////////////////////////////////////////////////////////////
local scene = composer.newScene( )
local lineGroup = display.newGroup()  -- ㊟ 程式生成底圖群組
local imgGroup = display.newGroup()  -- ㊟ 圖片群組
local fontGroup = display.newGroup()  -- ㊟ 文字群組

-- ㊣ 宣告各種區域變數 //////////////////////////////////////////////////////////////////////////
local lineBgColor -- 設定背景顏色
local btnTable -- 前往下一個場景文字按鈕

-- ㊣ 宣告各種區域函式 //////////////////////////////////////////////////////////////////////////
local funMain -- ㊟ main 函式名稱
local funInit -- ㊟ 初始化函式，建立元件，設定初始值，部署元件等工作，最終在 main() 中調用
local funImg -- ㊟ 引入圖片函式名稱
local funFont -- ㊟ 引入文字函式名稱
local funAudio -- ㊟ 引入音效音樂函式名稱
local funGoScene -- 前往場景按鈕韓式名稱

-- ㊣ 宣告與定義main()函式 //////////////////////////////////////////////////////////////////////
funMain = function()
	funInit()
end

-- ㊣ 定義其他函式 //////////////////////////////////////////////////////////////////////////////
funInit = function( _sceneGroup )
	
	-- ㊟ 使用程式生成藍色背景
	lineBgColor = display.newRect( lineGroup , _SCREEN.CENTER.X , _SCREEN.CENTER.Y , _SCREEN.WIDTH , _SCREEN.HEIGHT )
	lineBgColor:setFillColor( 0/225 , 114/255 , 227/255 )

	-- ㊟ 標題｜下面網址文字
	display.newText( fontGroup , "場景一" , 160 , -20 , native.systemFontBold , 20 )
	display.newText( fontGroup , "GOBLINLAB.ORG" , 160 , 500 , native.systemFontBold , 20 )

	-- ㊟ 生成文字按鈕
	btnTable = widget.newButton( 
		{ -- 如何變更按鈕點及面積的大小範圍
			group = fontGroup,
			x = 160,
			y = 200,
			label = "前往場景二",
			labelColor = { default = { 0,0,0 } , over = { 1,1,1 } },
			fontSize = 20,
			onEvent = funGoScene
		}	
	 )
	 funGoScene = function( sceneGroup )
		local options = { 
			effect = "fade",
		 	time = 4000  
		}
		composer.gotoScene( "scene2" , options )
		btnTable:removeEventListener( "tap" , funGoScene )
		-- btnTable:addEventListener( "tap" , funGoScene )
	end

end
print( funGoScene )

-- ㊣ Composer /////////////////////////////////////////////////////////////////////////////////
-- ㊟ Composer 場景事件第一階段
-- ㊟ 畫面沒到螢幕上時，先呼叫scene:create
-- ㊟ 任務:負責UI畫面繪製
function scene:create(event)
    print('scene:create')
    -- ㊟ 把場景的view存在sceneGroup這個變數裡
    local sceneGroup = self.view

    -- ㊟ 接下來把會出現在畫面的東西，加進sceneGroup裡面，這個非常重要

end


-- ㊟ 畫面到螢幕上時，呼叫scene:show
-- ㊟ 移除前一個場景，播放音效，開始計時，播放各種動畫
function  scene:show( event)
    local sceneGroup = self.view
    local phase = event.phase

    if( "will" == phase ) then
        print('scene:show will')
        -- ㊟ 畫面即將要推上螢幕時要執行的程式碼寫在這邊
        funMain(sceneGroup)

    elseif ( "did" == phase ) then
        print('scene:show did')
        -- ㊟ 把畫面已經被推上螢幕後要執行的程式碼寫在這邊
        -- ㊟ 可能是移除之前的場景，播放音效，開始計時，播放各種動畫
        funMain(sceneGroup)
        -- ㊟ 移除前一個畫面的元件
        -- composer.getVariable( "loading" ):removeSelf( )
        -- Runtime:addEventListener( "touch" , touch )

    end
end


-- ㊟ 即將被移除，呼叫scene:hide
-- ㊟ 任務:停止音樂，釋放音樂記憶體，停止移動的物體等
function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( "will" == phase ) then
        print('scene:hide will')
        -- ㊟ 畫面即將移開螢幕時，要執行的程式碼
        -- ㊟ 這邊需要停止音樂，釋放音樂記憶體，有timer的計時器也可以在此停止

        -- ㊟ 畫面已經移開螢幕時，要執行的程式碼
    end
end

-- ㊟ 下一個場景畫面推上螢幕後
-- ㊟ 任務:摧毀場景
function scene:destroy( event )
    print('scene:destroy')
    if ("will" == event.phase) then
        -- ㊟ 這邊寫下畫面要被消滅前要執行的程式碼

    end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene