require 'os'
require 'snd'
require 'snapshots'

------------------------
-- Константы -----------
------------------------
global {
  timestamp = 604800;
  bugsCount = math.random(6, 12);
  checkCount = 0;
  isInvalidDocument = false;
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
  end;
  v.act = function(s)
    remove(s);
    timestamp = timestamp - getTimeStamp(timeValue, timeUnit);
    checkCount = checkCount + 1;
    if timestamp < 0 then
      timestamp = 0;
      walk(roomList);
      return;
    end;
    if math.random(1, 10) > 5 and bugsCount > 0 then
      bugsCount = bugsCount - 1;
      p [[Опачки! Найдена неисправность]];
    else
      p [[Проверка прошла успешно. Недочетов не выявлено!]];
    end;
    walk(roomList);
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

function getRandomObject(images)
  return images[math.random(1, #images)];
end;

------------------------
-- Статы ---------------
------------------------
stat {
  nam = 'статусы';
  disp = function()
    pn ('Дедлайн через:^', formatTime(timestamp));
    pn ('Неисправности: ', bugsCount);     -- убрать на релизе(?)
    pn ('Кол-во проверок: ', checkCount);
    pn ('_____________');
  end;
};

------------------------
-- Основа --------------
------------------------
document = obj {
  disp = 'документ'..fmt.img('assets/book.png');
  dsc = function(s)
    p [[На столе лежит {документ} неизвестного содержания...^^]];
    p(fmt.tab('50%', 'center')..fmt.img('assets/document.png'));
  end;
  valid = math.random(1, 10) > 1;
  tak = function(s)
    if s.valid then
      p [[О! Так это же документ подтверждающий тестирование. Даже печать стоит! С документом все в порядке]];
      timestamp = timestamp - 60 * 5;
      walk(roomList);
      return true;
    else
      p [[Документ не подписан. Зачем проверять то, что точно не работает? Сидеть дальше нет смысла. Пойду домой...]];
      isInvalidDocument = true
      return true;
    end;
  end;
}

coffeeBreak = room {
  disp = 'Перерыв на кофе 15 минуточек';
  pic = 'assets/coffee.gif';
  way = { path {'Вернуться к работе', 'roomList'} };
  enter = function()
    timestamp = timestamp - getTimeStamp(15, 'м');
  end;
}

painAttack = room {
  painAttackImages = {
    'assets/pain-1.png',
    'assets/pain-2.png',
    'assets/pain-3.png',
  };
  timeValue = 0;
  disp = function(s)
    return string.format('Тебе внезапно стало плохо, ты схватился за живот и потерял сознание (Ты потерял времени: %s м.)', s.timeValue);
  end;
  pic = function(s)
    return getRandomObject(s.painAttackImages);
  end;
  way = { path {'Вернуться к работе', 'roomList'} };
  enter = function(s)
    s.timeValue = math.random(10, 50);
    timestamp = timestamp - getTimeStamp(s.timeValue, 'м');
  end;
}

traveledToToilet = room {
  toiletImages = {
    'assets/toilet-1.png',
    'assets/toilet-2.png',
    'assets/toilet-3.png',
    'assets/toilet-4.jpg',
  };
  timeValue = 0;
  disp = function(s)
    return string.format('На завтрак ты съел что то не то, из за чего тебе необходимо немедленно отлучиться в туалет не самого лучшего состояния. Но выбора нет... (Ты потерял времени: %s ч.)', s.timeValue);
  end;
  pic = function(s)
    return getRandomObject(s.toiletImages);
  end;
  way = { path {'Вернуться к работе', 'roomList'} };
  enter = function(s)
    s.timeValue = math.random(1, 3);
    timestamp = timestamp - getTimeStamp(s.timeValue, 'ч');
  end;
}

traitorVolodya = room {
  volodyaImages = {
    'assets/volodya-1.jpg',
    'assets/volodya-2.jpg',
    'assets/volodya-3.jpg',
    'assets/volodya-4.jpg',
    'assets/volodya-5.jpg',
  };
  bug = 0;
  disp = function(s)
    return string.format('Пока ты не видел, проказник Володя решил доказать, что он полезный, и влез туда, куда никто не просил и сделал то, что никто не ждал. В итоге из за его действий появилось новых неисправностей: %s шт.', s.bug);
  end;
  pic = function(s)
    return getRandomObject(s.volodyaImages);
  end;
  way = { path {'Вернуться к работе', 'roomList'} };
  enter = function(s)
    s.bug = math.random(1, 3);
    bugsCount = bugsCount + s.bug;
  end;
}

helperBulka = room {
  bulkaImages = {
    'assets/bulka-1.png',
    'assets/bulka-2.png',
    'assets/bulka-3.png',
    'assets/bulka-4.png',
    'assets/bulka-5.png',
  };
  bug = 0;
  disp = function(s)
    return string.format('Наивный и добрый коллега "Булка" решил помочь и выполнить за тебя ТВОЮ работу. Починил неисправностей: %s шт.', s.bug);
  end;
  pic = function(s)
    return getRandomObject(s.bulkaImages);
  end;
  way = { path {'Вернуться к работе', 'roomList'} };
  enter = function(s)
    s.bug = math.random(0, 2);
    bugsCount = bugsCount - s.bug;
    if (bugsCount == 0) then
      return;
    end;
    if (bugsCount < 0) then
      bugsCount = 0;
      return;
    end;
  end;
}

roomList = room {
  nam = 'roomList';
  disp = 'Список проверок';
  obj = {
    setOptions('Проверка на пригодность площадки', 4, 'ч'),
    setOptions('Проверка на механические повреждения', 6, 'ч'),
    setOptions('Проверка системы безопасности', 12, 'ч'),
    setOptions('Проверка системы энергоснабжения', 6, 'ч'),
    setOptions('Проверка системы крепления', 2, 'ч'),
    setOptions('Проверка стыковочных механизмов', 1, 'ч'),
    setOptions('Проверка систем связи', 18, 'ч'),
    setOptions('Проверка оборудования', 13, 'ч'),
    setOptions('Проверка герметичности', 7, 'ч'),
    setOptions('Проверка системы питания ракеты', 8, 'ч'),
    setOptions('Проверка топлива', 4, 'ч'),
    setOptions('Проверка системы подачи кислорода', 12, 'ч'),
    setOptions('Проверка системы вентиляции', 8, 'ч'),
    setOptions('Проверка системы отопления', 12, 'ч'),
    setOptions('Проверка системы охлаждения', 12, 'ч'),
    setOptions('Проверка двигателей', 1, 'д'),
    setOptions('Проверка наличия на борту средств первой необходимости (Комплекс)', 16, 'ч'),
    setOptions('Проверка наличия, количества, исправности и качества костюмов ', 10, 'ч'),
    setOptions('Проверка самочувствия космонавтов ', 2, 'ч'),
    setOptions('Проверка физического состояния космонавтов ', 40, 'м'),
    setOptions('Проверка психологического состояния космонавтов ', 20, 'м'),
    setOptions('Проверка на отсутствие колюще-режущих вещей', 10, 'м'),
    setOptions('Проверка на отсутствие легко-воспламеняющихся вещей', 10, 'м'),
    setOptions('Проверка расчетов на корректность', 1, 'д'),
  };
  coffeeTime = 8;
  exit = function(s)
    s.coffeeTime = s.coffeeTime - 1;

    if #s.obj == 0 or timestamp == 0 then
      if (bugsCount > 0) then
        walk(fail);
      else
        walk(ready);
      end;
      return;
    end;

    if s.coffeeTime == 0 then
      s.coffeeTime = 8;
      timestamp = timestamp - 60 * 15;
      walk(coffeeBreak);
      return;
    end;

    if timestamp == getTimeStamp(1, 'д') or timestamp < getTimeStamp(1, 'д') then
      snd.music('assets/sounds/terror.mp3', 0);
    end;

    if math.random(1, 20) > 18 then
      walk(painAttack);
      return;
    end;

    if math.random(1, 20) > 18 then
      walk(traveledToToilet);
      return;
    end;

    if math.random(1, 20) > 18 then
      walk(traitorVolodya);
      return;
    end;

    if math.random(1, 20) > 18 and bugsCount > 0 then
      walk(helperBulka);
      return;
    end;
  end;
}

room {
  nam = 'launchPreparation';
  disp = 'Подготовка к запуску';
  obj = { document };
  onenter = function()
    take "статусы"
    snd.music('assets/sounds/theme.mp3', 0);
    snapshots:make();
  end;
}: with {
  obj {
    dsc = function()
      if isInvalidDocument then
        p(fmt.c '^');
        p [[{Переиграть?}]];
      end;
    end;
    act = function()
      isInvalidDocument = false
      snapshots:restore();
    end;
  }
}

----------------------------
-- Заключительные комнаты --
----------------------------
ready = room {
  disp = 'Это чудесное чувство после хорошо сделанной работы';
  dsc = [[Все системы ракеты проверены и работают безупречно, словно после чашки кофе с утра. Ракета готова к своему звездному вылету! Время покорить космос!]];
  pic = 'assets/ready.gif';
  enter = function()
    snd.music('assets/sounds/happy.mp3', 1);
    drop "статусы"
  end;
  exit = function()
    snd.stop_music()
  end;
  way = {
    path {"Старт!", "Полет_main"},
  };
}

fail = room {
  disp = 'Вы проиграли';
  dsc = [[Ну что сказать, наша ракета проявила характер испуганной кошки и взорвалась при старте. Наверное, ей нужно было больше мотивации, чем просто "выпустить в космос".^^

  Как бы ты не старался, но работу ты выполнил халатно, а потому два доблестных сотрудника охраны вывели тебя вперед ногами со стартовой площадки. Санаторий в Сибири не ждет...]];
  pic = 'assets/fail2.gif';
  enter = function()
    snd.music('assets/sounds/fail.mp3', 1);
  end;
  exit = function()
    snd.stop_music()
  end;
}: with {
  obj {
    dsc = [[{Переиграть?}]];
    act = function()
      snapshots:restore(); -- восстановились
    end;
  }
}

