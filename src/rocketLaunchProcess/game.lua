require 'snd'
require 'snapshots'

global {
  astrounautsCount = 0;
  peoplesPatience = 100;
  readyToLaunch = 0;
}

stat {
  nam = 'статусы_марат';
  disp = function()
    pn ('Терпение толпы:^', peoplesPatience..'%');
    pn ('Астронавтов: ', astrounautsCount);

    if readyToLaunch > 0 then
      pn ('Готовность к запуску:^', readyToLaunch..'%');
    end;
  end;
};

function decreasePeoplesPatience(patience)
  patience = patience - rnd(6)

  return patience
end;

function goEndRoom(isEnd)
  if isEnd then
    walk('проигрыш');
    return
  end

  if peoplesPatience < 1 then
    peoplesPatience = 0
    walk('бунт');
    return
  end
end;

function goToAstronauts()
  if astrounautsCount > 3 then
    walk('астронавты');
  end;
end;

room {
	nam = 'Запуск_main';
	disp = "Главное меню";
	dsc = [[Настал день, когда человечество вновь сделает невозможное - отправится на встречу новому, ранее неизведанному]];
	way = { path { 'Информация перед началом', 'инфо' } };
	pic = 'rocketLaunchProcess/static/background.png';
	enter = function() take 'статусы_марат'	end;
}

room {
  nam = 'инфо';
  disp = 'Уже вот вот начнется трансляция';
	dsc = [[Добро пожаловать! Ваша трансляция старта ракеты начинается прямо сейчас. Подготовьтесь к космическому шоу уровня галактического класса!^^

  На экране мелькают комментарии зрителей:^^

  "Ого, это станция, где даже ракеты работают на удаленке?"^
  "Надеюсь, ракета не забыла взять космический кофе с собой!"^^

  Оператор камеры ловит веселые моменты в студии, где команда подготовки шутит и поднимает настроение. Ведущий космического шоу появляется на экране:^
  "Зрители, давайте вместе создадим космическую историю! Поднимайтесь с нами в невесомость!"^^

  Звучит мелодичный космический саундтрек, и начинается захватывающее шоу запуска ракеты!]];
  pic = 'rocketLaunchProcess/static/operator.png';
  way = { path {'Начать игру', 'центр'} };
  enter = function()
    snd.music('rocketLaunchProcess/static/interstellar.mp3', 0);
  end;
}

room {
  nam = 'центр';
  disp = 'Начало трансляции';
	dsc = [[Трансляция началась, но космонавтов все еще нет на месте. Где же они?]];
  pic = 'rocketLaunchProcess/static/command-center.png';
  way = {
    path {'Главный зал', 'зал'},
    path {'Офисное помещение', 'офис'},
    path {'Коридор к лифту', 'лифт'},
    path {'Левое крыло', 'левое крыло'},
    path {'Право крыло', 'правое крыло'},
    path {'Центральное крыло', 'центральное крыло'}
  };
  enter = function(s)
		peoplesPatience = decreasePeoplesPatience(peoplesPatience);
    goEndRoom();
    goToAstronauts();
	end;
  onenter = function()
    snapshots:make();
  end;
}

room {
	nam = 'зал';
	disp = 'Главный зал';
	hasAstronauts = false;
	dsc = function(s)
    p 'Просторное помещение, находясь тут, понимаешь, сколько и сил и времени было потрачено на возведение этого места. Вот оно! Величие!^^';

    if s.hasAstronauts then
      s.obj:add('сотрудник')
    else
      p 'Хмм... Тут пока никого нет';
    end;
  end;
  pic = 'rocketLaunchProcess/static/room1.png';
	way = {
		path {'Вернуться в командный центр', 'центр'},
    path {'Офисное помещение', 'офис'},
    path {'Коридор к лифту', 'лифт'},
	};
  enter = function(s)
		peoplesPatience = decreasePeoplesPatience(peoplesPatience);
    goEndRoom()
    goToAstronauts();

    if astrounautsCount < 4 and rnd(10) > 5 then
      s.hasAstronauts = true
    end;
	end;
};

room {
	nam = 'офис';
	disp = 'Офисное помещение';
  hasAstronauts = false;
	dsc = function(s)
    p 'Обычное, ничем не примечательное офисное помещение, где выпускники магистратуры проводят всю оставшуюся жизнь.^^';

    if s.hasAstronauts then
      s.obj:add('сотрудник')
    else
      p 'Хмм... Тут пока никого нет';
    end;
  end;
  pic = 'rocketLaunchProcess/static/room2.png';
	way = {
		path {'Вернуться в командный центр', 'центр'},
    path {'Главный зал', 'зал'},
    path {'Левое крыло', 'левое крыло'},
    path {'Право крыло', 'правое крыло'},
    path {'Центральное крыло', 'центральное крыло'}
	};
  enter = function(s)
		peoplesPatience = decreasePeoplesPatience(peoplesPatience);
    goEndRoom()
    goToAstronauts();

    if astrounautsCount < 4 and rnd(10) > 5 then
      s.hasAstronauts = true
    end;
	end;
};

room {
	nam = 'лифт';
	disp = 'Коридор к лифту';
	hasAstronauts = false;
	dsc = function(s)
    p 'Недавно отремантированное помещение, к сожалению, лифт неработает.^^';

    if s.hasAstronauts then
      s.obj:add('сотрудник')
    else
      p 'Хмм... Тут пока никого нет';
    end;
  end;
  pic = 'rocketLaunchProcess/static/room3.png';
	way = {
		path {'Вернуться в командный центр', 'центр'},
    path {'Главный зал', 'зал'},
	};
  enter = function(s)
		peoplesPatience = decreasePeoplesPatience(peoplesPatience);
    goEndRoom()
    goToAstronauts();

    if astrounautsCount < 4 and rnd(10) > 5 then
      s.hasAstronauts = true
    end;
	end;
};

room {
	nam = 'левое крыло';
	disp = 'Левое крыло';
  hasAstronauts = false;
	dsc = function(s)
    p 'Достаточно нелюдное помещение левого крыла.^^';

    if s.hasAstronauts then
      s.obj:add('сотрудник')
    else
      p 'Хмм... Тут пока никого нет';
    end;
  end;
  pic = 'rocketLaunchProcess/static/room4.jpg';
	way = {
		path {'Вернуться в командный центр', 'центр'},
    path {'Офисное помещение', 'офис'},
    path {'Право крыло', 'правое крыло'},
    path {'Центральное крыло', 'центральное крыло'}
	};
  enter = function(s)
		peoplesPatience = decreasePeoplesPatience(peoplesPatience);
    goEndRoom()
    goToAstronauts();

    if astrounautsCount < 4 and rnd(10) > 5 then
      s.hasAstronauts = true
    end;
	end;
};

room {
	nam = 'правое крыло';
	disp = 'Право крыло';
	hasAstronauts = false;
	dsc = function(s)
    p 'Самое популярное помещение для экскурсий.^^';

    if s.hasAstronauts then
      s.obj:add('сотрудник')
    else
      p 'Хмм... Тут пока никого нет';
    end;
  end;
  pic = 'rocketLaunchProcess/static/room6.jpg';
	way = {
		path {'Вернуться в командный центр', 'центр'},
    path {'Офисное помещение', 'офис'},
    path {'Левое крыло', 'левое крыло'},
    path {'Центральное крыло', 'центральное крыло'}
	};
  enter = function(s)
		peoplesPatience = decreasePeoplesPatience(peoplesPatience);
    goEndRoom()
    goToAstronauts();

    if astrounautsCount < 4 and rnd(10) > 5 then
      s.hasAstronauts = true
    end;
	end;
};

room {
	nam = 'центральное крыло';
	disp = 'Центральное крыло';
	hasAstronauts = false;
	dsc = function(s)
    p 'Самое людное помещение во всем комплексе.^^';

    if s.hasAstronauts then
      s.obj:add('сотрудник')
    else
      p 'Хмм... Тут пока никого нет';
    end;
  end;
  pic = 'rocketLaunchProcess/static/room5.png';
	way = {
		path {'Вернуться в командный центр', 'центр'},
    path {'Офисное помещение', 'офис'},
    path {'Левое крыло', 'левое крыло'},
    path {'Право крыло', 'правое крыло'},
	};
  enter = function(s)
		peoplesPatience = decreasePeoplesPatience(peoplesPatience);
    goEndRoom()
    goToAstronauts();

    if astrounautsCount < 4 and rnd(10) > 5 then
      s.hasAstronauts = true
    end;
	end;
};


room {
  nam = 'астронавты';
  disp = 'Команда мечты в сборе!';
	dsc = [[Команда в сборе и пора приступить к полету.^^

  Космонавты собираются в своем уютном шатле. На столе стоят космические закуски, и каждый космонавт имеет свой космический брендированный костюм.^^

  За космическим кофе и космическими закусками команда обсуждает свои предстоящие космические приключения.^^

  Но перед этим необходимо отправить эту груду металла в полет. Итак, начнем!
  ]];
  pic = 'rocketLaunchProcess/static/dudes.png';
	way = {
		path {'Приступить к запуску!', 'запуск'},
	};
}

room {
  nam = 'запуск';
  disp = 'Запуск ракеты';
	dsc = [[Этап финальной подготовки наступил, и перед нами целый ряд действий перед стартом. Однако терпение толпы на исходе, нашей зрелищной трансляции уже не хватает! Так давайте уже полетим вместе с нашей героической командой космонавтов-магистрантов, но сначала убедимся, что наш космический корабль подготовлен к этому удивительному путешествию!]];
  pic = 'rocketLaunchProcess/static/launch.png';
  obj = {
    'охлаждение',
    'процедуры',
    'связь',
    'двигатели',
    'держатели',
    'скорость',
    'префинал'
  };
  enter = function(s)
    readyToLaunch = 1
    peoplesPatience = decreasePeoplesPatience(peoplesPatience);
    goEndRoom()
	end;
};

-- Вспомогательные объекты
obj {
	nam = 'сотрудник';
  hasClickAstronaunt = false;
	dsc = function(s)
    if s.hasClickAstronaunt == false then
      p 'А вот и наш {сотрудник}.';
    end;
  end;
	act = function(s)
		p [[Отлично! Мы провели нашего дорогого коллегу в комнату ожидания, чтобы он в спокойной обстановке дожидался старта.]];
    astrounautsCount = astrounautsCount + 1;
    remove(s);
	end;
}

obj {
	nam = 'охлаждение';
  isClicked = false;
	dsc = function(s)
    if s.isClicked == false then
      p 'Охладить {охлаждение|двигатель и корпус ракеты}.';
      p(fmt.c '^');
    end;
  end;
	act = function(s)
    if rnd(20) > 18 then
      goEndRoom(true);
      return;
    end;
    p [[Отлично! Двигатель и корпус охлаждены. Приступаем к следующему шагу.]];
    readyToLaunch = readyToLaunch + 9;
    peoplesPatience = decreasePeoplesPatience(peoplesPatience);
    goEndRoom()
    remove(s);
	end;
}

obj {
	nam = 'процедуры';
  isClicked = false;
	dsc = function(s)
    if s.isClicked == false and readyToLaunch == 10 then
      p 'Старт предпусковых {процедуры|процудур}.';
      p(fmt.c '^');
    end;
  end;
	act = function(s)
    if rnd(20) > 18 then
      goEndRoom(true);
      return;
    end;
    p [[Отлично! Мы провели необходимые процедуры. Готовы идти дальше.]];
    readyToLaunch = readyToLaunch + 18;
    peoplesPatience = decreasePeoplesPatience(peoplesPatience);
    goEndRoom()
    remove(s);
	end;
}

obj {
	nam = 'связь';
  isClicked = false;
	dsc = function(s)
    if s.isClicked == false and readyToLaunch == 28 then
      p 'Установка {связь|связи} с командованием.';
      p(fmt.c '^');
    end;
  end;
	act = function(s)
    if rnd(20) > 18 then
      goEndRoom(true);
      return;
    end;
    p [[Отлично! Связь установлена, работает исправно! Приступаем к следующему шагу!]];
    readyToLaunch = readyToLaunch + 18;
    peoplesPatience = decreasePeoplesPatience(peoplesPatience);
    goEndRoom()
    remove(s);
	end;
}

obj {
	nam = 'двигатели';
  isClicked = false;
	dsc = function(s)
    if s.isClicked == false and readyToLaunch == 46 then
      p 'Запуск {двигатели|двигателя}.';
      p(fmt.c '^');
    end;
  end;
	act = function(s)
    if rnd(20) > 18 then
      goEndRoom(true);
      return;
    end;
    p [[ЗАПУСК ДВИГАТЕЛЕЙ. *все сотрудники задержали дыхание*]];
    readyToLaunch = readyToLaunch + 18;
    peoplesPatience = decreasePeoplesPatience(peoplesPatience);
    goEndRoom()
    remove(s);
	end;
}

obj {
	nam = 'держатели';
  isClicked = false;
	dsc = function(s)
    if s.isClicked == false and readyToLaunch == 64 then
      p 'Отделить от башен {держатели}.';
      p(fmt.c '^');
    end;
  end;
	act = function(s)
    if rnd(20) > 18 then
      goEndRoom(true);
      return;
    end;
    p [[Держатели отделены, идем дальше по инструкции!]];
    readyToLaunch = readyToLaunch + 18;
    peoplesPatience = decreasePeoplesPatience(peoplesPatience);
    goEndRoom()
    remove(s);
	end;
}

obj {
	nam = 'скорость';
  isClicked = false;
	dsc = function(s)
    if s.isClicked == false and readyToLaunch == 82 then
      p 'Набрать космическую {скорость}.';
      p(fmt.c '^');
    end;
  end;
	act = function(s)
    if rnd(20) > 18 then
      goEndRoom(true);
      return;
    end;
    p [[Пошло добро по трубам, пошел набор скорости!]];
    readyToLaunch = readyToLaunch + 18;
    peoplesPatience = decreasePeoplesPatience(peoplesPatience);
    goEndRoom()
    remove(s);
	end;
}

obj {
	nam = 'префинал';
  isClicked = false;
	dsc = function(s)
    if readyToLaunch == 100 then
      p '{префинал|ПОЛЕТЕЛИ}!!!';
      p(fmt.c '^');
    end;
  end;
  act = function(s)
    walk('победа');
    remove(s);
	end;
}

include 'rocketLaunchProcess/finals'
