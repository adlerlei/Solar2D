--[[//////////////////////////////////////////////////////////////////////////////////////////
㊕ teacher : Zark
㊕ school : goblinlab.org
㊕ Time : 2016/09/05
㊕ Author : Adler Lei
㊕ operation : 隨意創作，練習入門班所學習到的知識。
--//////////////////////////////////////////////////////////////////////////////////////////]]

-- ㊣ 引入各種函式庫 ///////////////////////////////////////////////////////////////////////////
local scene = composer.newScene(  )

-- ㊣ 宣告各種區域變數 //////////////////////////////////////////////////////////////////////////


-- ㊣ 宣告各種區域函式 //////////////////////////////////////////////////////////////////////////
local funMain -- ㊟ main 函式名稱
local funInit -- ㊟ 初始化函式，建立元件，設定初始值，部署元件等工作，最終在 main() 中調用
local funImg -- ㊟ 引入圖片函式名稱
local funFont -- ㊟ 引入文字函式名稱
local funAudio -- ㊟ 引入音效音樂函式名稱

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
print( "哇哈哈～這裡是場景二" )
    elseif ( "did" == phase ) then
        print('scene:show did')
        -- ㊟ 把畫面已經被推上螢幕後要執行的程式碼寫在這邊
        -- ㊟ 可能是移除之前的場景，播放音效，開始計時，播放各種動畫
composer.removeScene( "scene1" , true )
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
    --     audio.stop()
    --     audio.dispose( bgMusic )
    --     bgMusic = nil
    -- elseif ( "did" == phase ) then
    --     print('scene:hide did')
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