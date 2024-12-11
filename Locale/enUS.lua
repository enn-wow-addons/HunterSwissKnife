-- if ( GetLocale() == "enUS" or GetLocale() == "enGB" ) then

    -- Addon information

    HSK_TITLE   = "HunterSwissKnife"; -- DO NOT CHANGE
    HSK_VERSION = "v1.1";             -- DO NOT CHANGE

    -- Messages

    HSK_MESSAGE_ADDONLOADED   = string.format("%s%s %s is Loaded. Type %s or %s for configuration menu",
                                              HSK_COLOR_GREEN,
                                              HSK_TITLE,
                                              HSK_VERSION,
                                              "/hsk",
                                              "/hunterswissknife");
    HSK_MESSAGE_ADDONUNLOADED = string.format("%s%s %s is Unloaded.",
                                              HSK_COLOR_YELLOW,
                                              HSK_TITLE,
                                              HSK_VERSION);

    -- UI

    HSK_UI_TEMPLATE_WINDOW_HEADER_TEXT             = HSK_TITLE;

    HSK_UI_MAINMENU_CHECKBOX_AIMEDSHOTCASTBAR_TEXT = "Aimed Shot castbar";
    HSK_UI_MAINMENU_CHECKBOX_AUTOSHOTCASTBAR_TEXT  = "Auto Shot castbar";
    HSK_UI_MAINMENU_CHECKBOX_AUTOSHOTOVERRIDE_TEXT = "Auto Shot override";
    HSK_UI_MAINMENU_CHECKBOX_CALLPETOVERRIDE_TEXT  = "Call Pet override";
    HSK_UI_MAINMENU_CHECKBOX_ASPECTSOVERRIDE_TEXT  = "Aspects override";
    HSK_UI_MAINMENU_CHECKBOX_ASPECTSANTIDAZE_TEXT  = "Antidaze";
    HSK_UI_MAINMENU_CHECKBOX_TRACKINGOVERRIDE_TEXT = "Minimap Click override";
    HSK_UI_MAINMENU_CHECKBOX_TRACKINGRING_TEXT     = "Tracking Ring";

    HSK_UI_MAINMENU_BUTTON_DEFAULT_TEXT            = "Default";
    HSK_UI_MAINMENU_BUTTON_SAVE_TEXT               = "Save";

    -- Spells

    HSK_SPELL_HAWK_NAME           = "Aspect of the Hawk";
    HSK_SPELL_MONKEY_NAME         = "Aspect of the Monkey";
    HSK_SPELL_CHEETAH_NAME        = "Aspect of the Cheetah";
    HSK_SPELL_PACK_NAME           = "Aspect of the Pack";
    HSK_SPELL_BEAST_NAME          = "Aspect of the Beast";
    HSK_SPELL_WILD_NAME           = "Aspect of the Wild";
    HSK_SPELL_WOLF_NAME           = "Aspect of the Wolf";

    HSK_SPELL_AUTOSHOT_NAME       = "Auto Shot";
    HSK_SPELL_AIMEDSHOT_NAME      = "Aimed Shot";
    HSK_SPELL_MULTISHOT_NAME      = "Multi-Shot";
    HSK_SPELL_SCATTERSHOT_NAME    = "Scatter Shot";
    HSK_SPELL_CONCUSSIVESHOT_NAME = "Concussive Shot";

    HSK_SPELL_SERPENTSTING_NAME   = "Serpent Sting";
    HSK_SPELL_SCORPIDSTING_NAME   = "Scorpid Sting";
    HSK_SPELL_VIPERSTING_NAME     = "Viper Sting";
    HSK_SPELL_WYVERNSTING_NAME    = "Wyvern Sting";

    HSK_SPELL_FROSTTRAP_NAME      = "Frost Trap";
    HSK_SPELL_FREEZINGTRAP_NAME   = "Freezing Trap";
    HSK_SPELL_EXPLOSIVETRAP_NAME  = "Explosive Trap";
    HSK_SPELL_IMMOLATIONTRAP_NAME = "Immolation Trap";

    HSK_SPELL_WINGCLIP_NAME       = "Wing Clip";
    HSK_SPELL_COUNTERATTACK_NAME  = "Counterattack";
    HSK_SPELL_DETERRENCE_NAME     = "Deterrence";

    HSK_SPELL_RAPIDFIRE_NAME      = "Rapid Fire";
    HSK_SPELL_FEIGNDEATH_NAME     = "Feign Death";
    HSK_SPELL_FLARE_NAME          = "Flare";

    HSK_SPELL_CALLPET_NAME        = "Call Pet";
    HSK_SPELL_SCAREBEAST_NAME     = "Scare Beast";

-- end
