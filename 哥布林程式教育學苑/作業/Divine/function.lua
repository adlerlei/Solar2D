-----------------------------------------------------------------------------------------
-- 哥布林程式設計學苑 - 課後作業
-- 占卜遊戲進化版
-- 老師：Zark 老師
-- 學生：律 澗隱
-- 2016 / 07 / 25 / 星期一
-----------------------------------------------------------------------------------------

-- 攪亂表格
math.randomseed( os.time() )

-- 宣告一個變數，等等用來存放骰子圖片（當骰子圖片的遙控器）
local lastImg
-- 宣告一個變數，等等用來存放背景圖片（當圖片的遙控器）
local lastBg

-- 開啟/關閉手機bar
function openCloseBar( isOpen )
	if ( isOpen ) then
		display.setStatusBar( display.TranslucentStatusBar )
	else
		display.setStatusBar( display.HiddenStatusBar )
	end
end

-- 引入圖片檔案
function loadImg( _img , _width , _height )
	local img = display.newImageRect( _img , _width , _height )
	return img
end

-- title 文字輸出
function titleText( _text , _textX , _textY , _font , _size )
	local titleText = display.newText( _text , _textX , _textY , _font , _size )
	return titleText
end
-- 背景圖片檔案 ------------------------------------------------------------------------------------------------------------------------
-- 背景圖片檔案 - 紅色
function bgRed()
	local img = display.newImageRect( "images/bgRed.png" , display.viewableContentWidth/0.8 , display.viewableContentHeight/0.8 )
	img.x , img.y = 160 , 240
	lastBg = img
end
-- 背景圖片檔案 - 藍色
function bgBlue()
	local img = display.newImageRect( "images/bgBlue.png" , display.viewableContentWidth/0.8 , display.viewableContentHeight/0.8 )
	img.x , img.y = 160 , 240
	lastBg = img
end
-- 背景圖片檔案 - 黃色
function bgYellow()
	local img = display.newImageRect( "images/bgYellow.png" , display.viewableContentWidth/0.8 , display.viewableContentHeight/0.8 )
	img.x , img.y = 160 , 240
	lastBg = img
end
-- END ------------------------------------------------------------------------------------------------------------------------

-- 大吉｜吉｜小吉｜壞 圖片 --------------------------------------------------------------------------------------------------------
function imgSmallGood()
	local img = display.newImageRect( "images/smallGood.png" , 150 , 100 )
	img.x , img.y = 160 , 150
	-- 第九行宣告的骰子變數，將 local img = xxx 存放在 lastImg 中，用來隱藏圖片用的遙控器！
	lastImg = img
	return img
end

function imgGood()
	local img = display.newImageRect( "images/good.png" , 100 , 100 )
	img.x , img.y = 160 , 150
	-- 第九行宣告的骰子變數，將 local img = xxx 存放在 lastImg 中，用來隱藏圖片用的遙控器！
	lastImg = img
	return img
end

function imgVeryGood()
	local img = display.newImageRect( "images/VeryGood.png" , 150 , 100 )
	img.x , img.y = 160 , 150
	-- 第九行宣告的骰子變數，將 local img = xxx 存放在 lastImg 中，用來隱藏圖片用的遙控器！
	lastImg = img
	return img
end

function imgBad( )
	local img = display.newImageRect( "images/BAD.png" , 100 , 100 )
	img.x , img.y = 160 , 150
	-- 第九行宣告的骰子變數，將 local img = xxx 存放在 lastImg 中，用來隱藏圖片用的遙控器！
	lastImg = img
	return img
end
-- END ------------------------------------------------------------------------------------------------------

-- 骰子圖片音樂 -----------------------------------------------------------------------------------------------
local psound
-- 骰子圖片音樂 - 小吉
function playSmallSound()
	local imgSound = audio.loadSound( "music/smileSmallGood.mp3" )
	audio.play( imgSound , { channel = 1 } )
	psound = imgSound
end

-- 骰子圖片音樂 - 吉
function playGoodSound()
	local imgSound = audio.loadSound( "music/smileGood.mp3" )
	psound = imgSound
	audio.play( imgSound , { channel = 1 } )
end

-- 骰子圖片音樂 - 大吉
function playVeryGoodSound()
	local imgSound = audio.loadSound( "music/smileVeryGood.mp3" )
	psound = imgSound
	audio.play( imgSound , { channel = 1 } )
end
-- END ------------------------------------------------------------------------------------------------------


-- 將隨機出現骰子圖片以及骰子音效放入函示裡面 -----------------------------------------------------------------------
function playImgTable()
	if (lastImg ~= nil ) then
		lastImg:removeSelf( )
		lastImg = nil
	end
	-- 骰子Table . 將 function 中的 40 ~ 61 骰子圖片丟到 table 裡面
	local imgTable = {
		{
			text = "吉",
			img = imgGood,
			sound = playGoodSound,
		},
		{
			text = "小吉",
			img = imgSmallGood,
			sound = playSmallSound,
		},
		{
			text = "大吉",
			img = imgVeryGood,
			sound = playVeryGoodSound,
		},
		{
			text = "壞",
			img = imgBad,
			sound = playVeryGoodSound,
		}
	}
	-- math.randow() 隨機選擇 table 中的值，並附値給 變數 rdm
	local rdm = math.random( #imgTable )
	-- 將圖片輸出在手機螢幕上｜imgTable[裡面是要取的值，因為使用隨機並給了rdm變數，所以填入rdm](後面括號是因為輸出的為函示，所以需要括號)
	-- imgTable[rdm]()
	local whatGood = imgTable[rdm]
	whatGood.img()
	whatGood.sound()
	-- playSound( whatGood.sound , 2 ) -- 失敗！
end
-- END --------------------------------------------------------------------------------------------------------

-- 將隨機出現背景圖片放入函示裡面 -----------------------------------------------------------------------
function playBgImg()
	if ( lastBg ~= nil ) then
		lastBg:removeSelf()
		lastBg = nil
	end
	local bgImg = {
		{
			text = "紅色背景圖片",
			img = bgRed,
		},
		{
			text = "藍色背景圖片",
			img = bgBlue,
		},
		{
			text = "黃色背景圖片",
			img = bgYellow,
		}
	}
	local rdm = math.random( #bgImg )
	local whatBg = bgImg[rdm]
	whatBg.img()
end
-- END ---------------------------------------------------------------------------------------------