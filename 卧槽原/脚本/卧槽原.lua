--��鵱ǰҳ���ǲ����̵�
setDict(0,"dict.txt") --�ֿ���Ҫ�ŵ���Դ�ļ���
useDict(0)
function is_shop()
	
	local intX,intY = findMultiColor(0,0,0,0,"FFFFFF","-14|9|FFFFFF|0|21|FFFFFF|-6|10|432B22|9|13|4A2A18|32|10|341E11|64|8|CAC6C4|95|9|886848|112|13|DEDEDE",0,0.9)
	if intX>-1 and intY>-1 then
		toast("��ǰ���̵�ҳ��",0,0,12)
		sleep(500)
		return true
	else
		toast("��Ҫ�ֶ����̵�ҳ��",0,0,12)
		sleep(500)
		exitScript()
		return false
	end
	
	
end


function ����()
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



function Ѱ����ǩ������(x1,y1,x2,y2,first_color,offset_color,dir,sim)
	
	local intX,intY = findMultiColor(x1,y1,x2,y2,first_color,offset_color,dir,sim)
	print(intX,intY)
	if intX>-1 and intY>-1 then
		click(intX+428,intY+15,1)
		����()
	end
	
end


function ����ǩ()
	--����ͨ��ǩ
	Ѱ����ǩ������(403,46,624,538,"FAF3BB","9|4|3D7DA2|5|-16|B96E3A|-6|-6|FBEAA9|13|13|AD7149",0,0.9)
	sleep(300)
	--������
	Ѱ����ǩ������(412,44,648,531,"FA4116","5|13|582F3B|19|8|3D1E18|91|-30|172D4C",0,0.9)
	
end

function ����ҳ��()
	local gesture = Gesture:new() --����һ�����ƻ�������
	local path = Path:new() --����һ���켣·��
	path:setStartTime(10) --�Ӵ����¼��ĵ�100�����ʼ����
	path:setDurTime(300) --������ʱ��
	path:addPoint(680,300) --�켣�ϵĵ�һ����
	path:addPoint(680,100) --�켣�ϵĵڶ�����
	gesture:addPath(path) --���һ������·��
	gesture:dispatch()
end

function ��ǲ�������½���()
	find_and_click(555,367,793,492,"A45324","3|0|E0D5C2|14|7|DFC147|26|4|0A1A0C",0,0.9)
end

function ����ҳ��()
	--�����������
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


function �Զ�ˢ�̵�()
	while true do
		����ҳ��()
		sleep(300)
		��ǲ�������½���()
		sleep(300)
		����ǩ()
		sleep(500)
		����ҳ��()
		sleep(500)
		����ǩ()
		sleep(300)
	end
	
end
ret = is_shop ()
if ret then
	�Զ�ˢ�̵�()
end



