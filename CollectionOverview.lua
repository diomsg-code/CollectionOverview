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

collectionOverviewFrame:RegisterEvent("ADDON_LOADED")
collectionOverviewFrame:SetScript("OnEvent", collectionOverviewFrame.OnEvent)

SLASH_CollectionOverview1, SLASH_CollectionOverview2 = '/colov', '/CollectionOverview'

SlashCmdList["CollectionOverview"] = SlashCommand