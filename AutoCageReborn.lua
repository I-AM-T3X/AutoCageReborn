--[[
    Auto Cage Reborn
    Original concept by @Kruithne
    Modernized rewrite with full localization support
]]

local ADDON_NAME, AutoCageReborn = ...

-- ============================================================================
-- Localization (Complete tables with all translations)
-- ============================================================================
local L = {
    CAGED_MESSAGE = {
        ["frFR"] = "Dupliquer animal de compagnie; la mise en cage pour vous!",
        ["deDE"] = "Doppeltes Haustier; Sperre es in einen Käfig für dich!",
        ["enUS"] = "Duplicate pet; caging it for you!",
        ["itIT"] = "Metti in gabbia le tue mascotte duplicate!",
        ["koKR"] = "애완 동물을 복제 ; 케이지 에 넣어!",
        ["zhCN"] = "重复宠物;把它关在笼子里！",
        ["zhTW"] = "重複寵物;把它關在籠子裡！",
        ["ruRU"] = "Повторяющиеся питомца; положить его в клетку!",
        ["esES"] = "Duplicar mascota; ponerlo en una jaula!",
        ["esMX"] = "Duplicar mascota; ponerlo en una jaula!",
        ["ptBR"] = "Duplicar para animais de estimação ; colocá-lo em uma gaiola!"
    },
    
    LOADED = {
        ["frFR"] = "Chargé!",
        ["deDE"] = "Geladen!",
        ["enUS"] = "Loaded!",
        ["itIT"] = "Caricato!",
        ["koKR"] = "로드!",
        ["zhCN"] = "加载!",
        ["zhTW"] = "載入!",
        ["ruRU"] = "Загружен!",
        ["esES"] = "Cargado!",
        ["esMX"] = "Cargado!",
        ["ptBR"] = "Carregado!"
    },
    
    BUTTON_DUPLICATE_PETS = {
        ["frFR"] = "Cager les doubles",
        ["deDE"] = "Haustiere einsperren",
        ["enUS"] = "Cage Duplicate Pets",
        ["itIT"] = "Metti in gabbia i doppi",
        ["koKR"] = "중복 애완동물 케이지",
        ["zhCN"] = "关笼重复宠物",
        ["zhTW"] = "關籠重複寵物",
        ["ruRU"] = "Клетка для дубликатов",
        ["esES"] = "Enjaular duplicados",
        ["esMX"] = "Enjaular duplicados",
        ["ptBR"] = "Gaiola para duplicatas"
    },
    
    BUTTON_DUPLICATE_PETS_TOOLTIP = {
        ["frFR"] = "Met en cage tous les familiers en double qui ne sont ni favoris, ni de niveau supérieur à un.",
        ["deDE"] = "Sperrt alle Haustiere in einen Käfig, die weder favorisiert sind, noch Level eins übersteigen.",
        ["enUS"] = "Cages all duplicate pets that are neither favourited or above level one.",
        ["itIT"] = "Mette in gabbia tutte le mascotte duplicate che non sono né preferite né di livello superiore a uno.",
        ["koKR"] = "즐겨찾기에 추가되지 않았고 레벨 1을 초과하지 않는 모든 중복 애완 동물을 케이지에 넣습니다.",
        ["zhCN"] = "将所有未收藏且等级不高于1的重复宠物关入笼中。",
        ["zhTW"] = "將所有未收藏且等級不高於1的重複寵物關入籠中。",
        ["ruRU"] = "Помещает в клетку всех дубликатов питомцев, которые не в избранном и не выше 1 уровня.",
        ["esES"] = "Pone en jaula todas las mascotas duplicadas que no son favoritas ni de nivel superior a uno.",
        ["esMX"] = "Pone en jaula todas las mascotas duplicadas que no son favoritas ni de nivel superior a uno.",
        ["ptBR"] = "Coloca em gaiola todos os animais de estimação duplicados que não são favoritos ou acima do nível um."
    },
    
    CHECKBOX_AUTO = {
        ["frFR"] = "Automatiquement les doublons de cage",
        ["deDE"] = "Haustiere automatisch einsperren",
        ["enUS"] = "Automatically cage duplicates",
        ["itIT"] = "Metti in gabbia le tue mascotte duplicate automaticamente",
        ["koKR"] = "자동으로 케이지 중복",
        ["zhCN"] = "自动笼子里重复",
        ["zhTW"] = "自動籠子裡重複",
        ["ruRU"] = "Автоматически Кейдж дубликаты",
        ["esES"] = "Automáticamente duplicados de jaula",
        ["esMX"] = "Automáticamente duplicados de jaula",
        ["ptBR"] = "Duplicatas de gaiola automaticamente",
    },
    
    CHECKBOX_AUTO_TOOLTIP = {
        ["frFR"] = "Si activé, les animaux de compagnie en double qui s'apprend on mettra automatiquement dans une cage.",
        ["deDE"] = "Wenn aktiviert werden doppelte Haustiere automatisch in einen Käfig gesetzt, sobald sie erlernt werden.",
        ["enUS"] = "If enabled, duplicate pets that get learnt will automatically be put in a cage.",
        ["itIT"] = "Se abilitato,le mascotte duplicate che impari saranno automaticamente messi in gabbia.",
        ["koKR"] = "사용 하면 배운 얻을 중복 애완 동물 감 금 소에 게 자동으로 됩니다.",
        ["zhCN"] = "如果启用，把学到的重复宠物自动将会在一个笼子里。",
        ["zhTW"] = "如果啟用，把學到的重複寵物自動將會在一個籠子裡。",
        ["ruRU"] = "Если этот параметр включен, повторяющиеся животные, которые научились получать автоматически ставится в клетке.",
        ["esES"] = "Si se activa, automáticamente se pondrá mascotas duplicadas que haz aprendidas en una jaula.",
        ["esMX"] = "Si se activa, automáticamente se pondrá mascotas duplicadas que haz aprendidas en una jaula.",
        ["ptBR"] = "Se habilitado, animais de estimação duplicados que se aprendeu serão automaticamente colocados em uma gaiola.",
    },
    
    AUTO_ENABLED = {
        ["frFR"] = "Les familiers en double seront désormais automatiquement mis en cage.",
        ["deDE"] = "Doppelte Haustiere werden jetzt automatisch eingesperrt, wenn sie erhalten werden.",
        ["enUS"] = "Duplicate pets will now be automatically caged when obtained.",
        ["itIT"] = "Le mascotte duplicate verranno ora automaticamente messe in gabbia quando ottenute.",
        ["koKR"] = "이제 애완 동물을 획득할 때 중복이 자동으로 케이지에 들어갑니다.",
        ["zhCN"] = "现在获得重复宠物时将自动将其关入笼中。",
        ["zhTW"] = "現在獲得重複寵物時將自動將其關入籠中。",
        ["ruRU"] = "Дубликаты питомцев теперь будут автоматически помещаться в клетку при получении.",
        ["esES"] = "Las mascotas duplicadas se pondrán automáticamente en jaula al obtenerse.",
        ["esMX"] = "Las mascotas duplicadas se pondrán automáticamente en jaula al obtenerse.",
        ["ptBR"] = "Animais de estimação duplicados serão automaticamente colocados em gaiola quando obtidos."
    },
    
    AUTO_DISABLED = {
        ["frFR"] = "Les familiers en double ne seront plus automatiquement mis en cage.",
        ["deDE"] = "Doppelte Haustiere werden nicht mehr automatisch eingesperrt.",
        ["enUS"] = "Duplicate pets will no longer be automatically caged when obtained.",
        ["itIT"] = "Le mascotte duplicate non verranno più messe automaticamente in gabbia.",
        ["koKR"] = "이제 애완 동물을 획득할 때 중복이 자동으로 케이지에 들어가지 않습니다.",
        ["zhCN"] = "获得重复宠物时不再自动将其关入笼中。",
        ["zhTW"] = "獲得重複寵物時不再自動將其關入籠中。",
        ["ruRU"] = "Дубликаты питомцев больше не будут автоматически помещаться в клетку.",
        ["esES"] = "Las mascotas duplicadas ya no se pondrán automáticamente en jaula.",
        ["esMX"] = "Las mascotas duplicadas ya no se pondrán automáticamente en jaula.",
        ["ptBR"] = "Animais de estimação duplicados não serão mais automaticamente colocados em gaiola."
    },
    
    CAGING = {
        ["frFR"] = "Mise en cage des familiers en double...",
        ["deDE"] = "Doppelte Haustiere werden eingesperrt...",
        ["enUS"] = "Caging duplicate pets...",
        ["itIT"] = "Mettendo in gabbia le mascotte duplicate...",
        ["koKR"] = "중복 애완 동물 케이지 처리 중...",
        ["zhCN"] = "正在将重复宠物关入笼中...",
        ["zhTW"] = "正在將重複寵物關入籠中...",
        ["ruRU"] = "Помещение дубликатов питомцев в клетку...",
        ["esES"] = "Poniendo mascotas duplicadas en jaula...",
        ["esMX"] = "Poniendo mascotas duplicadas en jaula...",
        ["ptBR"] = "Colocando animais de estimação duplicados em gaiola..."
    },
    
    CAGING_COMPLETE = {
        ["frFR"] = "Mise en cage terminée !",
        ["deDE"] = "Einsperren abgeschlossen!",
        ["enUS"] = "Caging complete!",
        ["itIT"] = "Messa in gabbia completata!",
        ["koKR"] = "케이지 처리 완료!",
        ["zhCN"] = "关笼完成！",
        ["zhTW"] = "關籠完成！",
        ["ruRU"] = "Клетка заполнена!",
        ["esES"] = "¡Enjaulado completado!",
        ["esMX"] = "¡Enjaulado completado!",
        ["ptBR"] = "Colocação em gaiola completa!"
    },
    
    CAGING_NONE_FOUND = {
        ["frFR"] = "Aucun familier en double éligible trouvé.",
        ["deDE"] = "Keine geeigneten doppelten Haustiere gefunden.",
        ["enUS"] = "No eligible duplicate pets found.",
        ["itIT"] = "Nessuna mascotte duplicata idonea trovata.",
        ["koKR"] = "적합한 중복 애완 동물을 찾을 수 없습니다.",
        ["zhCN"] = "未找到符合条件的重复宠物。",
        ["zhTW"] = "未找到符合條件的重複寵物。",
        ["ruRU"] = "Подходящих дубликатов питомцев не найдено.",
        ["esES"] = "No se encontraron mascotas duplicadas elegibles.",
        ["esMX"] = "No se encontraron mascotas duplicadas elegibles.",
        ["ptBR"] = "Nenhum animal de estimação duplicado elegível encontrado."
    },
    
    CAGING_PROGRESS = {
        ["frFR"] = "Mise en cage de %d familier(s)...",
        ["deDE"] = "%d Haustier(e) werden eingesperrt...",
        ["enUS"] = "Caging %d pet(s)...",
        ["itIT"] = "Mettendo in gabbia %d mascotte...",
        ["koKR"] = "%d마리 애완 동물 케이지 처리 중...",
        ["zhCN"] = "正在将 %d 只宠物关入笼中...",
        ["zhTW"] = "正在將 %d 隻寵物關入籠中...",
        ["ruRU"] = "Помещение %d питомца(ов) в клетку...",
        ["esES"] = "Poniendo %d mascota(s) en jaula...",
        ["esMX"] = "Poniendo %d mascota(s) en jaula...",
        ["ptBR"] = "Colocando %d animal(is) em gaiola..."
    },
    
    INVENTORY_FULL = {
        ["frFR"] = "Inventaire plein ! Impossible de créer des cages.",
        ["deDE"] = "Inventar voll! Käfige können nicht erstellt werden.",
        ["enUS"] = "Inventory full! Cannot create pet cages.",
        ["itIT"] = "Inventario pieno! Impossibile creare gabbie.",
        ["koKR"] = "가방이 가득 찼습니다! 애완동물 우리를 만들 수 없습니다.",
        ["zhCN"] = "背包已满！无法创建宠物笼。",
        ["zhTW"] = "背包已滿！無法創建寵物籠。",
        ["ruRU"] = "Инвентарь полон! Невозможно создать клетки.",
        ["esES"] = "¡Inventario lleno! No se pueden crear jaulas.",
        ["esMX"] = "¡Inventario lleno! No se pueden crear jaulas.",
        ["ptBR"] = "Inventário cheio! Não é possível criar gaiolas."
    },
    
    COMMAND_AVAILABLE = {
        ["frFR"] = "Commandes disponibles :",
        ["deDE"] = "Verfügbare Befehle:",
        ["enUS"] = "Available Commands:",
        ["itIT"] = "Comandi disponibili:",
        ["koKR"] = "사용 가능한 명령어:",
        ["zhCN"] = "可用命令：",
        ["zhTW"] = "可用命令：",
        ["ruRU"] = "Доступные команды:",
        ["esES"] = "Comandos disponibles:",
        ["esMX"] = "Comandos disponibles:",
        ["ptBR"] = "Comandos disponíveis:"
    },
    
    COMMAND_HELP = {
        ["frFR"] = "Liste les commandes disponibles.",
        ["deDE"] = "Listet verfügbare Befehle auf.",
        ["enUS"] = "List available commands.",
        ["itIT"] = "Elenca i comandi disponibili.",
        ["koKR"] = "사용 가능한 명령어를 나열합니다.",
        ["zhCN"] = "列出可用命令。",
        ["zhTW"] = "列出可用命令。",
        ["ruRU"] = "Показывает список доступных команд.",
        ["esES"] = "Lista los comandos disponibles.",
        ["esMX"] = "Lista los comandos disponibles.",
        ["ptBR"] = "Lista os comandos disponíveis."
    },
    
    COMMAND_CAGE = {
        ["frFR"] = "Met en cage tous les familiers en double.",
        ["deDE"] = "Sperrt alle doppelten Haustiere ein.",
        ["enUS"] = "Cage all duplicate pets.",
        ["itIT"] = "Metti in gabbia tutte le mascotte duplicate.",
        ["koKR"] = "모든 중복 애완 동물을 케이지에 넣습니다.",
        ["zhCN"] = "将所有重复宠物关入笼中。",
        ["zhTW"] = "將所有重複寵物關入籠中。",
        ["ruRU"] = "Поместить всех дубликатов питомцев в клетку.",
        ["esES"] = "Poner todas las mascotas duplicadas en jaula.",
        ["esMX"] = "Poner todas las mascotas duplicadas en jaula.",
        ["ptBR"] = "Colocar todos os animais de estimação duplicados em gaiola."
    },
    
    COMMAND_TOGGLE = {
        ["frFR"] = "Active/désactive la mise en cage automatique.",
        ["deDE"] = "Schaltet die automatische Einsperrfunktion um.",
        ["enUS"] = "Toggle auto-caging functionality.",
        ["itIT"] = "Attiva/disattiva la funzione di messa in gabbia automatica.",
        ["koKR"] = "자동 케이지 기능을 켜거나 끕니다.",
        ["zhCN"] = "切换自动关笼功能。",
        ["zhTW"] = "切換自動關籠功能。",
        ["ruRU"] = "Переключить функцию автоматического помещения в клетку.",
        ["esES"] = "Alternar la funcionalidad de enjaulado automático.",
        ["esMX"] = "Alternar la funcionalidad de enjaulado automático.",
        ["ptBR"] = "Alternar a funcionalidade de gaiola automática."
    },
}

-- Helper to get localized string
local locale = GetLocale()
local function GetString(table)
    return table[locale] or table["enUS"] or "Unknown"
end

-- ============================================================================
-- Configuration & State
-- ============================================================================
local CONSTANTS = {
    DELAY_CAGE = 0.4,
    DELAY_SCAN = 0.2,
    MAX_LEVEL = 1,
}

local State = {
    isProcessing = false,
    cageQueue = {},
    originalSearch = "",
    hooksInstalled = false,
    db = nil,
}

-- ============================================================================
-- Utility Functions
-- ============================================================================
local function Print(msg, color)
    color = color or "cff69ccf0"
    DEFAULT_CHAT_FRAME:AddMessage("|cffffd200Auto Cage Reborn:|r |" .. color .. msg .. "|r")
end

local function SaveSearch()
    State.originalSearch = C_PetJournal.GetSearchFilter()
end

local function RestoreSearch()
    C_PetJournal.SetSearchFilter(State.originalSearch or "")
end

local function HasFreeBagSpace()
    for bag = 0, 4 do  -- Backpack (0) + 4 bags
        local freeSlots, bagType = C_Container.GetContainerNumFreeSlots(bag)
        -- bagType 0 = normal bag, not profession bag
        if bagType == 0 and freeSlots > 0 then
            return true
        end
    end
    return false
end

-- ============================================================================
-- Core Logic
-- ============================================================================
local function ProcessQueue()
    if #State.cageQueue == 0 then
        if State.isProcessing then
            Print(GetString(L.CAGING_COMPLETE), "cff00ff00")
            State.isProcessing = false
            RestoreSearch()
        end
        return
    end
    
    -- Check bag space before attempting to cage
    if not HasFreeBagSpace() then
        Print(GetString(L.INVENTORY_FULL), "cffff0000")
        State.cageQueue = {}  -- Clear remaining queue
        State.isProcessing = false
        RestoreSearch()
        return
    end
    
    local petID = table.remove(State.cageQueue, 1)
    local speciesID, customName, level, xp, maxXp, displayID, favorite, name = C_PetJournal.GetPetInfoByPetID(petID)
    local isTradeable = select(16, C_PetJournal.GetPetInfoByPetID(petID))
    
    if speciesID then
        if level == CONSTANTS.MAX_LEVEL and not favorite and isTradeable then
            C_PetJournal.CagePetByID(petID)
            Print(name .. " :: " .. GetString(L.CAGED_MESSAGE), "cff00ff00")
            
            C_Timer.After(CONSTANTS.DELAY_CAGE, ProcessQueue)
            return
        end
    end
    
    ProcessQueue()
end

function AutoCageReborn:ScanAndCage(targetSpeciesID)
    if State.isProcessing then return end
    
    if not C_PetJournal.IsJournalUnlocked() then
        Print("Pet Journal is busy. Try again in a moment.", "cffff0000")
        return
    end
    
    if targetSpeciesID then
        targetSpeciesID = tonumber(targetSpeciesID)
    end
    
    SaveSearch()
    
    C_PetJournal.ClearSearchFilter()
    C_PetJournal.SetPetSortParameter(LE_SORT_BY_LEVEL)
    
    local numPets, numOwned = C_PetJournal.GetNumPets()
    local seenSpecies = {}
    State.cageQueue = {}
    State.isProcessing = true
    
    Print(GetString(L.CAGING), "cffffff00")
    
    for i = 1, numOwned do
        local petID, speciesID, owned, customName, level, favorite, isRevoked, speciesName = C_PetJournal.GetPetInfoByIndex(i)
        local isTradeable = select(16, C_PetJournal.GetPetInfoByIndex(i))
        
        if not targetSpeciesID or speciesID == targetSpeciesID then
            if seenSpecies[speciesID] then
                if level == CONSTANTS.MAX_LEVEL and not favorite and isTradeable then
                    table.insert(State.cageQueue, petID)
                end
            else
                seenSpecies[speciesID] = true
            end
        end
    end
    
    if #State.cageQueue > 0 then
        Print(GetString(L.CAGING_PROGRESS):format(#State.cageQueue), "cffffff00")
        ProcessQueue()
    else
        Print(GetString(L.CAGING_NONE_FOUND), "cffff0000")
        State.isProcessing = false
        RestoreSearch()
    end
end

function AutoCageReborn:Toggle()
    State.db.enabled = not State.db.enabled
    local msg = State.db.enabled and L.AUTO_ENABLED or L.AUTO_DISABLED
    Print(GetString(msg), State.db.enabled and "cff00ff00" or "cffff0000")
    
    if _G["AutoCageReborn_CheckButton"] then
        _G["AutoCageReborn_CheckButton"]:SetChecked(State.db.enabled)
    end
end

-- ============================================================================
-- UI Creation
-- ============================================================================
function AutoCageReborn:InitUI()
    if State.hooksInstalled then return end
    
    C_Timer.After(1.0, function()
        if State.hooksInstalled then return end
        
        local isRematch = C_AddOns.IsAddOnLoaded("Rematch")
        local parent = isRematch and (_G["RematchFrame"] or _G["RematchPetPanel"] or PetJournalFrame or PetJournal) or (PetJournalFrame or PetJournal)
        
        -- Create Cage Button
        local btn = CreateFrame("Button", "AutoCageReborn_Button", parent, "UIPanelButtonTemplate")
        btn:SetSize(150, 24)
        btn:SetText(GetString(L.BUTTON_DUPLICATE_PETS))
        btn:Show()
        
        -- Create Checkbox
        local check = CreateFrame("CheckButton", "AutoCageReborn_CheckButton", parent, "UICheckButtonTemplate")
        check:SetChecked(State.db.enabled)
        check:Show()
        
        if isRematch then
            -- Rematch: Create container frame with styling
            local container = CreateFrame("Frame", "AutoCageReborn_Container", parent, "TooltipBackdropTemplate")
            container:SetSize(400, 34)
            container:SetPoint("BOTTOM", parent, "TOP", 0, -2)
            
            -- Reparent button and checkbox to container
            btn:SetParent(container)
            btn:ClearAllPoints()
            btn:SetPoint("LEFT", container, "LEFT", 10, 0)
            
            check:SetParent(container)
            check:ClearAllPoints()
            check:SetPoint("LEFT", btn, "RIGHT", 12, 0)
            
            container:Show()
        else
            -- Regular Pet Journal: No container, position beside Summon button
            btn:SetPoint("LEFT", PetJournalSummonButton, "RIGHT", 6, 0)
            check:SetPoint("LEFT", btn, "RIGHT", 8, 0)
        end
        
        -- Configure checkbox text
        local checkText = _G[check:GetName() .. "Text"]
        checkText:SetText(GetString(L.CHECKBOX_AUTO))
        checkText:SetPoint("LEFT", check, "RIGHT", -2, 0)
        if isRematch then
            checkText:SetWidth(200)
            checkText:SetJustifyH("LEFT")
        end
        
        -- Scripts
        btn:SetScript("OnClick", function() AutoCageReborn:ScanAndCage() end)
        btn:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(GetString(L.BUTTON_DUPLICATE_PETS), 1, 1, 1)
            GameTooltip:AddLine(GetString(L.BUTTON_DUPLICATE_PETS_TOOLTIP), nil, nil, nil, true)
            GameTooltip:Show()
        end)
        btn:SetScript("OnLeave", function() GameTooltip:Hide() end)
        
        check:SetScript("OnClick", function(self)
            State.db.enabled = self:GetChecked()
            local msg = State.db.enabled and L.AUTO_ENABLED or L.AUTO_DISABLED
            Print(GetString(msg), State.db.enabled and "cff00ff00" or "cffff0000")
        end)
        
        check:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(GetString(L.CHECKBOX_AUTO), 1, 1, 1)
            GameTooltip:AddLine(GetString(L.CHECKBOX_AUTO_TOOLTIP), nil, nil, nil, true)
            GameTooltip:Show()
        end)
        check:SetScript("OnLeave", function() GameTooltip:Hide() end)
        
        State.hooksInstalled = true
    end)
end

-- ============================================================================
-- Events & Initialization
-- ============================================================================
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("CHAT_MSG_SYSTEM")

local petCagedPattern = string.gsub(BATTLE_PET_NEW_PET, "%%s", ".*Hbattlepet:(%%d+).*")

f:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local addon = ...
        if addon == ADDON_NAME then
            AutoCageRebornDB = AutoCageRebornDB or {enabled = true}
            State.db = AutoCageRebornDB
            
            Print(GetString(L.LOADED))
            
            if C_AddOns.IsAddOnLoaded("Blizzard_Collections") then
                AutoCageReborn:InitUI()
            end
            
        elseif addon == "Blizzard_Collections" then
            AutoCageReborn:InitUI()
        end
        
    elseif event == "CHAT_MSG_SYSTEM" and State.db.enabled and not State.isProcessing then
        local msg = ...
        
        -- Safety check: ensure msg is a string before using string methods
        if type(msg) ~= "string" then return end
        
        local speciesID = msg:match(petCagedPattern)
        
        if speciesID then
            C_Timer.After(CONSTANTS.DELAY_SCAN, function()
                AutoCageReborn:ScanAndCage(tonumber(speciesID))
            end)
        end
    end
end)

-- ============================================================================
-- Slash Commands
-- ============================================================================
SLASH_AUTOCAGEREBORN1 = "/autocage"
SLASH_AUTOCAGEREBORN2 = "/acr"

SlashCmdList["AUTOCAGEREBORN"] = function(text)
    local cmd = text:lower():trim()
    
    if cmd == "" or cmd == "help" then
        Print(GetString(L.COMMAND_AVAILABLE))
        print("  |cffffff00/autocage cage|r - " .. GetString(L.COMMAND_CAGE))
        print("  |cffffff00/autocage toggle|r - " .. GetString(L.COMMAND_TOGGLE))
        print("  |cffffff00/acr|r (shorthand)")
        
    elseif cmd == "cage" then
        AutoCageReborn:ScanAndCage()
        
    elseif cmd == "toggle" then
        AutoCageReborn:Toggle()
        
    else
        Print("Unknown command. Try: /autocage help")
    end
end