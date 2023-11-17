-----------------------------------------------------------------------------------------
-- 哥布林音樂卡片（從新修改）
-- 哥布林程式教育學苑
-- 老師：zark
-- 學生：律 澗隱
-----------------------------------------------------------------------------------------

-- 開頭先載入背景音樂檔案
function playBgMusic( _music , _channel )
	audio.play( _music , { channel = _channel } )
end

-- 隱藏手機上方功能欄
function openCloseBar( isOpen )
	if (isOpen) then
		display.setStatusBar( display.TranslucentStatusBar ) 
	else
		display.setStatusBar( display.HiddenStatusBar )
	end
end

-- 載入背景圖片
function bgImage( _bgImage1 , _width , _height , _bgx   , _bgy  )

	print("bgImage Start....")
	print("_bgImage1:" .. _bgImage1)
	_bgImage1()
	print(_bgImage1 , _width , _height , _bgx , _bgy )

	local bgImg = display.newImageRect( _bgImage , _width , _height )
	--print(bgImg)
-- 	if (_bgx ~= nil) then
-- 		bgImg.x = _bgx
-- 	else
-- 	 	bgImg.x = 160
-- 	end
-- 	if (_bgy ~= nil) then
-- 		bgImg.y = _bgy
-- 	else
-- 		bgImg.y = 240
-- 	end
-- 	print("bgImg.x:" .. bgImg.x)
-- 	--bgImg.x , bgImg.y = _bgx , _bgy
-- 	return bgImg
-- end

-- local abc = bgImage(...)

-- 載入哥布林圖片
function goblinMan( _image , _width , _height , _bgx , _bgy )
	local img = display.newImageRect( _image , _width , _height )
	img.x , img.y = _bgx , _bgy
	return img
end

function rr (x1 , x2 , x3)
	local img = display.newImageRect( x1 , x2 , x3 )
	return x1 , x2 , x3
end
