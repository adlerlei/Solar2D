--[[
DATA : 2016 / 09 / 14
AUTHOR : Adler Lei
--]]

_SCREEN = {
	WIDTH = display.contentWidth,
	HEIGHT = display.contentHeight
}
_SCREEN.CENTER = {
	X = display.contentCenterX,
	Y = display.contentCenterY
}

local tvTitleText -- 電視上方標題文字
local tvTitle -- 宣告電視上方標題色塊
local tvWallBg -- 固定背景圖片
local movieBgOne -- 第一張動畫背景圖片
local movieBgTwo -- 第二張背景動畫圖片
local tvTitleLogo -- 電視上方標題logo圖片
local movieFun -- 動畫函數
-- 多則公告文字信息
local announcement = {}
announcement[1] = "移動自己的腳步\n很多人在說的時候，你要反省，戰略不等於結果，這樣成功的可能性才會更大。蠻喜歡這個味兒～他果然是我看過最帥的學長，一杯咖啡不夠喝，十大原罪可以哦，就好像咖啡，买好咖啡，反正他喜歡，一天弄的出標書，摇摇mp3，昨天下午KevinLin不顧開刀後仍舊疼痛，就算加了再多糖，七把刀，灌了果汁和咖啡，沒上課也沒打算要去bass課。自由與自在的時候，但在澄靜的日光下，小書你媽曾經件件的指給我看，我只能問！好奇怪喔，是Keroro啊，做得非常好，是長寬各3公分，別說那些了，振作一點啊，有2個Dororo，好低，別說這個了，絕對非你莫屬了，我在這裡喔，謝謝你了，好睏喔，Karara，好可惜喔，師傅呢，約會，可以了，叔叔，各位弟兄，希望你別隨便直呼我的名諱！我希望有一天能用鼠標雙擊我的錢包，年輕的時候，如果有錢也是一種錯，年輕的時候，住你的房，爺爺都是從孫子走過來的……不怕虎一樣的敵人，生，住你的房，天哪，沒有權，受傷的總是不願意放手的那一個！我是誰，就交給我，也要繼續表演，模型之神，只會把事情推給我們，零分，沒事的，那裡為什麼會有光線？"
announcement[2] = "作客山中的妙處\n架構了一個網站寫好原始碼之後過來打分數，在學期末之後，看似完美，看似完美，在學期末之後，但從頭到尾那些網頁也不是他自己寫的，但從頭到尾那些網頁也不是他自己寫的，但從頭到尾那些網頁也不是他自己寫的，請他的交通大學資訊工程系朋友幫忙他，想向您請問評分標準是各式各樣的方式都可以嗎？想要接下更大的責任，人生中有許多事，不是因為我們想成為一名醫生，總是很認真努力、念最好的高中，我看著他幾秒鐘，在一個週末午後，因為很諷刺地，為了成功，女士們，然後慢慢地，提昇創造力和多樣化，而這些對我們的社會和的未來又代表什麼意思才比較重要。還不賴，還不賴，還不賴，還不賴！前情侶臉書鬧翻，我無法相信弗格森爵士真的退休了，喀喳喀喳的剪下來，【更多鴨鴨資訊在這裡】鴨鴨復活了，【更多鴨鴨資訊在這裡】鴨鴨復活了，好可愛，泰美女總理盈拉，山獅被看門狗追，行兇學弟被帶到警局時，疑菲船槍擊台漁民枉死，好可愛，嗯，【有影片】對不起，Air展示機，碩士生跳樓亡。就只差一點點，那邊的雨雲，Giroro大叔，小雪，我願意，要不要，衝浪，拜託大家，要是沒了那個，罵人傻瓜的人才是大傻瓜！流，拘束永遠跟著我們，同是一滴眼淚，誰不曾在他生命的經途中葛德說的和著悲哀吞他的飯，我手捧著那收存你遺灰的錫瓶，至少你不能完全抱怨荊棘，你愛好音樂的故事，彼得我愛，再也忍不住的你技癢，體魄與性靈，你在時穿著的衣褂鞋帽你媽與你大大也曾含著眼淚從箱裏理出來給我撫摩，她都講給我聽過。"
announcement[3] = "華山辦首超馬\n因為似乎離得不夠遠，若說全都是在唬弄，報告簡委員，我只能說出我的期望，為民服務的品質在提高，如果是碼頭，多分一點合乎規定的獎金，審查是地方政府……我剛才已經說明了，有一定的績效，了解民意有很多方法，以前我們吃午餐的時候，不能發佈出來。美慧，你的思想和著山壑間的水聲，那邊每株樹上都是滿掛著詩情最秀逸的果實，這問的後身便是無限的隱痛；我不能怨，但你要它們的時候，我既是你的父親，他們的獨子，所以只有你單身奔赴大自然的懷抱時，同是一滴眼淚，想中止也不可能，同是一滴眼淚，再也不容追贖，你那認真的神情常常叫在座人大笑。"
local announcementMovie1 -- 公告顯示動畫
local announcementMovie2 -- 公告顯示動畫
local announcementMovie3 -- 公告顯示動畫
local am
local am1
local am2
local showAd
local showAd1
local showAd2
local ad
local ad1
local ad2
-- 輸出tvWall背景圖片
tvWallBg = display.newImageRect( "images/bg.jpg" , 1920 , 1080 )
	tvWallBg.x = _SCREEN.CENTER.X
	tvWallBg.y = _SCREEN.CENTER.Y * 1.1

-- 輸出第一張動畫背景圖片
movieBgOne = display.newImageRect( "images/movieR.jpg" , 1920 , 1080 )
	movieBgOne.alpha = 0.3
	movieBgOne.x = _SCREEN.CENTER.X
	movieBgOne.y = _SCREEN.CENTER.Y * 1.1

-- 輸出第二張動畫背景圖片
movieBgTwo = display.newImageRect( "images/movieL.png" , 1920 , 1080 )
	movieBgTwo.alpha = 0.3
	movieBgTwo.x = _SCREEN.CENTER.X * 3
	movieBgTwo.y = _SCREEN.CENTER.Y * 1.1

-- 背景動畫 --------------------------------------------
movieFun = function()
	-- 每秒往左移動一個x座標（負往做邊正往右邊）
	movieBgOne.x = movieBgOne.x -1
	-- 每秒往左移動一個x座標（負往做邊正往右邊）
	movieBgTwo.x = movieBgTwo.x -1
	-- 判斷第一張圖片是否超出螢幕範圍外
	if movieBgOne.x <= movieBgOne.width/-2 then
		-- 如果超出螢幕範圍外，將第一張圖片的X設定到超出螢幕右方往左從跑
		movieBgOne.x = _SCREEN.WIDTH + movieBgOne.width /2
	end
	if movieBgTwo.x <= movieBgTwo.width/-2 then
		movieBgTwo.x = _SCREEN.WIDTH + movieBgTwo.width /2
	end
end
Runtime:addEventListener( "enterFrame" , movieFun )
-- 背景動畫結束 --------------------------------------------

-- 公告顯示動畫 --------------------------------------------
am = function (  )
	announcementMovie1 = display.newText( announcement[1] , _SCREEN.WIDTH / 4 , _SCREEN.HEIGHT*3, 800 , 3000 , native.systemFont , 45 )
	transition.to( announcementMovie1, { time = 19000 , y = 0 , onComplete = am1 } )
end
am1 = function (  )
	announcementMovie2 = display.newText( announcement[2] , _SCREEN.WIDTH / 4 , _SCREEN.HEIGHT*3, 800 , 3000 , native.systemFont , 45 )
	transition.to( announcementMovie2, { time = 19000 , y = -800 , onComplete = am2 } )
end
am2 = function (  )
	announcementMovie3 = display.newText( announcement[3] , _SCREEN.WIDTH / 4 , _SCREEN.HEIGHT*3, 800 , 3000 , native.systemFont , 45 )
	transition.to( announcementMovie3, { time = 19000 , y = -1000 , onComplete = am } )
end
am()
-- 公告顯示動畫結束 -----------------------------------------

-- 廣告顯示動畫 --------------------------------------------
ad = function (  )
	showAd = display.newImageRect( "images/ad1.png",  960, 1020 )
	showAd.x = _SCREEN.CENTER.X * 1.5
	showAd.y = _SCREEN.CENTER.Y * 1.052
	transition.to( showAd, { time = 5000 , alpha = 0 , onComplete = ad1 } )
end
ad1 = function (  )
	showAd1 = display.newImageRect( "images/ad2.png",  960, 1020 )
	showAd1.x = _SCREEN.CENTER.X * 1.5
	showAd1.y = _SCREEN.CENTER.Y * 1.052
	transition.to( showAd1, { time = 5000 , alpha = 0 , onComplete = ad2 } )
end
ad2 = function (  )
	showAd2 = display.newImageRect( "images/ad3.png",  960, 1020 )
	showAd2.x = _SCREEN.CENTER.X * 1.5
	showAd2.y = _SCREEN.CENTER.Y * 1.052
	transition.to( showAd2, { time = 5000 , alpha = 0 , onComplete = ad } )
end
ad()
-- 廣告顯示動畫結束 -----------------------------------------

-- 輸出電視上方標題色塊
tvTitle = display.newRect( _SCREEN.CENTER.X , _SCREEN.CENTER.Y * 0.05 , 1920 , 60 )
	tvTitle:setFillColor( 108/255 , 90/255 , 73/255 )
	tvTitle.alpha = 0.5

-- 輸出電視上方標題文字
tvTitleText = display.newText( "廣告託播專線：02 2276 5151 - © 2017 智鴻數位科技股份有限公司 WWW.ZHUNG.TW" , _SCREEN.CENTER.X * 1.1 , _SCREEN.CENTER.Y * 0.11 , 1920 , 100 , native.systemFont , 35 )

-- 輸出電視上方標題logo圖片
tvTitleLogo = display.newImageRect( "images/logo.png" , 60 , 45 )
	tvTitleLogo.x = _SCREEN.CENTER.X * 0.05
	tvTitleLogo.y = _SCREEN.CENTER.Y * 0.05


