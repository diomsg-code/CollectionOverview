local addonName, COLOV = ...

COLOV.MEDIA_PATH = "Interface\\AddOns\\" .. addonName .. "\\media\\"

COLOV.addonVersion = C_AddOns.GetAddOnMetadata(addonName, "Version")