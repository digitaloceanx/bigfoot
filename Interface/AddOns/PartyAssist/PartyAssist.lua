 if (GetLocale() == "zhCN") then PartyAssist_011fb68e29e4ccdb7706ef78f5861e16 = "等级"; PartyAssist_2cb48be34143ff9b1e5d185931d238b7 = "左键施放法术，Shift+左键删除该法术"; PartyAssist_308249f8b8e45df7de8c520a81bc7625 = "设置法术"; PartyAssist_0de3d9f16559ad071d7e38e53ad54448 = "将魔法书中的法术拖进来以设置法术。"; elseif (GetLocale() == "zhTW") then PartyAssist_011fb68e29e4ccdb7706ef78f5861e16 = "等級"; PartyAssist_2cb48be34143ff9b1e5d185931d238b7 = "左鍵施放法術，Shift+左鍵刪除該法術"; PartyAssist_308249f8b8e45df7de8c520a81bc7625 = "設置法術"; PartyAssist_0de3d9f16559ad071d7e38e53ad54448 = "將魔法書中的法術拖進來以設置法術。"; else PartyAssist_011fb68e29e4ccdb7706ef78f5861e16 = "Rank"; PartyAssist_2cb48be34143ff9b1e5d185931d238b7 = "Left click to cast spell, Shift + Left click to delete spell"; PartyAssist_308249f8b8e45df7de8c520a81bc7625 = "Set Spell"; PartyAssist_0de3d9f16559ad071d7e38e53ad54448 = "Drag spell button into box to set spell."; end PartyAssist_Config = {}; PartyAssist_4b80a8a7aafdd3b7c9fc9ae1e52cba69 = nil; local PartyAssist_b81f56c91e636b15033b364847d7e3fb = true; PARTY_ASSIST_OPTION_8_BUTTONS = nil; local GetSpellInfo = GetSpellInfo local PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f, PartyAssist_5e57ab95c762a48d9a126b104db1056f; function PartyAssist_OnUpdate(self, elapsed) if (not PartyAssist_4b80a8a7aafdd3b7c9fc9ae1e52cba69) then return; end self.time = self.time + elapsed; if (self.time < 1.0) then return; end self.time = 0; for PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f = 1, 4, 1 do if (PartyAssist_Config[PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f]) then local PartyAssist_edd43bdd55f7f9b04be33af2ee290290, PartyAssist_017695fc1e40ede29ae92abfaf6b9ac9 = IsUsableSpell(PartyAssist_Config[PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f].real_spell); for PartyAssist_5e57ab95c762a48d9a126b104db1056f = 1, 4, 1 do local PartyAssist_fd724fd3c5e25aaf3b4226e1dae5257c = "party"..PartyAssist_5e57ab95c762a48d9a126b104db1056f; local PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 = getglobal("PartyAssistFrame"..PartyAssist_5e57ab95c762a48d9a126b104db1056f.."Button"..PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f); PartyAssist_02b8f630fe789f52b6e3067c3de885bf(PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5, PartyAssist_Config[PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f].real_spell, PartyAssist_fd724fd3c5e25aaf3b4226e1dae5257c, PartyAssist_017695fc1e40ede29ae92abfaf6b9ac9); end end end if (PARTY_ASSIST_OPTION_8_BUTTONS) then for PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f = 5, 8, 1 do if (PartyAssist_Config[PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f]) then local PartyAssist_edd43bdd55f7f9b04be33af2ee290290, PartyAssist_017695fc1e40ede29ae92abfaf6b9ac9 = IsUsableSpell(PartyAssist_Config[PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f].real_spell); for PartyAssist_5e57ab95c762a48d9a126b104db1056f = 1, 4, 1 do local PartyAssist_fd724fd3c5e25aaf3b4226e1dae5257c = "party"..PartyAssist_5e57ab95c762a48d9a126b104db1056f; local PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 = getglobal("PartyAssistFrame"..PartyAssist_5e57ab95c762a48d9a126b104db1056f.."Button"..PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f); PartyAssist_02b8f630fe789f52b6e3067c3de885bf(PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5, PartyAssist_Config[PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f].real_spell, PartyAssist_fd724fd3c5e25aaf3b4226e1dae5257c, PartyAssist_017695fc1e40ede29ae92abfaf6b9ac9); end end end end end function PartyAssist_OnEvent(self, event, addon) if (event == "ADDON_LOADED" and addon == "PartyAssist") then PartyAssist_7eaa53697fcca00bfc4f20e4aabf9514(); end end function PartyAssist_7eaa53697fcca00bfc4f20e4aabf9514() for PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f = 1, 8, 1 do if (PartyAssist_Config[PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f]) then PartyAssist_f9f659f4b707b2afb45fb858950f5d80(PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f, PartyAssist_Config[PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f].spell, PartyAssist_Config[PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f].rank, PartyAssist_Config[PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f].texture); end end end function PartyAssist_02b8f630fe789f52b6e3067c3de885bf(PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5, PartyAssist_b48c6d810781a0aaca7a1daf572bf0a2, PartyAssist_fd724fd3c5e25aaf3b4226e1dae5257c, PartyAssist_6ecedd099915844e11db275b6362ac47) local PartyAssist_51bbc6646cac6748cc62569220600b52 = getglobal(PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetName().."Icon"); local PartyAssist_4db02cbdc8b57dba7280e7d40f274547 = IsSpellInRange(PartyAssist_b48c6d810781a0aaca7a1daf572bf0a2, PartyAssist_fd724fd3c5e25aaf3b4226e1dae5257c); local PartyAssist_1f07aaf496fd15582e110c4b2364dc62 = getglobal(PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetName().."NormalTexture"); if (PartyAssist_6ecedd099915844e11db275b6362ac47) then PartyAssist_51bbc6646cac6748cc62569220600b52:SetVertexColor(0.5, 0.5, 1.0); PartyAssist_1f07aaf496fd15582e110c4b2364dc62:SetVertexColor(0.5, 0.5, 1.0); return; end if (PartyAssist_4db02cbdc8b57dba7280e7d40f274547 == 1) then PartyAssist_51bbc6646cac6748cc62569220600b52:SetVertexColor(1.0, 1.0, 1.0); PartyAssist_1f07aaf496fd15582e110c4b2364dc62:SetVertexColor(1.0, 1.0, 1.0); else PartyAssist_51bbc6646cac6748cc62569220600b52:SetVertexColor(0.4, 0.4, 0.4); PartyAssist_1f07aaf496fd15582e110c4b2364dc62:SetVertexColor(0.4, 0.4, 0.4); end end function PartyAssist_Toggle(PartyAssist_07b125142a704be2dcdaf4d5409539b2) if (PartyAssist_07b125142a704be2dcdaf4d5409539b2) then for i=1, 4 do local frame = getglobal("PartyAssistFrame" .. i); frame:Show(); for j=1, 4 do local button = getglobal("PartyAssistFrame" .. i .."Button" .. j); button:RegisterEvent("ACTIONBAR_SHOWGRID"); button:RegisterEvent("ACTIONBAR_HIDEGRID"); end for j=1, 8 do local button = getglobal("PartyAssistFrame" .. i .."Button" .. j); button:GetNormalTexture():SetAlpha(0.7); button:SetBackdropColor(0, 0, 0, 0.1); end end PartyAssist_4b80a8a7aafdd3b7c9fc9ae1e52cba69 = true; PartyAssist_Toggle8Buttons(nil); else for i=1, 4 do local frame = getglobal("PartyAssistFrame" .. i); frame:Show(); for j=1, 4 do local button = getglobal("PartyAssistFrame" .. i .."Button" .. j); button:UnregisterEvent("ACTIONBAR_SHOWGRID"); button:UnregisterEvent("ACTIONBAR_HIDEGRID"); end end PartyAssistFrame1:Hide(); PartyAssistFrame2:Hide(); PartyAssistFrame3:Hide(); PartyAssistFrame4:Hide(); for PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f = 1, 4, 1 do local PartyAssist_411b8aa6d5954c6020f0b9c9e80e847a = getglobal("PartyMemberFrame"..PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f); PartyAssist_411b8aa6d5954c6020f0b9c9e80e847a:UnregisterAnchorFrame(getglobal("PartyAssistFrame"..PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f)); end PartyAssist_4b80a8a7aafdd3b7c9fc9ae1e52cba69 = nil; end end function PartyAssist_ToggleTipMod(switch) PartyAssist_b81f56c91e636b15033b364847d7e3fb = switch and true or false; end function PartyAssist_Toggle8Buttons(PartyAssist_07b125142a704be2dcdaf4d5409539b2) if (PartyAssist_4b80a8a7aafdd3b7c9fc9ae1e52cba69) then if (PartyAssist_07b125142a704be2dcdaf4d5409539b2) then PARTY_ASSIST_OPTION_8_BUTTONS = true; for PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f = 1, 4, 1 do local PartyAssist_411b8aa6d5954c6020f0b9c9e80e847a = getglobal("PartyMemberFrame"..PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f); for PartyAssist_5e57ab95c762a48d9a126b104db1056f = 5, 8, 1 do local button = getglobal("PartyAssistFrame"..PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f.."Button"..PartyAssist_5e57ab95c762a48d9a126b104db1056f); button:Show(); button:RegisterEvent("ACTIONBAR_SHOWGRID"); button:RegisterEvent("ACTIONBAR_HIDEGRID"); end PartyAssist_411b8aa6d5954c6020f0b9c9e80e847a:RegisterAnchorFrame(getglobal("PartyAssistFrame"..PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f), 5, "LEFT", "RIGHT", -6, 15, 80); end else PARTY_ASSIST_OPTION_8_BUTTONS = nil; for PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f = 1, 4, 1 do local PartyAssist_411b8aa6d5954c6020f0b9c9e80e847a = getglobal("PartyMemberFrame"..PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f); for PartyAssist_5e57ab95c762a48d9a126b104db1056f = 5, 8, 1 do local button = getglobal("PartyAssistFrame"..PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f.."Button"..PartyAssist_5e57ab95c762a48d9a126b104db1056f); button:Hide(); button:UnregisterEvent("ACTIONBAR_SHOWGRID"); button:UnregisterEvent("ACTIONBAR_HIDEGRID"); end PartyAssist_411b8aa6d5954c6020f0b9c9e80e847a:RegisterAnchorFrame(getglobal("PartyAssistFrame"..PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f), 5, "LEFT", "RIGHT", -6, 5, 80); end end end end function PartyAssist_87ffd232a48a80f103b6e8c87a4d5f39(PartyAssist_07b125142a704be2dcdaf4d5409539b2) for PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f = 1, 4, 1 do local PartyAssist_fee0919976d3745a5b3f540b4fb67f47 = getglobal("PartyMemberFrame"..PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f.."Debuff1"); local PartyAssist_da22fbaf99a4688b55eed20aa9110588 = getglobal("PartyAssistFrame"..PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f.."Button1"); if (PartyAssist_07b125142a704be2dcdaf4d5409539b2) then PartyAssist_fee0919976d3745a5b3f540b4fb67f47:ClearAllPoints(); PartyAssist_fee0919976d3745a5b3f540b4fb67f47:SetPoint("TOPLEFT", PartyAssist_da22fbaf99a4688b55eed20aa9110588, "BOTTOMLEFT", 0, -5); else PartyAssist_fee0919976d3745a5b3f540b4fb67f47:ClearAllPoints(); PartyAssist_fee0919976d3745a5b3f540b4fb67f47:SetPoint("LEFT", PartyMemberFrame1, "RIGHT", -5, 5); end end end function PartyAssist_f9f659f4b707b2afb45fb858950f5d80(PartyAssist_8d0febf2348ea712b2b375ae95601d5f, PartyAssist_b48c6d810781a0aaca7a1daf572bf0a2, PartyAssist_776cc2335c5e051bd62524696424f056, PartyAssist_9248008bbb6d0ee7ce13f6ee45680051, PartyAssist_18a3b3485c281e43046f44d7467006f0) if (InCombatLockdown()) then return; end local PartyAssist_0ea0abe13259669fd5dbe8bbb9aba3a7; if (PartyAssist_776cc2335c5e051bd62524696424f056) then PartyAssist_0ea0abe13259669fd5dbe8bbb9aba3a7 = PartyAssist_b48c6d810781a0aaca7a1daf572bf0a2 .. "(" .. PartyAssist_776cc2335c5e051bd62524696424f056 .. ")"; else PartyAssist_0ea0abe13259669fd5dbe8bbb9aba3a7 = PartyAssist_b48c6d810781a0aaca7a1daf572bf0a2; end for PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f = 1, 4, 1 do local PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 = getglobal("PartyAssistFrame"..PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f.."Button"..PartyAssist_8d0febf2348ea712b2b375ae95601d5f); if (PartyAssist_b48c6d810781a0aaca7a1daf572bf0a2) then PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:SetAttribute("type", "spell"); PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:SetAttribute("spell", PartyAssist_0ea0abe13259669fd5dbe8bbb9aba3a7); getglobal(PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetName().."Icon"):SetTexture(PartyAssist_9248008bbb6d0ee7ce13f6ee45680051); getglobal(PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetName().."Icon"):Show(); PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:SetAttribute("unit", "party"..PartyAssist_e914904fab9d05d3f54d52bfc31a0f3f); PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.PartyAssist_b48c6d810781a0aaca7a1daf572bf0a2 = PartyAssist_b48c6d810781a0aaca7a1daf572bf0a2; PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.PartyAssist_776cc2335c5e051bd62524696424f056 = PartyAssist_776cc2335c5e051bd62524696424f056; PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.PartyAssist_0ea0abe13259669fd5dbe8bbb9aba3a7 = PartyAssist_0ea0abe13259669fd5dbe8bbb9aba3a7; else PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:SetAttribute("type", ""); PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:SetAttribute("spell", ""); PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:SetAttribute("unit", ""); getglobal(PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetName().."Icon"):Hide(); PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.PartyAssist_b48c6d810781a0aaca7a1daf572bf0a2 = nil; PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.PartyAssist_776cc2335c5e051bd62524696424f056 = nil; PartyAssist_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.PartyAssist_0ea0abe13259669fd5dbe8bbb9aba3a7 = nil; end end if (PartyAssist_18a3b3485c281e43046f44d7467006f0) then if (not PartyAssist_Config[PartyAssist_8d0febf2348ea712b2b375ae95601d5f]) then PartyAssist_Config[PartyAssist_8d0febf2348ea712b2b375ae95601d5f] = {}; end if (PartyAssist_b48c6d810781a0aaca7a1daf572bf0a2) then PartyAssist_Config[PartyAssist_8d0febf2348ea712b2b375ae95601d5f]["real_spell"] = PartyAssist_0ea0abe13259669fd5dbe8bbb9aba3a7; PartyAssist_Config[PartyAssist_8d0febf2348ea712b2b375ae95601d5f]["spell"] = PartyAssist_b48c6d810781a0aaca7a1daf572bf0a2; PartyAssist_Config[PartyAssist_8d0febf2348ea712b2b375ae95601d5f]["rank"] = PartyAssist_776cc2335c5e051bd62524696424f056; PartyAssist_Config[PartyAssist_8d0febf2348ea712b2b375ae95601d5f]["texture"] = PartyAssist_9248008bbb6d0ee7ce13f6ee45680051; else PartyAssist_Config[PartyAssist_8d0febf2348ea712b2b375ae95601d5f] = nil; end end end function PartyAssistButton_OnEnter(self) if (self.PartyAssist_b48c6d810781a0aaca7a1daf572bf0a2) then local PartyAssist_8983c60d66c8593ec7165ea9dbedb584, PartyAssist_776cc2335c5e051bd62524696424f056,_,_,_,_,PartyAssist_8d0febf2348ea712b2b375ae95601d5f = GetSpellInfo(self.PartyAssist_b48c6d810781a0aaca7a1daf572bf0a2, self.PartyAssist_776cc2335c5e051bd62524696424f056); local PartyAssist_caa997efdeb36851b2f828f934939927 = self.PartyAssist_776cc2335c5e051bd62524696424f056 and self.PartyAssist_b48c6d810781a0aaca7a1daf572bf0a2 .. " (" .. self.PartyAssist_776cc2335c5e051bd62524696424f056 .. ")" or self.PartyAssist_b48c6d810781a0aaca7a1daf572bf0a2; if (PartyAssist_8d0febf2348ea712b2b375ae95601d5f) then GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT"); if (PartyAssist_b81f56c91e636b15033b364847d7e3fb) then GameTooltip:SetText(PartyAssist_caa997efdeb36851b2f828f934939927); else GameTooltip:SetSpellByID(PartyAssist_8d0febf2348ea712b2b375ae95601d5f); end GameTooltip:AddLine(PartyAssist_2cb48be34143ff9b1e5d185931d238b7, 0.8, 0.8, 0.8); GameTooltip:Show(); end else GameTooltip_SetDefaultAnchor(GameTooltip, self); GameTooltip:ClearLines(); GameTooltip:SetText(PartyAssist_308249f8b8e45df7de8c520a81bc7625, 1.0, 1.0, 1.0); GameTooltip:AddLine(PartyAssist_0de3d9f16559ad071d7e38e53ad54448, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b); GameTooltip:Show(); end PartyAssist_OnEvent("ACTIONBAR_SHOWGRID"); end function PartyAssistButton_OnLeave(self) GameTooltip:Hide(); PartyAssist_OnEvent("ACTIONBAR_HIDEGRID"); end function PartyAssistButton_OnPreClick(self, button) if (IsShiftKeyDown()) then PartyAssist_f9f659f4b707b2afb45fb858950f5d80(self:GetID(), nil, nil, nil, true); else local PartyAssist_6d5e7d83d8358745ae4dcf61d16bd1f3, PartyAssist_d0503eaa1a9225f07a76fbdfc5bb3a5b = GetCursorInfo(); if (PartyAssist_6d5e7d83d8358745ae4dcf61d16bd1f3 == "spell") then local PartyAssist_caa997efdeb36851b2f828f934939927, PartyAssist_e8c95b8860b5a5703f316c063d64ccae,PartyAssist_9248008bbb6d0ee7ce13f6ee45680051 = GetSpellInfo(PartyAssist_d0503eaa1a9225f07a76fbdfc5bb3a5b, BOOKTYPE_SPELL); local PartyAssist_776cc2335c5e051bd62524696424f056; if (PartyAssist_e8c95b8860b5a5703f316c063d64ccae and string.find(PartyAssist_e8c95b8860b5a5703f316c063d64ccae, PartyAssist_011fb68e29e4ccdb7706ef78f5861e16)) then PartyAssist_776cc2335c5e051bd62524696424f056 = PartyAssist_e8c95b8860b5a5703f316c063d64ccae; end PartyAssist_f9f659f4b707b2afb45fb858950f5d80(self:GetID(), PartyAssist_caa997efdeb36851b2f828f934939927, PartyAssist_776cc2335c5e051bd62524696424f056, PartyAssist_9248008bbb6d0ee7ce13f6ee45680051, true); end end end function PartyAssistButton_OnEvent(self, event, ...) if (event == "ACTIONBAR_SHOWGRID") then self:GetNormalTexture():SetAlpha(1.0); self:SetBackdropColor(0, 0, 0, 0.5); elseif (event == "ACTIONBAR_HIDEGRID") then if (not self:GetAttribute("spell") or self:GetAttribute("spell") == "") then self:GetNormalTexture():SetAlpha(0.7); self:SetBackdropColor(0, 0, 0, 0.1); end end end function PartyAssistButton_OnLoad(self) PartyAssist_OnEvent("ACTIONBAR_HIDEGRID"); end 
