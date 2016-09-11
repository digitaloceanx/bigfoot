
------------------------
--- 2011 -03 -15 Terry@bf
-- 迁移一些UI相关的功能到这里
-- UI的独立控件也会放到这里
------------------------

--框体保存功能
local function roundUpFrameLocations(_id)
	local _val = BF_Frames_Config[_id]
	if _val then
	----------这里修改一个报错。point 为string 如何 floor----------------------
		BF_Frames_Config[_id].point = _val.point
		BF_Frames_Config[_id].refPoint = floor(_val.refPoint)
		BF_Frames_Config[_id].offX = floor(_val.offX)
		BF_Frames_Config[_id].offY = floor(_val.offY)
	end
end

function __BigFoot_Frame_Save(__frame, __id)
	if (__frame and __frame:IsVisible()) then
		BF_Frames_Config[__id]={};
		local point,region,refPoint,x,y = __frame:GetPoint(1)
		if not region or not region:GetName() then
			region = "UIParent"
		else
			region = region:GetName()
		end
		BF_Frames_Config[__id] = {};
		BF_Frames_Config[__id].point = point
		BF_Frames_Config[__id].region = region
		BF_Frames_Config[__id].refPoint = refPoint
		BF_Frames_Config[__id].offX = x
		BF_Frames_Config[__id].offY = y
		roundUpFrameLocations(__id)
	end
end

function __BigFoot_Frame_Load(__frame, __id)
	local point,region,refPoint,x,y
	if (__frame and BF_Frames_Config[__id]) then
		 point 	= BF_Frames_Config[__id].point
		 region	= BF_Frames_Config[__id].region
		 refPoint = BF_Frames_Config[__id].refPoint
		 x		= BF_Frames_Config[__id].offX
		 y		= BF_Frames_Config[__id].offY
		if not __frame:IsProtected() then
			__frame:ClearAllPoints();
			__frame:SetPoint(point, region, refPoint, x,y);
			__frame.__user_placed = true;
		else
			BFSecureCall(__frame.ClearAllPoints,__frame);
			BFSecureCall(__frame.SetPoint,__frame,point, region, refPoint, x,y);

			__frame.__user_placed = true;
		end
	end
end

function __BigFoot_Frame_StopMovingOrSizing(__self)
	if (__self.__originalStopMovingOrSizing) then
		__self.__originalStopMovingOrSizing(__self);
	end
	BigFoot_DelayCall(__BigFoot_Frame_Save, 1, __self, __self.__layout_id);
end

function RegisterForSaveFrame(__frame, __id, __no_load)
	assert(__frame ~= nil, "frame must be assigned.");
	assert(type(__frame) == "table", "RegisterForSaveFrame: the first parameter must be frame object.");

	if (not __id) then
		__id = __frame:GetName();
	end

	assert(__id ~= nil, "The frame has no name, can not be used as default id.");

	__frame.__layout_id = __id;

	if (not __frame.rfsf_hooked) then
		__frame.rfsf_hooked = true;
		__frame.__originalStopMovingOrSizing = __frame.StopMovingOrSizing;
		__frame.StopMovingOrSizing = __BigFoot_Frame_StopMovingOrSizing;
	end

	if (not __no_load) then
		roundUpFrameLocations(_id);
		__BigFoot_Frame_Load(__frame, __id);
	end
end

---鼠标提示功能
function BigFoot_Tooltip_Init()
	local __index = 1;
	while (true) do
		local __TextLeft = getglobal("BigFootTooltipTextLeft"..__index);
		local __TextRight = getglobal("BigFootTooltipTextRight"..__index);

		if (__TextLeft) then
			__TextLeft:SetText("");
		end

		if (__TextRight) then
			__TextRight:SetText("");
		end

		if (not __TextLeft and not __TextRight) then
			break;
		else
			__index = __index + 1;
		end
	end;

	BigFootTooltip:SetOwner(UIParent, "ANCHOR_NONE");
--	BigFootTooltip:SetPoint("TOPLEFT", "UIParent", "BOTTOMRIGHT", 5, -5);
	BigFootTooltip:SetText("BigFootTooltip");
	BigFootTooltip:Show();
end

function BigFoot_Tooltip_GetText(__tooltip, __newlinechar)
	if (not __tooltip) then
		__tooltip = BigFootTooltip;
	end

	if (not __newlinechar) then
		__newlinechar = "<n>";
	end

	local __strDesc = "";

	__tooltip:Show();

	local __index = 1;

	while (true) do
		local __TextLeft = getglobal(__tooltip:GetName().."TextLeft"..__index);
		local __TextRight = getglobal(__tooltip:GetName().."TextRight"..__index);

		local __strLeft;
		local __strRight;

		__strLeft = __TextLeft and __TextLeft:GetText();

		__strRight = __TextRight and __TextRight:GetText();

		local __strFull = "";

		if ( __index == 1 ) then
			if ( __strLeft == nil ) then
				return;
			end

			__strTitle = __strLeft;
		end

		if ( __strLeft == nil and __strRight == nil ) then
			__strFull = "";
		else
			if ( __strLeft == nil ) then
				__strLeft = "";
			end

			if ( __strRight == nil ) then
				__strRight = "";
			end

			if ( __strRight ~= "" ) then
				__strFull = __strLeft.."<t>"..__strRight;
			else
				__strFull = __strLeft;
			end
		end

		if ( __strFull ~= "" ) then
			__strDesc = __strDesc..__strFull..__newlinechar;
		end

		if (not __TextLeft and not __TextRight) then
			break;
		else
			__index = __index + 1;
		end
	end

	return __strDesc;
end

-- 新手提示功能
function BigFoot_ShowNewbieTooltip(__title, ...)
	if not __title then return end
	GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
	GameTooltip:SetText(__title, 1.0, 1.0, 1.0);
	local args = {...};
	local i;
	for i = 1, table.maxn(args), 1 do
		GameTooltip:AddLine(args[i], NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1.0, 1);
	end
	GameTooltip:Show();
end

function BigFoot_HideNewbieTooltip()
	GameTooltip:Hide();
end

--[[
local Artifact_Table = {
	["WARRIOR"] = {
		{
			name = "斯多姆卡，灭战者",
			link = "\124cffe5cc80\124Hitem:128910\124h[斯多姆卡，灭战者]\124h\124r",
		},
		{
			name = "瓦拉加尔战剑",
			link = "\124cffe5cc80\124Hitem:128908\124h[瓦拉加尔战剑]\124h\124r",
		},
		{
			name = "大地守护者之鳞",
			link = "\124cffe5cc80\124Hitem:128289\124h[大地守护者之鳞]\124h\124r",
		},
	},
	["PALADIN"] = {
		{
			name = "白银之手",
			link = "\124cffe5cc80\124Hitem:128823\124h[白银之手]\124h\124r",
		},
		{
			name = "真理守护者",
			link = "\124cffe5cc80\124Hitem:128866\124h[真理守护者]\124h\124r",
		},
		{
			name = "灰烬使者",
			link = "\124cffe5cc80\124Hitem:120978\124h[灰烬使者]\124h\124r",
		},
	},
	["DEATHKNIGHT"] = {
		{
			name = "诅咒之喉",
			link = "\124cffe5cc80\124Hitem:128402\124h[诅咒之喉]\124h\124r",
		},
		{
			name = "堕落王子之剑",
			link = "\124cffe5cc80\124Hitem:128292\124h[堕落王子之剑]\124h\124r",
		},
		{
			name = "天启",
			link = "\124cffe5cc80\124Hitem:128403\124h[天启]\124h\124r",
		},
	},
	["HUNTER"] = {
		{
			name = "泰坦之击",
			link = "\124cffe5cc80\124Hitem:128861\124h[泰坦之击]\124h\124r",
		},
		{
			name = "雄鹰之爪",
			link = "\124cffe5cc80\124Hitem:128808\124h[雄鹰之爪]\124h\124r",
		},
		{
			name = "萨斯多拉，风行者的遗产",
			link = "\124cffe5cc80\124Hitem:128826\124h[萨斯多拉，风行者的遗产]\124h\124r",
		},
	},
	["SHAMAN"] = {
		{
			name = "莱登之拳",
			link = "\124cffe5cc80\124Hitem:128935\124h[莱登之拳]\124h\124r",
		},
		{
			name = "毁灭之锤",
			link = "\124cffe5cc80\124Hitem:128819\124h[毁灭之锤]\124h\124r",
		},
		{
			name = "莎拉达尔，潮汐权杖",
			link = "\124cffe5cc80\124Hitem:128911\124h[莎拉达尔，潮汐权杖]\124h\124r",
		},
	},
	["ROGUE"] = {
		{
			name = "弑君者",
			link = "\124cffe5cc80\124Hitem:128870\124h[弑君者]\124h\124r",
		},
		{
			name = "恐惧之刃",
			link = "\124cffe5cc80\124Hitem:128872\124h[恐惧之刃]\124h\124r",
		},
		{
			name = "吞噬者之牙",
			link = "\124cffe5cc80\124Hitem:128476\124h[吞噬者之牙]\124h\124r",
		},
	},
	["DRUID"] = {
		{
			name = "月神镰刀",
			link = "\124cffe5cc80\124Hitem:128858\124h[月神镰刀]\124h\124r",
		},
		{
			name = "阿莎曼之牙",
			link = "\124cffe5cc80\124Hitem:128860\124h[阿莎曼之牙]\124h\124r",
		},
		{
			name = "乌索克之爪",
			link = "\124cffe5cc80\124Hitem:128821\124h[乌索克之爪]\124h\124r",
		},
		{
			name = "加尼尔，母亲之树",
			link = "\124cffe5cc80\124Hitem:128306\124h[加尼尔，母亲之树]\124h\124r",
		},
	},
	["MONK"] = {
		{
			name = "福枬，云游者之友",
			link = "\124cffe5cc80\124Hitem:128938\124h[福枬，云游者之友]\124h\124r",
		},
		{
			name = "神龙，迷雾之杖",
			link = "\124cffe5cc80\124Hitem:128937\124h[神龙，迷雾之杖]\124h\124r",
		},
		{
			name = "诸天之拳",
			link = "\124cffe5cc80\124Hitem:128940\124h[诸天之拳]\124h\124r",
		},
	},
	["DEMONHUNTER"] = {
		{
			name = "欺诈者的双刃",
			link = "\124cffe5cc80\124Hitem:127829\124h[欺诈者的双刃]\124h\124r",
		},
		{
			name = "奥达奇战刃",
			link = "\124cffe5cc80\124Hitem:128832\124h[奥达奇战刃]\124h\124r",
		},
	},
	["MAGE"] = {
		{
			name = "艾露尼斯",
			link = "\124cffe5cc80\124Hitem:127857\124h[艾露尼斯]\124h\124r",
		},
		{
			name = "烈焰之击",
			link = "\124cffe5cc80\124Hitem:128820\124h[烈焰之击]\124h\124r",
		},
		{
			name = "黑檀之寒",
			link = "\124cffe5cc80\124Hitem:128862\124h[黑檀之寒]\124h\124r",
		},
	},
	["PRIEST"] = {
		{
			name = "圣光之怒",
			link = "\124cffe5cc80\124Hitem:128868\124h[圣光之怒]\124h\124r",
		},
		{
			name = "图雷，纳鲁道标",
			link = "\124cffe5cc80\124Hitem:128825\124h[图雷，纳鲁道标]\124h\124r",
		},
		{
			name = "萨拉塔斯，黑暗帝国之刃",
			link = "\124cffe5cc80\124Hitem:128827\124h[萨拉塔斯，黑暗帝国之刃]\124h\124r",
		},
	},
	["WARLOCK"] = {
		{
			name = "乌萨勒斯，逆风收割者",
			link = "\124cffe5cc80\124Hitem:128942\124h[乌萨勒斯，逆风收割者]\124h\124r",
		},
		{
			name = "堕落者之颅",
			link = "\124cffe5cc80\124Hitem:128943\124h[堕落者之颅]\124h\124r",
		},
		{
			name = "萨格拉斯权杖",
			link = "\124cffe5cc80\124Hitem:128941\124h[萨格拉斯权杖]\124h\124r",
		},
	},
}

local function bf_OnMenuLoad(self,list,func)
	UIMenu_Initialize(self);
	self.parentMenu = "Bigfoot_Artifact";
	self.At = list;
	for _, t in pairs(list) do
		UIMenu_AddButton(self, t.name, nil, func);
	end
	UIMenu_AutoSize(self);
end

local function Artifact_bShow(self)
	local id = self:GetID();
	local parent = self:GetParent();
	DEFAULT_CHAT_FRAME:AddMessage(parent.At[id].link);
end

local f = CreateFrame("Button","Bigfoot_Artifact",UIParent);
f:SetHeight(32)
f:SetWidth(32)
f:SetPoint("BOTTOM","ChatFrameMenuButton","TOP",0,0);
local fontString = f:CreateFontString("Bigfoot_ArtifactText", "ARTWORK", "GameFontNormal");
fontString:SetPoint("CENTER");
Bigfoot_ArtifactText:SetText("神");
f:SetNormalTexture("Interface\\AddOns\\BigFootChat\\icon\\text_nor_frame");
f:SetPushedTexture("Interface\\AddOns\\BigFootChat\\icon\\text_push_frame");
f:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight");
f:SetScript("OnClick", function()
	if Bigfoot_ArtifactBox:IsShown() then
		Bigfoot_ArtifactBox:Hide();
		ModelChangeVariable.AfNotFirstUse = true;
	end
	if Bigfoot_ArtifactMenu:IsShown() then
		Bigfoot_ArtifactMenu:Hide()
	else
		Bigfoot_ArtifactMenu:Show()
	end
end)

function Bigfoot_ArtifactMenu_OnLoad(self)
	self.chatFrame = DEFAULT_CHAT_FRAME;
	UIMenu_Initialize(self);
	UIMenu_AddButton(self, "战士", nil, nil, "WARRIORMenu");
	UIMenu_AddButton(self, "圣骑士", nil, nil, "PALADINMenu");
	UIMenu_AddButton(self, "死亡骑士", nil, nil, "DEATHKNIGHTMenu");
	UIMenu_AddButton(self, "猎人", nil, nil, "HUNTERMenu");
	UIMenu_AddButton(self, "萨满祭司", nil, nil, "SHAMANMenu");
	UIMenu_AddButton(self, "潜行者", nil, nil, "ROGUEMenu");
	UIMenu_AddButton(self, "德鲁伊", nil, nil, "DRUIDMenu");
	UIMenu_AddButton(self, "武僧", nil, nil, "MONKMenu");
	UIMenu_AddButton(self, "恶魔猎手", nil, nil, "DEMONHUNTERMenu");
	UIMenu_AddButton(self, "法师", nil, nil, "MAGEMenu");
	UIMenu_AddButton(self, "牧师", nil, nil, "PRIESTMenu");
	UIMenu_AddButton(self, "术士", nil, nil, "WARLOCKMenu");
	UIMenu_AutoSize(self);
end

function Bigfoot_ArtifactMenu_Show(self)
	if not ModelChangeVariable.AfNotFirstUse then
		Bigfoot_ArtifactBox:ClearAllPoints();
		Bigfoot_ArtifactBox:SetPoint("LEFT", Bigfoot_Artifact, "RIGHT", 0, 0);
		Bigfoot_ArtifactBox.Text:SetText("神器预览");
		Bigfoot_ArtifactBox:Show();
	end
	UIMenu_OnShow(self);
	self:SetBackdropBorderColor(TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b);
	self:SetBackdropColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r, TOOLTIP_DEFAULT_BACKGROUND_COLOR.g, TOOLTIP_DEFAULT_BACKGROUND_COLOR.b);
end

function WARRIORMenu_OnLoad(self)
	bf_OnMenuLoad(self, Artifact_Table["WARRIOR"], Artifact_bShow);
end

function PALADINMenu_OnLoad(self)
	bf_OnMenuLoad(self, Artifact_Table["PALADIN"], Artifact_bShow);
end

function DEATHKNIGHTMenu_OnLoad(self)
	bf_OnMenuLoad(self, Artifact_Table["DEATHKNIGHT"], Artifact_bShow);
end

function HUNTERMenu_OnLoad(self)
	bf_OnMenuLoad(self, Artifact_Table["HUNTER"], Artifact_bShow);
end

function SHAMANMenu_OnLoad(self)
	bf_OnMenuLoad(self, Artifact_Table["SHAMAN"], Artifact_bShow);
end

function ROGUEMenu_OnLoad(self)
	bf_OnMenuLoad(self, Artifact_Table["ROGUE"], Artifact_bShow);
end

function DRUIDMenu_OnLoad(self)
	bf_OnMenuLoad(self, Artifact_Table["DRUID"], Artifact_bShow);
end

function MONKMenu_OnLoad(self)
	bf_OnMenuLoad(self, Artifact_Table["MONK"], Artifact_bShow);
end

function DEMONHUNTERMenu_OnLoad(self)
	bf_OnMenuLoad(self, Artifact_Table["DEMONHUNTER"], Artifact_bShow);
end

function MAGEMenu_OnLoad(self)
	bf_OnMenuLoad(self, Artifact_Table["MAGE"], Artifact_bShow);
end

function PRIESTMenu_OnLoad(self)
	bf_OnMenuLoad(self, Artifact_Table["PRIEST"], Artifact_bShow);
end

function WARLOCKMenu_OnLoad(self)
	bf_OnMenuLoad(self, Artifact_Table["WARLOCK"], Artifact_bShow);
end
]]

--[[ 无调用

--URL框体功能
function BigFoot_LaunchURL(__title, __url)
	BigFootURLFrameTitle:SetText("|cffffd100"..__title.."|r");
	BigFootURLFrameText:SetText(BF_URL_TEXT);

	-- Revise url to url encoding
	local __new_url = "";
	local __code;
	for __i = 1, string.len(__url), 1 do
		__code = string.byte(__url, __i);
		if (__code >= 128) then
			__new_url = __new_url .. string.format("%%%02X", __code);
		else
			__new_url = __new_url .. string.sub(__url, __i, __i);
		end
	end

	BigFootURLFrameURL.url = "bfurl:"..__new_url;

	BigFootURLFrameURL:SetText(BigFootURLFrameURL.url);

	BigFootURLFrame:Show();
end

--字体颜色
function BigFoot_SetTextColor(fontInstance, r, g, b, a)
	local __text = fontInstance:GetText();
	fontInstance:SetText(__text, r, g, b, a);
end

]]
