-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
--local widget = require( "widget" )

-- webView 以及 popUp 只需要選一種即可。

local webView
local popupup

-- webView = native.newWebView( 160, 240, 320, 240 )-- x.y,寬,高
-- webView:request( "http://www.goblinlab.org" )

webListener = function( event )

	--print( "已載入完成 ..." .. event.type )
	print( event.errorCode )
	print( "URL = " , event.url )

	if event.errorCode then
		print( "載入錯誤" )
	else
		print( "載入正常" )
	end
	return true
end

local function removeWebView() -- 清除掉整個 webView
	webView:removeEventListener( "urlRequest" , webListener )
	webView:removeSelf( ) -- 清空房子
	webView = nil -- 清空記憶體
end

-- webView:addEventListener( "urlRequest" , webListener )
-- webView.hasBackground = false -- 取消背景（可放自己的圖片等等）

--timer.performWithDelay( 10000 , removeWebView ) -- 10秒後刪除 webView


-- 以下是 webPopup 範例，所以將上面 11,12,16,,34,35,37註解起來，並且25加上 return 才能夠讀取。

local delete = function (  )
	native.cancelWebPopup( )
end

local option = {
	urlRequest = webListener,
	hasBackground = false,
}

 popupup=native.showWebPopup( "http://www.goblinlab.org" , option )
 timer.performWithDelay( 10000 , delete )
