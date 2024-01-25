dlg {
nam = "landing";
phr = {

{'#вход', [[Ура, вы подлетаете к планете! Требуется подготовиться к приемлению.]], always=true,
{'Вывод из сна экипажа', next='#вход', always=true, function() V["экипаж_пробуждён"] = 1 end},
{'Провека целостности капсулы', next='#вход', always=true, function() V["капсула_цела"] = 1 end},
{'Проверка работоспособности всех систем', next='#вход', always=true, function() V["все_системы_целы"] = 1 end},
{'Мобилизация ресурсов', next='#вход', always=true, function() V["ресы_мобилизированы"] = 1 end},
{'Подготовить экипаж', cond = function() return V["экипаж_пробуждён"] end, next='#вход', always=true, function() V["экипаж_подготовлен"] = 1 end},
{'Приступить к приземлению', cond = function() return V["экипаж_пробуждён"] and V["капсула_цела"] and V["все_системы_целы"] and V["ресы_мобилизированы"]  and V["экипаж_подготовлен"] end, next='#приземл', always=true},
},

{false, '#приземл', [[Определение наличия атмосферы на планете]], always=true,
{'Запустить датчики определения атмосферы', cond = function() return not V["атм"] and not V["безатм"] end, next='#приземл', always=true, function() if math.random(0, 1) then V["атм"] = 1 else V["безатм"] = 1 end end},
{'На планете есть атмосфера!', cond = function() return V["атм"] end, next='#атм1', always=true},
{'На планете нет атмосферы!', cond = function() return V["безатм"] end, next='#безатм1', always=true},
},

{false, '#атм1', [[Ваш корабль входит в атмосферу планеты, приборы автоматически анализируют планету. Но корабль незначительно отклонился от курса.]], always=true,
{'Поправить курс', next='#атм2', always=true, function() V["манёвры"]=0 end},
},

{false, '#атм2', [[Произведите манёвры для снижения скорости об атмосферу.]], always=true,
{'Повернуть правее!', cond = function() return V["манёвры"] <5 end, next='#атм2', always=true, function() if math.random(0, 6)<4 then p "Нужно левее" else p "Нужно правее" end; V["манёвры"] = V["манёвры"] +1 end},
{'Повернуть левее!', cond = function() return V["манёвры"] <5 end, next='#атм2', always=true, function() if math.random(0, 6)<4 then p "Нужно левее" else p "Нужно правее" end; V["манёвры"] = V["манёвры"] +1 end},
{'Повернуть правее и закончить манёвры!', cond = function() return V["манёвры"] >=5 end, next='#атм3', always=true},
{'Повернуть левее и закончить манёвры!', cond = function() return V["манёвры"] >=5 end, next='#атм3', always=true},
},

{false, '#атм3', [[Корпус ракеты сгорел, но в последний момент капсула с космонавтами была отстыкована.]], always=true,
{'Открыть парашют!', next='#атм4', always=true},
},

{false, '#атм4', [[Капсула с космонавтами с грохотом приземлилась. Нужно проверить всех космонавтов и всё оборудование.]], always=true,
{'Проверить космонавтов', next='#атм4', always=true, function() V["космы_в_порядке"] = 1 end},
{'Проверить оборудование', next='#атм4', always=true, function() V["вещи_в_порядке"] = 1 end},
{'Начать высадку', cond = function() return V["космы_в_порядке"] and V["вещи_в_порядке"] end, next='#атм4', always=true},
},

{false, '#безатм1', [[Ваш корабль приближается к планете, приборы автоматически анализируют планету. Но корабль незначительно отклонился от курса.]], always=true,
{'Запустить двигатели и поправить курс', next='#безатм2', always=true, function() V["манёвры"]=0 end},
},

{false, '#безатм2', [[Произведите манёвры для корректировки траектории.]], always=true,
{'Повернуть правее!', cond = function() return V["манёвры"] <5 end, next='#безатм2', always=true, function() if math.random(0, 6)<4 then p "Нужно левее" else p "Нужно правее" end; V["манёвры"] = V["манёвры"] +1 end},
{'Повернуть левее!', cond = function() return V["манёвры"] <5 end, next='#безатм2', always=true, function() if math.random(0, 6)<4 then p "Нужно левее" else p "Нужно правее" end; V["манёвры"] = V["манёвры"] +1 end},
{'Повернуть правее и закончить манёвры!', cond = function() return V["манёвры"] >=5 end, next='#безатм3', always=true},
{'Повернуть левее и закончить манёвры!', cond = function() return V["манёвры"] >=5 end, next='#безатм3', always=true},
},

{false, '#безатм3', [[Топливо сгорело, осталось только ждать столкновения.]], always=true,
{'Ждать столкновения', next='#безатм4', always=true},
},

{false, '#безатм4', [[Ракета с космонавтами с грохотом приземлилась. Нужно проверить всех космонавтов и всё оборудование.]], always=true,
{'Проверить космонавтов', next='#безатм4', always=true, function() V["космы_в_порядке"] = 1 end},
{'Проверить оборудование', next='#безатм4', always=true, function() V["вещи_в_порядке"] = 1 end},
{'Начать высадку', cond = function() return V["космы_в_порядке"] and V["вещи_в_порядке"] end, next='#безатм4', always=true, function() walk 'disembark_main' end},
},

}}