-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- 宣告table，設定粒子特效相關參數
local emitterParams = {
	textureFileName = "fire.png",
}
-- 相關設定參數可參閱官方api文檔，網址
-- https://docs.coronalabs.com/daily/api/library/display/newEmitter.html
---------------------------------

local json = require( "json" ) -- 引入 json 函式庫

local filePath = system.pathForFile( "fire.json" ) -- 讀取 json 檔

local f = io.open( filePath , "r" )

local emitterData = f:read( "*a" )

f:close()

local emitterParams = json.decode( emitterData )

local emitter = display.newEmitter( emitterParams )
	emitter.rotation = 180
	emitter.x = display.contentCenterX
	emitter.y = display.contentCenterY
