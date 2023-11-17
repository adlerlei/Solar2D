--[[
➳➳ 題目：	動畫製作｜場景轉換 作業練習 ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
➳➳ 單位：哥布林程式設計學苑 ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
➳➳ 教師：聯盟指揮官：Zark 老師 ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
➳➳ 目標：熟練動畫使用及場景轉換 ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
➳➳ 日期：2016 / 08 / 21 ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
➳➳ 學生：Adler Lei ➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳➳
]]

--=======================================================================================
-- 引入各種函式庫
local scene = composer.newScene()

--=======================================================================================
-- 宣告各種區域變數
--=======================================================================================
local varUiImg -- 使用函式生成圖片，並儲存給左邊變數
local varGoblinOrg -- 使用函式生成圖片，並儲存給左邊變數
local varScene1 -- 使用函式生成圖片，並儲存給左邊變數
local varGotoScene2 -- 使用函式生成圖片，並儲存給左邊變數
local varGotoMain -- 使用函式生成圖片，並儲存給左邊變數
local varSound -- 使用函式生成音樂，並儲存給左邊變數


-- 圖片
local varPathBg = "sceneOne/images/bg.jpg" -- 背景圖片
local varPathScene1 = "sceneOne/images/scene1.png" -- 場景1圖片
local varPathGotoScene2 = "sceneOne/images/gotoScene2.png" -- 前往場景2按鈕圖片
local varPathGotoMain = "sceneOne/images/gotoMain.png" -- 前往main場景按鈕圖片
local varPathGoblinOrg = "sceneOne/images/goblin.org.png" -- 哥布林學苑logo

-- 音效｜音樂
local varPathAudioBtn = audio.loadSound( "sceneOne/music/button.mp3" ) -- 按鈕音效｜1聲道
local varPathMusicWowMoon = audio.loadStream( "sceneOne/music/wowSilvermoon.mp3" ) -- 場景二背景音樂｜2聲道

--=======================================================================================
-- 宣告各種區域函式
--=======================================================================================
local funOnClick -- 偵聽點擊轉換場景的方式
local funScene
local funMakeUiImg -- 引入圖片 函式名稱
local funPlayAudio -- 引入音效｜音樂 函式名稱
local playOverlay

--=======================================================================================
-- 定義各種函式
--=======================================================================================
-- 引入圖片函式，並給予參數方便生成所需的ui物件圖片
funMakeUiImg = function( _path , _width , _height , _x , _y )
	varUiImg = display.newImageRect( _path , _width , _height , _x , _y )
	-- varUiImg.x , varUiImg.y = _x , _y
	return varUiImg 
end

-- 引入音樂音效函式，並給予參數方便生成所需的音效或者音樂
funPlayAudio = function( _path , _channel )
	return audio.play( _path , { channel = _channel } )
end

funScene = function()
	varGotoMain:addEventListener( "tap", funOnClick )
end

funOnClick = function()
	local options = { effect = "flip" , time = 400 }
	composer.gotoScene( "scene1" , options )
	varGotoMain:removeEventListener( "tap" , funOnClick )
end

playOverlay = function()
	local options = { isModal = true ,  effect = "flip" , time = 400 }
	composer.showOverlay( "menu" , options )
	varGotoMain:removeEventListener( "tap" , funOnClick )
end

--=======================================================================================
-- Composer 場景
--=======================================================================================
-- Composer 場景事件第一階段
-- 畫面還沒到螢幕上時，先呼叫 scene:create
-- 任務：負責 scene1 UI 畫面繪製
function scene:create( e )
	print( "畫面還沒上螢幕時，先呼叫 scene:create 這個函式" )
	-- 取得 composer group , 也就是取得 composer 所管理的群組，並儲存到 sceneGroup 變數
	local sceneGroup = self.view -- 把場景的 view 存在 sceneGroup 這個變數裡面
	local level_no = composer.getVariable( "level" )
	print("level_no" , level_no)
	-- 下方開始生成會出現在畫面的所有物件（按鈕｜背景等），並加入 sceneGroup 裡面，這個非常重要！！

	-- 生成背景圖片 ----------------------------------------------------------------
	-- varUiImg = funMakeUiImg( varPathBg , 400 , _SCREEN.HEIGHT ) -- 生成背景圖片
	-- varUiImg.x , varUiImg.y = _SCREEN.CENTER.X , _SCREEN.CENTER.Y -- 背景圖片x,y軸
	-- sceneGroup:insert( varUiImg ) -- 將背景圖片加入到 sceneGroup 群組
	-- -------------------------------------------------------------------------------
	-- -- 哥布林上方圖片 ---------------------------------------------------------------
	-- varGoblinOrg = funMakeUiImg( varPathGoblinOrg , 330 , 80 )
	-- varGoblinOrg.x , varGoblinOrg.y = _SCREEN.CENTER.X , -5
	-- sceneGroup:insert( varGoblinOrg )
	-- -------------------------------------------------------------------------------
	-- -- 場景1文字圖片 ----------------------------------------------------------------
	-- varScene1 = funMakeUiImg( varPathScene1 , 250 , 80 )
	-- varScene1.x , varScene1.y = _SCREEN.CENTER.X , _SCREEN.CENTER.Y
	-- sceneGroup:insert( varScene1 )
	-- -------------------------------------------------------------------------------
	-- -- 前往場景2按鈕圖片 ----------------------------------------------------------
	-- varGotoScene2 = funMakeUiImg( varPathGotoScene2 , 150 , 50 )
	-- varGotoScene2.x , varGotoScene2.y = 240 , 450
	-- sceneGroup:insert( varGotoScene2 )
	-- -------------------------------------------------------------------------------
	-- -- 返回main按鈕圖片 ----------------------------------------------------------
	varGotoMain = funMakeUiImg( varPathGotoMain , 150 , 50 )
	varGotoMain.x , varGotoMain.y = 80 , 450
	sceneGroup:insert( varGotoMain )
	-- -------------------------------------------------------------------------------
	local btn = display.newImageRect( sceneGroup ,  "images/fourSunGroup/1.png" , 50 , 50 )
	btn.x , btn.y = _SCREEN.CENTER.X , _SCREEN.CENTER.Y
	btn:addEventListener( "tap", playOverlay )
end


-- Composer 場景事件第二階段
-- 畫面到螢幕上時，呼叫 scene:show
-- 任務：移除前一個場景，播放音效，開始計時，播放各種動畫
function scene:show( e )
	local sceneGroup = self.view -- 把場景的 view 存在 sceneGroup 這個變數裡面
	local phase = e.phase -- 把 e.phase 事件所處的階段，儲存給 phase 變數
	
	if ( "will" == phase ) then
		print( "scene:show = will" )
		-- 畫面時將要推上螢幕時，要執行的程式碼寫在下面這裡
		print( "背景音樂播放了" )
		-- varSound = funPlayAudio( varPathMusicWowMoon , 2 )

	elseif ( "did" == phase ) then
		print( "scene:show = did" )
		-- 把畫面已經被推上螢幕後，要執行的程式碼寫在下面這裡
		-- 例如：可能會是移除之前的場景，播放音效，開始計時，播放各種動畫

		-- 移除前一個畫面的元件
		-- composer.getVariable( "loading" ):removeSelf()
		-- Runtime:addEventListener( "touch" , funOnClick )
		
		varGotoMain:addEventListener( "tap" , funOnClick )
		composer.removeScene( "scene1" , true )


	end
end


-- Composer 場景事件第三階段
-- 即將被移除，呼叫 scene:hide
-- 任務：停止音樂，釋放音樂記憶體，停止移動的物體等等
function scene:hide( e )
	local sceneGroup = self.view
	local phase = e.phase

	if ( "will" == phase ) then
		print( "scene:hide = will" )
		-- 畫面即將移開螢幕時，要執行的程式碼
		-- 這邊通常需要 停止音樂，釋放音樂記憶體，有time的計時器也可以在此停止
		-- 例如：audio.stop( )
		-- 例如：audio.dispose( bgMusic )
		-- 例如：bgMusic = nil

	elseif ( "did" == phase ) then
		print( "scene:hide = did" )
		-- 畫面已經離開螢幕，要執行的程式碼

	end
end


-- Composer 場景事件第四階段
-- 下一個場景畫面推上螢幕後
-- 任務：摧毀場景
function scene:destroy( e )
	print( "scene:destroy - 摧毀場景" )
	if ( "will" == event.phase ) then
		-- 這邊寫下畫面要被消滅前要執行的程式碼

	end
end


-- 偵聽場景的四種事件，並將場景回傳
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene