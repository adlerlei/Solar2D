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
local url = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=a3e2b221-75e0-45c1-8f97-75acbd43d613"
local tableView -- newtableView名稱
local zooJson -- 將網路json檔案儲存在zooJson變數
local imgTmp

-- 宣告各種區域函式 =======================================================
local onRowRender -- tableView專用偵聽函式
local onRowTouch -- tableView專用偵聽觸發函式
local remoteImagesResponse -- 抓取網路json檔圖檔
local handleResponse -- 偵聽網路請求函式
local main -- 27行｜宣告與定義main()函式
local init -- 33行｜初始化函式，一般用於建立元件，設定初始值，部署元件等工作 ... 
local updateTableRows --更新TableRows

-- 宣告與定義main()函式 ===================================================
main = function()
	init() -- 初始化函式，建立元件（ 33行開始 ）
end

-- 自定義函式 ============================================================
-- 初始化函式，一般用於建立元件，設定初始值，部署元件等工作 ...
init = function()

	local titleBg = display.newRect( 160 , 20 , 320 , 40 )
	titleBg:setFillColor(  148/255 , 188/255 , 50/255  )

	local titletext = display.newText( "哥布林動物園百科" , 160 , 20 )
	titletext:setFillColor( 1,1,1 )
end

--當圖片下載完成時，用以更新TableRow，將remoteImage替換成一般的ImageRect，從tmp資料夾取圖
updateTableRows = function()
	local rowNum = tableView:getNumRows()
	for i=1,rowNum do
		local row = tableView:getRowAtIndex(i)
		
		if (row) then
			if (row.imageObject) then
				display.remove(row.imageObject);
			end
			--以唯讀模式開啟該路徑的檔案，目的是檢查剛路徑檔案是否存在
			local path = system.pathForFile( i .. ".png", system.TemporaryDirectory )
			local fileHandle, errorString = io.open(path, "r")
			if (fileHandle) then
				local img = display.newImageRect( i .. ".png", system.TemporaryDirectory , 25, 25 )
				img.x = 30
				img.y = row.height / 2 
				row:insert(img);
				row.imageObject = img;
				io.close( fileHandle )
			end
			
		end
	end
end

-- 分隔線｜onRowrender ----------------------------------------------------------------
onRowRender = function( e )
	

	local row = e.row -- 獲取 e.row 的群組
	local rowWidth , rowHeight = row.contentWidth , row.contentHeight -- 獲取 row 的寬高
	local index = row.index
	local data = zooJson.result.results[index]
	local rowX , rowY = 30 , rowHeight * 0.5

	-- row欄位背景顏色
	local rowBgColor = display.newRect( row, 0, 0, rowWidth, 35 )
	rowBgColor:setFillColor( 245/255,245/255,245/255 )
	rowBgColor.anchorX = 0
	rowBgColor.x = 10
	rowBgColor.y = rowHeight * 0.5
	-- 判斷單數欄位顯示底色
	if ( index % 2 == 0 ) then
		rowBgColor.isVisible = false
	end

	-- 儲存網路json文字資料
	local rowText = display.newText( row , data.A_Name_Ch , 0 , 0 , native.systemFont , 15 )
	rowText:setFillColor( 1 , 0 , 0 )
	rowText.anchorX = 0
	rowText.x = 55
	rowText.y = rowHeight * 0.5

	-- 儲存網路json圖片資料
	display.loadRemoteImage( data.A_Pic01_URL , "GET" , remoteImagesResponse , row , index ..".png" , system.TemporaryDirectory , rowX , rowY )
end

-- 分隔線 ｜讀取網路圖片設定 ----------------------------------------------------------------
remoteImagesResponse = function( e )
	if ( not isError ) then
		--e.target.alpha = 0
		--e.target.width , e.target.height = 25 , 25
		--transition.to( e.target , { alpha = 1 , time = 1000 } ) -- 將生成圖片做一點動畫效果

		display.remove(e.target);
		e.target = nil;
		updateTableRows();

		-- 打印出檔案名稱及屬性相關資料
		-- row:insert( e.target )
		--print( "完整圖片路徑：" , e.response.fullPath )
		--print( "圖片名稱" , e.response.filename )
		--print( "圖片根目錄" , e.response.baseDirectory )
	else
		print( "網路請求失敗 ..." )
	end
end

-- 分隔線｜onRowTouch ----------------------------------------------------------------
onRowTouch = function( e )
	print( "哈哈哈～我被點擊了喔！" )
end

-- 分隔線 ｜偵聽網路請求 ----------------------------------------------------------------
handleResponse = function( e )
	if ( not isError ) then
		zooJson = json.decode( e.response )
		-- 輸出tableView列表
		for i = 1 , #zooJson.result.results do
			tableView:insertRow{
				rowHeight = 35,
			}
		end
	else
		print( "網路請求失敗 ..." )
	end
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