-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------


_SCREEN = {
	W = display.contentWidth ,
	H = display.contentHeight
}
_SCREEN.CENTER = {
	X = display.contentCenterX ,
	Y = display.contentCenterY
}

--螢幕寬高比例，以適應不同尺寸裝置
WIDTH_RATIO = _SCREEN.W/750
HEIGHT_RATIO = _SCREEN.H/1334

local main
local physics = require("physics" )
physics.start( )
physics.setGravity( 0, 0 )

local ball -- table名稱
local barLeft -- 左邊牆壁
local barRight -- 右邊牆壁
local barTop -- 上面牆壁
local barBottom -- 下面牆壁
local ballCollision
local ballShot
local enemy
local openCloseBar
local blood
local bloodVolume = 750 -- 血量（ 滿血量為螢幕寬度750 ）

-- 四顆球的初始化位置，並加入圖片路徑
local ballData = {
	{ man = "images/man1.png" , x = _SCREEN.CENTER.X *1.8, y = _SCREEN.CENTER.Y *1.5} ,
	{ man = "images/man2.png" , x = _SCREEN.CENTER.X *1.3, y = _SCREEN.CENTER.Y *1.6} ,
	{ man = "images/man3.png" , x = _SCREEN.CENTER.X *0.8 , y = _SCREEN.CENTER.Y *1.5} ,
	{ man = "images/man4.png" , x = _SCREEN.CENTER.X *0.3, y = _SCREEN.CENTER.Y *1.6} ,
}
--==================================================================

main = function (  )

	openCloseBar( false ) -- 開啟關閉手機功能欄位

	-- 黃色血條
	blood = display.newRect( _SCREEN.CENTER.X , 30 , 750 , 80 )
	blood:setFillColor( 251/255 , 165/255 , 41/255 )

	-- 紅色血條
	blood = display.newRect( 0 , 30 , bloodVolume , 80 )
	blood.anchorX = 0
	blood:setFillColor( 146/255 , 20/255 , 12/255 )

	local ballBody = { density=0.5, friction=0.2 , bounce=0.5, radius=100 }
	local ball = {  }
	for i = 1 , #ballData do
		local data = ballData[i]
		-- 生成四顆球
		--ball[i] = display.newCircle(  data.x , data.y , 50 )
		ball[i] = display.newImage( data.man , data.x , data.y )
		physics.addBody( ball[i], ballBody )
		ball[i].id = "ball"
	  	ball[i].linearDamping = 0.3
	  	ball[i].angularDamping = 0.8
	  	ball[i].isBullet = true
	  	ball[i].collision = ballCollision
	  	ball[i]:addEventListener( "collision", ball[i] )
	  	ball[i]:addEventListener( "touch", ballShot )
  	end
	local bumperBody = { friction=0.2, bounce=0.5 }
	-- Goblin Boss
	enemy = display.newImage( "images/goblinLogo.png" )
	enemy.x , enemy.y =  _SCREEN.CENTER.X, _SCREEN.CENTER.Y/2

	physics.addBody( enemy , "static",{ density=0.4, friction=0.3 , bounce = 0.2, radius = 200 } )
	enemy.id = "enemy"
  	-- enemy.collision = onCollision
	-- enemy:addEventListener( "collision", ballCollision )

	-- 左邊牆壁色塊
	barLeft = display.newRect( -10 , _SCREEN.CENTER.Y , 20 , _SCREEN.H )
	physics.addBody( barLeft, "static", bumperBody )
	-- 右邊牆壁色塊
	barRight = display.newRect( 760 , _SCREEN.CENTER.Y , 20 , _SCREEN.H )
	physics.addBody( barRight, "static", bumperBody )
	-- 上面牆壁色塊
	barTop = display.newRect( _SCREEN.CENTER.X , -10 , _SCREEN.W , 20 )
	physics.addBody( barTop, "static", bumperBody )
	-- 下面牆壁色塊
	barBottom = display.newRect( _SCREEN.CENTER.X  , 1345 , _SCREEN.W , 20 )
	physics.addBody( barBottom, "static", bumperBody )
end

-- 開啟關閉手機功能欄位
openCloseBar = function ( isOpen )
	if ( isOpen ) then
		display.setStatusBar( display.TranslucentStatusBar )
	else
		display.setStatusBar( display.HiddenStatusBar )
	end
end

-- 偵聽物件碰撞觸發事件
ballCollision = function ( self , e)
	local phase = e.phase
	if (phase == "began") then
		if (self.id == "ball") and (e.other.id == "enemy") then
			bloodVolume = bloodVolume - 50
			blood.width = bloodVolume
			transition.to( e.other, {time = 400 , xScale = 0.8 , yScale = 0.8 , transition = easing.continuousLoop} )
			print( "data" )
		elseif (bloodVolume == 0) then

			enemy.isVisible = false
			enemy = nil

			--local img = display.newRect( _SCREEN.CENTER.X, 665, _SCREEN.W , _SCREEN.H )
			
			print( "how is enemy value" , enemy )
		end
	end
end

-- 求飛出去 
ballShot = function ( e )
	local t = e.target
	local phase = e.phase
	if (phase == "began") then
		display.getCurrentStage():setFocus( t )
		t.isFocus = true
	    -- Stop current cueball motion, if any
	    t:setLinearVelocity( 0, 0 )
	    t.angularVelocity = 0
	    -- target
	    -- target.x = t.x
	    -- target.y = t.y
	    myLine = nil
	elseif (t.isFocus) then
		if (phase == "moved") then
			if ( myLine ) then
		        myLine.parent:remove( myLine )
		    end
			myLine = display.newLine( t.x,t.y, e.x,e.y )
    	    myLine:setStrokeColor( 1, 1, 1, 50/255 )
     	    myLine.strokeWidth = 15
		elseif (phase == "ended") then
			if ( myLine ) then
		        myLine.parent:remove( myLine )
		    end
			t.isFocus = false
		    display.getCurrentStage():setFocus( nil )
		    t:applyForce( (t.x - e.x )*2000000, (t.y - e.y )*2000000 , t.x , t.y )


		end
	end
end

main()

