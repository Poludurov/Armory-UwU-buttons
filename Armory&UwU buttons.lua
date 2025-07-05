local function ShowLinkPopup(url)
    StaticPopup_Show("VIEW_ARMORY_LINK", nil, nil, {url = url})
    print(url)
end

StaticPopupDialogs["VIEW_ARMORY_LINK"] = {
    text = "CTRL+C to copy the link",
    button1 = "Close",
    hasEditBox = true,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
    OnShow = function(self, data)
        self.editBox:SetText(data.url)
        self.editBox:HighlightText()
        self.editBox:SetFocus()
    end
}

hooksecurefunc("UnitPopup_ShowMenu", function(dropdownMenu, which)
    if UIDROPDOWNMENU_MENU_LEVEL > 1 or which == "TARGET" or which == "OTHERPET" then return end
    local name = dropdownMenu.name
    local realm = GetRealmName()
    local info = UIDropDownMenu_CreateInfo()
    info.notCheckable = true
    info.text = "Armory"
    info.colorCode = "|caaf49141"
    info.func = function() 
        ShowLinkPopup(("https://armory.warmane.com/character/%s/%s/"):format(name, realm)) 
    end
    UIDropDownMenu_AddButton(info)
    info.text = "UwU Logs"
    info.colorCode = "|cff1affa5"
    info.func = function() 
        ShowLinkPopup(("https://uwu-logs.xyz/character?name=%s&server=%s"):format(name, realm)) 
    end
    UIDropDownMenu_AddButton(info)
end)