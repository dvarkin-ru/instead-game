--[=[
humanHP = 100;
rocketHP = 100;
resourceHP = 100;
oxygenHP = 100;
]=]

------ РЕШЕНИЯ ЗАДАНИЙ ------
obj {
    nam = 'task_1',
    dsc = 'Здесь есть {пробоина}, которую нужно починить.',
    act = function(s)
        -- Логика выполнения задания
        local diceRoll = math.random(20)
        if diceRoll > 10 then
            -- Успешное выполнение
            humanHP = humanHP + charValue()
            oxygenHP = oxygenHP + charValue()
            rocketHP = rocketHP + charValue()
			p("Пока ты латал пробоину, ты заметил еще пару мест, которые требовали починки. Плагодаря этому были предотвращены пара будующих проблем, которые всплыли бы потом.")
        else
            -- Провал
            humanHP = humanHP - charValue()
            oxygenHP = oxygenHP - charValue()
            rocketHP = rocketHP - rocketHP()
			p("Ну ты  хотяб попытался, но что-то пошло не так. Ты тупо прикрыл дырку пакетом.")
        end
        currentTask.completed = true
		-- Удаление кнопки
		s:disable()
    end;
}

obj {
    nam = 'task_2',
    dsc = 'Похоже, что от контрольной панели отошла пара {трубок}, возможно проблема именно в них.',
    act = function(s)
        -- Логика выполнения задания
        local diceRoll = math.random(20)
        if diceRoll > 10 then
            -- Успешное выполнение
            humanHP = humanHP + charValue()
            oxygenHP = oxygenHP + charValue()
			p("Ура, ты смог восстановить стабильную подачу кислорода в отсеки")
        else
            -- Провал
            humanHP = humanHP - charValue()
            oxygenHP = oxygenHP - charValue()
			p("Хоть задание было не сложном, но ты провалил и его. Подача кислорода восстановлена, но он не такой вкусный как раньше.")
        end
        currentTask.completed = true
		s:disable()
    end;
}

obj {
    nam = 'task_3',
    dsc = 'В блоке фильтрации воды на удивление и правда пахнет вином, нужно это {исправить}',
    act = function(s)
        -- Логика выполнения задания
        local diceRoll = math.random(20)
        if diceRoll > 10 then
            -- Успешное выполнение
            humanHP = humanHP + charValue()
            rocketHP = rocketHP + charValue()
            resourceHP = resourceHP + charValue()
			p("Ты успешно запустил систему усиленной фильтрации воды. Конечно это теперь не вино, но члены экипажа говорят, что вода стала вкуснее.")
        else
            -- Провал
            humanHP = humanHP - charValue()
            rocketHP = rocketHP - charValue()
            resourceHP = resourceHP - charValue()
			p("Ты попытался запустить усиленную систему фильрации воды, но вода теперь имеет мерзкий вкус уксуса и чего-то технического. Возможно ты повредил что-то, пока ковырялся в системе фильров.")
        end
        currentTask.completed = true
		-- Удаление кнопки
		s:disable()
    end;
}

obj {
    nam = 'task_4',
    dsc = 'Тут ОЧЕНЬ темно, но ты смог {нащупать} неисправную лампочку',
    act = function(s)
        -- Логика выполнения задания
        local diceRoll = math.random(20)
        if diceRoll > 10 then
            -- Успешное выполнение
			p("Вау, ты смог заменить лампочку! ")
        else
            -- Провал
            humanHP = humanHP - charValue() - 10
            rocketHP = rocketHP - charValue()
			p("Ты полез куда-то не туда, вместо того, чтобы просто заменить лампочку. Хоть ты не электрик, но у тебя теперь тоже есть корочка)))")
        end
        currentTask.completed = true
		-- Удаление кнопки
		s:disable()
    end;
}

obj {
    nam = 'task_5',
    dsc = 'Кухня полна {стасиков}',
    act = function(s)
        -- Логика выполнения задания
        local diceRoll = math.random(20)
        if diceRoll > 10 then
            -- Успешное выполнение
			p("Вау, ты смог заменить лампочку! ")
        else
            -- Провал
            humanHP = humanHP - charValue() - 10
            rocketHP = rocketHP - charValue()
			p("Ты полез куда-то не туда, вместо того, чтобы просто заменить лампочку. Хоть ты не электрик, но у тебя теперь тоже есть корочка)))")
        end
        currentTask.completed = true
		-- Удаление кнопки
		s:disable()
    end;
}