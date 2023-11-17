--[[
DATA : 2016 / 09 / 14
OPERATION : newTableView
AUTHOR : Adler Lei & Zack
ACADEMY : GoblinLab.org
TEACHER : Zark
--]]

-- 引入各種函式庫 =======================================================
require( "official_document" ) -- 讀取外部官方文檔（使用print_r打印出json table資料數據）
local scene = composer.newScene(  ) -- 引入場景庫
local widget = require( "widget" ) -- 引入元件庫
local json = require( "json" ) -- 引入json庫

-- 宣告各種區域變數 =======================================================


-- 宣告各種區域函式 =======================================================
local main
local init

-- 宣告與定義main()函式 ===================================================
main = function()
	init()
end

-- 自定義函式 ============================================================
-- 初始化函式，一般用於建立元件，設定初始值，部署元件等工作 ...
init = function()

end

-- 分隔線 --------------------------------------------------------------------------------

--=======================================================================================
-- Composer 場景
--=======================================================================================
-- Composer 場景事件第一階段
-- 畫面還沒到螢幕上時，先呼叫 scene:create
-- 任務：負責 scene1 UI 畫面繪製
function scene:create( e )
	print('scene1:create')
	print( "畫面還沒上螢幕時，先呼叫 scene:create 這個函式" )
	-- 取得 composer group , 也就是取得 composer 所管理的群組，並儲存到 sceneGroup 變數
	local sceneGroup = self.view -- 把場景的 view 存在 sceneGroup 這個變數裡面
	print("sceneName" , composer.getSceneName("current"))
	composer.isDebug = true
	-- 下方開始生成會出現在畫面的所有物件（按鈕｜背景等），並加入 sceneGroup 裡面，這個非常重要！
	tableView = widget.newTableView( -- 生成 tableView 清單欄位
			{
				left = 0, -- 欄位左邊距離
				top = 40, -- 欄位上方距離
				width = 320, -- 欄位寬
				height = 480, -- 欄位高
				noLines = true, -- 隱藏欄位之間的線條
				-- backgroundColor = {1,0,0}, -- 設定背景顏色
				hideBackground = true,
				onRowRender = onRowRender, -- 欄位呼叫的函式( 清單欄位內容宣染 )
				onRowTouch = onRowTouch,
			}
		)
	network.request( url , "GET" , handleResponse )
end


-- Composer 場景事件第二階段
-- 畫面到螢幕上時，呼叫 scene:show
-- 任務：移除前一個場景，播放音效，開始計時，播放各種動畫
function scene:show( e )
	local sceneGroup = self.view -- 把場景的 view 存在 sceneGroup 這個變數裡面
	local phase = e.phase -- 把 e.phase 事件所處的階段，儲存給 phase 變數
	
	if ( "will" == phase ) then
		print( "scene1:show = will" )
		-- 畫面時將要推上螢幕時，要執行的程式碼寫在下面這裡
		main()

	elseif ( "did" == phase ) then
		print( "scene1:show = did" )
		-- 把畫面已經被推上螢幕後，要執行的程式碼寫在下面這裡
		-- 例如：可能會是移除之前的場景，播放音效，開始計時，播放各種動畫
		

	end
end


-- Composer 場景事件第三階段
-- 即將被移除，呼叫 scene:hide
-- 任務：停止音樂，釋放音樂記憶體，停止移動的物體等等
function scene:hide( e )
	local sceneGroup = self.view
	local phase = e.phase

	if ( "will" == phase ) then
		print( "scene1:hide = will" )
		-- 畫面即將移開螢幕時，要執行的程式碼
		-- 這邊通常需要 停止音樂，釋放音樂記憶體，有time的計時器也可以在此停止


	elseif ( "did" == phase ) then
		print( "scene1:hide = did" )
		-- 畫面已經離開螢幕，要執行的程式碼

	end
end


-- Composer 場景事件第四階段
-- 下一個場景畫面推上螢幕後
-- 任務：摧毀場景
function scene:destroy( e )
	print( "scene1:destroy - 摧毀場景" )
	if ( "will" == e.phase ) then
		-- 這邊寫下畫面要被消滅前要執行的程式碼
		-- composer.removeScene( "scene1" , true )
	
	end
end


-- 偵聽場景的四種事件，並將場景回傳
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene