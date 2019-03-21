HSK_Core_CastbarConfig = {}
HSK_Core_CastbarConfig.__index = HSK_Core_CastbarConfig;

function HSK_Core_CastbarConfig:new()
    local newObj = {
        x           = 0;
        y           = -235;
        height      = 12;
        width       = 100;

        innerBorder = { height = 4, width  = 4 };
        outerBorder = { height = 2, width  = 2 };

        reloadColor = { r = 1, g = 0, b = 0 };
        aimingColor = { r = 1, g = 1, b = 0 };

        alpha       = { visible = 1, hidden  = 0 };
    };

    return setmetatable(newObj, HSK_Core_CastbarConfig);
end


HSK_Core_Castbar = {}
HSK_Core_Castbar.__index = HSK_Core_Castbar;

function HSK_Core_Castbar:new()
    local newObj = {}
    return setmetatable(newObj, HSK_Core_Castbar);
end

function HSK_Core_Castbar:applyConfig(config)
    local posX              = self.config.x      * GetScreenWidth()  / 1000;
    local posY              = self.config.y      * GetScreenHeight() / 1000;
    local height            = self.config.height * GetScreenHeight() / 1000;
    local width             = self.config.width  * GetScreenWidth()  / 1000;
    local innerBorderHeight = self.config.innerBorder.height;
    local innerBorderWidth  = self.config.innerBorder.width;
    local outerBorderHeight = self.config.outerBorder.height;
    local outerBorderWidth  = self.config.outerBorder.width;

    self.frame:SetHeight(height);
    self.frame:SetWidth(width);
    self.frame:SetPoint("CENTER", UIParent, "CENTER", posX, posY);

    self.bar:SetHeight(height);
    self.bar:SetWidth(width);

    self.innerBorder:SetHeight(height + innerBorderHeight);
    self.innerBorder:SetWidth(width + innerBorderWidth);

    self.outerBorder:SetHeight(height + innerBorderHeight + outerBorderHeight);
    self.outerBorder:SetWidth(width + innerBorderWidth + outerBorderWidth);
end
