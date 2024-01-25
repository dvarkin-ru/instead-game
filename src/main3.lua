require "fmt" -- некоторые функции форматирования
fmt.para = true -- включить режим параграфов (отступы)


game.act = 'Не работает.';
game.use = 'Это не поможет.';
game.inv = 'Зачем мне это?';

global {V={}}

room {
	nam = 'main';
	disp = "НАЧАЛО";
	dsc = [[Добро пожаловать в удивительный мир космоса!^^
    Открывайте двери в бескрайний космос возможностей! Мы ищем истинных звездоплавателей, 
    готовых к несравненным космическим приключениям. Здесь вы станете частью эпической миссии
     и выберете свою команду для полета в неведомые уголки вселенной. Готовы ли вы стать космической звездой? Ваш полет начинается прямо сейчас! 
    ]];
	way = { path { 'Далее', 'r1' } };
	pic = 'cosmonaut/11.jpg';
} --[[:with {
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
}]]

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

-- Ксения
include 'cosmonaut/tutorial'
include 'cosmonaut/cosmonaut'
