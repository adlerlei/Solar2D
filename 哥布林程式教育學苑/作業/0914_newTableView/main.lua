--[[
DATA : 2016 / 09 / 14
OPERATION : newTableView
AUTHOR : Adler Lei
ACADEMY : GoblinLab.org
TEACHER : Zark
--]]

widget = require( "widget" ) -- 先引入 widget 工具庫
local json = require( "json" ) -- 先引入json 庫

-- local imgGroup = display.newGroup( )


-- 白色背景底圖
local bg = display.newRect( 160 , 400 , 320 ,  display.contentHeight*1 )
bg:setFillColor( 1,1,1 )

-- 上方標題欄位
local bgTitle = display.newRect( 160 , 5 , 320 , 50 )
bgTitle:setFillColor( 245/255 , 245/255 , 245/255 )

-- 上方標題文字
local title = display.newText( "TableView練習" , 160 , 7 , nil , 20 )
title:setFillColor( 0 , 0 , 0 )

-- 電影資訊
local tableMovies = {
	{
		title = "死侍",
		time = "2016年9月14日",
		bg = "images/m1.jpg",
		isNow = true,
	},
	{
		title = "蝙蝠俠對超人",
		time = "2016年9月15日",
		bg = "images/m2.jpg",
		isNow = true,
	},
	{
		title = "刺客教條",
		time = "2016年9月16日",
		bg = "images/m3.jpg",
		isNow = true,
	},
	{
		title = "哥布林學苑傳記",
		time = "2016年9月16日",
		bg = "images/m4.jpg",
		isNow = true,
	},
	{
		title = "功夫熊貓",
		time = "2016年9月17日",
		bg = "images/m5.jpg",
		isNow = true,
	},
}

-- local xx = tableMovies.text
-- print( xx )

-- 這是練習用的，從網路上抓下來的json已經是字串，不需要再經過這一步轉成字串
local encode_str = json.encode( tableMovies ) -- 先把table的值轉成json字串
print( #encode_str )

-- 從網路上抓下來的json要這樣處理，這是把 json 字串轉換成 table 表
local decode_table = json.decode( encode_str )
print( #decode_table )

-- onRowRender 函式
local onRowRender = function( e )

	-- local imgGroup = display.newGroup( )
	-- local textGroup = display.newGroup( )
	-- local row = display.newGroup( )

	-- 將 event.row 儲存到 row 變數
	local row = e.row

	-- 儲存 row 的寬跟高
	local rowWidth , rowHeight = row.contentWidth , row.contentHeight

	-- 顯示圖片
	local rowImg = display.newImageRect( row , decode_table[ row.index ].bg , 320 ,90 )
	rowImg.anchorX = 0
	rowImg.x , rowImg.y = 0 , rowHeight * 0.5

	-- 顯示文字
	local rowText = display.newText( row , decode_table[ row.index ].title , 0 , 0 , native.systemFont , 15 )
	rowText:setFillColor( 1 , 0 ,0 ) -- 文字顏色
	rowText.anchorX = 0
	rowText.x = 13
	rowText.y = rowHeight * 0.5

end

-- 生成 tableView
local tableView = widget.newTableView{
	left = 0,
	top = 30,
	height = 480,
	width = 320,
	noLines = true,
	onRowRender = onRowRender,
}
 -- 使用迴圈輸出欄位
for i=1,#tableMovies do
	tableView:insertRow{
	rowHeight = 90,
	lineColor = { 178/255 , 34/255 , 34/255 }

}
end
