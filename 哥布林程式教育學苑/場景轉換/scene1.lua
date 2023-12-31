-----------------------------------------------------------------------------------------
--
-- xxx.lua
--
-----------------------------------------------------------------------------------------

--=======================================================================================
--引入各種函式庫
--=======================================================================================
local composer = require("composer")
local scene = composer.newScene( )
--=======================================================================================
--宣告各種變數
--=======================================================================================
local text

local onClick
local init

--=======================================================================================
--定義各種函式
--=======================================================================================
init = function( sceneGroup )
	text = display.newText( "場景二" , 160 , 240 , native.systemFont , 30 )
	sceneGroup:insert(text)
	
end

onClick = function()
	local options = { effect = "flip" , time = 400 }
	composer.gotoScene( "scene2" , options )
	Runtime:removeEventListener( "tap" , onClick )
end
--=======================================================================================
--Composer
--=======================================================================================

--畫面沒到螢幕上時，先呼叫scene:create
--任務:負責UI畫面繪製
function scene:create(event)
	--把場景的view存在sceneGroup這個變數裡
	local sceneGroup = self.view
	init(sceneGroup)
	--接下來把會出現在畫面的東西，加進sceneGroup裡面

end


--畫面到螢幕上時，呼叫scene:show
--任務:移除前一個場景，播放音效，開始計時，播放各種動畫
function  scene:show( event)
	local sceneGroup = self.view
	local phase = event.phase

	if( "will" == phase ) then
		--畫面即將要推上螢幕時要執行的程式碼寫在這邊
	elseif ( "did" == phase ) then
		--把畫面已經被推上螢幕後要執行的程式碼寫在這邊
		--可能是移除之前的場景，播放音效，開始計時，播放各種動畫
		Runtime:addEventListener( "tap" , onClick )
	end
end


--即將被移除，呼叫scene:hide
--任務:停止音樂，釋放音樂記憶體，停止移動的物體等
function scene:hide( event )
	
	local sceneGroup = self.view
	local phase = event.phase

	if ( "will" == phase ) then
		--畫面即將移開螢幕時，要執行的程式碼
		--這邊需要停止音樂，釋放音樂記憶體，有timer的計時器也可以在此停止
	elseif ( "did" == phase ) then
		--畫面已經移開螢幕時，要執行的程式碼
	end
end

--下一個場景畫面推上螢幕後
--任務:摧毀場景
function scene:destory( event )
	if ("will" == event.phase) then
		--這邊寫下畫面要被消滅前要執行的程式碼

	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destory", scene )

return scene