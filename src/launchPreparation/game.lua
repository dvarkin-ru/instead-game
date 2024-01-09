require 'os'
require 'snd'
require 'snapshots'

snd.music 'assets/theme.mp3'

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
  v.dsc =  function(s)
    p(string.format([[{%s (%s %s.)}]], name, timeValue, timeUnit));
    p(fmt.c '^');
  end
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

  return string.format('%d д. %2d ч. %2d м.', days, hours, minutes)
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
    pn ('Неисправности: ', bugsCount)     -- убрать на релизе(?)
    pn ('Кол-во проверок: ', checkCount)
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
  disp = 'документ'..fmt.img('assets/book.png');
  dsc = function(s)
    p [[На столе лежит {документ} неизвестного содержания...^^]]
    p(fmt.tab('50%', 'center')..fmt.img('assets/document.png'))
  end;
  valid = rnd(10) > 1;
  tak = function(s)
		if s.valid then
			p [[О! Так это же документ подтверждающий тестирование. Даже печать стоит! С документом все в порядке]];
      timestamp = timestamp - 60 * 5;
      walk(roomList)
      return true;
		else
			p [[Документ не подписан. Зачем проверять то, что точно не работает? Сидеть дальше нет смысла. Пойду домой...]];
      return true;
		end;
	end;
}

coffeeBreak = room {
  disp = 'Перерыв на кофе 15 минуточек';
	pic = 'assets/coffee.gif';
  way = { path {'Вернуться к работе', 'roomList'} };
}

roomList = room {
  nam = 'roomList';
  disp = 'Список проверок';
  obj = {
    setOptions('Проверка на пригодность площадки', 4, 'ч'),
    setOptions('Проверка на механические повреждения', 1, 'д'),
    setOptions('Проверка системы безопасности', 14, 'ч'),
    setOptions('Проверка системы энергоснабжения', 3, 'ч'),
    setOptions('Проверка системы крепления', 2, 'ч'),
    setOptions('Проверка стыковочных механизмов', 1, 'ч'),
    setOptions('Проверка систем связи', 18, 'ч'),
    setOptions('Проверка оборудования', 13, 'ч'),
    setOptions('Проверка герметичности', 7, 'ч'),
    setOptions('Проверка системы питания ракеты', 8, 'ч'),
    setOptions('Проверка топлива', 3, 'ч'),
    setOptions('Проверка системы подачи кислорода', 1, 'д'),
    setOptions('Проверка системы вентиляции', 8, 'ч'),
    setOptions('Проверка системы отопления', 12, 'ч'),
    setOptions('Проверка системы охлаждения', 12, 'ч'),
    setOptions('Проверка двигателей', 1, 'д'),
    setOptions('Проверка наличия на борту средств первой необходимости (Комплекс)', 1, 'д'),
    setOptions('Проверка наличия, количества, исправности и качества костюмов ', 1, 'д'),
    setOptions('Проверка самочувствия космонавтов ', 2, 'ч'),
    setOptions('Проверка физического состояния космонавтов ', 40, 'м'),
    setOptions('Проверка психологического состояния космонавтов ', 20, 'м'),
    setOptions('Проверка на отсутствие колюще-режущих вещей', 10, 'м'),
    setOptions('Проверка на отсутствие легко-воспламеняющихся вещей', 10, 'м'),
    setOptions('Проверка расчетов на корректность', 2, 'д'),
  };
  coffeeTime = 5;
  exit = function(s)
    s.coffeeTime = s.coffeeTime - 1

    if #s.obj == 0 or timestamp == 0 then
      if (bugsCount > 0) then
        walk(fail);
      else
        walk(ready);
      end;
      return
    end;

    if s.coffeeTime == 0 then
      s.coffeeTime = 5
      timestamp = timestamp - 60 * 15;
      walk(coffeeBreak);
      return
    end;
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
ready = room {
	disp = 'Это чудесное чувство после хорошо сделанной работы';
	dsc = [[Все системы ракеты проверены и работают безупречно, словно после чашки кофе с утра. Ракета готова к своему звездному вылету! Время покорить космос!]];
	pic = 'assets/ready.gif';
}

fail = room {
	disp = 'Вы проиграли';
	dsc = [[Ну что сказать, наша ракета проявила характер испуганной кошки и взорвалась при старте. Наверное, ей нужно было больше мотивации, чем просто "выпустить в космос"!]];
	pic = 'assets/fail2.gif';
}: with {
	obj {
		dsc = [[{Переиграть?}]];
		act = function()
			snapshots:restore() -- восстановились
		end;
	}
}

