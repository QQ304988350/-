--检查当前页面是不是商店
setDict(0,"dict.txt") --字库需要放到资源文件中
useDict(0)
function is_shop()
	
	local intX,intY = findMultiColor(0,0,0,0,"FFFFFF","-14|9|FFFFFF|0|21|FFFFFF|-6|10|432B22|9|13|4A2A18|32|10|341E11|64|8|CAC6C4|95|9|886848|112|13|DEDEDE",0,0.9)
	if intX>-1 and intY>-1 then
		toast("当前在商店页面",0,0,12)
		sleep(500)
		return true
	else
		toast("需要手动打开商店页面",0,0,12)
		sleep(500)
		exitScript()
		return false
	end
	
	
end


function 购买()
	for i=1,50 do
		sleep(100)
		intX,intY = findMultiColor(432,327,655,438,"FDA825","18|0|0B1B0D|39|-4|F0CF4B|141|-2|FFFFFF",0,0.9)
		if intX>-1 and intY>-1 then
			click(intX,intY,1)
			return true
		end
	end
	
end

function click(x,y,second)
	for i=1,5 do
		tap(x,y)
		sleep(second*100)
	end
end

function find_and_click(x1,y1,x2,y2,first_color,offset_color,dir,sim)
	local intX,intY = findMultiColor(x1,y1,x2,y2,first_color,offset_color,dir,sim)
	if intX>-1 and intY>-1 then
		click(intX,intY,1)
	end
end



function 寻找书签并购买(x1,y1,x2,y2,first_color,offset_color,dir,sim)
	
	local intX,intY = findMultiColor(x1,y1,x2,y2,first_color,offset_color,dir,sim)
	print(intX,intY)
	if intX>-1 and intY>-1 then
		click(intX+428,intY+15,1)
		购买()
	end
	
end


function 买书签()
	--买普通书签
	寻找书签并购买(403,46,624,538,"FAF3BB","9|4|3D7DA2|5|-16|B96E3A|-6|-6|FBEAA9|13|13|AD7149",0,0.9)
	sleep(300)
	--买神秘
	寻找书签并购买(412,44,648,531,"FA4116","5|13|582F3B|19|8|3D1E18|91|-30|172D4C",0,0.9)
	
end

function 滑动页面()
	local gesture = Gesture:new() --创建一个手势滑动对象
	local path = Path:new() --创建一个轨迹路径
	path:setStartTime(10) --从触发事件的第100毫秒后开始滑动
	path:setDurTime(300) --滑动的时间
	path:addPoint(680,300) --轨迹上的第一个点
	path:addPoint(680,100) --轨迹上的第二个点
	gesture:addPath(path) --添加一个滑动路径
	gesture:dispatch()
end

function 派遣任务重新进行()
	find_and_click(555,367,793,492,"A45324","3|0|E0D5C2|14|7|DFC147|26|4|0A1A0C",0,0.9)
end

function 更新页面()
	--点击立即更新
	find_and_click(28,453,304,529,"FFFFFF","0|-11|101F47|32|-4|FFDC4E|33|0|FBD84D|-2|11|031F62",0,0.9)
	sleep(300)
	local intX,intY = findMultiColor(293,150,604,456,"533F24","1|-6|FFFFFF|12|-7|3B2B1B|28|-16|2E2017|35|-108|042266|38|-123|FFFFFF",0,0.9)
	if intX>-1 and intY>-1 then
		click(intX,intY,1)
		exitScript()
	else
		find_and_click(479,284,644,374,"1E395B","-10|-3|FFFFFF|-28|-8|F8F9FA|-44|-6|172D4C",0,0.9)
	end
end


function 自动刷商店()
	while true do
		更新页面()
		sleep(300)
		派遣任务重新进行()
		sleep(300)
		买书签()
		sleep(500)
		滑动页面()
		sleep(500)
		买书签()
		sleep(300)
	end
	
end
ret = is_shop ()
if ret then
	自动刷商店()
end



