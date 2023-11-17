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
local scene = composer.newScene(  )


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
--=======================================================================================
local text
local bg

--=======================================================================================
--宣告各種區域函式
--=======================================================================================
local onClick
print("hahaha")

--=======================================================================================
--定義其他函式
--=======================================================================================
--初始化函式，一般用於建立元件，設定初始值，部署元件等工作...
init = function (sceneGroup)


	bg = display.newImageRect( sceneGroup , "images/main.jpg", _SCREEN.WIDTH, _SCREEN.HEIGHT )
	bg.x , bg.y = _SCREEN.CENTER.X , _SCREEN.CENTER.Y

	text = display.newText(
		sceneGroup,
		"場景轉換效果展示\n展示效果：fade",
		210 ,
		45 ,
		native.systemFont ,
		25
		)

	text:setFillColor( 0,1 )

	Runtime:addEventListener( "tap" , onClick )

end

-- 分隔線 --------------------------------------------------
onClick = function (  )
	local option = {
		effect = "slideUp",
		time = 400
	}
	composer.gotoScene( "scene2" , option )
end

--=======================================================================================
--呼叫主函式
--=======================================================================================


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
		init(sceneGroup)

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
