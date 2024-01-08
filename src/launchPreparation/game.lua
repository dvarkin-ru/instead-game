require 'os'
require 'snapshots'

------------------------
-- Константы -----------
------------------------
global {
  timestamp = 604800;
  bugsCount = rnd(10);
  checkCount = 0
}

------------------------
-- Утилиты -------------
------------------------
function setOptions(name, timeValue, timeUnit)
  local v = {}
  v.disp = name;
  v.dsc = string.format('{%s (%s %s.)} |', name, timeValue, timeUnit);
  v.act = function(s)
    remove(s)
    timestamp = timestamp - getTimeStamp(timeValue, timeUnit);
    checkCount = checkCount + 1
    if timestamp < 0 then
      timestamp = 0
      walk(roomList)
      return
    end
    if rnd(10) > 5 and bugsCount > 0 then
      bugsCount = bugsCount - 1
      p [[Опачки! Найдена неисправность]];
    else
      p [[Проверка прошла успешно. Недочетов не выявлено!]]
    end
    walk(roomList)
  end
  return obj(v)
end

function formatTime(time)
  local seconds = time % 60
  local minutes = math.floor((time / 60) % 60)
  local hours = math.floor((time / 3600) % 24)
  local days = math.floor(time / 86400)

  return string.format('%d дней %2d часов %2d минут', days, hours, minutes)
end

function getTimeStamp(value, unit)
  if unit == 'д' then
    return value * 86400
  elseif unit == 'ч' then
    return value * 3600
  elseif unit == 'м' then
    return value * 60
  else
    return nil
  end
end

------------------------
-- Статы ---------------
------------------------
stat {
  nam = 'статусы';
  disp = function(s)
    pn ('Оставлееся время: ', formatTime(timestamp))
    pn ('Баги: ', bugsCount)     -- убрать на релизе
    pn ('Кол-во проверок: ', checkCount)     -- убрать на релизе
    pn ('_____________')
  end
};

function init()
	take 'статусы'
end

------------------------
-- Основа --------------
------------------------
document = obj {
  disp = 'документ';
  dsc = [[На столе лежит {документ} неизвестного содержания...]];
  valid = rnd(10) > 1;
  tak = function(s)
		if s.valid then
			p [[О! Так это же документ подтверждающий тестирование. Даже печать стоит! С документом все в порядке]];
      timestamp = timestamp - 60;
      walk(roomList)
      return true;
		else
			p [[Документ не подписан. Зачем проверять то, что точно не работает? Сидеть дальше нет смысла. Пойду домой...]];
      return true;
		end;
	end;
}

roomList = room {
  disp = 'Список проверок';
  obj = {
    setOptions('Проверка на пригодность площадки', 6, 'д'),
    setOptions('Проверка на механические повреждения', 1, 'д'),
    setOptions('Проверка системы безопасности', 1, 'д'),
    setOptions('Проверка системы энергоснабжения', 1, 'д'),
    setOptions('Проверка системы крепления', 1, 'д'),
    setOptions('Проверка стыковочных механизмов', 1, 'д'),
    setOptions('Проверка систем связи', 1, 'д'),
    setOptions('Проверка оборудования', 1, 'д'),
    setOptions('Проверка герметичности', 1, 'д'),
    setOptions('Проверка системы питания', 1, 'д'),
    setOptions('Проверка топлива', 1, 'д'),
    setOptions('Проверка системы подачи кислорода', 1, 'д'),
  };
  exit = function(s)
    if #s.obj == 0 or timestamp == 0 then
      if (bugsCount > 0) then
        walk('fail');
      else
        walk('ready');
      end
    end
  end;
}

room {
	nam = 'launchPreparation';
  disp = 'Подготовка к запуску';
  obj = { document };
  onenter = function()
		snapshots:make()
	end;
}

----------------------------
-- Заключительные комнаты --
----------------------------
room {
	nam = 'ready';
	disp = 'Победа!';
	dsc = [[Проверка всех систем успешна!]];
	pic = 'assets/ready.gif';
}

room {
	nam = 'fail';
	disp = 'Вы проиграли';
	dsc = [[Фэйл]];
	pic = 'assets/fail2.gif';
}: with {
	obj {
		dsc = [[{Переиграть?}]];
		act = function()
			snapshots:restore() -- восстановились
		end;
	}
}

