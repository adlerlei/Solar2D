-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- 用來多一層判斷取出來的值是否是我們需要的

-- print( type ( "ert" ) )
-- print( type ( 100 ) )


local tb = { '我是字串' , 200 , { 1 , 2 , "haha" } , function() print( "我是函式" )  end , true }

local rdm = math.random( #tb )

local element = tb[rdm]

print ( type ( element ) )

-- 回傳的數值都會是字串 , 下面例子參考

if ( type ( element ) == "number"  ) then
	print( "確定是數值後要處理的事情" )
elseif ( type ( element ) == "string" ) then
	print( "同上...下面以此類推" )
end
--=============

-- 提前結束 變數 的生命 do .. end
do
	local life = "haha"
	print( life )
end
print( life )
--=============

-- 物件導向方式的函式

local hunter = { name = "Minato" , talent = "獸王" , hp = 10000 }

function hunter:shoot( target ) -- shoot 是我們自己想出來的方法物件
	print( "HP : " , self.hp ) -- 物件導向的方式才會內定一個變數為 self , 所以可以使用 self 來取得物件
	print( "瞄準射擊" .. target )
end
hunter:shoot( '哥布林' )

--===============================================

-- format(pattern , .. )
local number = math.random( 200 )
local str = string.format( "%d%s所得替代率" , number , '%' ) -- % 為佔位符號
print( str )