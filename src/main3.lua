-- $Name: Самая интересная игра!$
-- $Version: 0.5$
-- $Author: Анонимный любитель текстовых приключений$
-- $Info: Это ремейк старой игры\nС ZX specturm$

require "fmt" -- некоторые функции форматирования
fmt.para = true -- включить режим параграфов (отступы)

game.act = 'Не работает.';
game.use = 'Это не поможет.';
game.inv = 'Зачем мне это?';

room {
	nam = 'main';
	disp = "Подвал";
	dsc = [[Вы очутились в подвале, из которого можно выйти на место запуска.]];
	way = {path {'Выйти на поверхность', "пустошь"} };
}

include "launchpad"
include "ship"
include "flight"
include "landing"

