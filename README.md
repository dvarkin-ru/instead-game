# instead-game (Кривова, Процесс полета)
## список сцен по файлам:
- flightProcess-10 - процесс полета (Кривова)
- img-10 - папка для хранения картинок для flightProcess-10
- ____________________________________________
- main3 - просто где появляется игрок
- launchpad - здесь нужно построить корабль из двух компонентов, а также можно взять с собой Барсика, который погрызёт гудок, если осмотрит местность дважды
- ship - вход в корабль и тестирование
- flight - полёт, можно нажать гудок
- landing - приземление и общение с кем-то
- --------------------------------------------
## Рандомные события и задания: (еще не реализовано)
  "Ты проснулся после криосна и заглянул в свой рабочий терминал, там можно прочитать о СОБЫТИЯХ, которые произошли, пока ты спал и о ЗАДАНИЯХ, которыми стоит заняться..."
  0. *СОБЫТИЕ* -> *ЗАДАНИЕ* (пример)
    1. *Если не реагировать на событие*
    2. *Успешное выполнение следствия события*
    3. *Недачное выполнение следствия события*
    * d20 - успех выполнения задания полностью зависит от рандома
    * выбор - успех зависит от правильного выбора
    * пока не знаю как сделаю выполнение задания - телепортация в нужную комнату сразу, или нужно самостоятельно идти в нужную комнату.
    * Не реагировать на событие - пойти спать

  1. Пролетели через метеоритный дождь -> В обшивке появилась ~~дырка~~ отверстие. Пока не стало слишком поздно нужно заделать пробоину. (d20)
     1. (Ничего не делать) [-10 хп кораблю] Целостность корабля частитчно нарушена и наверно не стоило это игнорировать.
     2. [+2 хп кораблю] Пока ты латал пробоину, ты заметил еще пару мест, которые требовали починки. Плагодаря этому были предотвращены пара будующих проблем, которые всплыли бы потом.
     3. [-5 хп кораблю] Ну ты  хотяб попытался, но что-то пошло не так. Ты тупо прикрыл дырку пакетом. 
  2. Пока ты спал что-то случилось с системой подачи кислорода, становится тяжело дышать. -> Починить систему подачи кислорода (d20)
     1. [game over] С этим точно не стоило шутить, это не та работа, на которую можно забить. Все, кто спали мирно умерли во сне, остальным повезло чуть меньше.
     2. [+2 хп экипажу] 
     3. [-5 хп экипажу] 
  3. В сводке пишется, что один из членов экипажа со станным именем начал называть себя чьим-то сыном и буянить. В итоге вся вода, которую он трогал превратилась в вино. Как? Да черт знает, разбирайся сам! -> Вода превратилась в вино, нужно что-то с этим сделать, иначе весь экипаж сопьется. (d20)
     1. (Ничего не делать) [-10 хп кораблю, - 10 хп экипажу] Ты спился, твои соседи по криокомнате спились, все спились. Конечно со временем вода и сама отфильтруется, но печень спасибо не скажет. К тому же некоторые члены экипажа ушли в запой и забили на свои обязанностии и выполнение задач.
     2. [+1 хп экипажу] Ты успешно запустил систему усиленной фильтрации воды. Конечно это теперь не вино, но члены экипажа говорят, что вода стала вкуснее.
     3. [-2 хп кораблю, -3 хп экипажу] Ты попытался запустить усиленную систему фильрации воды, но вода теперь имеет мерзкий вкус уксуса и чего-то технического. Возможно ты повредил что-то, пока ковырялся в системе фильров.
  4. В одном из отсеков нет света -> Починить освещение. Сколько нужно членов экипажа, чтобы заменить лампочку? (d20)
     1. (Ничего не делать) [-0,01 хп экипажу] Один из твоих коллег в темноте ударился мизинчиком об угол. Ты нехороший человек.
     2. [-] Вау, ты смог заменить лампочку!  
     3. [-5 хп ракете, -1 хп экипажу] Ты полез куда-то не туда, вместо того, чтобы просто заменить лампочку. Хоть ты не электрик, но у тебя теперь тоже есть корочка)))
  5. На борту корабля завелись стасики и начали есть запасы еды -> Твоя задача избавиться от стасиков или защитить запасы еды от них. (выбор)
     1. (расставить ловушки) Ты из какого года? Из 2023? Тараканы сейчас слишком умные для этих примитивных устройств. Над тобой все смеются, в том числе тараканы.
     2. (приготовить тараканов) [+5 хп экипажу] Душа бывшего студента, который когда-то жил в общаге подсказывает, что тараканов можно приготовить. Зачем пропадать такому ценному белку? Ты представил какие блюда можно приготовить... Хрустящие тараканьи крылышки с азиатскими специями, тараканьи мясные шарики в томатном соусе, зажаренные тараканы на гриле с медово-горчичным глазурью, тараканьи фрикадельки в карамелизованном луковом соусе, французский багет с обжаренными тараканьими крошками и чесночным маслом, тараканьи ножки в кокосовой панировке с манго-ананасовым соусом, тараканьи кексы с шоколадным ганашем и малиновым кули... Экипаж доволен новым блююдам. Возможно им не стоит знать из чего это готовится.
     3. (выбросить тараканов с корабля) Ты включил музыку в отсеке для сброса мусора. Все тараканы сползлись туда и утроили там тусовку под звуки (татарстан супер гуд). После нажатия на рычаг створки шлюза открылись и вся колония стасиков отправилась в открытый космос. Надеюсь мы их больше не увидим.
     4. [ничего не делать] Пока все спали, тараканы угнали корабль, а все криокамеры и члены экипажа были выброшены за борт.
  6. В гости заходили инопланетяне и подарили странные яйцеподобные коконы -> Нужно выяснить что это за коконы и для чего они нужны. (выбор)
     1. {в любой момент} (Заглянуть в кокон) [game over] Створки кокона приотрылись как только ты подошел к нему. Внутри кокона видна пульсация, оно живое. Ты заглянул во внутрь кокона (Великолепный план, надежный как швейцарские часы!). Всё произошло слишком быстро, что-то пригнуло тебе на лицо прямо из кокона.
     2. {в любой момент} (Изучить кокон на научной станции) Ничего необычного, просто фейсхаггер в своем коконе. Мог бы быть интересным подарком для коллеги, если бы не кислота. Хотя... Может с ним можно что-то сделать?   
     3. {после изучения} (Приготовить из кокона вкусный обед) [+5 хп экипажу] Ты вспомнил, что когда-то ты был прекрасным поваром. Ты вспоминаешь студенческие годы, когда живя в общаге тебе приходилось готовить из всего, что попадется под руку.
       Ты осторожно разбиваешь яйцо, сохраняя целость фейсхаггера, и размешиваешь его вилкой, чтобы смешать желток и белок. Затем он разогреваешь сковороду, которыю невозможно прожечь кислотой (ты не помниь где ты её купил, но на ручке мелкими буквами написано made in USSR). Добвляешь небольшое количество сливочного масла, и аккуратно выкладываешь яйцо и мясо фейсхагера на сковороду.
Слегка шипя, мясо начинает образовывать золотистую корочку вокруг себя. Ты приправляешь яйцо и мясо свежими травами и специями, чтобы добавить аромат и вкус.
Когда блюдо достигает идеальной степени готовности, ты аккуратно переносишь его на стильную футуристичную тарелку с ~~LGBT~~ RGB подсветкой. Ты решил украсить блюдо свежими травами и добавляешь небольшое количество декоративных элементов, чтобы подчеркнуть его уникальность и оригинальность.
В результате, яйцо готово к подаче. Оно представляет собой удивительное блюдо, сочетающее в себе нежность яйца, золотистую корочку мяса фейсхаггера и аромат свежих трав. Готовое яйцо чужого с фейсхаггером становится привлекательным и аппетитным произведением кулинарного искусства, готовым принести наслаждение космонавту, который изголодался по домашней еде.
     4. {в любой момент} (Выбросить в космос) Ты уже видел это в каком-то старом кино... Так что выбросить это в космос не такая уж и плохая идея.
     5. [ничего не делать] Ты решил ничего не делать с этими странными коконами. Со временем члены экипажа начали пропадать... Корабль превратился в прекрасную колонию чужих. 
- --------------------------------------------

