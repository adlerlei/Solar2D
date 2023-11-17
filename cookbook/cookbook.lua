--**************************
--********** 貼圖 **********
--**************************
local backgroundImage = display.newImageRect("Background.png",960,640)
backgroundImage.x = 480
backgroundImage.y = 320



-- **************************************************************
-- ** 顯示物件座標、旋轉、放大縮小、透明度、是否可見、移動圖層 **
-- **************************************************************
object.x = x座標
object.y = y座標
object.rotation = 旋轉角度
object.xScale = x方向縮放
object.yScale = y方向縮放
object.alpha =透明度
object.isVisible = 是否可見
object:toFront() 	--移往圖層最上層
object:toBack() 	--移往圖層最下層


--**************************
--******** 製作按鈕 ********
--**************************
local widget = require("widget") --引入widget

local key1Pressed = function(event)
    if ("began" == event.phase) then
        --把要做的事情寫在這邊。
        --觸控事件的階段，除了有 began，還有ended,moved
    end
end

local key1 = widget.newButton{
    width = 105,           --設定按鈕的寬度
    height = 325,          --設定按鈕的長度
    id = "1",              --設定按鈕的id
    defaultFile = "1.png", --還沒按下去圖
    overFile = "1P.png",   --真的按下去的圖
    onEvent = key1Pressed, --按下去要做的事
}



--**************************
--******** 播放音效 ********
--**************************
--先引入音效檔
local mySound1 = audio.loadSound("1.mp3") 
--或是引入背景音樂檔
local BGM = audio.loadSound("backgroundMusic.mp3") 
--播放用audio.play
audio.play(mySound1)
--播放背景音樂，loops=-1代表不停重複
audio.play(backgroundMusic,{loops=-1})



--**************************
--******* 隔多久做事情 *****
--**************************
timer.performWithDelay(時間,要做的事情)



--**************************
--******* 移動物體函式 *****
--**************************
transition.to(移動的物體,{time=時間,x=要移動的x值,transition=移動的速率變化,onComplete=動畫完成要做的事})



--**************************
--******* 觸碰監聽器 *******
--**************************
local puzzleTouch = function(event)
	if event.phase =="began" then
		--開始觸碰
	elseif event.phase =="move" then
		--觸碰移動
	elseif event.phase =="ended" then
		--觸碰結束
	end
end
object:addEventListener("touch",puzzleTouch)
--Runtime:addEventListener("touch",puzzleTouch)  --此為整個畫面加上觸碰監聽器



--**************************
--***** 用程式畫四邊形 *****
--**************************
local shape = display.newRect(x座標,y座標,寬度,高度)
shape:setFillColor(0.22,0.8,1)



--**************************
--******** 製作文字 ********
--**************************
local label = display.newText("Hello World",x座標,y座標,native.systemFontBold,80)
label:setFillColor(0.29,0.26,0.08)



--**************************
--****** 開啟多點觸控 ******
--**************************
system.activate("multitouch")



--**************************
--******* If 判斷式 ********
--**************************
local firstNumber = 6
local secondNumber = 5
local thirdNumber = 7
if firstNumber>secondNumber then
end

if firstNumber<secondNumber then
else
end

if firstNumber<secondNumber then
elseif firstNumber<thirdNumber then
end



--**************************
--******** for 迴圈 ********
--**************************
for i=1,10 do
	print(i)
end



--**************************
--******* while 迴圈 *******
--**************************
local i=1
while i<=10 do
	print(i)
	i=i+1
end



--**************************
--******** 函式寫法 ********
--**************************
--無參數的函式
function printThreeLine()
	print("this is the first line")
	print("this is the second line")
	print("this is the third line")
end
printThreeLine()

--有參數的函式
function add(number1,number2)
	return number1+number2
end

local answer = add(2,3)
print(answer)



--**************************
--**** 有次序的表格寫法 ****
--**************************
local fruitBag = {}
fruitBag[1] = "apple"
fruitBag[2] = "banana"
fruitBag[3] = "mango"
print(fruitBag[1])

local fruitBag ={"apple","banana","mango"}
print(fruitBag[1])



--**************************
--**** 無次序的表格寫法 ****
--**************************
local fruitBag={
	red="apple",
	yellow="banana"
}
fruitBag.green = "mango"
print(fruitBag.red)
print(fruitBag["red"])



--**************************
--**** 有次序表格的操作 ****
--**************************
local fruitTable = {"apple","banana","orange"}
for i=1, #fruitTable do
	print(fruitTable[i])
end



--**************************
--**** 無次序表格的操作 ****
--**************************
local fruitTable = {
	red = "apple",
	yellow = "banana",
	orange = "orange",
	green = "mango"
}
for key,value in pairs(fruitTable) do
	print(key,value)
end



--**************************
--** 表格元素的新增與刪除 **
--**************************
local alphabetTable
local printMyTable = function()
	for i=1,#alphabetTable do
		print(alphabetTable[i])
	end
	print("**********************") --加入分隔線
end
alphabetTable = {"a","b","c","d","e","f","g"}
printMyTable()

table.insert(alphabetTable,3,"just insert this")
printMyTable()

table.remove(alphabetTable,3)
printMyTable()



--**************************
--****** 生成顯示群組 ******
--**************************
local yourFortune = display.newGroup()
local tempFortune = display.newImageRect("1.png",410,232)
yourFortune:insert(tempFortune)
yourFortune.x = display.contentWidth/2
yourFortune.y = display.contentHeight - 278



--**************************
--********** 註釋 **********
--**************************
單行註釋用「--」
多行註釋用「--[[」與「]]--」



--**************************
--****** 取亂數的方法 ******
--**************************
--先用下面程式碼攪亂亂數表
math.randomseed(os.time())
--再用math.random()函式求亂數
local fortuneNumber = math.random(6)



--**************************
--**** 單場景程式碼架構 ****
--**************************
--引入函式庫
display.setStatusBar(display.HiddenStatusBar) -- 隱藏狀態列

--宣告各種變數


local main = function() --宣告與定義main()函式

end

-- 下面定義其他函式


-- 上面定義其他函式

main() --呼叫main()函式



--**************************
--**** Composer場景架構 ****
--**************************

--********* 引入各種函式庫 **********--
local widget = require("widget")
local composer = require("composer")
local scene = composer.newScene()

--********** 宣告各種變數 ***********--


--********** 定義各種函式 ***********--


--************ Composer *************--
--場景還沒到螢幕上時，負責UI畫面繪製
function scene:create(event)
	local screenGroup = self.view

end

--移除上個場景、播放音效與動畫，開始計時
function scene:show(event)
	if event.phase =="did" then
		composer.removeScene("上個場景")
	end
end

--停止音樂、釋放音樂記憶體，停止移動的物件
function scene:hide( event )
	if event.phase =="will" then

	end
end

--下個場景推上螢幕後，摧毀場景
function scene:destroy( event )
	if event.phase =="will" then

	end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene


--**************************
--**** Composer轉移場景 ****
--**************************
composer.gotoScene(轉移場景名,如何轉移場景)



--**************************
--****** 物理引擎設定 ******
--**************************
local physics = require ("physics")
physics.start()
physics.setGravity(0,40)

--加入物件
physics.addBody(物體,物件狀態,{density=25,bounce=0,friction=0})
--施力
object:applyForce(x方向施力,y方向施力,施力點x座標,施力點y座標)



--**************************
--****** 單個物件碰撞 ******
--**************************
local onCollision = function(event)
	print(event.other.name)
end

object:addEventListener("collision",onCollision)



--**************************
--*** 整個螢幕中物件碰撞 ***
--**************************
local onCollision = function(event)
	print(event.object1.name)
	print(event.object2.name)
end

Runtime:addEventListener("collision",onCollision)



--**************************
--****** movieclip.lua *****
--**************************
local movieclip = require ("movieclip")
local explodeAnimation = movieclip.newAnim({"Explo1.png",
		"Explo2.png","Explo3.png","Explo4.png","Explo5.png",
		"Explo6.png","Explo7.png","Explo8.png","Explo9.png"})
explodeAnimation:stopAtFrame(9)
explodeAnimation:play({startFrame=1,endFrame=9,loop=1})



--**************************
--**** 存取檔案兩個函式 ****
--**************************
local saveRecord = function(fileName, highScoreValue)
	--要存的檔名是theFile，要存的高分值是theValue
    local theFile = fileName
    local theValue = highScoreValue

    --找到要存檔的路徑
    local path=system.pathForFile(theFile,system.DocumentsDirectory)

    -- 用io.open打開這個路徑，w+是要寫檔的意思
    local file = io.open(path,"w+")
    if file then
        file:write(theValue) --真的寫入高分進檔案
        io.close(file) --寫完檔案後關閉檔案
    end
end

local loadRecord = function(fileName)
    --要讀取的檔名是theFile
    local theFile = fileName

    --找到要讀檔的路徑
    local path=system.pathForFile(theFile,system.DocumentsDirectory)

    -- 用io.open打開這個路徑，r是要讀檔的意思
    local file = io.open(path,"r")
    if file then
        --如果檔案存在，則讀出所有的資料
        local highScoreValue = file:read( "*a" )
        io.close(file) --讀完檔案後關閉檔案
        return highScoreValue --回傳高分
    else
        --如果檔案不存在沒有高分，則建立新檔
        local file = io.open(path,"w+")
        file:write("0") --把高分存成0分
        io.close(file) --寫完檔案後關閉檔案
        local highScoreValue = "0" 
        return highScoreValue --回傳高分是0分
    end
end