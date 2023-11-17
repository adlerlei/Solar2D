-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local susiImg = display.newImageRect( "images/1.png" , 100 , 100 )
susiImg.x , susiImg.y = 160 , 150 

local susiImg1 = display.newImageRect( "images/2.png" , 100 , 100 )
susiImg1.x , susiImg1.y = 160 , 350 

function onTouch( e )
	local obj = e.target
	-- print( event.x , event.y )？
	if ( e.phase == "began" ) then -- x.phase phase是既有的屬性。
		e.target.oldX = obj.x
		e.target.oldY = obj.y
		print( e.target.oldX , e.target.oldY )
	elseif ( e.phase == "moved" ) then -- 當使用者開始拖移的時候
		local move_x = e.x - e.xStart -- 計算X物件位移差量
		local move_y = e.y - e.yStart -- 計算Y物件位移差量
		obj.x = move_x + e.target.oldX -- 同下
		obj.y = move_y + e.target.oldY -- 就的x座標加上x軸的位移量
	end
end
susiImg:addEventListener( "touch", onTouch )


-- susiImg1:addEventListener( "touch", onTouch )
-- event 事件當發的當下，手在哪裡。( 物流車）)
-- began 手指按下去的階段。
-- target 哪一個物件觸發。
-- moved 拖動。