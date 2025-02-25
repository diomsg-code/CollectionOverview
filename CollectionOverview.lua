local addonName, COLOV = ...

local L = COLOV.localization

----------------------
--- Local funtions ---
----------------------

local function SlashCommand(msg, editbox)
    if not msg or msg:trim() == "" then
        Settings.OpenToCategory("Collection Overview")
	else
        COLOV:PrintDebug("No arguments will be accepted.")
	end
end

--------------
--- Frames ---
--------------

local collectionOverviewFrame = CreateFrame("Frame", "CollectionOverview")

---------------------
--- Main funtions ---
---------------------

function collectionOverviewFrame:OnEvent(event, ...)
	self[event](self, event, ...)
end

function collectionOverviewFrame:ADDON_LOADED(_, addOnName)
    if addOnName == addonName then
        COLOV:LoadOptions()
        COLOV:PrintDebug("Addon fully loaded.")

        --local raceTimeOverviewFrame = CreateFrame("Frame", "CollectionOverview", UIParent, "ButtonFrameTemplate")
        --raceTimeOverviewFrame:SetPoint("CENTER")
        --raceTimeOverviewFrame:SetSize(500, 500)
        --raceTimeOverviewFrame:SetTitle("Collection Overview")

        --raceTimeOverviewFrame.portrait = raceTimeOverviewFrame:GetPortrait()
        --raceTimeOverviewFrame.portrait:SetPoint('TOPLEFT', -5, 8)
        --raceTimeOverviewFrame.portrait:SetTexture(COLOV.MEDIA_PATH .. "iconRound.blp")

        --raceTimeOverviewFrame:Show()

        --local count = C_TransmogCollection.GetCategoryCollectedCount(1)
        --local total = C_TransmogCollection.GetCategoryTotal(1)
        --COLOV:PrintDebug(count)
        --COLOV:PrintDebug(total)


        --local numPets, numOwned = C_PetJournal.GetNumPets()
        --COLOV:PrintDebug(numPets .. "-" .. numOwned)

        --local numMounts = C_MountJournal.GetNumMounts()
        --COLOV:PrintDebug(numMounts)
    end
end

function collectionOverviewFrame:Load()
    local tab = LibStub('SecureTabs-2.0'):Add(CollectionsJournal, self, "Hallo")
    tab:SetText('blue')

    -- Erstellt den Inhaltsbereich für den Tab
    tab.frame = CreateFrame("Frame", nil, CollectionsJournal, "ButtonFrameTemplate")
    tab.frame:SetTitle("Skyriding Race Tracker")

    local secureTabButton = CreateFrame("Button", nil, CollectionsJournal, "SecureActionButtonTemplate")
    secureTabButton:SetAttribute("type", "click")
    secureTabButton:SetAttribute("clickbutton", CollectionsJournalTab4)
    secureTabButton:SetPoint("TOPLEFT", tab, "TOPLEFT")
    secureTabButton:SetPoint("BOTTOMRIGHT", tab, "BOTTOMRIGHT")
    secureTabButton:RegisterForClicks("AnyDown")

    tab.frame.portrait = tab.frame:GetPortrait()
    tab.frame.portrait:SetPoint('TOPLEFT', -5, 8)
    tab.frame.portrait:SetTexture(COLOV.MEDIA_PATH .. "iconRound.blp")

    tab.frame:SetAllPoints(CollectionsJournal)
    tab.frame:Hide()

    -- Füge Text hinzu
    local text = tab.frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    text:SetPoint("CENTER", tab.frame, "CENTER", 0, 0)
    text:SetText("Test-Inhalt für den neuen Tab")

    tab.OnSelect = function()
        tab.LeftHighlight:Hide()
        tab.MiddleHighlight:Hide()
        tab.RightHighlight:Hide()
        tab:SetHighlightLocked(true)

        HeirloomsJournal.ClassDropdown:Hide()
        HeirloomsJournal.progressBar:Hide()
        HeirloomsJournal.SearchBox:Hide()
        HeirloomsJournal.FilterDropdown:Hide()

        print('Tab was clicked!')
        tab.frame:Show()
    end

    tab.OnDeselect = function()
        print('A different tab was clicked!')
    end
end

hooksecurefunc("ToggleCollectionsJournal", function(tab)
    if tab ~= nil then return end
    if not CollectionsJournal then return end
    if not CollectionsJournal:IsShown() then return end

    --collectionOverviewFrame:Load()
end)

collectionOverviewFrame:RegisterEvent("ADDON_LOADED")
collectionOverviewFrame:SetScript("OnEvent", collectionOverviewFrame.OnEvent)

SLASH_CollectionOverview1, SLASH_CollectionOverview2 = '/colov', '/CollectionOverview'

SlashCmdList["CollectionOverview"] = SlashCommand