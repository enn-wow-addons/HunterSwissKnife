-- Chinese localization is provided by Qcat0214
-- Thanks!

if GetLocale() == "zhCN" then

    -- Addon information

    HSK_TITLE   = "HunterSwissKnife"; -- DO NOT CHANGE
    HSK_VERSION = "v1.1";             -- DO NOT CHANGE

    -- Messages

    HSK_MESSAGE_ADDONLOADED   = string.format("%s%s %s 已加载. 输入 %s 或 %s 查看配置菜单",
                                              HSK_COLOR_GREEN,
                                              HSK_TITLE,
                                              HSK_VERSION,
                                              "/hsk",
                                              "/hunterswissknife");
    HSK_MESSAGE_ADDONUNLOADED = string.format("%s%s %s 未加载.",
                                              HSK_COLOR_YELLOW,
                                              HSK_TITLE,
                                              HSK_VERSION);

    -- UI

    HSK_UI_TEMPLATE_WINDOW_HEADER_TEXT             = HSK_TITLE;

    HSK_UI_MAINMENU_CHECKBOX_AIMEDSHOTCASTBAR_TEXT = "瞄准射击施法条";
    HSK_UI_MAINMENU_CHECKBOX_AUTOSHOTCASTBAR_TEXT  = "自动射击施法条";
    HSK_UI_MAINMENU_CHECKBOX_AUTOSHOTOVERRIDE_TEXT = "自动射击覆盖";
    HSK_UI_MAINMENU_CHECKBOX_CALLPETOVERRIDE_TEXT  = "召唤宠物覆盖";
    HSK_UI_MAINMENU_CHECKBOX_ASPECTSOVERRIDE_TEXT  = "守护覆盖";
    HSK_UI_MAINMENU_CHECKBOX_ASPECTSANTIDAZE_TEXT  = "抗眩晕";
    HSK_UI_MAINMENU_CHECKBOX_TRACKINGOVERRIDE_TEXT = "小地图点击覆盖";
    HSK_UI_MAINMENU_CHECKBOX_TRACKINGRING_TEXT     = "跟踪环";

    HSK_UI_MAINMENU_BUTTON_DEFAULT_TEXT            = "默认";
    HSK_UI_MAINMENU_BUTTON_SAVE_TEXT               = "保存";

    -- Spells

    HSK_SPELL_HAWK_NAME           = "雄鹰守护";
    HSK_SPELL_MONKEY_NAME         = "灵猴守护";
    HSK_SPELL_CHEETAH_NAME        = "猎豹守护";
    HSK_SPELL_PACK_NAME           = "豹群守护";
    HSK_SPELL_BEAST_NAME          = "野兽守护";
    HSK_SPELL_WILD_NAME           = "野性守护";

    HSK_SPELL_AUTOSHOT_NAME       = "自动射击";
    HSK_SPELL_AIMEDSHOT_NAME      = "瞄准射击";
    HSK_SPELL_MULTISHOT_NAME      = "多重射击";
    HSK_SPELL_SCATTERSHOT_NAME    = "驱散射击";
    HSK_SPELL_CONCUSSIVESHOT_NAME = "震荡射击";

    HSK_SPELL_SERPENTSTING_NAME   = "毒蛇钉刺";
    HSK_SPELL_SCORPIDSTING_NAME   = "毒蝎钉刺";
    HSK_SPELL_VIPERSTING_NAME     = "蝰蛇钉刺";
    HSK_SPELL_WYVERNSTING_NAME    = "翼龙钉刺";

    HSK_SPELL_FROSTTRAP_NAME      = "冰霜陷阱";
    HSK_SPELL_FREEZINGTRAP_NAME   = "冰冻陷阱";
    HSK_SPELL_EXPLOSIVETRAP_NAME  = "爆炸陷阱";
    HSK_SPELL_IMMOLATIONTRAP_NAME = "献祭陷阱";

    HSK_SPELL_WINGCLIP_NAME       = "摔绊";
    HSK_SPELL_COUNTERATTACK_NAME  = "反击";
    HSK_SPELL_DETERRENCE_NAME     = "威慑";

    HSK_SPELL_RAPIDFIRE_NAME      = "急速射击";
    HSK_SPELL_FEIGNDEATH_NAME     = "假死";
    HSK_SPELL_FLARE_NAME          = "照明弹";

    HSK_SPELL_CALLPET_NAME        = "召唤宠物";
    HSK_SPELL_SCAREBEAST_NAME     = "恐吓野兽";

end
