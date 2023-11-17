-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
-- function 裡面可以再寫function，但是不推薦這樣寫
local bf
local af = function()

		bf = function()

			print( "bfunction" )

		end

	print( "afunction" )

end
af()
bf()


-- 下面是要透過網路抓取 json 資料的網址
-- http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=a3e2b221-75e0-45c1-8f97-75acbd43d613

-- 下面是 官方提供的 print_r 可以輸出 table 的內容 //////////////////////////////////////////
function print_r ( t )  
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end
--////////////////////////////////////////////////////////////////////////////////////////

local remoteImageResponse 

-- 以下是正式開始
local json = require( "json" ) -- 先引入 json 函式庫

--  初始化，使用元件呈現網路資料
local init = function( text , src )

	-- 文字資料
	local lb = display.newText( text , 160 , 100 , nil , 30 )
	lb:setFillColor( 1,1,1 )

	-- 抓取網路圖片資料
	-- 這是透過網路抓取圖片的函式，因為沒有回傳值，所以不需要儲存給變數，testImg.png 為自定義名稱，抓下來的圖片會儲存在手機中
	display.loadRemoteImage( src , "GET" , remoteImageResponse , "testImg.png" , 160 , 400 )

end

--////////////////////////////////////////////////////////////////////////////////////////

-- 宣告一個 function 用來偵聽並請求網路資料，網路請求 handler
local function handleResponse( e ) -- 名字自己取
	-- isError / response 為自帶屬性要記得！！！
	if ( not e.isError ) then -- isError 是內建屬性檢查網路請求是否正常或成功，如果不成功則為 true，因為前面有加一個 not，所以意思是 （如果請求沒有異常，就執行...）
		-- 使用 json.decode() 把網路抓取的資料轉換成 table
		local table = json.decode( e.response ) -- response 為自帶屬性，就是網路給你的東西是什麼（sever所回應給你，還給你的資料是什麼）
		
		init( table.result.results[1].A_Family , table.result.results[1].A_Pic01_URL )
		-- print_r(table)
	else

		print( "請求失敗" )
	
	end

end

--////////////////////////////////////////////////////////////////////////////////////////

-- 把要請求的網址儲存到變數 url 裡面
local url = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=a3e2b221-75e0-45c1-8f97-75acbd43d613"

-- 使用 network 函式庫
network.request( url , "GET" , handleResponse ) -- 我們抓取資料使用 GET，要丟資料到sever使用POST

--////////////////////////////////////////////////////////////////////////////////////////

-- 網路圖片請求 handler
remoteImageResponse = function( e )
	-- 跟 68行 一樣意思
	if ( not e.isError ) then

		e.target.alpha = 0 -- 把新生成圖片的元件透明度設為0
		e.target.width , e.target.height = 200 , 200 -- 使用生成圖片元件的參考來設定寬高屬性
		transition.to( e.target , { alpha = 1 , time = 1000 } ) -- 將生成圖片做一點動畫效果

		-- 打印出檔案名稱及屬性相關資料
		print( "完整圖片路徑：" , e.response.fullPath )
		print( "圖片名稱" , e.response.filename )
		print( "圖片根目錄" , e.response.baseDirectory )
	
	else

		print( "網路請求失敗 ..." )

	end


end

