dlg {
nam = "build_rocket";
phr = {

{'#вход', [[Чтобы собрать комплект чертежей, нужны исследования.]], always=true,
{'Исследовать топливно-двигательные системы', next='#вход', always=true, function() V["тдс"] = 1 end},
{'Исследовать салонное дело', next='#вход', always=true, function() V["салон"] = 1 end},
{'Исследовать поверхности', next='#вход', always=true, function() V["поверхность"] = 1 end},
{'Исследовать парус', next='#вход', always=true, function() V["парус"] = 1 end},
{'Исследовать нагревательную систему', next='#вход', always=true, function() V["нагрев"] = 1 end},
{'Исследовать ядерный реактор', next='#вход', always=true, function() V["яр"] = 1 end},
{'Исследовать систему торможения', next='#вход', always=true, function() V["тормоз"] = 1 end},
{'Исследовать каркас', next='#вход', always=true, function() V["каркас"] = 1 end},
{'Составить комплект чертежей', cond = function() return V["каркас"] and V["тдс"] and V["салон"] and V["поверхность"] and V["парус"] and V["нагрев"] and V["яр"]  and V["тормоз"] end, next='#кч1', always=true},
},

{false, '#кч1', [[Теперь проекты нужно согласовать!]], always=true,
{'Согласовать у Федотова И. Ю.', next='#кч1', always=true, function() V["Федотов"] = 1 end},
{'Начать строить площадку', next='#кч1', always=true, function() V["площадка"]  = 1 end},
{'Начать поиск и подписание договоров', cond = function() return V["площадка"] and V["Федотов"] end, next='#ппд1', always=true},
},

{false, '#ппд1', [[Теперь нужно найти и подписать договоры на подрядные и субподрядне работы!]], always=true,
{'Найти и подписать договора на подрядные работы.', next='#ппд1', always=true, function() V["подрядные"] = 1 end},
{'Найти и подписать договора на субподрядные работы.', next='#ппд1', always=true, function() V["субподрядные"] = 1 end},
{'Подготовка материалов для конструирования ракеты и их подъёма на луну.', cond = function() return V["субподрядные"]  and V["подрядные"] end, next='#пм1', always=true},
},

{false, '#пм1', [[Подготавливаем материалы для конструирования ракеты и их подъёма на луну.]], always=true,
{'Подготовка и подъём материалов каркаса', next='#пм1', always=true, function() V["каркас_мат"]=1 end},
{'Подготовка и подъём материалов топливной двигательной системы.', next='#пм1', always=true, function() V["тдс_мат"]=1 end},
{'Подготовка и подъём материалов салона.', next='#пм1', always=true, function() V["салон_мат"]=1 end},
{'Подготовка и подъём материалов поверхности ракеты.', next='#пм1', always=true, function() V["поверхность_мат"]=1 end},
{'Подготовка и подъём материалов паруса.', next='#пм1', always=true, function() V["парус_мат"]=1 end},
{'Подготовка и подъём материалов нагревательной системы.', next='#пм1', always=true, function() V["нагрев_мат"]=1 end},
{'Подготовка и подъём ядерного реактора.', next='#пм1', always=true, function() V["яр_мат"]=1 end},
{'Подготовка и тормозной системы.', next='#пм1', always=true, function() V["тормоз_мат"]=1 end},
{'Переместить рабочие бригады', cond = function() return V["каркас_мат"] and V["тдс_мат"] and V["салон_мат"] and V["поверхность_мат"] and V["парус_мат"] and V["нагрев_мат"] and V["яр_мат"]  and V["тормоз_мат"] end, next='#перем1', always=true},
},

{false, '#перем1', [[Теперь нужно переместить рабочую бригаду и материалы для начала работ на Луну.]], always=true,
{'Переместить Сидорова', next='#перем1', always=true, function() V["Сидоров_на_ракете"] = 1 end},
{'Переместить Петрова', next='#перем1', always=true, function() V["Петров_на_ракете"] = 1 end},
{'Собрать тестовую ракету', cond = function() return V["Петров_на_ракете"] and V["Сидоров_на_ракете"]  end, next='#тест1', always=true, function() V["сборка_тест"]  = 0 end},
},

{false, '#тест1', [[Теперь нужно собрать тестовую ракету.]], always=true,
{'Запуск тестовой ракеты', cond = function() return V["сборка_тест"] >10 end, next='#зап1', always=true},
{'Сборка', next='#тест1', always=true, function() V["сборка_тест"] = V["сборка_тест"] +1; p(V["сборка_тест"]) end},
},

{false, '#зап1', [[Запуск прошёл успешно. Теперь нужно собрать ракету, прошедшую тестирование.]], always=true,
{'Начать сборку ракеты', next='#тест2', always=true, function() V["сборка_тест_2"] = 0 end},
},

{false, '#тест2', [[Теперь нужно собрать ракету, прошедшую тестирование.]], always=true,
{'Запуск ракеты', cond = function() return V["сборка_тест_2"] >10 end, next='#зап2', always=true},
{'Сборка', next='#тест2', always=true, function() V["сборка_тест_2"] = V["сборка_тест_2"] +1; p(V["сборка_тест_2"]) end},
},

{false, '#зап2', [[Поздравляем, ракета построена! Теперь можно построить стартовую площадку.]], always=true,
{'Перейти к постройке стартовой площадки', next='#зап2', always=true, function() walk 'луна_1' end},
},

}}