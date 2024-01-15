--------оформление-------

--какать тут--
 



-------------------------

-- КОРИДОРЫ --- 
-------------------------
room { 
	nam = 'бытовой_коридор';
	disp = "Блок Ж";
	dsc = [[ Этот коридор выглядит как нервная система корабля, соединяющая все ключевые зоны для комфортного проживания. Здесь члены экипажа проводят большую часть своего времени вне служебных обязанностей. ]];
	pic = 'img/rooms/быткор.png';
	way = {
		path {'Туалет', 'туалет' },
		path { 'Отсек с криокапсулами', 'отсек_с_криокапсулами' },
		path { 'Столовая', 'столовая' },
		path { 'Комната рекреации', 'команата_рекреации' },
		path { 'Медблок', 'медблок' },
		path { 'Блок Р', 'рабочий_коридор' },
	}
}

room { 
	nam = 'рабочий_коридор';
	disp = "Блок Р";
	dsc = [[ Тут члены экипажа работают работу]];
	pic = 'img/rooms/рабкор.png';
	way = {
		path {'Кухня', 'кухня' },
		path { 'Космо-ферма', 'космо_ферма' },
		path { 'Лаборатория', 'лаборатория' },
		path { 'Шлюз', 'шлюз' },
		path { 'Блок Ж', 'бытовой_коридор' },
		path { 'Блок Т', 'технический_коридор' },
	}
}

room { 
	nam = 'технический_коридор';
	disp = "Блок Т";
	dsc = [[ Тут расположены различные технические помещения, относящиеся к работе корабля. А также склад и технологический шлюз. ]];
	pic = 'img/rooms/техкор.png';
	way = {
		path {'Блок регенерации кислорода', 'блок_регенерации_кислорода' },
		path { 'Блок фильтрации воды', 'блок_фильтрации_воды' },
		path { 'Склад', 'склад' },
		path { 'Технологический шлюз', 'технологический_шлюз' },
		path { 'Блок Р', 'рабочий_коридор' },
	}
}

-------------------------------
-- комнаты БЫТОВОГО коридора --
-------------------------------

room { 
	nam = 'туалет';
	disp = "Туалет";
	dsc = [[ Небольшое, но важное место на корабле. Это укромный уголок, где можно на мгновение уединиться и отдохнуть от напряженного графика. ]];
	pic = 'img/rooms/туалет.png';
	way = {path { 'Блок Ж', 'бытовой_коридор' },};
}

room { 
	nam = 'отсек_с_криокапсулами';
	disp = "Отсек с криокапсулами";
	dsc = [[ Тихий и спокойный отсек, где расположены криокапсулы для длительного сна. Он наполнен тихим гулом систем поддержания жизни. ]];
	pic = 'img/rooms/крио.png';
	way = {
		path { 'Блок Ж', 'бытовой_коридор' },
		path { 'Спать до следующего цикла', 'проснулся' },
	}
	
}

room { 
	nam = 'столовая';
	disp = "Столовая";
	dsc = [[ Сердце социальной жизни на корабле. Здесь экипаж собирается, чтобы питаться и общаться, делясь новостями и планами на день. ^^
	Красивое изображение вместо иллюминатора подминает настроение и улучшает аппетит]];
	pic = 'img/rooms/столовая.png';
	way = {
		path { 'Блок Ж', 'бытовой_коридор' },
		path { 'Кухня', 'кухня' },
	}
}

room { 
	nam = 'команата_рекреации';
	disp = "Комната рекреации";
	dsc = [[ Место для отдыха и развлечений. Стены украшены разнообразными играми и развлекательными системами, создающими иллюзию земного комфорта. ^^
	Хоть тут и красиво, но искуственная проекция на стене всё равно не настоящая...]];
	pic = 'img/rooms/рекр.png';
	way = {path { 'Блок Ж', 'бытовой_коридор' },};

	enter = function(s)
        if currentTask.id == 4 and not currentTask.completed then
            -- Добавление кнопки для задания
            s.obj:add('task_4')
        else
            -- Удаление кнопки, если задание не актуально
            s.obj:del('task_4')
        end
    end;  
}

room { 
	nam = 'медблок';
	disp = "Медблок";
	dsc = [[ Место, наполненное оборудованием для лечения и поддержания здоровья экипажа. Здесь всегда царит спокойствие и порядок. ]];
	pic = 'img/rooms/мед.png';
	way = {path { 'Блок Ж', 'бытовой_коридор' },};
}

-------------------------------
-- комнаты РАБОЧЕГО коридора --
-------------------------------
room { 
	nam = 'кухня';
	disp = "Кухня";
	dsc = [[ Функциональное и хорошо оборудованное место, где готовят пищу для всего экипажа. Запахи готовящейся еды наполняют воздух. ^^
	Смотря на проекцию леса кажется, что можно полувствовать запах леса и природы.]];
	pic = 'img/rooms/кухня.png';
	way = {
		path { 'Блок Р', 'рабочий_коридор' },
		path { 'Столовая', 'столовая' },
	};

	enter = function(s)
        if currentTask.id == 5 and not currentTask.completed then
            -- Добавление кнопки для задания
            s.obj:add('task_5')
        else
            -- Удаление кнопки, если задание не актуально
            s.obj:del('task_5')
        end
    end;  
}

room { 
	nam = 'космо_ферма';
	disp = "Космо-ферма";
	dsc = [[ Здесь выращиваются культуры для питания экипажа. Это зеленый оазис на борту корабля, наполненный свежестью и надеждой. ]];
	pic = 'img/rooms/ферма.png';
	way = {path { 'Блок Р', 'рабочий_коридор' },};
}

room { 
	nam = 'лаборатория';
	disp = "Лаборатория";
	dsc = [[ *тут придумывают навые способы как выращивать космо-картошечку* ]];
	pic = 'img/rooms/лаборатория.png';
	way = {path { 'Блок Р', 'рабочий_коридор' },};
}

room { 
	nam = 'шлюз';
	disp = "Шлюз";
	dsc = [[ Это ворота в открытый космос. Сюда ступают только те, кто готов столкнуться с неизведанным и бесконечностью космического пространства. ]];
	pic = 'img/rooms/шлюз.png';
	way = {
		path { 'Блок Р', 'рабочий_коридор' },
		path { 'Космос', 'космос' },
	}
}

-----------------------------------
-- комнаты ТЕХНИЧЕСКОГО коридора --
-----------------------------------

room { 
	nam = 'блок_регенерации_кислорода';
	disp = "Блок регенерации кислорода";
	dsc = [[ Ключевая зона для поддержания жизни на корабле. Здесь происходит регенерация кислорода и очистка воздуха. ]];
	pic = 'img/rooms/кислород.png';
	way = {path { 'Блок Т', 'технический_коридор' },};

	enter = function(s)
        if currentTask.id == 2 and not currentTask.completed then
            -- Добавление кнопки для задания
            s.obj:add('task_2')
        else
            -- Удаление кнопки, если задание не актуально
            s.obj:del('task_2')
        end
    end;   
}

room { 
	nam = 'блок_фильтрации_воды';
	disp = "Блок фильтрации воды";
	dsc = [[ Зона, где обеспечивается очистка и подготовка воды для потребностей экипажа. Это место напоминает о значимости ресурсов в длительных путешествиях. ]];
	pic = 'img/rooms/вода.png';
	way = {path { 'Блок Т', 'технический_коридор' },};

	enter = function(s)
        if currentTask.id == 3 and not currentTask.completed then
            -- Добавление кнопки для задания
            s.obj:add('task_3')
        else
            -- Удаление кнопки, если задание не актуально
            s.obj:del('task_3')
        end
    end;  
	
}

room { 
	nam = 'склад';
	disp = "Склад";
	dsc = [[ Заполнен всевозможными запасами и материалами, склад является жизненно важной частью корабля. Здесь хранится все необходимое для поддержания работы и жизни на борту. ]];
	pic = 'img/rooms/склад.png';
	way = {path { 'Блок Т', 'технический_коридор' },};

	enter = function(s)
        if currentTask.id == 6 and not currentTask.completed then
            -- Добавление кнопки для задания
            s.obj:add('task_6')
			currentTask.completed = true
        else
            -- Удаление кнопки, если задание не актуально
            s.obj:del('task_6')
        end
    end;   
}

room { 
	nam = 'технологический_шлюз';
	disp = "Технологический шлюз";
	dsc = [[ *Небольной люк через который производится выброс мусора* ^^
	Если постараться, то сюда сможет пролезть человек.]];
	pic = 'img/rooms/техшлюз.png';
	way = {
		path { 'Блок Р', 'рабочий_коридор' },
		path { 'Космос', 'космос' },
	}
}

--------------------
-- локация КОСМОС --
--------------------
room { 
	nam = 'космос';
	disp = "Космос";
	dsc = [[ *Бесконечная темнота. Осюда можно добраться до разных частей снаружи корабля.* ]];
	pic = 'img/rooms/космос.png';
	way = {
		path { 'Шлюз', 'шлюз' },
		path { 'Обшивка корабля', 'обшивка' },
	}
}

room { 
	nam = 'обшивка';
	disp = "Обшивка корабря";
	dsc = [[ Кусок обшивки, до которого было не сложно добраться ]];
	--pic = 'img/rooms/обшивка.png';
	way = {
		path { 'Вернуться к шлюзу', 'космос' },
		--path { 'Обшивка корабля', 'обшивка' },
	};

	enter = function(s)
        if currentTask.id == 1 and not currentTask.completed then
            -- Добавление кнопки для задания
            s.obj:add('task_1')
			currentTask.completed = true
        else
            -- Удаление кнопки, если задание не актуально
            s.obj:del('task_1')
		   --p('aboba')
        end
    end;   
}

-----------------------------------
--- ВАЖНЫЕ КОМНАТЫ---
-----------------------------------
room {
	nam = "WIN";
	disp = "Ура, победа!";
	dsc = [[Вы смогли продержаться на протяжении этого долгого полета^
	Впереди тебя ждет процесс посадки, удачи!^^
	Congratulations!]];
	pic = '10-img/game_over.gif';
}

room {
	nam = "GAMEOVER";
	disp = "Вы проиграли";
	dsc = [[Какие-то из ваших решений привели с глобальному обсёру^^
	Congratulations!]];
	pic = '10-img/game_over.gif';
}
