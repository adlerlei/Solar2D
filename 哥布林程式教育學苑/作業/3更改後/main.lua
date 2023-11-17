-----------------------------------------------------------------------------------------
-- app介面 - 引入圖片｜文字｜音效聲音｜Function練習
-- 哥布林程式設計學苑
-- 聯盟指揮官：Zark 老師
-- 2016 / 07 / 12
-- 學生：律 澗隱
-----------------------------------------------------------------------------------------
require( "image" )
display.setStatusBar( display.HiddenStatusBar)
local top
local loginOut

top , loginOut = phoneBar()
main()
music()