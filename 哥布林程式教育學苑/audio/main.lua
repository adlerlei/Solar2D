-----------------------------------------------------------------------------------------
--
-- main.lua
-- 音樂音效播放
-----------------------------------------------------------------------------------------

local function init()
	local music1 = audio.loadSound( "images/1.mp3" )
	local music2 = audio.loadStream( "images/3.mp3")
end

init()


audio.play( music1 , { channel = 1} )
--audio.play( music2 , { channel = 2 } )
--audio.fade( {  time= 3000 } )


timer.performWithDelay( 3000, function (  )
	audio.setVolume( 0.5 , { channel = 3 } )
	audio.play( music1 , { channel = 3 } )
	
end )

timer.performWithDelay( 10000, function (  )
	audio.stop( 1 )
	-- audio.fadeOut( { time= 1000 } )
	audio.dispose( music1 )
	music1 = nil
end )

timer.performWithDelay( 13000,function (  )
	audio.play( music1 , { channel = 1} )
end )

--audio.stop(  )

local PI = 3.14
print( "本月薪水:" .. PI * 10000)

PI = 5

print( "本月薪水:" .. PI * 10000




