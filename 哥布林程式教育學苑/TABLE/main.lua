-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- 陣列行table
local t = { "傳奇" , "史詩" , "精良" , "優秀" ,"垃圾" }

math.randomseed( os.time() ) -- 一開始使用即可隨機攪亂表格！

local rdm = math.random( #t ) 
-- local rdm = math.random( 5 )


print( "Random Quality :" .. t[rdm] ) -- 顯示出來隨機摋到的裝備名稱


function getT(  )
	local t = { "傳奇" , "史詩" , "精良" , "優秀" }
	--return t
	--return "傳奇" , "史詩" , "精良" , "優秀" 
	return unpack( t )
end

--print( getT()[3] )
local s1 , s2 , s3 , s4 = getT()
print(s4)

t[5] = "一般"
local x = t[2]
local r = #t -- 抓取有幾個元素
print(r)

-- 陣列行table iterate 依次取得元素
-- ipairs
-- i是位置，v是元素內容
for i, v in ipairs(t) do
	print(i,v)
	if (i == 1) then
	end
end

-- hash型table 主要放異值資料（以key來取直)

local ht = { chest = "胸甲" , belt = "腰帶" , leg = "頭部" }
ht.hand = "手套" 
-- 以下兩種都可以
local uu = ht["hand"]
print (uu)
local item = ht.hand
print( item )

for k, v in pairs(ht) do
	print( k,v )
end

-- 複合式table ！！！
local goblin = {
	class = "hunter",
	money = 150000,
	skills = {"shoot" , "jump"},
	equips = {
		head = "adfdjkfjdkf helmet",
		chest = "adfkadfjdkfjdk armor",
		foot = "adjkfjkfkd shoes",
	},
	attributes = {
		stamina = 5000,
		hp = 350000,
		focus = 120,
	}
}

local wow = goblin.attributes.focus
local jum = goblin.skills[2]

print( jum )