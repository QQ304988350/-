--��鵱ǰҳ���ǲ����̵�
setDict(0,"dict.txt") --�ֿ���Ҫ�ŵ���Դ�ļ���
useDict(0)

function ����ӳ�()
	local r = rnd(1,2)
	sleep(100*r)
end

function is_shop()
	
	local intX,intY = findMultiColor(0,0,0,0,"FFFFFF","-14|9|FFFFFF|0|21|FFFFFF|-6|10|432B22|9|13|4A2A18|32|10|341E11|64|8|CAC6C4|95|9|886848|112|13|DEDEDE",0,0.9)
	if intX>-1 and intY>-1 then
		����ӳ�()
		return true
	else
		toast("��Ҫ�ֶ����̵�ҳ��",0,0,12)
		����ӳ�()
		exitScript()
		return false
	end
	
	
end


function ����()
	for i=1,50 do
		����ӳ�()
		intX,intY = findMultiColor(432,327,655,438,"FDA825","18|0|0B1B0D|39|-4|F0CF4B|141|-2|FFFFFF",0,0.9)
		if intX>-1 and intY>-1 then
			local r = rnd(-3,3)
			click(intX+r+50,intY+r)
			--��ʼ��һ�½���,��ֹ����һЩ����ֵֹ�ҳ���赲,������
			click(15+r,300+r)
			return true
		end
	end
	
end

function click(x,y)
	for i=1,5 do
		tap(x,y)
		����ӳ�()
	end
end

function find_and_click(x1,y1,x2,y2,first_color,offset_color,dir,sim)
	local intX,intY = findMultiColor(x1,y1,x2,y2,first_color,offset_color,dir,sim)
	if intX>-1 and intY>-1 then
		click(intX,intY)
	end
end



function Ѱ����ǩ������(d_x,d_y,x1,y1,x2,y2,first_color,offset_color,dir,sim)
	-- d_x d_y x��y��ƫ����
	local intX,intY = findMultiColor(x1,y1,x2,y2,first_color,offset_color,dir,sim)
	--print(intX,intY,d_x,d_y)
	if intX>-1 and intY>-1 then
		click(intX+d_x,intY+d_y)
		����()
	end
	
end


function ����ǩ()
	--����ͨ��ǩ
	Ѱ����ǩ������(425,17,410,1,542,540,"FFCC48","-2|5|E9C88A|0|4|FFF1B5|5|6|2B3037|8|8|3977A0|12|-4|893716|17|6|5F4C3F|14|-11|4984B8",0,0.9)
	����ӳ�()
	--������
	Ѱ����ǩ������(427,29,410,1,542,540,"F8421E","1|3|FB7E3D|4|8|FE5D2B|13|1|FC511E|13|8|5D323E|10|15|7C3D5C|15|13|753957|22|14|2F2421",0,0.9)
	
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
	����ӳ�()
	local intX,intY = findMultiColor(293,150,604,456,"533F24","1|-6|FFFFFF|12|-7|3B2B1B|28|-16|2E2017|35|-108|042266|38|-123|FFFFFF",0,0.9)
	if intX>-1 and intY>-1 then
		click(intX,intY)
		exitScript()
	else
		find_and_click(479,284,644,374,"1E395B","-10|-3|FFFFFF|-28|-8|F8F9FA|-44|-6|172D4C",0,0.9)
	end
end


function �Զ�ˢ�̵�()
	while true do
		--ret = is_shop ()
		--if  ret==false then
		--	exitScript()
		--end
		
		��ǲ�������½���()
		����ӳ�()
		����ǩ()
		sleep(500)
		����ҳ��()
		sleep(1000)
		����ǩ()
		����ӳ�()
		����ҳ��()
		����ӳ�()
	end
	
end




�Զ�ˢ�̵�()





