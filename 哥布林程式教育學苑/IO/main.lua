-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
--local fileName = "goblin.txt"
local saveFile -- 寫入函示名稱
local loadFile -- 讀取函示名稱

saveFile = function( _saveFileName , _saveText )
	-- 從系統Documents資料夾尋找指定檔案
	local path = system.pathForFile( _saveFileName , system.DocumentsDirectory )
	--以為讀模式開啟該路徑的檔案，目的是檢查剛剛路徑檔案是否存在
	local fileHandle , errorString = io.open( path , "r" )
	--判斷檔案是否存在
	if ( fileHandle ) then
		print( "檔案已存在" )
		io.close( fileHandle )
	else
		print( "發生的錯誤是" .. errorString )
	end

	-- 已寫入模式開啟該檔案，如果檔案已經存在會覆蓋之前內容，如果不存在就新增
	fileHandle = io.open( path , "w+" )
	if ( fileHandle ) then
		-- 將資料寫入檔案中
		--local data = "第一次練習corona io練習" .. system.getTimer( ) .. "寫完了！"
		fileHandle:write( _saveText )
		-- 寫完資料之後關閉
		io.close( fileHandle )
	else
		print( "找不到可寫入的檔案" )
	end

end

-- ////////////// 下面是讀取檔案並顯示 ////////////////////////////////////////////
loadFile = function( _selectFile )
	local path = system.pathForFile( _selectFile , system.DocumentsDirectory )
	local fileHandle , errorString = io.open( path , "r" )

	if ( fileHandle ) then
		local fileText = fileHandle:read( "*a" )
		print( fileText )
		io.close( fileHandle )
	end
end


saveFile( "test.txt" , "第二次練習參數寫入文件內容！" )
loadFile( "test.txt" )