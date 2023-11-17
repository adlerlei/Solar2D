-----------------------------------------------------------------------------------------
-- 哥布林程式教育學苑課後作業
-- 作業項目：占卜遊戲
-- 老師：Zark 老師
-- 學生：律 澗隱
-- 時間：20160720
-----------------------------------------------------------------------------------------

-- 引入背景音樂
function playBgMusic( _music , _channel )
	audio.play( _music , { channel = _channel } )
end

-- 隱藏顯示手機功能欄位
function openCloseBar( isOpen )
	if (isOpen) then
		display.setStatusBar( display.TranslucentStatusBar ) 
	else 
		display.setStatusBar( display.HiddenStatusBar )
	end
end

-- 引入背景圖片
function backgroundRed( _PathName , _Width , _Height )
	local imgRed = display.newImageRect( _PathName , _Width , _Height )
	return imgRed -- 回傳值，main.lua需要使用變數接收回傳值，才可以操控參數！！！
end

function backgroundBlack( _PathName , _Width , _Height )
	local imgBlack = display.newImageRect( _PathName , _Width , _Height )
	return imgBlack
end

function backgroundWhite( _PathName , _Width , _Height )
	local imgWhite = display.newImageRect( _PathName , _Width , _Height )
	return imgWhite
end

-- 引入占卜底圖
function imgDishes( _PathName , _Width , _Height )
	local imgDishes = display.newImageRect( _PathName , _Width , _Height )
	return imgDishes
end

-- 引入右邊燈籠圖片
function imgLantern( _PathName , _Width , _Height )

	local imgLantern = display.newImageRect( _PathName , _Width , _Height )
	-- local imgLantern1 = display.newImageRect( _PathName , _Width , _Height )
	return imgLantern
	-- return imgLantern1
end
-- 引入左邊燈籠圖片
function imgLantern1( _PathName , _Width , _Height )

	local imgLantern1 = display.newImageRect( _PathName , _Width , _Height )
	-- local imgLantern1 = display.newImageRect( _PathName , _Width , _Height )
	return imgLantern1
	-- return imgLantern1
end

-- 引入人物圖片--------------------------------------------
function imgWoman( _PathName , _Width , _Height )
	local imgWoman = display.newImageRect( _PathName , _Width , _Height )
	return imgWoman
end

function imgDollBigLeft( _PathName , _Width , _Height )
	local imgDollBigLeft = display.newImageRect( _PathName , _Width , _Height )
	return imgDollBigLeft
end

function imgDollBigRight( _PathName , _Width , _Height )
	local imgDollBigRight = display.newImageRect( _PathName , _Width , _Height )
	return imgDollBigRight
end
--------------------------------------------------------------

-- 引入文字
function myText( _string , _textx , _texty , _font , _fontSize )
	local myText = display.newText( _string , _textx , _texty , _font , _fontSize )
	return myText
end

-- 使用table創造文字練習
myTextTab = 
{
	text = "占",
	font = "SentyPaperCut",
	fontSize = 50,
}

myTextTab1 = 
{
	text = "卜",
	font = "SentyPaperCut",
	fontSize = 50,
}

-- 大吉｜小吉｜吉 圖片
function veryGood()
local veryGood = display.newImageRect( "images/veryGood.png" , 100 , 80 )
veryGood.x , veryGood.y = 160 , 95
-- return veryGood
end

function good()
	local good = display.newImageRect( "images/good.png" , 100 , 80 )
	good.x , good.y = 160 , 95
end

function smallGood()
	local smallGood = display.newImageRect( "images/smallGood.png" , 100 , 80 )
	smallGood.x , smallGood.y = 160 , 95
end
