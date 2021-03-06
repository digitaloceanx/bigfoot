﻿local L = LibStub("AceLocale-3.0"):NewLocale("GladiatorlosSA", "enUS",true)
if not L then return end

L["Spell_CastSuccess"] = "On Successful Cast"
L["Spell_CastStart"] = "On Beginning of Spell Cast"
L["Spell_AuraApplied"] = "On Buff/Debuff Application"
L["Spell_AuraRemoved"] = "On Buff/Debuff Removal"
L["Spell_Interrupt"] = "On Cast Interrupt"
L["Spell_Summon"] = "On Spell Summon"
L["Any"] = true
L["Player"] = true
L["Target"] = true
L["Focus"] = true
L["Mouseover"] = true
L["Party"] = true
L["Raid"] = true
L["Arena"] = true
L["Boss"] = true
L["Custom"] = true
L["Friendly"] = true
L["Hostile player"] = true
L["Hostile unit"] = true
L["Neutral"] = true
L["Myself"] = true
L["Mine"] = true
L["My pet"] = true
L["Custom Spell"] = true
L["New Sound Alert"] = true
L["name"] = "File Name"
L["same name already exists"] = "Spell name already exists"
L["spellid"] = "Spell ID"
L["Remove"] = "Delete Sound"
L["Are you sure?"] = true
L["Test"] = "Test File Path"
L["Use existing sound"] = true
L["choose a sound"] = "Choose existing sound"
L["file path"] = "Custom File Path"
L["event type"] = "Event Type"
L["Source unit"] = "Source Unit"
L["Source type"] = "Source Type"
L["Custom unit name"] = "Custom Unit Name"
L["Dest unit"] = "Destination Unit"
L["Dest type"] = "Destination Type"

L["GladiatorlosSACredits"] = "Customizable PvP Announcer addon for vocalizing many important spells and cast by your enemies.|n|n|cffFFF569Created by|r |cff9482C9Abatorlos|r |cffFFF569of Spinebreaker|r|n|cffFFF569Legion update by|r |cffC79C6EOrunno|r |cffFFF569of Moon Guard (With permission from zuhligan)|r|n|n|cffFFF569Special Thanks|r|n|cffA330C9superk521|r (Past Project Manager)|n|cffA330C9DuskAshes|r (Chinese Support)|n|cffA330C9N30Ex|r (Mists of Pandaria Support)|n|cffA330C9zuhligan|r (Warlords of Draenor & French Support)|n|cffA330C9jungwan2|r (Korean Support)|n|cffA330C9Mini_Dragon|r (Chinese support for WoD & Legion)|n|cffA330C9LordKuper|r (Russian support for Legion)"
L["PVP Voice Alert"] = true
L["Load Configuration"] = true
L["Load Configuration Options"] = true
L["General"] = true
L["General options"] = true
L["Enable area"] = true
L["Anywhere"] = true
L["Alert works anywhere"] = "Alerts occur anywhere"
L["Arena"] = true
L["Alert only works in arena"] = "Alerts occur in arenas"
L["Battleground"] = true
L["Alert only works in BG"] = "Alerts occur in battlegrounds"
L["World"] = true
L["Alert works anywhere else then anena, BG, dungeon instance"] = "Alerts occur in the world such as on Kalimdor or the Broken Isles"
L["Voice config"] = "Voice Options"
L["Voice language"] = true
L["Select language of the alert"] = true
L["Chinese(Yike Xia)"] = true
L["Chinese(female)"] = true
L["English(female)"] = "English (Female)"
L["adjusting the voice volume(the same as adjusting the system master sound volume)"] = "Adjusts the voice's volume.|n|nNOTE: The voice uses the client's Master channel. You may need to adjust your other sound options accordingly."
L["Advance options"] = "Advanced Options"
L["Smart disable"] = "Spam Throttle"
L["Disable addon for a moment while too many alerts comes"] = "Briefly disables sound notifications during periods of frequent ability usage."
L["Throttle"] = true
L["The minimum interval of each alert"] = true
L["Abilities"] = true
L["Abilities options"] = true
L["Disable options"] = "Disable Category"
L["Disable abilities by type"] = true
L["Disable Buff Applied"] = "Buff Applied"
L["Check this will disable alert for buff applied to hostile targets"] = "Disable all callouts in Buff Applied"
L["Disable Buff Down"] = "Buff Down"
L["Check this will disable alert for buff removed from hostile targets"] = "Disable all callouts in Buff Down"
L["Disable Spell Casting"] = "Spell Casting"
L["Chech this will disable alert for spell being casted to friendly targets"] = "Disable all callouts in Spell Casting"
L["Disable special abilities"] = "Special Abilities"
L["Check this will disable alert for instant-cast important abilities"] = "Disable all callouts in Special Abilities"
L["Disable friendly interrupt"] = "Friendly Interrupts"
L["Check this will disable alert for successfully-landed friendly interrupting abilities"] = "Disable all callouts for ally successful interrupts. ('Countered!')"
L["Buff Applied"] = true
L["Target and Focus Only"] = true
L["Alert works only when your current target or focus gains the buff effect or use the ability"] = true
L["Alert Drinking"] = true
L["In arena, alert when enemy is drinking"] = true
L["PvP Trinketed Class"] = true
L["Also announce class name with trinket alert when hostile targets use PvP trinket in arena"] = "In arenas, announces the class that used their PvP Medallion.|r"
L["General Abilities"] = true
L["|cffFF7D0ADruid|r"] = true
L["|cffF58CBAPaladin|r"] = true
L["|cffFFF569Rogue|r"] = true
L["|cffC79C6EWarrior|r"] = true
L["|cffFFFFFFPriest|r"] = true
L["|cff0070daShaman|r"] = true
L["|cff69CCF0Mage|r"] = true
L["|cffC41F3BDeath Knight|r"] = true
L["|cffABD473Hunter|r"] = true
L["|cFF00FF96Monk|r"] = true
L["|cffA330C9Demon Hunter|r"] = true
L["|cff9482C9Warlock|r"] = true
L["Buff Down"] = true
L["Spell Casting"] = true
L["Big Heals"] = true
L["Greater Heal, Divine Light, Greater Healing Wave, Healing Touch, Enveloping Mist"] = "Heal (Priest)|nPower Word: Radiance (Priest)|nShadow Covenant (Priest)|nVivify (|cFF00FF96Monk|r)|nHoly Light (|cffF58CBAPaladin|r)|nHealing Wave (|cff0070daShaman|r)|nHealing Touch (|cffFF7D0ADruid|r)"
L["Resurrection"] = true
L["Resurrection, Redemption, Ancestral Spirit, Revive, Resuscitate"] = "All out-of-combat resurrection abilities."
L["Special Abilities"] = true
L["Friendly Interrupt"] = true
L["Spell Lock, Counterspell, Kick, Pummel, Mind Freeze, Skull Bash, Rebuke, Solar Beam, Spear Hand Strike, Wind Shear, Consume Magic"] = true
L["Profiles"] = true

L["PvPWorldQuests"] = "NYI"
L["DisablePvPWorldQuests"] = "NYI"
L["DisablePvPWorldQuestsDesc"] = "Disable all callouts in PvP World Quests"
L["OperationMurlocFreedom"] = true

L["EnemyInterrupts"] = "Interrupts (And Solar Beam, because it interrupts AND silences!)"
L["EnemyInterruptsDesc"] = "Enables or disables callouts for ALL enemy Interrupt and Silence abilities."

L["Default / Female voice"] = "Default Voice"
L["Select the default voice pack of the alert"] = " "
L["Optional / Male voice"] = true
L["Select the male voice"] = true
L["Optional / Neutral voice"] = true
L["Select the neutral voice"] = true
L["Gender detection"] = true
L["Activate the gender detection"] = true
L["Voice menu config"] = true
L["Choose a test voice pack"] = true
L["Select the menu voice pack alert"] = true

L["English(male)"] = true
L["No sound selected for the Custom alert : |cffC41F4B"] = true
L["Master Volume"] = true -- changed from L["Volume"] = true
L["Change Output"] = true
L["Unlock the output options"] = true
L["Output"] = true
L["Select the default output"] = true
L["Master"] = true
L["SFX"] = true
L["Ambience"] = true
L["Music"] = true