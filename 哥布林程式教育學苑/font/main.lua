-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- name = "adler"
-- local name = "zark"
-- local name = "ADLER"
-- print(string.lower(name))

-- local name1 = "lei"
-- print(string.upper(name1))

-- local name2 = "heianpipo"
-- print(string.reverse(name2))

-- local name3 = "aoipocho"
-- print( string.rep(name3,3) )

-- local name4 = "iloveheianpipo"
-- print( string.sub( name4,1,5) )

-- local name5 = "heianpipo"
-- print( string.len( name5 ) )
-- print( #name5 )

local image = display.newImageRect(  "images/1.png" , 320 , 480 )
image.x = 160
image.y = 240

local image1 = display.newImageRect( "images/2.png" , 320 , 200 )
image1.x = 160
image1.y = 480

local text = display.newText( "文字效果" , 200,200 , native.systemFont , 21 )
text:setFillColor( 1 , 1 , 1 )
