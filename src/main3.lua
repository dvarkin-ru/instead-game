-- $Name: Самая интересная игра!$
-- $Version: 0.5$
-- $Author: Анонимный любитель текстовых приключений$





require "fmt" -- некоторые функции форматирования
fmt.para = true -- включить режим параграфов (отступы)
--game.pic = 'img/rooms/космос.png'



game.act = 'Не работает.';
game.use = 'Это не поможет.';
game.inv = 'Зачем мне это?';

global {V={}}

room {
	nam = 'main';
	disp = "Начало игры";
	dsc = [[Добро пожаловать в прекрасную игру-симулятор. ^^
	ЦЕЛЬ: нету, только путь. ^^
	 ^^
	Игра выполнена с поддержкой самых передовых дендро-фекальных методов программирования.^^

	Осталась всего неделя, и нам необходимо убедиться.^

	Каждая минута на счету, поэтому именно тебе, работяга-срочник с красным дипломом, предстоит успеть уложиться в сроки, иначе вся ответственность ляжет на тебя.
	P.S. Если вы видите планету за бортом - это просто красивая проекция/картина/рисунок для поднятия настроения и морального духа]];
	--way = {path {'Начать', "start10"} };

	pic = 'assets/ready.gif';
	way = {path {'Начать', 'build_rocket'} };
} :with {
obj {
	nam = 'полет_walk';
	dsc = 'for debug {полет_walk}';
	act = function()
		walkin 'Полет'
	end,
},
obj {
	nam = 'космодром_walk';
	dsc = 'for debug {космодром_walk}';
	act = function()
		walkin 'космодром'
	end,
},
obj {
	nam = 'запуск_walk';
	dsc = 'for debug {запуск_walk}';
	act = function()
		walkin 'инфо'
	end,
},
obj {
	nam = 'tutorial_walk';
	dsc = 'for debug {tutorial_walk}';
	act = function()
		walkin 'tutorial'
	end,
},
obj {
	nam = 'луна_1_walk';
	dsc = 'for debug {луна_1_walk}';
	act = function()
		walkin 'луна_1'
	end,
},
obj {
	nam = 'landing_walk';
	dsc = 'for debug {landing_walk}';
	act = function()
		walkin 'landing'
	end,
},
obj {
	nam = 'disembark_walk';
	dsc = 'for debug {disembark_walk}';
	act = function()
		walkin 'disembark'
	end,
}
}

-- Аня
include "flightProcess-10"
include "tasks"
include "map"

-- Серёжа
include 'launchPreparation/tutorial'

--Андрей
include "andrey_room"
include "andrey_game"
include "andrey_obj"
include "andrey_tasks"

-- Матвей
include 'rocketLaunchProcess/game'

-- Павел
include 'tarasov'

-- Настя
include 'build_rocket'

-- Роман
include 'landing'

-- Иван
include 'disembark'
