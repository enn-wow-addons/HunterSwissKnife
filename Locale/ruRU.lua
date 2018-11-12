if GetLocale() == "ruRU" then

    -- Addon information

    HSK_TITLE   = "HunterSwissKnife"; -- DO NOT CHANGE
    HSK_VERSION = "v1.1";             -- DO NOT CHANGE

    -- Messages

    HSK_MESSAGE_ADDONLOADED   = string.format("%s%s %s загружен. Окно настроек: %s или %s",
                                              HSK_COLOR_GREEN,
                                              HSK_TITLE,
                                              HSK_VERSION,
                                              "/hsk",
                                              "/hunterswissknife");
    HSK_MESSAGE_ADDONUNLOADED = string.format("%s%s %s выгружен.",
                                              HSK_COLOR_YELLOW,
                                              HSK_TITLE,
                                              HSK_VERSION);

    -- UI

    HSK_UI_TEMPLATE_WINDOW_HEADER_TEXT             = HSK_TITLE;

    HSK_UI_MAINMENU_CHECKBOX_AIMEDSHOTCASTBAR_TEXT = "Кастбар (приц. выстрел)";
    HSK_UI_MAINMENU_CHECKBOX_AUTOSHOTCASTBAR_TEXT  = "Кастбар (авт. стрельба)";
    HSK_UI_MAINMENU_CHECKBOX_AUTOSHOTOVERRIDE_TEXT = "Постоянная авт. стрельба";
    HSK_UI_MAINMENU_CHECKBOX_CALLPETOVERRIDE_TEXT  = "Переопр. призыв питомца";
    HSK_UI_MAINMENU_CHECKBOX_ASPECTSOVERRIDE_TEXT  = "Постоянные аспекты";
    HSK_UI_MAINMENU_CHECKBOX_ASPECTSANTIDAZE_TEXT  = "Antidaze у духа гепарда";
    HSK_UI_MAINMENU_CHECKBOX_TRACKINGOVERRIDE_TEXT = "Minimap Click override";
    HSK_UI_MAINMENU_CHECKBOX_TRACKINGRING_TEXT     = "Tracking Ring";

    HSK_UI_MAINMENU_BUTTON_DEFAULT_TEXT            = "Сбросить";
    HSK_UI_MAINMENU_BUTTON_SAVE_TEXT               = "Сохранить";

    -- Spells

    HSK_SPELL_HAWK_NAME           = "Дух ястреба";
    HSK_SPELL_MONKEY_NAME         = "Дух обезьяны";
    HSK_SPELL_CHEETAH_NAME        = "Дух гепарда";
    HSK_SPELL_PACK_NAME           = "Дух стаи";
    HSK_SPELL_BEAST_NAME          = "Дух зверя";
    HSK_SPELL_WILD_NAME           = "Дух дикой природы";

    HSK_SPELL_AUTOSHOT_NAME       = "Автоматическая стрельба";
    HSK_SPELL_AIMEDSHOT_NAME      = "Прицельный выстрел";
    HSK_SPELL_MULTISHOT_NAME      = "Залп";
    HSK_SPELL_SCATTERSHOT_NAME    = "Дезориентирующий выстрел";
    HSK_SPELL_CONCUSSIVESHOT_NAME = "Контузящий выстрел";

    HSK_SPELL_SERPENTSTING_NAME   = "Укус змеи";
    HSK_SPELL_SCORPIDSTING_NAME   = "Укус скорпида";
    HSK_SPELL_VIPERSTING_NAME     = "Укус гадюки";
    HSK_SPELL_WYVERNSTING_NAME    = "Укус виверны";

    HSK_SPELL_FROSTTRAP_NAME      = "Ледяная ловушка";
    HSK_SPELL_FREEZINGTRAP_NAME   = "Замораживающая ловушка";
    HSK_SPELL_EXPLOSIVETRAP_NAME  = "Взрывная ловушка";
    HSK_SPELL_IMMOLATIONTRAP_NAME = "Обжигающая ловушка";

    HSK_SPELL_WINGCLIP_NAME       = "Подрезать крылья";
    HSK_SPELL_COUNTERATTACK_NAME  = "Контратака";
    HSK_SPELL_DETERRENCE_NAME     = "Сдерживание";

    HSK_SPELL_RAPIDFIRE_NAME      = "Быстрая стрельба";
    HSK_SPELL_FEIGNDEATH_NAME     = "Притвориться мертвым";
    HSK_SPELL_FLARE_NAME          = "Осветительная ракета";

    HSK_SPELL_CALLPET_NAME        = "Призыв питомца";
    HSK_SPELL_SCAREBEAST_NAME     = "Отпугивание зверя";

end
