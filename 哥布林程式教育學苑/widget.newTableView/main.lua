-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local widget = require( "widget" )

local onRowRender
local onRowTouch

onRowRender = function( e )
	local row = e.row -- 取得row群組的參考
	local rowHeight , rowWidth = row.contentHeight , row.contentWidth -- 暫存row的寬高

	-- 建立 row 的內容
	local rowTitle = display.newText( row , "Row" .. row.index , 160 , 240 , native.systemFont , 14 )
	rowTitle:setFillColor( 1 , 0 ,0 ) -- 文字顏色
	rowTitle.anchorX = 0 -- 對其苗點
	rowTitle.x = 13 -- 文字x軸座標
	rowTitle.y = rowHeight * 0.5 -- 文字y軸座標
	print(rowTitle.x , rowTitle.y)

	local rowImg = display.newImageRect( row, "01.png" , 20 , 20 )
	rowImg.anchorX = 1
	rowImg.x , rowImg.y = rowWidth-10 , rowHeight * 0.5

	if ( row.index % 2 == 0 ) then
		rowImg.isVisible = false
	end
end

onRowTouch = function( e )
	print( "Event Phase：" , e.phase )
	print( "Event target：" , e.target )
	print( "Event Row Index：" , e.target.index )
end


local tableView = widget.newTableView(
	{
		left = 0,
		top = 0,
		height = 480,
		width = 320,
		onRowRender = onRowRender,
		onRowTouch = onRowTouch, -- 偵聽點擊哪一個row
	}
) 


-- tableView:insertRow{}

for i = 1 , 40 do
	tableView:insertRow{}
end

