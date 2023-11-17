-- 控制手機狀態列方式
-- display.setStatusBar( display.HiddenStatusBar ) -- 隱藏狀態列
-- display.setStatusBar( display.DefaultStatusBar ) -- 顯示預設狀態列
-- display.setStatusBar( display.TranslucentStatusBar ) -- 顯示半透明狀態列
-- display.setStatusBar( display.DarkStatusBar ) -- 顯示黑色狀態列

-- 調閱手機畫面數值
-- display.contentWidth -- 取得目前螢幕設備寬度 Width
-- display.contentHeight -- 取得目前螢幕設備高度 Height
-- display.contentCenterX -- 取得目前螢幕設備中心點 X 座標
-- display.contentCenterY -- 取得目前螢幕設備中心點 Y 座標
-- display.statusBarHeight -- 取得 IOS 狀態列高度 （僅限於IOS設備..測試後Android同樣適用..）

-- 控制物件 Object 的屬性及方法
-- object.alpha -- 控制物件透明度，範圍 0 到 1，0 代表完全透明！
-- object.x -- 物件x座標
-- object.y -- 物件y座標
-- object.anchorX -- 控制物件 x 軸對其重心點，範圍 0 到 1，0 代表左對齊！(0=最左｜0.5=中心點｜1=最右)
-- object.anchorY -- 控制物件 y 軸對其重心點，範圍 0 到 1，0 代表上頂端對齊！(0=最頂｜0.5=中心點｜1=最底)
-- object.isVisible -- 控制物件是否可視，flase 代表隱藏。
-- object.rotation -- 控制物件旋轉，數值代表旋轉的角度。
-- object.xScale -- 控制物件 X 軸縮放，0.5代表縮小 1/2，2代表放大2倍。(控制圖片X軸縮小50%)
-- object.yScale -- 控制物件 Y 軸縮放，0.5代表縮小 1/2，2代表放大2倍。(控制圖片Y軸縮小50%)

-- 顯示app目前執行時間
-- function printTimeSinceStart( event )
--       print (event.time/1000 .. " sceonds since app started.")
-- end 
-- Runtime:addEventListener( "enterFrame", printTimeSinceStart )

-- 宣告螢幕設備寬度及高度還有XY座標中心點 .. 這是全域變數
-- screen = {
-- 	w = display.contentWidth ,
-- 	h = display.contentHeight ,
-- 	x = display.contentCenterX ,
-- 	y = display.contentCenterY ,
-- }

-- 要使用按鈕元件，需要先引入 widget 函式庫
-- local widget = require( "widget" )

-- 按鈕元件的參數設定
-- id -- 對此按鈕元件進行命名
-- x , y -- 設定按鈕的 x y 座標（以元件的中心點為基準點）x,y或者left,top只能選一種
-- left , top -- 設定按鈕元件的座標（以元件的左上端點為基準點）
-- isEnabled -- 設定按鈕元件是否可用，設定 false 為不可用
-- lableColor -- 按鈕文字顏色，default 為按下前的顏色，over 為按下後的顏色
-- onPress -- 等待按鈕按下後，要執行的函式名稱
-- onRelease -- 等待按鈕按了之後放開，要執行函式名稱
-- onEvent -- 自定義按鈕觸發階段執行不同動作自行寫函示

-- 按鈕範例
-- local button = widget.newButton{
-- 	x = 160 ,
-- 	y = 240 ,
-- 	labelColor = { default = { 1,1,1 } , over = { 0,0,0 } } ,
-- 	label = "按鈕文字"
-- 	-- onPress -- 等待按鈕按下後，要執行的函式名稱 / 這三種選擇一種即可！
-- 	-- onRelease -- 等待按鈕按了之後放開，要執行函式名稱
-- 	-- onEvent -- 自定義按鈕觸發階段執行不同動作自行寫函示
-- }

-- 按鈕及函式範例
-- local widget = require("widget")
-- local button = widget.newButton{
-- 	x = 160 ,
-- 	y = 240 ,
-- 	labelColor = { default = { 1,1,1 } , over = { 0,0,0 } } ,
-- 	label = "按鈕文字" ,
-- 	fontSize = "30" , -- 按鈕文字大小
-- 	onEvent = butFunction , -- 自定義按鈕觸發階段執行不同動作自行寫函示
-- }

-- local butFunction = function(event)
-- 	if ( event.phase == "began" ) then
-- 		print("按鈕按下")
-- 	elseif ( event.phase == "moved" )
-- 		print("按住按鈕且拖曳")
-- 	elseif( event.phase == "ended" )
-- 		print("按鈕放開")
-- 	end
-- end