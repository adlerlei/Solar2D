--[[
DATA : 2016 / 09 / 14
OPERATION : newTableView
AUTHOR : Adler Lei
ACADEMY : GoblinLab.org
TEACHER : Zark
--]]
--=======================================================================================
--引入各種函式庫
--=======================================================================================
-- 引入場景的函式庫
local composer = require("composer")

-- 生成一個新的場景
local scene = composer.newScene()

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
local imgTable = {} -- 圖片table
imgTable.bg1 = "images/game.jpg"
imgTable.bg2 = "images/game2.jpg"
imgTable.bg3 = "images/loading.jpg"

--宣告各種區域函式


--=======================================================================================
--宣告與定義main()函式
--=======================================================================================
funMain = function (  )

	-- 建立一個子群組
	funInit()
print( "haha" )
end

--=======================================================================================
--定義其他函式
--=======================================================================================
--初始化函式，一般用於建立元件，設定初始值，部署元件等工作...
funInit = function ()
	local img = display.newImageRect( imgTable.bg1 , 320 , 480 )
	img.x , img.y = 160 , 240
end

-- 分隔線 --------------------------------------------------


--=======================================================================================
--呼叫主函式
--=======================================================================================
funMain()


--=======================================================================================
--場景管理
--=======================================================================================
--畫面沒到螢幕上時，先呼叫scene:create，負責UI畫面繪製
function scene:create( event )
	--把場景的view存在sceneGroup這個變數裡
	local sceneGroup = self.view

	--接下來把會出現在畫面的東西，加進sceneGroup裡面
end

--畫面到螢幕上時，呼叫scene:show
--移除前一個場景，播放音效，開始計時，播放各種動畫
function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if( phase == "will") then
		--畫面即將要推上螢幕時要執行的程式碼寫在這邊
	elseif ( phase == "did") then
		--把畫面已經被推上螢幕後要執行的程式碼寫在這邊
		--可能是移除之前的場景，播放音效，開始計時，播放各種動畫

	end
end

--即將被移除，呼叫scene:hide，停止音樂，釋放音樂記憶體
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then
		--畫面即將移開螢幕時，要執行的程式碼
		--這邊需要停止音樂，釋放音樂記憶體，有timer的計時器也可以在此停止
	elseif (phase == "did") then
		--畫面已經移開螢幕時，要執行的程式碼
	end
end

--下一個場景畫面推上螢幕後
--任務
function scene:destory( event )
	local sceneGroup = self.view
	--這邊寫下畫面要被消滅前要執行的程式碼
end

-----------------------------

--幫場景加上偵聽器
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destory", scene )

return scene
