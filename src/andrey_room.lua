room { 
	nam = 'космодром';
	disp = "Космодром";
	dsc = [[ Вы видите огромный космический корабль, который дожен завершить миссию успешно, если команда тестеров выявит и справит все ошибки. ]];
	pic = 'img/космодром.png';
	way = {
		path {"Зайти на корабль", "корабль"},
		path {"Посетить оружейную", "оружейная"},
		path {"Пойти похомячить", "кухня_Андрей"},
	};
	
	enter = function(s)
    	take 'статус_Андрей'
		checkEndGame(s)
        if currentTask.id == 1 then
            -- Добавление кнопки для задания
            s.obj:add('task_1_Андрей')
        else
            -- Удаление кнопки, если задание не актуально
            s.obj:del('task_1_Андрей')
        end
		if currentTask.id == 2 then
            -- Добавление кнопки для задания
            s.obj:add('task_2_Андрей')
        else
            -- Удаление кнопки, если задание не актуально
            s.obj:del('task_2_Андрей')
        end
		if currentTask.id == 3 then
            -- Добавление кнопки для задания
            s.obj:add('task_3_Андрей')
			s.obj:add('рейдер')
        else
            -- Удаление кнопки, если задание не актуально
            s.obj:del('task_3_Андрей')
			s.obj:del('рейдер')
        end
		if currentTask.id == 4 then
            -- Добавление кнопки для задания
            s.obj:add('task_4_Андрей')
        else
            -- Удаление кнопки, если задание не актуально
            s.obj:del('task_4_Андрей')
        end
		if currentTask.id == 5 then
            -- Добавление кнопки для задания
            s.obj:add('task_5_Андрей')
        else
            -- Удаление кнопки, если задание не актуально
            s.obj:del('task_5_Андрей')
        end
		if currentTask.id == 6 then
            -- Добавление кнопки для задания
            s.obj:add('task_6_Андрей')
        else
            -- Удаление кнопки, если задание не актуально
            s.obj:del('task_6_Андрей')
        end
    end;
	exit = function(s)
		checkEndGame(s)
		deleteAlien(s)
	end;
}

room { 
	nam = 'корабль';
	disp = "Корабль";
	dsc = [[ Вы вступили на корабль боли и отчаяния, если вы это читаете значит пострадал один студент при выполнении. ]];
	pic = 'img/корабль.png';
	way = {
		path {"Вернуться на космодром", "космодром"},
		path {"Комната для сброса", "уборная"},
		path {"Зайти на склад", "склад_Андрей"},
		path {"Комната буль-буль", "блок_фильтрации_воды_Андрей"},
		path {"Капитанский мостик", "капитанский_мостик"},
	};
	enter = function(s)
		checkEndGame(s)
		spownAlien(s)
	end;
	exit = function(s)
		checkEndGame(s)
		deleteAlien(s)
	end;
}

room { 
	nam = 'капитанский_мостик';
	disp = "Капитанский мостик";
	dsc = [[ Место управления космическим кораблём. ]];
	pic = 'img/Капитанский_мостик.png';
	obj = {'пилот'};
	way = {
		path {"Вернуться на корабль", "корабль"},
	};
	enter = function(s)
		checkEndGame(s)
		if currentTask.id ~= 2 then
			spownAlien(s)
		end;
	end;
	exit = function(s)
		deleteAlien(s)
		checkEndGame(s)
	end;
}

room { 
	nam = 'оружейная';
	disp = "Оружейная";
	dsc = [[ Разнообразное оружие для защиты от инопланетной нечести. ]];
	pic = 'img/оружейная.png';
	obj = {'пистолет'};
	way = {
		path {"Вернуться на космодром", "космодром"},
	};
	enter = function(s)
		checkEndGame(s)
		spownAlien(s)
	end;
	exit = function(s)
		checkEndGame(s)
		deleteAlien(s)
	end;
}

room { 
	nam = 'уборная';
	disp = "Туалет";
	dsc = [[ Выглядит хуже чем есть на самом деле, делай свои дела и уходи отсюда. ]];
	pic = 'img/туалет.png';
	obj = {'туалет_Андрей'};
	way = {
		path {"Вернуться на корабль", "корабль"},
	};
	enter = function(s)
		spownAlien(s)
		checkEndGame(s)
	end;
	exit = function(s)
		checkEndGame(s)
		deleteAlien(s)
	end;
}

room { 
	nam = 'кухня_Андрей';
	disp = "Кухня";
	dsc = [[ Функциональное и хорошо оборудованное место, где готовят пищу для всего экипажа. Запахи готовящейся еды наполняют воздух. ]];
	pic = 'img/Столовая.png';
	obj = {'начальник'},
	way = {
		path {"Вернуться на космодром", "космодром"},
	};
	enter = function(s)
		if currentTask.id ~= 1 then
			spownAlien(s)
			checkEndGame(s)
		end;
	end;
	exit = function(s)
		checkEndGame(s)
		deleteAlien(s)
	end;
}

room { 
	nam = 'склад_Андрей';
	disp = "Склад";
	dsc = [[ Заполнен всевозможными запасами и материалами, склад является жизненно важной частью корабля. Здесь хранится все необходимое для поддержания работы и жизни на борту. ]];
	pic = 'img/Склад.png';
	way = {
		path {"Вернуться на корабль", "корабль"},
	};
	obj = {'механик-инженер'};
	enter = function(s)
		if currentTask.id ~= 4 then
			spownAlien(s)
			checkEndGame(s)
		end;
	end;
	exit = function(s)
		checkEndGame(s)
		deleteAlien(s)
	end;
}

room { 
	nam = 'блок_фильтрации_воды_Андрей';
	disp = "Блок фильтрации воды";
	dsc = [[ Зона, где обеспечивается очистка и подготовка воды для потребностей экипажа. Это место напоминает о значимости ресурсов в длительных путешествиях. ]];
	pic = 'img/Блок_воды.png';
	way = {
		path {"Вернуться на корабль", "корабль"},
	};
	enter = function(s)
		checkEndGame(s)
		spownAlien(s)
	end;
	exit = function(s)
		checkEndGame(s)
		deleteAlien(s)
	end;
}

room { 
	nam = 'lose';
	disp = "Поражение";
	dsc = [[ Ты сделал всё что в твоих силах. Ты не плохой человек тебе просто не повезло. Это конец корабль не прошёл тестирования и мы лешились нашего стажёра. Кто-нибудь выложите вакансию на нового тестировщика.]];
	pic = 'img/поражение.png';
}

room { 
	nam = 'win';
	disp = "Победа";
	enter = function () drop 'статус_Андрей' end;
	dsc = [[ Кто ты воин? Твоё имя попадёт в историю данного космодрома и будут восхвалять тебя как Марка Аврелия. Корабль прошёл все тесты можно приступать к следующему пункту.]];
	pic = 'img/победа.png';
	way = {
		path {"Подготовить корабль", "tutorial_main"},
	};
}
