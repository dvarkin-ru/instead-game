global {
    humanHP = 100;
}

stat { -- stat -- объект "статус"
	nam = 'статус_Андрей';
	disp = function(s)
		pn ('Здоровье тестера: ', humanHP)
	end
};

function init()
    take 'статус_Андрей'
end

global {
	currentTask = {
   		id = 1,
	}
}

function missionComplete(currentTask)
	currentTask.id = currentTask.id + 1
end;

function findObjectByName(objects, name)
	for i, obj in ipairs(objects) do
		if obj.nam == name then
			return obj
		end
	end
	return nil
end;

function spownAlien(s)
	if currentTask.id < 6 then
		if rnd(15) > 6 then
			s.obj:add('ксеноморф')
		end;
	end;
end;
	
function deleteAlien(s)
	local alien = findObjectByName(s.obj, 'ксеноморф')
		if alien ~= nil then
			if alien.status == true then
				humanHP = humanHP - 20
				s.obj:del('ксеноморф')
			end;
		end;
end;

function checkEndGame(s)
	if humanHP == 0 then
		walk('lose')
	end;
	if currentTask.id > 6 then
		walk('win')
	end;
end;
