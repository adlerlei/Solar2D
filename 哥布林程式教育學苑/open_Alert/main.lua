-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local funAlert
local alert

funAlert = function( e )
	if ( e.action == "clicked" ) then
		if ( e.index == 1 ) then
			print( "未必！" )
		elseif ( e.index == 2 ) then
			print( "不知道！" )
		elseif ( e.index == 3 ) then
			print( "有可能.." )
		end
	elseif ( e.action == "cancelled" ) then -- 判斷用戶什麼都沒有點的時候該做什麼
		print( "去玩法師吧" )
	end
end

alert = native.showAlert( "神器專精選擇" , "下列哪三種神器專精比較適合獵人？" , { '獸王' , '射擊' , '生存' } , funAlert )

timer.performWithDelay( 5000,  function()
	native.cancelAlert( alert )
end )