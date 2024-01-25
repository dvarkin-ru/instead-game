require 'os'
require 'snd'
require 'snapshots'

------------------------
-- Константы -----------
------------------------
global {
  people = math.random(10, 20);
}

------------------------
-- Утилиты -------------
------------------------
function getObj(name, timeValue, timeUnit, roomOption, room)
  local v = {};
  local action = math.random(0, 3);
  v.disp = name;
  v.dsc =  function(s)
    p(string.format([[{%s (%s %s.)}]], name, timeValue, timeUnit));
    p(fmt.c '^');
  end;
  v.act = function(s)
    remove(s);
    timestamp = timestamp + getTimeStamp(timeValue, timeUnit);
    getPeople();
    if timestamp > math.random(0, 604800) then
      p [[Увы, но время твое вышло!]]
      walk(endGame);
      return;
    end;
    if people == 0 then
      p [[Увы, но все умерли!]]
      walk(endGame);
      return;
    end;

    if action == 0 then
      walk(cat);
      return;
    end;

    if action == 1 then
      walk(chil);
      return;
    end;

    if action == 2 then
      walk(help);
      return;
    end;

    if action == 3 then
      walk(toilet);
      return;
    end;
  end;
  return obj(v);
end;

function formatTime(time)
  local seconds = time % 60;
  local minutes = math.floor((time / 60) % 60);
  local hours = math.floor((time / 3600) % 24);
  local days = math.floor(time / 86400);

  return string.format('%d д. %2d ч. %2d м.', days, hours, minutes);
end;

function getTimeStamp(value, unit)
  if unit == 'д' then
    return value * 86400;
  elseif unit == 'ч' then
    return value * 3600;
  elseif unit == 'м' then
    return value * 60;
  else
    return nil;
  end;
end;

function getPeople()
  local isDead = math.random(0, 1);
  if isDead == 0 then
    people = people - math.random(1, 5);
  else
    people = people + math.random(0, 2);
  end;
end;

function getTimeValue() 
  local time = math.random(0,2);
  if time == 0 then 
    return 'м';
  elseif time == 1 then
    return 'ч';
  else
    return 'д';
  end;
end;

------------------------
-- Статы ---------------
------------------------
stat {
  nam = 'state';
  disp = function()
    pn ('Дней на планете:^', formatTime(timestamp));
    pn ('Кол-во выживших: ', people);
    pn ('_____________');
  end;
};

------------------------
-- Игра --------------
------------------------
chil = room {
  disp = 'Да пошло оно все пойду отдохну!';
  pic = 'assets/chil.gif';
  way = { path {'Вернуться в лагерь', 'camp'} };
  enter = function()
    timestamp = timestamp - getTimeStamp(math.random(1, 20), 'м');
  end;
}

help = room {
  timeValue = 0;
  disp = function(s)
    return string.format('К тебе на помощь пришли ребята и вы решили попить пивка! (Ты потерял времени: %s м.)', s.timeValue);
  end;
  pic = 'assets/help.png';
  way = { path {'Вернуться в лагерь, чтоб протрезветь', 'camp'} };
  enter = function(s)
    s.timeValue = math.random(2, 8);
    timestamp = timestamp + getTimeStamp(s.timeValue, getTimeValue());
  end;
}

toilet = room {
  timeValue = 0;
  disp = function(s)
    return string.format('Ты съел что то не то, из за чего тебе необходимо немедленно отлучиться в туалет. (Ты потерял времени: %s ч.)', s.timeValue);
  end;
  pic = 'assets/tolkan.png';
  way = { path {'Вернуться в лагерь, чтоб поменять штаны', 'camp'} };
  enter = function(s)
    s.timeValue = math.random(0, 23);
    timestamp = timestamp - getTimeStamp(s.timeValue, getTimeValue());
  end;
}

cat = room {
  disp = function(s)
    return string.format('Добрый котик Васька спас отряд от нападения. Спас людей: %s', people);
  end;
  pic = 'assets/cat.gif';
  way = { path {'Вернуться в лагерь, чтоб поблагорарить кота Ваську', 'camp'} };
}

camp = room {
  nam = 'camp';
  disp = 'Список дел';
  pic = 'assets/camp.png';
  obj = {
    getObj('Проверка медицинского состояния членов экипажа', math.random(1, 24), getTimeValue()),
    getObj('Исследование планеты и выбор безопасной зоны', math.random(1, 24), getTimeValue()),
    getObj('Планировка и разработка дизайна базы', math.random(1, 24), getTimeValue()),
    getObj('Строительство жилых и рабочих помещений', math.random(1, 24), getTimeValue()),
    getObj('Разработка систем очистки воды и воздуха', math.random(1, 24), getTimeValue()),
    getObj('Установка систем утилизации отходов', math.random(1, 24), getTimeValue()),
    getObj('Установка солнечных батарей и/или генераторов', math.random(1, 24), getTimeValue()),
    getObj('Разработка систем энергосбережения', math.random(1, 7), getTimeValue()),
    getObj('Проведение геологических исследований', math.random(1, 7), getTimeValue()),
    getObj('Установка спутниковой связи', math.random(1, 10), getTimeValue()),
    getObj('Создание системы выращивания пищи', math.random(1, 24), getTimeValue()),
    getObj('Разработка методов устойчивого сельского хозяйства', math.random(1, 24), getTimeValue()),
    getObj('Установка систем видеонаблюдения и безопасности', math.random(1, 24), getTimeValue()),
    getObj('Создание медицинского центра', math.random(1, 24), getTimeValue()),
    getObj('Разработка системы добычи и очистки воды', math.random(1, 24), getTimeValue()),
    getObj('Установка серверов и компьютерных систем', math.random(1, 24), getTimeValue()),
    getObj('Создание лабораторий и научных исследовательских центров', math.random(1, 40), getTimeValue()),
    getObj('Создание культурных и развлекательных мероприятий', math.random(1, 24), getTimeValue()),
    getObj('Разработка мер безопасности для сетей и информационных систем', math.random(1, 24), getTimeValue()),
    getObj('Создание планов эвакуации и аварийного реагирования', math.random(1, 100), getTimeValue())
  };
  exit = function(s)
    if #s.obj == 0 then
      walk(ready_pusheen);
      return;
    end;
  end;
}

room {
  nam = 'disembark_main';
  disp = 'Начальный экран';
  dsc = [[С мостика по всему кораблю раздались звуки подготовки к высадке.^Поднялись стойки седьмого отсека, включились системы стабилизации. Экипаж "Аура Нова" вступил в новую главу своего путешествия, направляясь к неизведанным территориям, где каждый шаг мог открыть перед ними тайны далеких миров.]];
  pic = 'assets/planet.png';
  way = {path {'Процесс высадки', 'disembark'} };
}

room {
  nam = 'disembark';
  disp = 'Высаживаемся!';
  pic = 'assets/bg-pusheen.png';
  way = {path {'Высадка', 'camp'} };
  onenter = function()
    timestamp = 0;
    take 'state';
    snapshots:make();
  end;
}

ready_pusheen = room {
  disp = 'Вы прошли игру!';
  pic = 'assets/ready-pusheen.gif';
}: with {
  obj {
    dsc = [[{Переиграть?}]];
    act = function()
      snapshots:restore();
    end;
  }
}

endGame = room {
  disp = 'Вы проиграли';
  dsc = [[Как бы ты не старался тебе на другой планете тебе не выжить, говорила тебе мама: "Оставайся дома!"]];
  pic = 'assets/fail.gif';
}: with {
  obj {
    dsc = [[{Переиграть?}]];
    act = function()
      snapshots:restore();
    end;
  }
}
