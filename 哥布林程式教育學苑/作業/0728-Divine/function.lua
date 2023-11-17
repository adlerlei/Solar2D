-----------------------------------------------------------------------------------------
-- main.lua
-- 哥布林程式教育學苑｜課後作業
-- 互動式占卜遊戲代碼重構
-- 學生｜律 澗隱
-----------------------------------------------------------------------------------------

-- 開啟關閉手機功能欄位
function closeOpenBar( isOpen )
	if ( isOpen ) then
		display.setStatusBar( display.TranslucentStatusBar  )
	else
		display.setStatusBar( display.HiddenStatusBar )
	end
end

-- -- 背景圖片參數
-- local bgs = {display.newImageRect( "images/bgImg1.jpg" , 320 , 480 ) ,
-- 			 display.newImageRect( "images/bgImg2.jpg" , 320 , 480 ) ,
-- 			 display.newImageRect( "images/bgImg3.jpg" , 320 , 480 ) ,
-- 			 display.newImageRect( "images/bgImg4.jpg" , 320 , 480 )}
-- for i=1,#bgs do
-- 	bgs[i].x , bgs[i].y = 160 , 240
-- end

-- function hideAllBgs()
-- 	for i=1,#bgs do
-- 		bgs[i].isVisible = false
-- 	end
-- end

-- 自動取得螢幕寬度｜高度參數設定 - 背景圖片專用，所以給區域變數
AUTO_SCREEN_WIDTH = display.viewableContentWidth
AUTO_SCREEN_HEIGHT = display.viewableContentHeight

-- 對話文字
local textX = 160
local textY = 240
local font = native.systemFont
local fontSize = 20


hideAllBgs()

-- local bgImg1 = 
bgImg1.isVisible = false
local bgImg2 = display.newImageRect( "images/bgImg2.jpg" , 100 , 120 )
bgImg2.isVisible = false
local bgImg3 = display.newImageRect( "images/bgImg3.jpg" , 100 , 120 )
bgImg3.isVisible = false
local bgImg4 = display.newImageRect( "images/bgImg4.jpg" , 100 , 120 )
bgImg4.isVisible = false

local goblin = "images/goblin.png"

-- 背景圖片XY軸座標參數
local imgX = display.contentCenterX
local imgY = display.contentCenterY

local goblinText
local lastImg
local textIndex = 1

-- 讀取音效檔案
function playSound( _pachName , _channel )
	audio.play( _pachName ,  { _channel = _channel } )
end

-- 載入介面圖片
function makeUiImg( _pathName , _width , _height , imgX , imgY )
	local uiImg = display.newImageRect( _pathName , _width , _height )
	uiImg.x , uiImg.y = imgX , imgY
	return uiImg
end

-- 引入哥布林人物圖片
function playGoblin()
	local img = display.newImageRect( goblin , 100 , 120 )
	img.x , img.y = 160 , 440
	return goblin
end

-- 引入四張背脊圖片
-- function playBg1()
-- 	local img = display.newImageRect( bgImg1 , AUTO_SCREEN_WIDTH , AUTO_SCREEN_HEIGHT )
-- 	img.x , img.y = imgX , imgY
-- 	lastImg = img
-- 	img:toBack( )
-- end
-- function playBg2()
-- 	local img = display.newImageRect( bgImg2 , AUTO_SCREEN_WIDTH , AUTO_SCREEN_HEIGHT )
-- 	img.x , img.y = imgX , imgY
-- 	lastImg = img
-- 	img:toBack( )
-- end
-- function playBg3()
-- 	local img = display.newImageRect( bgImg3 , AUTO_SCREEN_WIDTH , AUTO_SCREEN_HEIGHT )
-- 	img.x , img.y = imgX , imgY
-- 	lastImg = img
-- 	img:toBack( )
-- end
-- function playBg4()
-- 	local img = display.newImageRect( bgImg4 , AUTO_SCREEN_WIDTH , AUTO_SCREEN_HEIGHT )
-- 	img.x , img.y = imgX , imgY
-- 	lastImg = img
-- 	img:toBack( )
-- end

-- 將每段時間隨機顯示背景圖片放進函式
function playBgImg()
	hideAllBgs()
	bgs[math.random( #bgs )].isVisible = true
	-- if (lastImg ~= nil) then
	-- 	lastImg:removeSelf()
	-- end
	-- local bgTable = {
	-- 	{
	-- 		bg = bgImg1,
	-- 	},
	-- 	{
	-- 		bg = bgImg2,
	-- 	},
	-- 	{
	-- 		bg = bgImg3,
	-- 	},
	-- 	{
	-- 		bg = bgImg4,
	-- 	},
	-- }
	-- local rdm = math.random( #bgTable )
	-- local img = display.newImageRect( bgTable[rdm].bg , AUTO_SCREEN_WIDTH , AUTO_SCREEN_HEIGHT )
	-- img.x , img.y = imgX , imgY
	-- lastImg = img
	-- img:toBack( )
	-- for i=1,#bg do
	-- 	print(i)
	-- end
end

-- 哥布林人物點擊出現文字
function makeGoblinText( _string )
	if (goblinText == nil) then
		goblinText = display.newText( "哥布林語：" .. _string , textX , textY , font , fontSize )
		goblinText:setFillColor( 0 , 0 , 0 )
	else
		goblinText.text = "哥布林語：" .. _string
	end
end
-- function makeGoblin2( _textX , _textY , _font , _size )
-- 	local text2 = display.newText( "哥布林語：*&%$" , textX , textY , font , fontSize )
-- end
-- function makeGoblin3( _textX , _textY , _font , _size )
-- 	local text3 = display.newText( "哥布林語：#@!$%" , textX , textY , font , fontSize )
-- end

-- 按鈕點及出現對話文字
clickText = function()
	print("clickText")
	-- local clickGoblinText = {
	-- 	{
	-- 		content = "*&%$",
	-- 	},
	-- 	{
	-- 		content = "#@!$%",
	-- 	},
	-- 	{
	-- 		content = "1234",
	-- 	}
	-- }
	local clickGoblinText = {"*&%$" , "#@!$%" , "1234" }
	--local rdm = math.random( #clickGoblinText )
	makeGoblinText( clickGoblinText[textIndex] )
	textIndex = textIndex + 1 -- 將原本的textIndex變數拿過來再重新+1後，在附值給原本的tetIndex變數
	-- 如果指針的位置大於table陣列的長度，則回到起始點=1
	if (textIndex > #clickGoblinText) then
		textIndex = 1
	end
end


