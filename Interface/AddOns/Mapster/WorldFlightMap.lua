
if IsAddOnLoaded('WorldFlightMap') then return; end		--bf@178.com

local WORLDFLIGHTMAP_OPEN_CONFIRM, WORLDFLIGHTMAP_CLOSE_CONFIRM;

local TaxiButtons = {}
local lines = {}

if ( GetLocale() == "zhCN" ) then
	WORLDFLIGHTMAP_OPEN_CONFIRM = "世界地图飞行点模式已开启\n请重新与NPC对话"
	WORLDFLIGHTMAP_CLOSE_CONFIRM = "世界地图飞行点模式已关闭\n请重新与NPC对话"
elseif ( GetLocale() == "zhTW" ) then
	WORLDFLIGHTMAP_OPEN_CONFIRM = "世界地圖飛行點模式已開啟\n請重新與NPC對話"
	WORLDFLIGHTMAP_CLOSE_CONFIRM = "世界地圖飛行點模式已關閉\n請重新與NPC對話"
else
	WORLDFLIGHTMAP_OPEN_CONFIRM = "World Flight Map is avaluable\nPlease re-contact the NPC"
	WORLDFLIGHTMAP_CLOSE_CONFIRM = "World Flight Map is disabled\nPlease re-contact the NPC"
end

StaticPopupDialogs["CLOSE_TAXI_FRAME"] = {
	text = WORLDFLIGHTMAP_OPEN_CONFIRM,
	button1 = TEXT(OKAY),
	OnAccept = function(self)
		WorldFlightMapSwitch_TaxiFrame:Enable();
		HideUIPanel(TaxiFrame);
	end
};

StaticPopupDialogs["CLOSE_WORLDMAP_FRAME1"] = {
	text = WORLDFLIGHTMAP_CLOSE_CONFIRM,
	button1 = TEXT(OKAY),
	OnAccept = function(self)
		WorldFlightMapSwitch_WorldMapFrame:Enable();
		HideUIPanel(WorldMapFrame);
		for i,v in pairs(TaxiButtons) do
			v:Hide();
		end
		for i,v in pairs(lines) do
			v:Hide();
		end
	end
};

StaticPopupDialogs["CLOSE_WORLDMAP_FRAME2"] = {
	text = WORLDFLIGHTMAP_OPEN_CONFIRM,
	button1 = TEXT(OKAY),
	OnAccept = function(self)
		WorldFlightMapSwitch_WorldMapFrame:Enable();
		HideUIPanel(WorldMapFrame);
		for i,v in pairs(TaxiButtons) do
			v:Hide();
		end
		for i,v in pairs(lines) do
			v:Hide();
		end
	end
};

local function WFM_Check(val, switch)
	if val == 1 then
		BigFoot_SetModVariable("MapToolkit", "MapWordFlight", 1);
		switch:SetChecked(true);
		BFWorldFlightMap_Toggle(true);
	else
		BigFoot_SetModVariable("MapToolkit", "MapWordFlight", 0);
		switch:SetChecked(false);
		BFWorldFlightMap_Toggle(false);
	end
	ModManagement_Refresh();
end

--地图上的开关定义
CreateFrame("CheckButton", "WorldFlightMapSwitch_TaxiFrame", TaxiRouteMap, "UICheckButtonTemplate");	--TaxiFrame里的CheckButton
WorldFlightMapSwitch_TaxiFrame:SetToplevel(true);
WorldFlightMapSwitch_TaxiFrame:SetWidth(22);
WorldFlightMapSwitch_TaxiFrame:SetHeight(22);
WorldFlightMapSwitch_TaxiFrameText:SetText("开启世界地图飞行点");
WorldFlightMapSwitch_TaxiFrame:SetPoint("RIGHT", TaxiRouteMap, "TOPRIGHT", -150, -15);
WorldFlightMapSwitch_TaxiFrame:SetScript("OnClick", function(this, button)
	local value = BigFoot_GetModVariable("MapToolkit", "MapWordFlight")
	if (value == 1) then
		WFM_Check(0,WorldFlightMapSwitch_TaxiFrame);
	else
		WFM_Check(1,WorldFlightMapSwitch_TaxiFrame);
	end
	WorldFlightMapSwitch_TaxiFrame:Disable();
	StaticPopup_Show("CLOSE_TAXI_FRAME");
end);

CreateFrame("CheckButton", "WorldFlightMapSwitch_WorldMapFrame", WorldMapDetailFrame, "UICheckButtonTemplate");	--WorldMapFrame里的CheckButton
WorldFlightMapSwitch_WorldMapFrame:SetWidth(25);
WorldFlightMapSwitch_WorldMapFrame:SetHeight(25);
WorldFlightMapSwitch_WorldMapFrameText:SetText("世界地图飞行点");
WorldFlightMapSwitch_WorldMapFrame:SetPoint("TOP", WorldMapDetailFrame, "TOP", 0, 0);
WorldFlightMapSwitch_WorldMapFrame:SetFrameLevel(2000);
WorldFlightMapSwitch_WorldMapFrame:SetScript("OnClick", function(this, button)
	local value = BigFoot_GetModVariable("MapToolkit", "MapWordFlight")
	if (value == 1) then
		WFM_Check(0,WorldFlightMapSwitch_TaxiFrame);
		WorldFlightMapSwitch_WorldMapFrame:Disable();
		StaticPopup_Show("CLOSE_WORLDMAP_FRAME1");
	else
		WFM_Check(1,WorldFlightMapSwitch_TaxiFrame);
		WorldFlightMapSwitch_WorldMapFrame:Disable();
		StaticPopup_Show("CLOSE_WORLDMAP_FRAME2");
	end
end);

local FlightmapCoordinates = { -- fairly accurate sizes for the different flight maps, these were calculated using very special maths and things
	[1] = { -- Kalimdor
		left = 10970,
		top = 12470,
		width = 24340,
	},

	[2] = { -- eastern kingdoms
		left = 12270,
		top = 12270,
		width = 28800,
	},

	[3] = { -- outland
		left = 10670,
		top = 6400,
		width = 12270,
	},

	[4] = { -- northrend
		left = 8533,
		top = 11730,
		width = 15466,
	},

	[6] = { -- pandaria
		left = 6770,
		top = 7461,
		width = 11892,
	},

	[7] = { -- Draenor
		left = 10120,
		top = 11630,
		bottom = -4771,
		width = 16396,
	},

	[8] = { -- Broken Isles, none of this makes any sense but let's do it anyway
		left = 6929,
		top = 4800, -- 9061 / 2,
		--right = 2665,
		--bottom = 533,
		width = 8528,
		height = 8528 / 2,
		--left = 13100.0996,
		--right = -5738.08,
		--top = 7262.129,
		--bottom = -5296.6899,
		--width = 18838.1796,
		--height = 12558.8189,
	},
}

--[[
	GetAllTaxiNodes() returns a table with every taxi node on the current continent
	{
		x = 0.5,
		y = 0.5,
		name = "Some Taxi Node",
		nodeID = 123,
		slotIndex = 29,
		type = 3,
	}
--]]

local TAXI_OPEN = false
-- TaxiFrame:UnregisterAllEvents() -- we should probably undo this if we're in an area that isn't supported somehow

local f = CreateFrame('Frame', 'WorldFlightMapFrame', WorldMapButton)
f:SetAllPoints()
f:SetFrameStrata('HIGH')
f:SetFrameLevel(2000)

f:SetScript('OnEvent', function(self, event, ...) return self[event] and self[event](self, ...) end)

local function CreateArrowButton()
	local button = CreateFrame("Button", nil, WorldFlightMapFrame)
	button:SetSize(16, 16)
	local tx = button:CreateTexture(nil, 'OVERLAY')
	tx:SetPoint('CENTER', button, 'CENTER')
	tx:SetSize(32, 32)
	tx:SetTexture('interface/minimap/minimap-deadarrow')
	tx:SetTexCoord(0, 1, 1, 0)
	return button
end

--红色箭头
local redButton = CreateArrowButton();
redButton:SetPoint("RIGHT",WorldFlightMapSwitch_WorldMapFrame,"LEFT",0,0);

local function TaxiNodeOnClick(self)
	TakeTaxiNode(self:GetID())
end

local function CreateLine()
	local line = f:CreateLine(nil, "OVERLAY")
	line:SetVertexColor(0,0.8,1)
	line:SetNonBlocking(true)
	line:SetAtlas('_UI-Taxi-Line-horizontal')
	line:SetThickness(32)
	--line:SetBlendMode('ADD')
	tinsert(lines, line)
	return line
end

local function GetLine()
	for i,line in ipairs(lines) do
		if not line:IsShown() then return line end
	end
	return CreateLine()
end

--local function DrawLine(x1,y1,x2,y2,r,g,b,a)
local function DrawLine(button1, button2, r, g, b, a)
	local line = GetLine()
	--DrawRouteLine(line, "WorldMapButton", x1*1002, -y1*668, x2*1002, -y2*668, 32, 'TOPLEFT')
	--line:SetStartPoint('TOPLEFT', WorldMapButton, x1*1002, -y1*668)
	--line:SetEndPoint('TOPLEFT', WorldMapButton, x2*1002, -y2*668)
	line:SetStartPoint('CENTER', button1)
	line:SetEndPoint('CENTER', button2)
	line:SetVertexColor(r or 1, g or 1, b or 1, a or 1)
	line:Show()
	return line
end


local function GetMapSize()
	local _, left, top, right, bottom = GetCurrentMapZone()
	local floorNum, dright, dbottom, dleft, dtop = GetCurrentMapDungeonLevel()
	if DungeonUsesTerrainMap() then floorNum = floorNum - 1 end
	if floorNum > 0 then left, top, right, bottom = dleft, dtop, dright, dbottom end

	if left and left ~= right then
		local width, height = left - right, top - bottom
		return left, top, right, bottom, width, height, format('%d.%d', GetCurrentMapAreaID(), floorNum)
	end
end

local function GetButtonFromSlot(slot)
	return TaxiButtons[slot]
end

local taxiNodePositions = {}
-- Draw all flightpaths within one hop of current location
local function DrawOneHopLines()
	--local numSingleHops = 0

	--local left, top, right, bottom, width, height = GetMapSize()
	for i = 1, #taxiNodePositions do
		local node = taxiNodePositions[i]

		if GetNumRoutes(i) == 1 and node.type == 'REACHABLE' then -- node.type ~= 'NONE' then
			local button1 = GetButtonFromSlot(TaxiGetNodeSlot(i, 1, true))
			local button2 = GetButtonFromSlot(TaxiGetNodeSlot(i, 1, false))
			DrawLine(button1, button2)
		end
	end
	-- It's possible to fly to a node without knowing intermediate nodes any more
	-- which means if you don't know any flight points you can reach directly, you can still
	-- fly to nodes that are farther out as long as you know them
	--[[
	if ( numSingleHops == 0 ) then
		UIErrorsFrame:AddMessage(ERR_TAXINOPATHS, 1.0, 0.1, 0.1, 1.0)
		CloseTaxiMap()
	end
	--]]
end



local GetButton

local function TaxiNodeOnButtonEnter(button)
	local index = button:GetID()
	WorldMapTooltip:SetOwner(button, "ANCHOR_RIGHT")
	WorldMapTooltip:AddLine(TaxiNodeName(index), nil, nil, nil, true)

	-- Setup variables
	local numRoutes = GetNumRoutes(index)
	local type = TaxiNodeGetType(index)

	if type == 'REACHABLE' or type == 'CURRENT' then
		for i = 1, #lines do
			lines[i]:Hide()
		end

		for slot, button in pairs(TaxiButtons) do -- hide nodes we can't fly to
			if TaxiNodeGetType(slot) == 'DISTANT' then
				button:Hide()
			end
		end

		button:SetHighlightTexture([[Interface\TaxiFrame\UI-Taxi-Icon-Highlight]])
	else
		button:SetHighlightTexture(nil)
	end

	if ( type == "REACHABLE" ) then
		local cost = TaxiNodeCost(button:GetID())
		if cost ~= 0 then
			SetTooltipMoney(WorldMapTooltip, cost)
		end

		for i = 1, numRoutes do
			local slot = TaxiGetNodeSlot(index, i, true)
			local button1 = GetButtonFromSlot(slot)

			if TaxiNodeGetType(slot) == 'DISTANT' then
				button1:Show()
			end

			slot = TaxiGetNodeSlot(index, i, false)
			local button2 = GetButtonFromSlot(slot)
			DrawLine(button1, button2)

			if TaxiNodeGetType(slot) == 'DISTANT' then
				button2:Show()
			end
		end
	elseif ( type == "CURRENT" ) then
		WorldMapTooltip:AddLine(TAXINODEYOUAREHERE, 1.0, 1.0, 1.0, true)
		DrawOneHopLines()
	end

	WorldMapTooltip:Show()
end


local function BounceAnimation(self) -- SetLooping('BOUNCE') is producing broken animations, so we're just simulating what it's supposed to do
	local tx, parent, bounce = self.tx, self.parent, self.bounce
	tx:ClearAllPoints()
	if self.up then
		tx:SetPoint('BOTTOM', parent, 'TOP', 0, 10)
		bounce:SetSmoothing('OUT')
	else
		tx:SetPoint('BOTTOM', parent, 'TOP')
		bounce:SetSmoothing('IN')
	end
	bounce:SetOffset(0, self.up and -10 or 10)
	self.up = not self.up
	self:Play()
end
--group:SetLooping('REPEAT')
--group:Play()

local function CreateButton(i)
	local button = CreateFrame("Button", nil, f)
	button:SetSize(16, 16)
	button:SetHighlightTexture([[Interface\TaxiFrame\UI-Taxi-Icon-Highlight]])

	local highlight = button:GetHighlightTexture()
	highlight:ClearAllPoints()
	highlight:SetPoint('CENTER')
	highlight:SetSize(32, 32)

	local i = i or (#TaxiButtons + 1)
	button:SetScript('OnClick', TaxiNodeOnClick)
	button:SetID(i)
	TaxiButtons[i] = button

	button:SetScript('OnEnter', TaxiNodeOnButtonEnter)
	button:SetScript('OnLeave', function() WorldMapTooltip:Hide() end)

	local tx = button:CreateTexture(nil, 'OVERLAY')
	tx:SetPoint('BOTTOM', button, 'TOP')
	tx:SetSize(32, 32)
	tx:SetTexture('interface/minimap/minimap-deadarrow')
	tx:SetTexCoord(0, 1, 1, 0)

	local group = tx:CreateAnimationGroup()
	group.tx = tx

	local bounce = group:CreateAnimation('Translation')
	bounce:SetOffset(0, 10)
	bounce:SetDuration(0.5)
	bounce:SetSmoothing('IN')
	group.bounce = bounce

	group.up = true

	group:SetScript('OnFinished', BounceAnimation)
	group.parent = button
	button.arrow = tx
	group:Play()
	return button
end

function GetButton(i)
	return TaxiButtons[i] or CreateButton(i)
end

local ContinentMaps = {GetMapContinents()}
for i = #ContinentMaps, 2, -2 do tremove(ContinentMaps, i) end

--[[
local NodeTypeToName = {
	[LE_FLIGHT_PATH_TYPE_CURRENT] = 'CURRENT',
	[LE_FLIGHT_PATH_TYPE_REACHABLE] = 'REACHABLE',
	[LE_FLIGHT_PATH_TYPE_UNREACHABLE] = 'UNREACHABLE',
	-- [??] = 'DISTANT',
}
--]]

local CurrentContinent, CurrentMap = -1
function f:WORLD_MAP_UPDATE()
	if not TAXI_OPEN then return self:UnregisterEvent('WORLD_MAP_UPDATE') end
	local continentID = GetCurrentMapContinent() == CurrentContinent and CurrentContinent or -1
	local continent = FlightmapCoordinates[continentID]
	local left, top, right, bottom, width, height, mapID = GetMapSize()

	if mapID ~= CurrentMap or not mapID then
		for i = 1, #lines do -- only hide lines if the map has changed to a new map when this event fired
			lines[i]:Hide()
		end
		CurrentMap = mapID
	end

	if not continent then -- clear any buttons
		for i = 1, #TaxiButtons do
			TaxiButtons[i]:Hide()
		end
		return
	end

	local showArrows = ContinentMaps[continentID] and GetCurrentMapAreaID() ~= ContinentMaps[continentID] -- only show arrows on zone maps

	local j = 1
	for i = 1, #taxiNodePositions do
		local node = taxiNodePositions[i]
		--if node.type ~= 'NONE' then
		if node.type ~= 'NONE' then
			local mx, my = (left - node.x) / width, (top - node.y) / height
			local button = GetButton(j)
			button:ClearAllPoints()
			button:SetPoint('CENTER', f, 'TOPLEFT', mx * 1002, my * -668)
			button:SetNormalTexture(TaxiButtonTypes[node.type].file)
			button:SetID(i)
			--button:SetID(node.slotIndex)

			if node.type == 'REACHABLE' then
				button.arrow:SetShown(showArrows)
			else
				button.arrow:Hide()
			end

			if node.type == 'REACHABLE' or node.type == 'CURRENT' then
				button:Show()
			else
				button:Hide()
			end


			j = j + 1
		end
	end

	for i = j, #TaxiButtons do -- hide extra buttons
		TaxiButtons[i]:Hide()
	end

	if not showArrows then
		DrawOneHopLines()
	end
end

local function ZoomOutForNodes() -- Zoom map out until we can see at least one connecting node
	local left, top, right, bottom, width, height, mapID = GetMapSize()
	local nodeCount = 0
	for i = 1, #taxiNodePositions do
		local node = taxiNodePositions[i]
		if node.type ~= 'NONE' then
			if node.x < left and node.x > right and node.y > bottom and node.y < top then
				nodeCount = nodeCount + 1
			end
		end
	end
	if nodeCount < 2 and IsZoomOutAvailable() and ZoomOut() then
		ZoomOutForNodes()
	end
end

--打开飞行地图事件
function f:TAXIMAP_OPENED()
	TAXI_OPEN = true
	if not WorldMapFrame:IsShown() then
		ToggleWorldMap()
	end
	SetMapToCurrentZone()
	local continentID = GetCurrentMapContinent()
	local continent = FlightmapCoordinates[continentID]
	if continent then
		CurrentContinent = continentID

		--[[
		local nodes = GetAllTaxiNodes(taxiNodePositions)

		for i = 1, #nodes do
			local node = nodes[i]
			node.type = TaxiNodeGetType(node.slotIndex)
			local x, y = TaxiNodePosition(node.slotIndex)
			if continent.height then
				node.x, node.y = continent.left - continent.width * x, (continent.top - continent.height) + continent.height * y
			else
				node.x, node.y = continent.left - continent.width * x, (continent.top - continent.width) + continent.width * y
			end
		end
		--]]

		wipe(taxiNodePositions)
		for i = 1, NumTaxiNodes() do
			local type = TaxiNodeGetType(i)
			local name = TaxiNodeName(i)
			local x, y = TaxiNodePosition(i)
			--local wx, wy = continent.left - continent.width * x, (continent.top - continent.width) + continent.width * y

			local wx, wy
			if continent.height then
				wx, wy = continent.left - continent.width * x, (continent.top - continent.height) + continent.height * y
			else
				wx, wy = continent.left - continent.width * x, (continent.top - continent.width) + continent.width * y
			end

			taxiNodePositions[i] = {type = type, name = name, x = wx, y = wy}
		end

		self:RegisterEvent('WORLD_MAP_UPDATE')
		--SetMapZoom(continentID)
		self:WORLD_MAP_UPDATE()
		ZoomOutForNodes() -- only zoom out if we don't have other flight points on the current map?

		f:Show()
	end
end
-- f:RegisterEvent('TAXIMAP_OPENED')	--bf@178.com

function f:TAXIMAP_CLOSED()
	TAXI_OPEN = false
	CurrentContinent = -1
	self:UnregisterEvent('WORLD_MAP_UPDATE')
	f:Hide()
	if WorldMapFrame:IsShown() then
		ToggleWorldMap()
	end
end
-- f:RegisterEvent('TAXIMAP_CLOSED')	--bf@178.com

local timer = CreateFrame('Frame')
timer:Hide()

local TimeSince = 0
timer:SetScript('OnUpdate', function(self, elapsed) -- delayed close for the map frame
	TimeSince = TimeSince + elapsed
	if TimeSince >= 0.2 then
		self:Hide()
		if not WorldMapFrame:IsVisible() then
			CloseTaxiMap()
		end
	end
end)

WorldMapFrame:HookScript('OnHide', function() -- stop interaction with the flight master after a small timeout
	-- seems to trigger when switching between windowed and fullscreen mode
	TimeSince = 0
	timer:Show()
end)

function BFWorldFlightMap_Toggle(toggle)
	if toggle then
		WorldFlightMapFrame:RegisterEvent('TAXIMAP_OPENED');
		WorldFlightMapFrame:RegisterEvent('TAXIMAP_CLOSED');
		TaxiFrame:UnregisterEvent("TAXIMAP_OPENED");
		TaxiFrame:UnregisterEvent("TAXIMAP_CLOSED");
		WorldFlightMapSwitch_WorldMapFrame:SetChecked(true);
		UIParent:UnregisterEvent('TAXIMAP_OPENED')
	else
		WorldFlightMapFrame:UnregisterAllEvents();
		TaxiFrame:RegisterEvent("TAXIMAP_OPENED");
		TaxiFrame:RegisterEvent("TAXIMAP_CLOSED");
		WorldFlightMapSwitch_TaxiFrame:SetChecked(false);
		WorldFlightMapSwitch_WorldMapFrame:SetChecked(false);
		UIParent:RegisterEvent('TAXIMAP_OPENED')
	end
end
