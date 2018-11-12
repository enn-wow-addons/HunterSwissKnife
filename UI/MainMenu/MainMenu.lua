local HSK_DSettings = {
    AimedShotCastbar = {
        Enabled = true;
    },
    AutoShotCastbar = {
        Enabled = true;
    },
    AutoShotOverride = {
        Enabled = true;
    },
    CallpetOverride = {
        Enabled = true;
    },
    AspectsOverride = {
        Enabled = true;
    },
    AspectsAntiDaze = {
        Enabled = true;
    }
}


HSK_Settings = {
    AimedShotCastbar = {
        Enabled = HSK_DSettings.AimedShotCastbar.Enabled;
    },
    AutoShotCastbar = {
        Enabled = HSK_DSettings.AutoShotCastbar.Enabled;
    },
    AutoShotOverride = {
        Enabled = HSK_DSettings.AutoShotOverride.Enabled;
    },
    CallpetOverride = {
        Enabled = HSK_DSettings.CallpetOverride.Enabled;
    },
    AspectsOverride = {
        Enabled = HSK_DSettings.AspectsOverride.Enabled;
    },
    AspectsAntiDaze = {
        Enabled = HSK_DSettings.AspectsAntiDaze.Enabled;
    }
}


-- GetChecked returns nil if unchecked, so the wrapper function is necessary
local function CheckBoxIsEnabled(checkButtonFrame)
    return checkButtonFrame:GetChecked() and true or false;
end


local function CheckBoxIsGlobalVars()
    if  CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_AIMEDSHOTCASTBAR) == HSK_Settings.AimedShotCastbar.Enabled and
        CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_AUTOSHOTCASTBAR)  == HSK_Settings.AutoShotCastbar.Enabled  and
        CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_AUTOSHOTOVERRIDE) == HSK_Settings.AutoShotOverride.Enabled and
        CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_CALLPETOVERRIDE)  == HSK_Settings.CallpetOverride.Enabled  and
        CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_ASPECTSOVERRIDE)  == HSK_Settings.AspectsOverride.Enabled  and
        CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_ASPECTSANTIDAZE)  == HSK_Settings.AspectsAntiDaze.Enabled
    then
        return true;
    else
        return false;
    end
end


local function CheckBoxIsDefault()
    if  CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_AIMEDSHOTCASTBAR) == HSK_DSettings.AimedShotCastbar.Enabled and
        CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_AUTOSHOTCASTBAR)  == HSK_DSettings.AutoShotCastbar.Enabled  and
        CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_AUTOSHOTOVERRIDE) == HSK_DSettings.AutoShotOverride.Enabled and
        CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_CALLPETOVERRIDE)  == HSK_DSettings.CallpetOverride.Enabled  and
        CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_ASPECTSOVERRIDE)  == HSK_DSettings.AspectsOverride.Enabled  and
        CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_ASPECTSANTIDAZE)  == HSK_DSettings.AspectsAntiDaze.Enabled
    then
        return true;
    else
        return false;
    end
end


local function SetGlobalVarsToDefault()
    HSK_Settings.AimedShotCastbar.Enabled = HSK_DSettings.AimedShotCastbar.Enabled;
    HSK_Settings.AutoShotCastbar.Enabled  = HSK_DSettings.AutoShotCastbar.Enabled;
    HSK_Settings.AutoShotOverride.Enabled = HSK_DSettings.AutoShotOverride.Enabled;
    HSK_Settings.CallpetOverride.Enabled  = HSK_DSettings.CallpetOverride.Enabled;
    HSK_Settings.AspectsOverride.Enabled  = HSK_DSettings.AspectsOverride.Enabled;
    HSK_Settings.AspectsAntiDaze.Enabled  = HSK_DSettings.AspectsAntiDaze.Enabled;
end


local function SetGlobalVarsToCheckBox()
    HSK_Settings.AimedShotCastbar.Enabled = CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_AIMEDSHOTCASTBAR);
    HSK_Settings.AutoShotCastbar.Enabled  = CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_AUTOSHOTCASTBAR);
    HSK_Settings.AutoShotOverride.Enabled = CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_AUTOSHOTOVERRIDE);
    HSK_Settings.CallpetOverride.Enabled  = CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_CALLPETOVERRIDE);
    HSK_Settings.AspectsOverride.Enabled  = CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_ASPECTSOVERRIDE);
    HSK_Settings.AspectsAntiDaze.Enabled  = CheckBoxIsEnabled(HSK_UI_MAINMENU_CHECKBOX_ASPECTSANTIDAZE);
end


local function SetCheckBoxToDefault()
    HSK_UI_MAINMENU_CHECKBOX_AIMEDSHOTCASTBAR:SetChecked(HSK_DSettings.AimedShotCastbar.Enabled);
    HSK_UI_MAINMENU_CHECKBOX_AUTOSHOTCASTBAR:SetChecked(HSK_DSettings.AutoShotCastbar.Enabled);
    HSK_UI_MAINMENU_CHECKBOX_AUTOSHOTOVERRIDE:SetChecked(HSK_DSettings.AutoShotOverride.Enabled);
    HSK_UI_MAINMENU_CHECKBOX_CALLPETOVERRIDE:SetChecked(HSK_DSettings.CallpetOverride.Enabled);
    HSK_UI_MAINMENU_CHECKBOX_ASPECTSOVERRIDE:SetChecked(HSK_DSettings.AspectsOverride.Enabled);
    HSK_UI_MAINMENU_CHECKBOX_ASPECTSANTIDAZE:SetChecked(HSK_DSettings.AspectsAntiDaze.Enabled);
end


local function SetCheckBoxToGlobalVars()
    HSK_UI_MAINMENU_CHECKBOX_AIMEDSHOTCASTBAR:SetChecked(HSK_Settings.AimedShotCastbar.Enabled);
    HSK_UI_MAINMENU_CHECKBOX_AUTOSHOTCASTBAR:SetChecked(HSK_Settings.AutoShotCastbar.Enabled);
    HSK_UI_MAINMENU_CHECKBOX_AUTOSHOTOVERRIDE:SetChecked(HSK_Settings.AutoShotOverride.Enabled);
    HSK_UI_MAINMENU_CHECKBOX_CALLPETOVERRIDE:SetChecked(HSK_Settings.CallpetOverride.Enabled);
    HSK_UI_MAINMENU_CHECKBOX_ASPECTSOVERRIDE:SetChecked(HSK_Settings.AspectsOverride.Enabled);
    HSK_UI_MAINMENU_CHECKBOX_ASPECTSANTIDAZE:SetChecked(HSK_Settings.AspectsAntiDaze.Enabled);
end


function HSK_UI_MainMenu_CheckBox_OnClick()
    if not CheckBoxIsGlobalVars() then
        HSK_UI_MAINMENU_BUTTON_SAVE:Enable();
    else
        HSK_UI_MAINMENU_BUTTON_SAVE:Disable();
    end

    if not CheckBoxIsDefault() then
        HSK_UI_MAINMENU_BUTTON_DEFAULT:Enable();
    else
        HSK_UI_MAINMENU_BUTTON_DEFAULT:Disable();
    end
end


function HSK_UI_MainMenu_Button_Default_OnClick()
    SetCheckBoxToDefault();

    HSK_UI_MainMenu_CheckBox_OnClick();
end


function HSK_UI_MainMenu_Button_Save_OnClick()
    SetGlobalVarsToCheckBox();

    HSK_UI_MAINMENU:Hide();
end


function HSK_UI_MainMenu_OnShow()
    SetCheckBoxToGlobalVars();

    HSK_UI_MainMenu_CheckBox_OnClick();
    HSK_UI_MAINMENU:Show();
end
