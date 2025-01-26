local addonName, COLOV = ...

local L = COLOV.localization

function COLOV:LoadOptions()
    if (not COLOV_Database_Options) then
        COLOV_Database_Options = {}
    end

    self.options = COLOV_Database_Options

    local variableTable = COLOV_Database_Options
    local category, layout = Settings.RegisterVerticalLayoutCategory("Collection Overview")
    category.ID = "Collection Overview"

    

    Settings.RegisterAddOnCategory(category)
end
