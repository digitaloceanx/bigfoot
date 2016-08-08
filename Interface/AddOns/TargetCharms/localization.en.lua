﻿if GetLocale() == "enUS" then
TARGETCHARMS_TITLE = "TargetCharms";

TARGETCHARMS_OPTIONS_TITLE = "TargetCharms Options";
TARGETCHARMS_OPTIONS_LAYOUT_TEXT = "Customize:";
TARGETCHARMS_OPTIONS_DRAG = "Draggable";
TARGETCHARMS_OPTIONS_SHOWONTARGET = "Show only while Targeting";
TARGETCHARMS_OPTIONS_TOGGLEICON = "Togglable Buttons";
TARGETCHARMS_OPTIONS_SHOWICONS = "Show Icons";
TARGETCHARMS_OPTIONS_SCALE = "Scale";
TARGETCHARMS_OPTIONS_OPACITY = "Opacity";
TARGETCHARMS_OPTIONS_XSPACING = "X Spacing";
TARGETCHARMS_OPTIONS_YSPACING = "Y Spacing";
TARGETCHARMS_OPTIONS_SHOW_TITLE = "Display:";
TARGETCHARMS_OPTIONS_CLOSE_BUTTON = "Close";
TARGETCHARMS_OPTIONS_FLARE_MOVE_BUTTON = "Move World Markers";
TARGETCHARMS_OPTIONS_FLARE_LOCK_BUTTON = "Lock World Markers";
TARGETCHARMS_OPTIONS_FLARE_MOVE_TEXT = "World\nMrkrs"
TARGETCHARMS_OPTIONS_PRESETS_TITLE = "Select Layout:";
TARGETCHARMS_OPTIONS_LOAD_BUTTON = "Set Layout";
TARGETCHARMS_OPTIONS_READYCHECK_TITLE = "Ready Button Options";
TARGETCHARMS_OPTIONS_READYCHECK_TEXT = "Text:";
TARGETCHARMS_OPTIONS_FLARE_TITLE = "World Markers Options";
TARGETCHARMS_OPTIONS_WIDTH = "Width";
TARGETCHARMS_READYCHECK_TEXT = "Ready?";
TARGETCHARMS_MSG_TAG = "TargetCharms: ";
TARGETCHARMS_CMD_HELP = "/TargetCharms [Reset|Setup]";
TARGETCHARMS_SLASH1 = "/targetcharms";
TARGETCHARMS_SLASH2 = "/tc";
TARGETCHARMS_LOADED = "Loaded";
TARGETCHARMS_ERROR_INVALIDCHAR = "Invalid Position Character";


--Positions & Charms
TARGETCHARMS_POSITION_UP = "^";
TARGETCHARMS_POSITION_DOWN = "v";
TARGETCHARMS_POSITION_LEFT = "<";
TARGETCHARMS_POSITION_RIGHT = ">";
TARGETCHARMS_CHARM1 = "1";
TARGETCHARMS_CHARM2 = "2";
TARGETCHARMS_CHARM3 = "3";
TARGETCHARMS_CHARM4 = "4";
TARGETCHARMS_CHARM5 = "5";
TARGETCHARMS_CHARM6 = "6";
TARGETCHARMS_CHARM7 = "7";
TARGETCHARMS_CHARM8 = "8";
TARGETCHARMS_CHARM9 = "9"; --Not currently used
TARGETCHARMS_CHARM0 = "0";

TARGETCHARMS_BLUEFLARE = "B";
TARGETCHARMS_GREENFLARE = "G";
TARGETCHARMS_PURPLEFLARE = "P";
TARGETCHARMS_REDFLARE = "R";
TARGETCHARMS_YELLOWFLARE = "Y";
TARGETCHARMS_CLEARFLARE = "X";

--Lower case on CMDs
TargetCharms_CMDS = {"reset", "setup"};

TargetCharms_LayoutDefaults =	{{"Standard", ">1>5v6<2v3>7v8<4v_>0"},
				{"Inverted",">4>8v7<3v2>6v5<1v_>0"},
				{"Horizontal",">1>2>3>4>5>6>7>8>0"},
				{"Vertical",">1v2v3v4v5v6v7v8v0"},
				{"3x3",">1v2v3>6^5^4>7v8v0"}};

Flare_LayoutDefaults =	{{"Standard", ">B>RvY<GvP>X"},
				{"3x2",">B>G>PvX<Y<R"},
				{"Horizontal",">B>G>P>R>Y>X"},
				{"Vertical",">BvGvPvRvYvX"}};
				
TargetCharms_ShowTypes = {"Party/Raid","Always","Hide"};
end