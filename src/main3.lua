-- $Name: Самая интересная игра!$
-- $Version: 0.5$
-- $Author: Анонимный любитель текстовых приключений$





require "fmt" -- некоторые функции форматирования
fmt.para = true -- включить режим параграфов (отступы)
--game.pic = 'img/rooms/космос.png'



game.act = 'Не работает.';
game.use = 'Это не поможет.';
game.inv = 'Зачем мне это?';



room {
	nam = 'main';
	disp = "Начало игры";
	dsc = [[Добро пожаловать в прекрасную игру-симулятор "жизни" на космическом корабле. ^^
	ЦЕЛЬ: Прожить 5 циклов^^
	 ^^
	Игра выполнена с поддержкой самых передовых дендро-фекальных методов программирования.^^
	
	До полета ракеты осталась всего неделя, и для успешного запуска нам необходимо убедиться, что ракета находится в полной исправности.^

	Каждая минута на счету, поэтому именно тебе, работяга-срочник с красным дипломом, предстоит успеть уложиться в сроки, провести тщательную проверку всех систем и компонентов ракеты, чтобы обнаружить и устранить любые поломки или неисправности, иначе вся ответственность ляжет на тебя.
	P.S. Если вы видите планету за бортом - это просто красивая проекция/картина/рисунок для поднятия настроения и морального духа]];
	--way = {path {'Начать', "start10"} };

	pic = 'assets/bg.png';
	way = {path {'Краткая справка', 'tutorial'} };
}

-- Аня
include "flightProcess-10"
include "tasks"
include "map"

-- Серёжа
include 'launchPreparation/tutorial'


