-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
screen = {
	w = display.contentWidth,
	h = display.contentHeight
}
screenCenter = {
	x = display.contentCenterX,
	y = display.contentCenterY
}

local movie1
local movie2

-- 公告文字內容
local at = "Announcement\nThe Chinese volleyball association confirmed the appointment in an official statement saying that the chief coach is a new position designed for Lang Ping who has been plagued by injuries for years Lang Ping will focus on making plans for the team which aims to repeat glory in Tokyo 2020 Olympic Games"

-- 背景底圖
local tvBg = display.newImageRect( "images/bg.jpg" , screen.w * 3.2 , screen.h )
	tvBg.x = screenCenter.x
	tvBg.y = screenCenter.y

-- 動畫背景圖
local tvBg1 = display.newImageRect( "images/bg1.jpg" , screen.w * 3.2 , screen.h )
	tvBg1.x = screenCenter.x
	tvBg1.y = screenCenter.y
	tvBg1.alpha = 0.2
function movie1 ()
	transition.to( tvBg1, { time = 20000  , x = -1200 , onComplete = movie2 } )
end
function movie2 ()
	transition.to( tvBg1, { time = 20000  , x = screenCenter.x , onComplete = movie1 } )
end

movie1()
--timer.performWithDelay( 1, movie1 , -1 )
--timer.performWithDelay( 2000, movie2 , 0 )
--transition.to( tvBg1, { time = 20000  , x = screenCenter.x , onComplete = movie1 } )

-- 廣告幻燈片遮罩底圖
local adBg = display.newImageRect( "images/bg.jpg" , screen.w * 3.2 , screen.h )
	adBg.x = 2255
	adBg.y = screenCenter.y

-- 廣告圖片
-- local adImg1 = display.newImageRect( "images/22.jpg", 1710 , 1920 )
-- 	adImg1.x = 1387
-- 	adImg1.y = 1055

-- 公告白色半透明圖層
local adImg = display.newRect( -320 , 1055 , 1700 , 1920 )
	adImg.alpha = 0.1

-- 公告文字內容信息
local adFont = display.newText( at , -330 , 2700 , 1400 , 1520 , native.systemFont , 70 )
-- 公告文字跑馬燈（下到上）
transition.to( adFont, { time=8000 , y = 0 } )

-- logo標題黑底
local titleBlack = display.newRect( screenCenter.x , screenCenter.y / 20 , screen.w * 3.5 , screen.h / 20 )
	titleBlack:setFillColor( 0,0,0 )

-- logo標題白色半透明底
local title = display.newRect( screenCenter.x , screenCenter.y / 20 , screen.w * 3.5 , screen.h / 20 )
	title.alpha = 0.8

-- zhung logo
local logoImg = display.newImageRect( "images/logo.png" , 110 , 70 )
	logoImg.x = -1050
	logoImg.y = 55

-- title 文字信息
local titleFont = display.newText( "廣告託播專線：02 2276 5151｜info @ zhung.tw｜智鴻數位科技股份有限公司 WWW.ZHUNG.TW " , 320 , 52 , native.systemFont , 60 )
	titleFont:setFillColor( 101/255,77/255,60/255 )
