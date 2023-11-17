-----------------------------------------------------------------------------------------
-- app介面 - 引入圖片｜文字｜音效聲音｜Function練習
-- 哥布林程式設計學苑
-- 聯盟指揮官：Zark 老師
-- 2016 / 07 / 12
-- 學生：律 澗隱
-- 問題：1.字型無法正確顯示｜2.在photoshop製作的圖片介面，到了corona sdk大小完全不同，需要從新調整每一張圖片？
-----------------------------------------------------------------------------------------
-- 第一次發現可以把不只一種功能同時放在一個Function裡面！
function phoneBar(  )
	-- 手機頂部
	local top = display.newImageRect( "images/topAd/top-bg.png" , display.viewableContentWidth , display.viewableContentHeight * 0.2 )
	top.x , top.y = display.contentCenterX , 10
	-- 手機頂部登出圖示
	local loginOut = display.newImageRect( "images/topAd/loginOut.png" , 20 , 20 )
	loginOut.x , loginOut.y = 15 , 28
	-- 文字輸出 ( 更改字型失敗 .. )
	local myText = display.newText( "社區好幫手" , 160 , 28 , "wt005" , 20 )
	-- 廣告圖片
	local ad = display.newImageRect( "images/topAd/廣告圖片.png" , 320 , 150 )
	ad.x , ad.y = display.contentCenterX , 120
	return top , loginOut , myText , ad
end

-- 社區功能及官方功能
function main(  )
	-- 背景底圖
	local bg = display.newImageRect( "images/communityFeatures/main.png" , 320 , 130 )
	bg.x , bg.y = 160 , 260
	local bg = display.newImageRect( "images/communityFeatures/main1.png" , 320 , 155 )
	bg.x , bg.y = 160 , 400
	-- -- 社區公告
	-- local communityFeatures = display.newImageRect( "images/communityFeatures/社區公告.png" , 60 , 50 )
	-- communityFeatures.x , communityFeatures.y = 45 , 230
	-- -- 社區公告壓克力
	-- local cf = display.newImageRect( "images/communityFeatures/社區公告壓克力.png" , 90 , 68 )
	-- cf.x , cf.y = 45 , 230
end

-- 播放音樂
function music()
	local music = audio.loadSound( "music.mp3")
	audio.play( music , { channel = 1 } )
end