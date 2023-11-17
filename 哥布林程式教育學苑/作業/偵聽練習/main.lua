-----------------------------------------------------------------------------------------
-- main.lua
-- 哥布林程式教育學苑｜課後作業
-- 偵聽事件地獄特訓
-- 學生｜律 澗隱
-----------------------------------------------------------------------------------------

require( "function" ) -- 讀取外部 function.lua 檔案

-- 圖片參數 ----------------------------------------------------------
imgAutoWidth = display.viewableContentWidth -- 自度取得手機介面寬度
imgAutoHeight = display.viewableContentHeight -- 自動取得手機介面高度
imgX = display.contentCenterX -- X軸自動對齊螢幕中心點
imgY = display.contentCenterY -- X軸自動對齊螢幕中心點
local bgImg_1 = "images/bgImg1.jpg" -- 背景圖片1
local bgImg_2 = "images/bgImg2.jpg" -- 背景圖片2
local bgImg_3 = "images/bgImg3.jpg" -- 背景圖片3
local bgImg_4 = "images/bgImg4.jpg" -- 背景圖片4
local goBlin = "images/goblin.png" -- 哥布林人物圖片
local goodImg = "images/good.png" -- 吉 圖片
local smallGoodImg = "images/smallGood.png" -- 小吉 圖片
local veryGoodImg = "images/veryGood.png" -- 大吉 圖片
local leafImg = "images/leaf.png" -- 葉子圖片
local potImg = "images/pot.png" -- 吉，小吉，大吉 底圖
local sushiImg_1 = "images/Sushi_1.png" -- 壽司圖片1
local sushiImg_2 = "images/Sushi_2.png" -- 壽司圖片2
local sushiImg_3 = "images/Sushi_3.png" -- 壽司圖片3
local sushiImg_4 = "images/Sushi_4.png" -- 壽司圖片4

-- 音樂參數
local playsound_1 = audio.loadSound( "music/S1.mp3" ) -- 按鈕音效1
local playsound_2 = audio.loadSound( "music/S2.mp3" ) -- 按鈕音效1
local playsound_3 = audio.loadSound( "music/S3.mp3" ) -- 按鈕音效1
local playsound_1 = "music/S1.mp3" -- 按鈕音效1
local playsound_2 = "music/S2.mp3" -- 按鈕音效2
local playsound_3 = "music/S3.mp3" -- 按鈕音效3

----------------------------------------------------------------------
-- 問題區 ----------------------------------
-- local oo = {
-- 	fu = { "images/Sushi_2.png" , 60 , 90 }, --  每個元素結束一定要逗號！！
-- 	ci = {
-- 		tt = "rrr",
-- 		ff = "yyy"
-- 	}

-- }
-- local qq = display.newImageRect( oo.fu[1] , oo.fu[2] , oo.fu[3] )
----------------------------------------------------------------------

-- 引入壽司圖片當作處發按鈕（右邊黃色壽司）
local img1 = makeImg( sushiImg_1 , 60 , 80 )
img1.x , img1.y = 200 , 460

-- 引入壽司圖片當作結束按鈕（左邊紅色壽司）
local img2 = makeImg( sushiImg_2 , 60 , 80 )
img2.x , img2.y = 90 , 460

-- 引入壽司圖片當作拖移按鈕（上面圓圈壽司）
local img3 = makeImg( goBlin , 100 , 120 )
img3.x , img3.y = 160 , 240

local tmr -- 宣告變數，可以適用整個頁面
local isPasue = false -- 先附值 isPasue 為布林值為否，用來儲存目前是否為暫停狀態。
local isPlay = false

function onClick( e )

	if (e.phase == "began") then
		if (e.target == img1) then
			if ( isPlay == false ) then
			-- 設定每三秒執行一次更換背景圖片，bgTable在function.lua
			print("start play")
			tmr = timer.performWithDelay( 1000 , makeBgTable , -1 )
			isPlay = true
			end
		elseif (e.target == img2) then
			-- print( "timer id :" .. e.x )
			if (isPause == false) then
				timer.pause( tmr )
				isPasue = true
			end
		end	
	elseif (e.phase == "ended") then
	
	end

end
img1:addEventListener( "touch", onClick )
img2:addEventListener( "touch", onClick )

local init
init = function()

	closeOpenBar( false ) -- 隱藏手機功能欄

end
init()


-- function onClick( e )
-- 	if ( e.phase == "began" ) then
-- 		print( "haha" )
-- 	elseif ( e.phase == "moved" ) then
-- 		print( e.x , e.y )
-- 	end
-- end

-- yellowSusi:addEventListener( "touch" , onClick )
-- -- timer.performWithDelay( 3000 , onClick , -1 )

function makeTouch( e )
	local obj = e.target
	if ( e.phase == "began" ) then
		e.target.oldX = obj.x -- 儲存起始點的座標點
		-- obj.oldX = obj.x
		e.target.oldY = obj.y
	elseif ( e.phase == "moved" ) then
		local move_x = e.x - e.xStart -- 計算x.y的位置移動差量
		local move_y = e.y - e.yStart
		obj.x = move_x + e.target.oldX -- 把原始點加上上面的位移差量
		obj.y = move_y + e.target.oldY
	end
end
img3:addEventListener( "touch", makeTouch )
-- function onTouch( e )
-- 	local obj = e.target
-- 	-- print( event.x , event.y )？
-- 	if ( e.phase == "began" ) then -- x.phase phase是既有的屬性。
-- 		e.target.oldX = obj.x
-- 		e.target.oldY = obj.y
-- 		print( e.target.oldX , e.target.oldY )
-- 	elseif ( e.phase == "moved" ) then -- 當使用者開始拖移的時候
-- 		local move_x = e.x - e.xStart -- 計算X物件位移差量
-- 		local move_y = e.y - e.yStart -- 計算Y物件位移差量
-- 		obj.x = move_x + e.target.oldX -- 同下
-- 		obj.y = move_y + e.target.oldY -- 就的x座標加上x軸的位移量
-- 	end
-- end


-- susiImg1:addEventListener( "touch", onTouch )
-- event 事件當發的當下，手在哪裡。( 物流車）)
-- began 手指按下去的階段。
-- target 哪一個物件觸發。
-- moved 拖動。


