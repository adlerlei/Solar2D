-----------------------------------------------------------------------------------------
--2016 11 07 作業
--作業項目：扭蛋機作業
--Teacher:Zark
--studends:yuchen
-----------------------------------------------------------------------------------------

-- Your code here
math.randomseed( os.time( ) )

function yuchen(  )
	local feb = { "忠孝" , "仁愛" , "信義" , "和平" }
	local rdm = math.random( #feb )
	local toy = display.newImageRect( 'images/toy.png' , 320 , 560 )
	toy.x , toy.y = 160 , 230
	--local bl = feb
	local sym = display.newText( feb[rdm] , 160 , 430 , system.nativeFont , 30 )
	--return bl , feb , sym
end
yuchen(  )

function
fun


local im = display.newImageRect( "" , )

display.newImageRect()