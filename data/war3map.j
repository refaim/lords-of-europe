globals
	//
	// Constants
	//
	
	constant integer gold_limit             = 10000
	constant integer lumber_limit           = 7000
	
	constant integer player_initial_gold    = 2000
	constant integer player_initial_lumber  = 1500
	constant integer player_initial_militia = 8
	
	constant integer city_taxes_gold        = 100
	constant integer city_taxes_lumber      = 50
	
	constant integer city_influnce_home     = 2
	constant integer city_influnce_foreign  = 6
	
	constant real    start_time             = 40.
	constant real    taxes_period           = 90.
	constant real    country_choose_time    = 60. * 2.
	constant real    settings_choose_time   = 30.
	
	constant string  brd_padding            = "         "
	
	constant integer col_country            = 1
	constant integer col_cities             = 2
	constant integer col_army               = 3
	constant integer col_influence          = 4
	
	constant real    col_country_width      = 11.
	constant real    col_cities_width       = 6.
	constant real    col_army_width         = 6.
	constant real    col_influence_width    = 6.
	
	constant integer random_country         = 'N00S'
	
	constant string  anonym_name = "Аноним"
	
	constant integer ALLY_MODE_NORMAL       = 1
	constant integer ALLY_MODE_FFA          = 2
	
	constant integer PICK_MODE_NORMAL       = 1
	constant integer PICK_MODE_ALL_RANDOM   = 2
	
	integer cfg_ally_mode = ALLY_MODE_NORMAL
	integer cfg_pick_mode = PICK_MODE_NORMAL
	
	dialog dlg_settings = null
	
	group g_cities
	
	timer tmr_game_start
	timer tmr_taxes
	timer tmr_settings
	timer tmr_peace
	
	timerdialog tdlg_game_start
	timerdialog tdlg_taxes
	timerdialog tdlg_settings
	timerdialog tdlg_peace
	
	multiboard brd_stats
	integer    brd_last_index
	
	force f_north_players
	force f_south_players
	
	rect rct_egypt_start
	rect rct_liban_start
	rect rct_turkey_start
	rect rct_greece_start
	rect rct_hungary_start
	rect rct_russia_start
	rect rct_moscow_start
	rect rct_finland_start
	rect rct_sweden_start
	rect rct_ukraine_start
	rect rct_italy_start
	rect rct_spain_start
	rect rct_almohads_start
	rect rct_england_start
	rect rct_france_start
	rect rct_germany_start
	rect rct_poland_start
	rect rct_byzantine_start
	rect rct_country_choose
	rect rct_beni_gania_start
	rect rct_england_zone
	rect rct_finland_zone
	rect rct_moscow_zone
	rect rct_russia_zone
	rect rct_ukraine_zone
	rect rct_turkey_zone
	rect rct_byzantine_zone
	rect rct_egypt_zone
	rect rct_beni_gania_zone
	rect rct_almohads_zone
	rect rct_hungary_zone
	rect rct_poland_zone
	rect rct_italy_zone
	rect rct_france_zone
	rect rct_spain_zone
	rect rct_germany_zone
	rect rct_greece_zone
	rect rct_liban_zone
	
	sound snd_capital_upgrade
	sound snd_game_enter
	sound snd_game_started
	sound snd_peace_time_expired
	
	unit city_halmstad
	unit city_marcel
	unit unit_north_countries
	unit unit_south_countries

	trigger tgr_initialization
	trigger tgr_game_initialization
	trigger tgr_game_start
	trigger tgr_settings_dialog_button_clicked
	
	trigger tgr_chat_msg_camera
	trigger tgr_chat_msg_names
	
	trigger tgr_player_gold_limit_reached
	trigger tgr_player_lumber_limit_reached
	trigger tgr_player_leave
	trigger tgr_player_influence_changed
	trigger tgr_player_country_chosen
	trigger tgr_player_alliance_changed
	
	trigger tgr_tome_of_learning_picked
	trigger tgr_country_choose_timeout
	trigger tgr_settings_choose_timeout
	trigger tgr_taxes
	trigger tgr_city_captured
	trigger tgr_city_destroyed
	trigger tgr_capital_upgrade
	trigger tgr_peace_time_expired
	
	trigger tgr_update_stats_army
	
	trigger tgr_unit_upgraded
	trigger tgr_cardinals_researched
	trigger tgr_barracks_switch
	trigger tgr_adv_tower_death
	trigger tgr_neutral_auto_upgrade
	trigger tgr_pirate_frigate_sold
	trigger tgr_item_taken
	trigger tgr_charged_attack
	trigger tgr_sacrifice_casted
	
	integer     array player_country
	integer     array player_random_country // используется в all random
	string      array player_nick
	group       array player_home_cities
	integer     array player_city_count
	integer     array player_required_influence
	integer     array player_influence
	integer     array player_influence_balance
	integer     array player_stats_pos
	integer     array player_age
	
	string      array country_name
	string      array country_color_code
	string      array country_capture_msg
	integer     array country_selector
	integer     array country_hero
	integer     array country_special
	integer     array country_priest
	playercolor array country_color
	rect        array country_zone
	rect        array country_start
	boolean     array country_chosen
	
	string      array capital_upgrade_name
	integer     array age_tech_id
	
	integer egypt
	integer england
	integer finland
	integer france
	integer germany
	integer greece
	integer hungary
	integer italy
	integer russia
	integer liban
	integer almohads
	integer moscow
	integer poland
	integer spain
	integer sweden
	integer turkey
	integer ukraine
	integer byzantine
	integer beni_gania
	
	integer country_count = 0

	boolean mod_anonymity = false
	boolean game_started = false
	player host
	
	constant integer btn_back  = 0
	
	constant integer btn_ally  = 1
	constant integer btn_pick  = 2
	constant integer btn_start = 3
	constant integer btn_peace_time = 4
	constant integer btn_mods = 5
	
	constant integer btn_ally_normal = 1
	constant integer btn_ally_ffa = 2
	
	constant integer btn_pick_normal = 1
	constant integer btn_pick_ar = 2
	
	constant integer btn_pt_0  = 1
	constant integer btn_pt_5  = 2
	constant integer btn_pt_10 = 3
	constant integer btn_pt_15 = 4
	
	constant integer btn_anonymity = 1
	
	constant integer DS_MAIN = 0
	constant integer DS_ALLY = 1
	constant integer DS_PICK = 2
	constant integer DS_PEACE_TIME = 3
	constant integer DS_MODS = 4

	button array buttons
	integer dlg_state = DS_MAIN
	integer peace_time = 0
	boolean love_and_peace = false
	boolean react_alliance_change = true
endglobals

function PlayerAlive takes player p returns boolean
	return (GetPlayerController(p) == MAP_CONTROL_USER and GetPlayerSlotState(p) == PLAYER_SLOT_STATE_PLAYING) or (p == Player(12))
endfunction

function PlayerSetCameraLevel takes player p, integer level returns nothing
	call SetCameraFieldForPlayer(p, CAMERA_FIELD_TARGET_DISTANCE, 1400. + 300. * level, 3.)
endfunction

function SetAllPlayersTechMaxAllowed takes integer techid, integer maximum returns nothing
	local integer i
	set i = 0
	loop
		call SetPlayerTechMaxAllowed(Player(i), techid, maximum)
		set i = i + 1
		exitwhen i > 11
	endloop
endfunction

function PlayerSetCountrySelectionState takes boolean enabled, boolean random returns nothing
	local integer i
	local integer level
	
	if enabled then
		set level = 1
	else
		set level = 0
	endif
	
	set i = 0
	loop
		call SetAllPlayersTechMaxAllowed(country_selector[i], level)
		set i = i + 1
		exitwhen i == country_count
	endloop
	
	if random then
		call SetAllPlayersTechMaxAllowed(random_country, level)
	endif
endfunction

function PlayerSetupRandomCountry takes player p returns nothing
	local integer pid
	set pid = GetPlayerId(p)
	loop
		set player_random_country[pid] = GetRandomInt(0, country_count - 1)
		exitwhen not country_chosen[player_random_country[pid]]
	endloop
endfunction

function GlobalPeace takes boolean flag returns nothing
	local integer i
	local integer j
	local player p
	local player p2
	local boolean old_reaction
	
	set old_reaction = react_alliance_change
	set react_alliance_change = false
	set love_and_peace = flag
	set i = 0
	loop
		set p = Player(i)
		set j = 0
		loop
			if i != j then
				set p2 = Player(j)
				
				if flag then
					call SetPlayerAllianceStateAllyBJ(p, p2, true)
					call SetPlayerAlliance(p, p2, ALLIANCE_SHARED_XP, false)
				else
					call SetPlayerAllianceStateAllyBJ(p, p2, GetPlayerAlliance(p, p2, ALLIANCE_SHARED_VISION))
				endif
			endif
			set j = j + 1
			exitwhen j > 11
		endloop
		set i = i + 1
		exitwhen i > 11
	endloop
	
	set react_alliance_change = old_reaction
endfunction

function ApplySettings takes nothing returns nothing
	local integer i
	local integer j
	local player p
	local player p2
	
	if cfg_ally_mode == ALLY_MODE_NORMAL then
		call SetMapFlag(MAP_LOCK_ALLIANCE_CHANGES, false)
		call SetMapFlag(MAP_ALLIANCE_CHANGES_HIDDEN, false)
	elseif cfg_ally_mode == ALLY_MODE_FFA then
		call SetMapFlag(MAP_LOCK_ALLIANCE_CHANGES, true)
		call SetMapFlag(MAP_ALLIANCE_CHANGES_HIDDEN, true)
		call SetMapFlag(MAP_SHARED_ADVANCED_CONTROL, false)
		
		set i = 0
		loop
			set p = Player(i)
			set j = 0
			loop
				if i != j then
					set p2 = Player(j)
					call SetPlayerAllianceStateAllyBJ(p, p2, false)
					call SetPlayerAllianceStateVisionBJ(p, p2, false)
					call SetPlayerAllianceStateControlBJ(p, p2, false)
					call SetPlayerAllianceStateFullControlBJ(p, p2, false)
				endif
				set j = j + 1
				exitwhen j > 11
			endloop
			set i = i + 1
			exitwhen i > 11
		endloop
	endif
	
	if cfg_pick_mode == PICK_MODE_ALL_RANDOM then
		call PlayerSetCountrySelectionState(false, false)
		
		set i = 0
		loop
			set p = Player(i)
			if PlayerAlive(p) then
				call PlayerSetupRandomCountry(p)
			endif
			set i = i + 1
			exitwhen i > 11
		endloop
	endif
	
	if mod_anonymity then
		set i = 0
		loop
			call SetPlayerName(Player(i), anonym_name)
			call SetPlayerColor(Player(i), PLAYER_COLOR_LIGHT_GRAY)
			set i = i + 1
			exitwhen i > 11
		endloop
	endif
	
	set i = 0
	loop
		if PlayerAlive(Player(i)) then
			call MultiboardSetItemValueBJ(brd_stats, col_country, player_stats_pos[i], GetPlayerName(Player(i)))
		endif
		set i = i + 1
		exitwhen i > 11
	endloop
endfunction

function AllyModeText takes nothing returns string
	if cfg_ally_mode == ALLY_MODE_NORMAL then
		return "свободные"
	elseif cfg_ally_mode == ALLY_MODE_FFA then
		return "каждый сам за себя"
	endif
	return ""
endfunction

function PickModeText takes nothing returns string
	if cfg_pick_mode == ALLY_MODE_NORMAL then
		return "свободный"
	elseif cfg_pick_mode == PICK_MODE_ALL_RANDOM then
		return "случайно"
	endif
	return ""
endfunction

function StartGame takes nothing returns nothing
	local string mods
	
	set unit_north_countries = CreateUnit(Player(15),'n00K',-11616.,11424.,270.)
	call SetUnitColor(unit_north_countries, ConvertPlayerColor(0))
	
	set unit_south_countries = CreateUnit(Player(15),'n00L',-11936.,11104.,270.)
	call SetUnitColor(unit_south_countries, ConvertPlayerColor(0))
	
	call CreateUnit(Player(0),'oeye',-11847.7,11259.1,328.68)
	call CreateUnit(Player(1),'oeye',-11818.3,11195.7,186.235)
	call CreateUnit(Player(2),'oeye',-11785.7,11245.1,203.934)
	call CreateUnit(Player(3),'oeye',-11781.1,11233.,22.083)
	call CreateUnit(Player(4),'oeye',-11775.4,11334.9,183.104)
	call CreateUnit(Player(5),'oeye',-11751.3,11357.4,299.804)
	call CreateUnit(Player(6),'oeye',-11710.6,11327.5,229.03)
	call CreateUnit(Player(7),'oeye',-11713.4,11282.1,268.899)
	call CreateUnit(Player(8),'oeye',-11820.,11222.9,267.536)
	call CreateUnit(Player(9),'oeye',-11803.,11260.8,293.816)
	call CreateUnit(Player(10),'oeye',-11741.5,11273.2,290.641)
	call CreateUnit(Player(11),'oeye',-11765.6,11282.1,170.008)
	
	call SetCameraPosition(-11938., 11264.)
	call ClearTextMessages()
	call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 3.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0.00)
	
	call DialogDisplay(host, dlg_settings, false)
	call DialogDestroy(dlg_settings)
	
	call DestroyTimerDialog(tdlg_settings)
	call PauseTimer(tmr_settings)
	call DestroyTimer(tmr_settings)
	
	call TimerStart(tmr_game_start, start_time, false, null)
	set tdlg_game_start = CreateTimerDialogBJ(tmr_game_start, "До начала:")
	
	call ApplySettings()
	
	call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, start_time, "|cffFF8422Союзы:|cffffcc00 " + AllyModeText())
	call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, start_time, "|cffFF8422Выбор страны:|cffffcc00 " + PickModeText())
	
	if peace_time > 0 then
		call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, start_time, "|cffFF8422Перемирие:|cffffcc00 " + I2S(peace_time) + " минут")
	endif
	
	set mods = ""
	
	if mod_anonymity then
		set mods = mods + ", анонимность"
	endif
	
	if mods != "" then
		call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, start_time, "|cffFF8422Моды:|cffffcc00 " + SubString(mods, 2, StringLength(mods)))
	endif
	
	if host != GetLocalPlayer() then
		call EnableUserUI(true)
		call EnableUserControl(true)
		call ShowInterface(true, 3.)
	endif
endfunction

function DialogAddModButton takes dialog whichDialog, string buttonText, boolean enabled, integer hotkey returns button
	local string text
	if enabled then
		set text = "вкл."
	else
		set text = "выкл."
	endif
	return DialogAddButton(whichDialog, buttonText + ": " + text, hotkey)
endfunction

function ShowSettingsDialog takes nothing returns nothing
	call DialogDisplay(host, dlg_settings, false)
	call DialogClear(dlg_settings)

	if dlg_state == DS_MAIN then
		call DialogSetMessage(dlg_settings, "|cffF090EEНастройки")
		set buttons[btn_ally]       = DialogAddButton(dlg_settings, "|cffFF8422Союзы:|r " + AllyModeText(), 0)
		set buttons[btn_pick]       = DialogAddButton(dlg_settings, "|cffFF8422Выбор страны:|r " + PickModeText(), 0)
		set buttons[btn_peace_time] = DialogAddButton(dlg_settings, "|cffFF8422Перемирие:|r " + I2S(peace_time) + " минут", 0)
		set buttons[btn_mods]       = DialogAddButton(dlg_settings, "|cffFF8422Моды", 0)
		set buttons[btn_start]      = DialogAddButton(dlg_settings, "|cff00ff00Начать игру", 0)
	elseif dlg_state == DS_ALLY then
		call DialogSetMessage(dlg_settings, "|cffF090EEСоюзы")
		set buttons[btn_ally_normal] = DialogAddButton(dlg_settings, "Свободные", 0)
		set buttons[btn_ally_ffa]    = DialogAddButton(dlg_settings, "Каждый сам за себя", 0)
	elseif dlg_state == DS_PICK then
		call DialogSetMessage(dlg_settings, "|cffF090EEВыбор страны")
		set buttons[btn_pick_normal] = DialogAddButton(dlg_settings, "Свободный", 0)
		set buttons[btn_pick_ar]     = DialogAddButton(dlg_settings, "Случайные страны", 0)
	elseif dlg_state == DS_PEACE_TIME then
		call DialogSetMessage(dlg_settings, "|cffF090EEПеремирие")
		set buttons[btn_pt_0]  = DialogAddButton(dlg_settings, "0 минут", 0)
		set buttons[btn_pt_5]  = DialogAddButton(dlg_settings, "5 минут", 0)
		set buttons[btn_pt_10] = DialogAddButton(dlg_settings, "10 минут", 0)
		set buttons[btn_pt_15] = DialogAddButton(dlg_settings, "15 минут", 0)
	elseif dlg_state == DS_MODS then
		call DialogSetMessage(dlg_settings, "|cffF090EEМоды")
		set buttons[btn_anonymity] = DialogAddModButton(dlg_settings, "Анонимность", mod_anonymity, 0)
	endif
	
	if dlg_state != DS_MAIN then
		set buttons[btn_back] = DialogAddButton(dlg_settings, "|cff00ff00Назад", 0)
	endif
	
	call DialogDisplay(host, dlg_settings, true)
endfunction

function OnSettingsDialogButtonClicked takes nothing returns nothing
	local button btn
	
	set btn = GetClickedButton()
	if dlg_state == DS_MAIN then
		if btn == buttons[btn_ally] then
			set dlg_state = DS_ALLY
		elseif btn == buttons[btn_pick] then
			set dlg_state = DS_PICK
		elseif btn == buttons[btn_peace_time] then
			set dlg_state = DS_PEACE_TIME
		elseif btn == buttons[btn_mods] then
			set dlg_state = DS_MODS
		elseif btn == buttons[btn_start] then
			call StartGame()
			return
		endif
	elseif dlg_state == DS_ALLY then
		if btn == buttons[btn_ally_normal] then
			set cfg_ally_mode = ALLY_MODE_NORMAL
		elseif btn == buttons[btn_ally_ffa] then
			set cfg_ally_mode = ALLY_MODE_FFA
		endif
		set dlg_state = DS_MAIN
	elseif dlg_state == DS_PICK then
		if btn == buttons[btn_pick_normal] then
			set cfg_pick_mode = PICK_MODE_NORMAL
		elseif btn == buttons[btn_pick_ar] then
			set cfg_pick_mode = PICK_MODE_ALL_RANDOM
		endif
		set dlg_state = DS_MAIN
	elseif dlg_state == DS_PEACE_TIME then
		if btn == buttons[btn_pt_0] then
			set peace_time = 0
		elseif btn == buttons[btn_pt_5] then
			set peace_time = 5
		elseif btn == buttons[btn_pt_10] then
			set peace_time = 10
		elseif btn == buttons[btn_pt_15] then
			set peace_time = 15
		endif
		set dlg_state = DS_MAIN
	elseif dlg_state == DS_MODS then
		if btn == buttons[btn_anonymity] then
			set mod_anonymity = not mod_anonymity
		elseif btn == buttons[btn_back] then
			set dlg_state = DS_MAIN
		endif
	endif
	call ShowSettingsDialog()
endfunction

function ColoredBalance takes integer b returns string
	if b >= 0 then
		return "|cff00ff00+" + I2S(b) + "|r"
	endif
	return "|cffff0000" + I2S(b) + "|r"
endfunction

function IsCapital takes integer id returns boolean
	return id >= 'h600' and id <= 'h604'
endfunction

function GetCapitalLevel takes integer id returns integer
	if IsCapital(id) then
		return id - 'h600' + 1
	endif
	return -1
endfunction

function IsSouthCountry takes integer c returns boolean
	return c == egypt or c == liban or c == almohads or c == turkey or c == beni_gania
endfunction

function IsNorthCountry takes integer c returns boolean
	return not IsSouthCountry(c)
endfunction

function IsCity takes unit u returns boolean
	return IsUnitInGroup(u, g_cities)
endfunction

function IsHomeCity takes unit u, player p returns boolean
	return IsUnitInGroup(u, player_home_cities[GetPlayerId(p)])
endfunction

function IsForeignCity takes unit u, player p returns boolean
	return IsCity(u) and not IsHomeCity(u, p)
endfunction

function CityGetRequiredInfluence takes unit u, player p returns integer
	if IsHomeCity(u, p) then
		return city_influnce_home
	endif
	return city_influnce_foreign
endfunction

function PlayerScienceInfluence takes player p returns integer
	return GetPlayerScore(p, PLAYER_SCORE_TECH_PERCENT)
endfunction

function PlayerArmyInfluence takes player p returns integer
	return GetPlayerState(p, PLAYER_STATE_RESOURCE_FOOD_USED)
endfunction

function PlayerRecalcInfluence takes player p returns nothing
	local integer pid
	
	set pid = GetPlayerId(p)
	set player_influence[pid] = PlayerScienceInfluence(p) + PlayerArmyInfluence(p)
	set player_influence_balance[pid] = player_influence[pid] - player_required_influence[pid]
	
	if pid != 12 then
		call MultiboardSetItemValueBJ(brd_stats, col_influence, player_stats_pos[pid], brd_padding + ColoredBalance(player_influence_balance[pid]))
	endif
endfunction

function StatsInitPlayer takes player p returns nothing
	local integer pid
	set pid = GetPlayerId(p)
	
	call MultiboardSetItemValueBJ(brd_stats, col_country,   player_stats_pos[pid], GetPlayerName(p))
	call MultiboardSetItemValueBJ(brd_stats, col_cities,    player_stats_pos[pid], brd_padding + I2S(player_city_count[pid]))
	call MultiboardSetItemValueBJ(brd_stats, col_army,      player_stats_pos[pid], brd_padding + I2S(GetPlayerState(p, PLAYER_STATE_RESOURCE_FOOD_USED)))
	call MultiboardSetItemValueBJ(brd_stats, col_influence, player_stats_pos[pid], brd_padding + ColoredBalance(player_influence_balance[pid]))
endfunction

function InitPlayers takes nothing returns nothing
	local integer i
	local player p
	set i = 0
	loop
		set p = Player(i)
		call SetPlayerTechMaxAllowedSwap('h60G', 1, p)
		call SetPlayerTechMaxAllowedSwap('h036', 3, p)
		call SetPlayerTechMaxAllowedSwap('h037', 1, p)
		call SetPlayerTechMaxAllowedSwap('h03B', 3, p)
		call SetPlayerTechMaxAllowedSwap('O001', 1, p)
		call SetPlayerTechMaxAllowedSwap('O000', 1, p)
		call SetPlayerTechMaxAllowedSwap('H01Z', 1, p)
		call SetPlayerUnitAvailableBJ('h613', false, p)
		call SetPlayerUnitAvailableBJ('h612', false, p)
		call SetPlayerUnitAvailableBJ('h60W', false, p)
		call SetPlayerUnitAvailableBJ('h001', false, p)
		call SetPlayerUnitAvailableBJ('h002', false, p)
		call SetPlayerUnitAvailableBJ('h61E', false, p)
		call SetPlayerUnitAvailableBJ('h61D', false, p)
		call SetPlayerUnitAvailableBJ('h61F', false, p)
		call SetPlayerUnitAvailableBJ('h617', false, p)
		call SetPlayerUnitAvailableBJ('h61I', false, p)
		call SetPlayerUnitAvailableBJ('h61H', false, p)
		call SetPlayerUnitAvailableBJ('h619', false, p)
		call SetPlayerUnitAvailableBJ('h61A', false, p)
		call SetPlayerUnitAvailableBJ('h614', false, p)
		call SetPlayerUnitAvailableBJ('h61B', false, p)
		call SetPlayerUnitAvailableBJ('h616', false, p)
		call SetPlayerUnitAvailableBJ('n601', false, p)
		call SetPlayerUnitAvailableBJ('h61K', false, p)
		call SetPlayerUnitAvailableBJ('h61J', false, p)
		call SetPlayerUnitAvailableBJ('n604', false, p)
		call SetPlayerUnitAvailableBJ('h61L', false, p)
		call SetPlayerUnitAvailableBJ('h61M', false, p)
		call SetPlayerUnitAvailableBJ('h01Q', false, p)
		call SetPlayerUnitAvailableBJ('h021', false, p)
		call SetPlayerUnitAvailableBJ('h035', false, p)
		call SetPlayerTechMaxAllowedSwap('R001', 0, p)
		
		call SetCameraFieldForPlayer(p, CAMERA_FIELD_TARGET_DISTANCE, 2000., 3.)
		set i = i + 1
		exitwhen i > 11
	endloop
endfunction

function IsCityFilter takes nothing returns boolean
	return IsCity(GetFilterUnit())
endfunction

function IsCityStupidFilter takes nothing returns boolean
	return GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetFilterUnit()) == 2000.
endfunction

function InitNeutralForces takes nothing returns nothing
	call SetPlayerName(Player(12), "|cff703020Варвары|r")
	call SetPlayerName(Player(15), "|cff703020Независимые|r")
	call SetPlayerFlagBJ(PLAYER_STATE_GIVES_BOUNTY, false, Player(12))
	call SetTimeOfDay(12)
	set g_cities = GetUnitsInRectMatching(GetWorldBounds(), Condition(function IsCityStupidFilter))
	set player_city_count[12] = CountUnitsInGroup(g_cities)
endfunction

function InitQuests takes nothing returns nothing
	call CreateQuestBJ(0, "|cffE8E354Автор",         "TRIGSTR_3753", "ReplaceableTextures\\CommandButtons\\BTNLeetTraining.blp")
	call CreateQuestBJ(0, "|cff00ff00Обновления",    "TRIGSTR_5850", "ReplaceableTextures\\CommandButtons\\BTNBansheeMaster.blp")
	call CreateQuestBJ(0, "|cff00ff00Другие версии", "TRIGSTR_6506", "ReplaceableTextures\\CommandButtons\\BTNManaDrain.blp")
	call CreateQuestBJ(2, "|cffE6B867Ресурсы",       "TRIGSTR_3749", "ReplaceableTextures\\CommandButtons\\BTNChestOfGold.blp")
	call CreateQuestBJ(2, "|cff61EA4CКоманды",       "TRIGSTR_3751", "ReplaceableTextures\\CommandButtons\\BTNMove.blp")
	call CreateQuestBJ(2, "|cffD4593AВлияния",       "TRIGSTR_6544", "ReplaceableTextures\\CommandButtons\\BTNMassTeleport.blp")
endfunction

function AddCountry takes string color_code, string name, playercolor color, string capture_msg, rect zone, rect start, integer selector, integer hero, integer special, integer priest returns integer
	local integer i = country_count
	
	set country_name[i] = "|cFF" + color_code + name + "|r"
	set country_color[i] = color
	set country_color_code[i] = color_code
	set country_capture_msg[i] = "захватил" + capture_msg
	set country_zone[i] = zone
	set country_start[i] = start
	set country_selector[i] = selector
	set country_hero[i] = hero
	set country_special[i] = special
	set country_priest[i] = priest
	set country_chosen[i] = false
	set country_count = country_count + 1
	
	return i
endfunction

function InitCountries takes nothing returns nothing
	set country_count = 0
	set egypt      = AddCountry("703020", "Египет",        PLAYER_COLOR_BROWN,      "",  rct_egypt_zone,      rct_egypt_start,      'N007', 'H008', 'h01Q', 'h001')
	set england    = AddCountry("C00020", "Англия",        PLAYER_COLOR_RED,        "а", rct_england_zone,    rct_england_start,    'N003', 'H626', 'n601', 'h613')
	set finland    = AddCountry("8A8A8A", "Финляндия",     PLAYER_COLOR_LIGHT_GRAY, "а", rct_finland_zone,    rct_finland_start,    'N00H', 'H01K', 'h616', 'h613')
	set france     = AddCountry("3050BB", "Франция",       PLAYER_COLOR_BLUE,       "а", rct_france_zone,     rct_france_start,     'N002', 'H625', 'h617', 'h60W')
	set germany    = AddCountry("905030", "Германия",      PLAYER_COLOR_BROWN,      "а", rct_germany_zone,    rct_germany_start,    'N008', 'H61Z', 'h61B', 'h613')
	set greece     = AddCountry("FF6010", "Греция",        PLAYER_COLOR_ORANGE,     "а", rct_greece_zone,     rct_greece_start,     'N00I', 'H01L', 'h61E', 'h60W')
	set hungary    = AddCountry("00EEDD", "Венгрия",       PLAYER_COLOR_CYAN,       "а", rct_hungary_zone,    rct_hungary_start,    'N004', 'H00C', 'h61D', 'h60W')
	set italy      = AddCountry("A030CC", "Италия",        PLAYER_COLOR_PURPLE,     "а", rct_italy_zone,      rct_italy_start,      'N00A', 'H00A', 'h614', 'h60W')
	set russia     = AddCountry("3060CC", "Киевская Русь", PLAYER_COLOR_LIGHT_BLUE, "а", rct_russia_zone,     rct_russia_start,     'N00F', 'H622', 'h61H', 'h613')
	set liban      = AddCountry("900020", "Ливан",         PLAYER_COLOR_RED,        "",  rct_liban_zone,      rct_liban_start,      'N00J', 'H01I', 'h61K', 'h002')
	set almohads   = AddCountry("FF8422", "Альмохады",     PLAYER_COLOR_ORANGE,     "и", rct_almohads_zone,   rct_almohads_start,   'N005', 'H627', 'h61J', 'h002')
	set moscow     = AddCountry("D020DD", "Московия",      PLAYER_COLOR_PINK,       "а", rct_moscow_zone,     rct_moscow_start,     'N00G', 'H01J', 'h61I', 'h613')
	set poland     = AddCountry("306020", "Польша",        PLAYER_COLOR_AQUA,       "а", rct_poland_zone,     rct_poland_start,     'N00C', 'H00B', 'h61F', 'h612')
	set spain      = AddCountry("F090EE", "Испания",       PLAYER_COLOR_PINK,       "а", rct_spain_zone,      rct_spain_start,      'N009', 'H623', 'h61L', 'h612')
	set sweden     = AddCountry("005090", "Швеция",        PLAYER_COLOR_LIGHT_BLUE, "а", rct_finland_zone,    rct_sweden_start,     'N00D', 'H624', 'h61A', 'h613')
	set turkey     = AddCountry("00FF00", "Турция",        PLAYER_COLOR_GREEN,      "а", rct_turkey_zone,     rct_turkey_start,     'N006', 'H621', 'n604', 'h001')
	set ukraine    = AddCountry("FFFF00", "Украина",       PLAYER_COLOR_YELLOW,     "а", rct_ukraine_zone,    rct_ukraine_start,    'N00E', 'H01M', 'h619', 'h612')
	set byzantine  = AddCountry("FFFF55", "Византия",      PLAYER_COLOR_YELLOW,     "а", rct_byzantine_zone,  rct_byzantine_start,  'N00B', 'H620', 'h61M', 'h60W')
	set beni_gania = AddCountry("4050CC", "Бени Гания",    PLAYER_COLOR_BLUE,       "а", rct_beni_gania_zone, rct_beni_gania_start, 'N00N', 'H020', 'h021', 'h002')
endfunction

function InitStatsMultiboard takes nothing returns nothing
	local integer i
	local integer j
	
	set i = 0
	set brd_last_index = 1
	loop
		if PlayerAlive(Player(i)) then
			set brd_last_index = brd_last_index + 1
			set player_stats_pos[i] = brd_last_index
		endif
		set i = i + 1
		exitwhen i > 12
	endloop
	
	set brd_stats = CreateMultiboardBJ(4, brd_last_index, "|cffFF8842 - Информация - ")
	
	call MultiboardDisplay(brd_stats, false)
	
	call MultiboardSetItemValueBJ(brd_stats, col_country, 1, "Страна")
	call MultiboardSetItemValueBJ(brd_stats, col_cities, 1, "Города")
	call MultiboardSetItemValueBJ(brd_stats, col_army, 1, "Армия")
	call MultiboardSetItemValueBJ(brd_stats, col_influence, 1, "Влияние")
	
	call MultiboardSetItemIconBJ(brd_stats, col_country, 1, "ReplaceableTextures\\CommandButtons\\BTNHumanCaptureFlag.blp")
	call MultiboardSetItemIconBJ(brd_stats, col_cities, 1, "ReplaceableTextures\\CommandButtons\\BTNTownHall.blp")
	call MultiboardSetItemIconBJ(brd_stats, col_army, 1, "ReplaceableTextures\\CommandButtons\\BTNHoldPosition.blp")
	call MultiboardSetItemIconBJ(brd_stats, col_influence, 1, "ReplaceableTextures\\CommandButtons\\BTNMassTeleport.blp")
	
	call MultiboardSetItemColorBJ(brd_stats, 0, 0, 100, 80., .0, 0)
	call MultiboardSetItemColorBJ(brd_stats, 0, 0, 100, 45., 10., 0)
	
	call MultiboardSetItemStyleBJ(brd_stats, 0, 0, true, false)
	call MultiboardSetItemStyleBJ(brd_stats, 0, 1, true, true)
	
	call MultiboardSetItemWidthBJ(brd_stats, col_country, 0, col_country_width)
	call MultiboardSetItemWidthBJ(brd_stats, col_cities, 0, col_cities_width)
	call MultiboardSetItemWidthBJ(brd_stats, col_army, 0, col_army_width)
	call MultiboardSetItemWidthBJ(brd_stats, col_influence, 0, col_influence_width)
	
	call StatsInitPlayer(Player(12))
	call MultiboardSetItemValueBJ(brd_stats, col_influence, player_stats_pos[12], "")
endfunction

function DetectHost takes nothing returns player
	local integer i
	local player p
	
	set i = 0
	loop
		set p = Player(i)
		if PlayerAlive(p) then
			set host = p
			return p
		endif
		set i = i + 1
		exitwhen i > 11
	endloop
	
	return null
endfunction

function GameInitialization takes nothing returns nothing
	local integer i
	call DetectHost()
	call CinematicFilterGenericBJ(0.00, BLEND_MODE_NONE, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 100, 100, 100, 100, 0, 0, 0, 0)
	
	set i = 0
	loop
		if Player(i) != host then
			call DisplayTimedTextToPlayer(Player(i), 0, 0, 30., "|cffffcc00Подождите, пока хост выберет режим игры")
		endif
		set i = i + 1
		exitwhen i > 11
	endloop
	
	call InitStatsMultiboard()
	
	call TimerStart(tmr_settings, settings_choose_time, false, null)
	set tdlg_settings = CreateTimerDialogBJ(tmr_settings, "Выбор режима:")	
	call ShowSettingsDialog()

	if host != GetLocalPlayer() then	
		call EnableUserUI(false)
		call EnableUserControl(false)
		call ShowInterface(false, 0.)
	endif
endfunction

function UnpauseEnumUnit takes nothing returns nothing
	call PauseUnit(GetEnumUnit(), false)
endfunction

function OnGameStart takes nothing returns nothing
	call DisableTrigger(GetTriggeringTrigger())
	call EnableTrigger(tgr_update_stats_army)
	call EnableTrigger(tgr_player_influence_changed)
	
	set bj_wantDestroyGroup = true
	call ForGroupBJ(GetUnitsInRectAll(bj_mapInitialPlayableArea), function UnpauseEnumUnit)
	
	call GroupAddGroup(g_cities, player_home_cities[13])
	call DestroyTimerDialog(tdlg_game_start)
	call TimerStart(tmr_taxes, taxes_period, true, null)
	set tdlg_taxes = CreateTimerDialogBJ(tmr_taxes, "Налоги:")
	call StartSound(snd_game_started)
	call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 20., "TRIGSTR_6387")
	call MultiboardDisplay(brd_stats, true)
	call EnableTrigger(tgr_taxes)
	set game_started = true
	
	if peace_time > 0 then
		call GlobalPeace(true)
		
		call TimerStart(tmr_peace, peace_time * 60., false, null)
		set tdlg_peace = CreateTimerDialogBJ(tmr_peace, "Перемирие:")	
	endif
endfunction

function HomeCityFilter takes nothing returns boolean
	return IsHomeCity(GetFilterUnit(), GetOwningPlayer(GetFilterUnit()))
endfunction

function ForeignCityFilter takes nothing returns boolean
	return IsForeignCity(GetFilterUnit(), GetOwningPlayer(GetFilterUnit()))
endfunction

function PlayerCityStateChanged takes player p, unit city, boolean taken returns nothing
	local integer pid
	local integer mult
	
	if taken then
		set mult = 1
	else
		set mult = -1
	endif
	
	set pid = GetPlayerId(p)
	set player_city_count[pid] = player_city_count[pid] + mult
	set player_required_influence[pid] = player_required_influence[pid] + CityGetRequiredInfluence(city, p) * mult

	call MultiboardSetItemValueBJ(brd_stats, col_cities, player_stats_pos[pid], brd_padding + I2S(player_city_count[pid]))
	call PlayerRecalcInfluence(p)
endfunction

function PlayerCityTaken takes player p, unit city returns nothing
	call PlayerCityStateChanged(p, city, true)
endfunction

function PlayerCityLost takes player p, unit city returns nothing
	call PlayerCityStateChanged(p, city, false)
endfunction

function DeclareIndependenceEnum takes nothing returns nothing
	local player p
	local integer pid
	local unit u
	
	set u = GetEnumUnit()
	set p = GetOwningPlayer(u)
	
	call PlayerCityLost(p, u)
	call PlayerCityTaken(Player(12), u)
	
	call SetUnitOwner(u, Player(12), true)
	
	call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 10., GetUnitName(u) + " |cffCDB79E(" + GetPlayerName(p) + "|cffCDB79E) объявил о своей независимости.")
	call PingMinimapForForceEx(bj_FORCE_ALL_PLAYERS, GetUnitX(u), GetUnitY(u), 3., 0, 100, 50., .0)
endfunction

function CheckPlayerInfluence takes player p returns nothing
	local integer pid
	local integer cities
	
	local group home_cities
	local group foreign_cities
	
	local group reb_home_cities
	local group reb_foreign_cities
	
	set pid = GetPlayerId(p)
	if player_influence[pid] >= player_required_influence[pid] then
		return
	endif
	
	set cities = player_city_count[pid]	
	call DisplayTimedTextToPlayer(p, 0, 0, 15., "|cffCDB79EРасширение невозможно, у вас не хватает влияния. Некоторые из ваших городов могут объявить независимость.")
	
	if cities <= 6 then
		return
	endif
	
	set home_cities = GetUnitsOfPlayerMatching(p, Condition(function HomeCityFilter))
	set foreign_cities = GetUnitsOfPlayerMatching(p, Condition(function ForeignCityFilter))
	
	if cities <= 12 then
		set reb_home_cities    = GetRandomSubGroup(GetRandomInt(1,2), home_cities)
		set reb_foreign_cities = GetRandomSubGroup(GetRandomInt(0,1), foreign_cities)
	elseif cities <= 22 then
		set reb_home_cities    = GetRandomSubGroup(GetRandomInt(2,3), home_cities)
		set reb_foreign_cities = GetRandomSubGroup(GetRandomInt(1,1), foreign_cities)
	elseif cities < 32 then
		set reb_home_cities    = GetRandomSubGroup(GetRandomInt(3,5), home_cities)
		set reb_foreign_cities = GetRandomSubGroup(GetRandomInt(1,2), foreign_cities)
	elseif cities < 42 then
		set reb_home_cities    = GetRandomSubGroup(GetRandomInt(4,6), home_cities)
		set reb_foreign_cities = GetRandomSubGroup(GetRandomInt(2,2), foreign_cities)
	else
		set reb_home_cities    = GetRandomSubGroup(GetRandomInt(5,8), home_cities)
		set reb_foreign_cities = GetRandomSubGroup(GetRandomInt(2,2), foreign_cities)
	endif
	
	call ForGroup(reb_home_cities,    function DeclareIndependenceEnum)
	call ForGroup(reb_foreign_cities, function DeclareIndependenceEnum)
	
	call GroupClear(home_cities)
	call GroupClear(foreign_cities)
	call GroupClear(reb_home_cities)
	call GroupClear(reb_foreign_cities)
endfunction

function OnTaxes takes nothing returns nothing
	local integer i
	local player p
	local integer pid
	local integer gathered_gold
	local integer gathered_lumber
	
	set i = 0
	loop
		set p = Player(i)
		set pid = GetPlayerId(p)
		
		set gathered_gold   = city_taxes_gold   * player_city_count[pid]
		set gathered_lumber = city_taxes_lumber * player_city_count[pid]
		
		call AdjustPlayerStateBJ(gathered_gold,   p, PLAYER_STATE_RESOURCE_GOLD)
		call AdjustPlayerStateBJ(gathered_lumber, p, PLAYER_STATE_RESOURCE_LUMBER)
		
		call DisplayTimedTextToPlayer(p, 0, 0, 15., "|cff00ff00Налоги собраны|r")
		call DisplayTimedTextToPlayer(p, 0, 0, 15., "|cffCDB79EПолучено |cffffcc00" + I2S(gathered_gold) + " |cffCDB79Eзолота.|r")
		call DisplayTimedTextToPlayer(p, 0, 0, 15., "|cffCDB79EПолучено |cffffcc00" + I2S(gathered_lumber) + " |cffCDB79Eдревисины.|r")
		call DisplayTimedTextToPlayer(p, 0, 0, 15., " ")
	
		call DisplayTimedTextToPlayer(p, 0, 0, 15., "|cff00ff00Влияние: |cffffcc00" + I2S(player_influence[pid]) + " |cffCDB79E= |cffffcc00" + I2S(PlayerArmyInfluence(p)) + " |cffCDB79E(армия) + |cffffcc00" + I2S(PlayerScienceInfluence(p)) + " |cffCDB79E(наука)")
		call DisplayTimedTextToPlayer(p, 0, 0, 15., "|cffff0000Необходимо влияния: |cffffcc00" + I2S(player_required_influence[pid]))
		
		call CheckPlayerInfluence(p)
		set i = i + 1
		exitwhen i > 11
	endloop
endfunction

function OnCityCaptured takes nothing returns nothing
	local player old_owner
	local player new_owner

	local unit city
	local string capture_msg
	
	set city = GetTriggerUnit()
	set new_owner = GetOwningPlayer(GetAttacker())
	set old_owner = GetOwningPlayer(city)
	
	if new_owner == old_owner then
		return
	endif
	
	if not IsCity(city) or GetUnitStateSwap(UNIT_STATE_LIFE, city) > 500. then
		return
	endif
	
	set capture_msg = country_capture_msg[player_country[GetPlayerId(new_owner)]]

	call SetUnitLifePercentBJ(GetTriggerUnit(), 100.)
	call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 10., GetPlayerName(new_owner) + " |cffCDB79E" + capture_msg + " " + GetUnitName(city) + " |cffCDB79E(" + GetPlayerName(old_owner) + "|cffCDB79E).")
	call PingMinimapForForceEx(bj_FORCE_ALL_PLAYERS, GetUnitX(city), GetUnitY(city), 3., 0, 100, 50., .0)
	
	call SetUnitOwner(city, new_owner, true)
	
	call PlayerCityTaken(new_owner, city)
	call PlayerCityLost(old_owner, city)
endfunction

function OnCityDestroyed takes nothing returns nothing
	local unit city
	local player p
	
	set city = GetDyingUnit()
	set p = GetOwningPlayer(city)
	
	if not IsCity(city) then
		return
	endif
	
	call PlayerCityLost(p, city)
	
	call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 10., "|cffCDB79EГород " + GetUnitName(city) + " |cffCDB79E(" + GetPlayerName(p) + "|cffCDB79E) был уничтожен.")
	call PingMinimapForForceEx(bj_FORCE_ALL_PLAYERS, GetUnitX(city), GetUnitY(city), 3., 0, 100, 50., .0)
endfunction

function UpdateStatsArmy takes nothing returns nothing
	local integer i
	local player p
	set i = 0
	loop
		set p = Player(i)
		if PlayerAlive(p) and player_country[i] != -1 then
			call MultiboardSetItemValueBJ(brd_stats, col_army, player_stats_pos[GetPlayerId(p)], brd_padding + I2S(GetPlayerState(p, PLAYER_STATE_RESOURCE_FOOD_USED)))
		endif
		set i = i + 1
		exitwhen i > 12
	endloop
endfunction

function OnPlayerInfluenceChanged takes nothing returns nothing
	local player p
	set p = GetOwningPlayer(GetTriggerUnit())
	if GetPlayerId(p) <= 12 then
		call PlayerRecalcInfluence(p)
	endif
endfunction

function PlayerSetCountry takes player p, integer country returns nothing
	local integer i
	local integer pid
	local unit capital
	local unit hero
	local unit militia
	local unit worker
	
	local real start_x
	local real start_y
	
	if country_chosen[country] then
		return
	endif
	
	set country_chosen[country] = true
	
	call SetAllPlayersTechMaxAllowed(country_selector[country], 0)
	
	set pid = GetPlayerId(p)
	
	if mod_anonymity then
		set player_nick[pid] = anonym_name
	else
		set player_nick[pid] = GetPlayerName(p)
	endif
	
	set player_country[pid] = country
	set player_home_cities[pid] = GetUnitsInRectMatching(country_zone[country], Condition(function IsCityFilter))
	
	call SetPlayerName(p, country_name[country])
	call SetPlayerColor(p, country_color[country])
	
	set start_x = GetRectCenterX(country_start[country])
	set start_y = GetRectCenterY(country_start[country])
	
	call PlayerSetCameraLevel(p, 3)
	call PanCameraToTimedForPlayer(p, start_x, start_y, 0)

	if not mod_anonymity then
		call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 15., player_nick[pid] + " |cff426242выбрал " + country_name[country])
	endif
	
	set capital = CreateUnit(p, 'h600', start_x, start_y, bj_UNIT_FACING)
	set hero    = CreateUnit(p, country_hero[country], start_x, start_y, bj_UNIT_FACING)
	
	call UnitAddItemByIdSwapped('I001', hero)
	call UnitAddItemByIdSwapped('I000', hero)
	
	set i = 1
	loop
		set militia = CreateUnit(p, 'h60O', start_x, start_y, bj_UNIT_FACING)
		if not game_started then
			call PauseUnit(militia, true)
		endif
		set i = i + 1
		exitwhen i > player_initial_militia
	endloop
	
	set worker = CreateUnit(p, 'h60J', start_x, start_y, bj_UNIT_FACING)
	
	if not game_started then
		call PauseUnit(capital, true)
		call PauseUnit(hero, true)
		call PauseUnit(worker, true)
	endif
	
	if IsSouthCountry(country) then
		call ForceAddPlayer(f_south_players, p)
		call SetPlayerUnitAvailableBJ('h610', false, p)
		call SetPlayerUnitAvailableBJ('h60Y', false, p)
		call SetPlayerUnitAvailableBJ('h60Z', false, p)
		call SetPlayerUnitAvailableBJ('n602', false, p)
		call SetPlayerUnitAvailableBJ('h03F', false, p)
		call SetPlayerUnitAvailableBJ('h045', false, p)
		call SetPlayerUnitAvailableBJ('n000', false, p)
		call SetPlayerUnitAvailableBJ('h025', false, p)
		call SetPlayerUnitAvailableBJ('h01Y', false, p)
		call SetPlayerUnitAvailableBJ('o600', false, p)
		call SetPlayerUnitAvailableBJ('h60I', false, p)
		call SetPlayerUnitAvailableBJ('h60E', false, p)
		call SetPlayerUnitAvailableBJ('h60F', false, p)
		call SetPlayerUnitAvailableBJ('h606', false, p)
		call SetPlayerUnitAvailableBJ('h60G', false, p)
		call SetPlayerUnitAvailableBJ('h60C', false, p)
		call SetPlayerUnitAvailableBJ('h607', false, p)
		call SetPlayerUnitAvailableBJ('h609', false, p)
	else
		call ForceAddPlayer(f_north_players, p)
		call SetPlayerUnitAvailableBJ('h61X' ,false, p)
		call SetPlayerUnitAvailableBJ('h61R', false, p)
		call SetPlayerUnitAvailableBJ('h61S', false, p)
		call SetPlayerUnitAvailableBJ('n000', false, p)
		call SetPlayerUnitAvailableBJ('n602', false, p)
		call SetPlayerUnitAvailableBJ('h60N', false, p)
		call SetPlayerUnitAvailableBJ('h026', false, p)
		call SetPlayerUnitAvailableBJ('h60R', false, p)
		call SetPlayerUnitAvailableBJ('h628', false, p)
		call SetPlayerUnitAvailableBJ('o003', false, p)
		call SetPlayerUnitAvailableBJ('h61W', false, p)
		call SetPlayerUnitAvailableBJ('h61U', false, p)
		call SetPlayerUnitAvailableBJ('h61V', false, p)
		call SetPlayerUnitAvailableBJ('h022', false, p)
		call SetPlayerUnitAvailableBJ('h037', false, p)
		call SetPlayerUnitAvailableBJ('h03C', false, p)
		call SetPlayerUnitAvailableBJ('h03D', false, p)
		call SetPlayerUnitAvailableBJ('h03E', false, p)
	endif
	
	if country == finland or country == sweden then
		call GroupAddUnit(player_home_cities[pid], city_halmstad)
	elseif country == germany then
		call GroupRemoveUnit(player_home_cities[pid], city_halmstad)
	elseif country == france then
		call GroupAddUnit(player_home_cities[pid], city_marcel)
	elseif country == italy then
		call SetPlayerTechMaxAllowedSwap('R001', 1, p)
	endif
	
	call SetPlayerUnitAvailableBJ(country_special[country], true, p)
	call SetPlayerUnitAvailableBJ(country_priest[country], true, p)
	
	call StatsInitPlayer(p)
	call PlayerRecalcInfluence(p)
endfunction

function PlayerSetRandomCountry takes player p returns nothing
	local integer pid
	set pid = GetPlayerId(p)
	
	if player_random_country[pid] == -1 then
		call PlayerSetupRandomCountry(p)
	endif
	call PlayerSetCountry(p, player_random_country[pid])
endfunction

function OnPlayerCountryChosen takes nothing returns nothing
	local player p
	
	local integer i
	local integer country
	local unit selector
	local integer selector_id

	if GetSellingUnit() != unit_north_countries and GetSellingUnit() != unit_south_countries then
		return
	endif
	
	set selector    = GetSoldUnit()
	set selector_id = GetUnitTypeId(selector)
	set p           = GetOwningPlayer(selector)

	call RemoveUnit(GetBuyingUnit())
	
	call SetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD,   player_initial_gold)
	call SetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER, player_initial_lumber)
	
	if selector_id == random_country then
		call PlayerSetRandomCountry(p)
	else
		set i = 0
		loop
			if selector_id == country_selector[i] then
				set country = i
				exitwhen true
			endif
			set i = i + 1
			exitwhen i == country_count
		endloop

		call PlayerSetCountry(p, country)
	endif
	
	if player_country[GetPlayerId(p)] != -1 then
		call RemoveUnit(selector)
	endif
endfunction

function OnCapitalUpgrade takes nothing returns nothing
	local player p
	local integer pid
	local integer level
	local unit u
	
	set u = GetTriggerUnit()
	set level = GetCapitalLevel(GetUnitTypeId(u))
	
	if level == -1 then
		return
	endif
	
	set p = GetOwningPlayer(u)
	set pid = GetPlayerId(p)
	
	if level <= player_age[pid] then
		return
	endif
	
	set player_age[pid] = level
	call SetPlayerTechResearched(p, age_tech_id[level], 1)
	
	if IsNorthCountry(player_country[GetPlayerId(p)]) then
		if level == 3 then
			call SetPlayerUnitAvailableBJ('n000', true,  p)
			call SetPlayerUnitAvailableBJ('n600', false, p)
			call SetPlayerUnitAvailableBJ('h60N', true,  p)
			call SetPlayerUnitAvailableBJ('h60L', false, p)
		elseif level == 4 then
			call SetPlayerUnitAvailableBJ('h60R', true,  p)
			call SetPlayerUnitAvailableBJ('n602', true,  p)
			call SetPlayerUnitAvailableBJ('n000', false, p)
			call SetPlayerUnitAvailableBJ('h60Q', false, p)
			call SetPlayerUnitAvailableBJ('h628', true,  p)
			call SetPlayerUnitAvailableBJ('h60P', false, p)
		endif
	else
		if level == 3 then
			call SetPlayerUnitAvailableBJ('h03F', true,  p)
			call SetPlayerUnitAvailableBJ('h03Q', false, p)
		elseif level == 4 then
			call SetPlayerUnitAvailableBJ('h01Y', true,  p)
			call SetPlayerUnitAvailableBJ('h01X', false, p)
		elseif level == 5 then
			call SetPlayerUnitAvailableBJ('h045', true,  p)
			call SetPlayerUnitAvailableBJ('h03F', false, p)
		endif
	endif
	
	call PlaySoundOnUnitBJ(snd_capital_upgrade, 'd', u)
	call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 15., GetPlayerName(p) + " достиг |cffffcc00" + capital_upgrade_name[level] + "|r.")
endfunction

function KillSelectorEnum takes nothing returns nothing
	local player p
	
	set p = GetOwningPlayer(GetEnumUnit())
	if PlayerAlive(p) then
		call PlayerSetRandomCountry(p)
	endif
	call RemoveUnit(GetEnumUnit())
endfunction

function OnCountryChooseTimeout takes nothing returns nothing
	set bj_wantDestroyGroup = true
	call ForGroupBJ(GetUnitsInRectAll(rct_country_choose), function KillSelectorEnum)
endfunction

function OnUnitUpgraded takes nothing returns nothing
	local unit u
	local integer uid
	local boolean recreate
	local player p
	
	set u = GetTriggerUnit()
	set uid = GetUnitTypeId(u)
	set p = GetOwningPlayer(u)
	set recreate = false
	
	if uid == 'h029' then // outpost -> fort
		if IsPlayerInForce(p, f_north_players) then
			call RemoveUnitFromStock(u, 'h026')
		else
			call RemoveUnitFromStock(u, 'h025')
		endif
	elseif uid == 'h02D' or uid == 'h029' or uid == 'h02B' or uid == 'h02C' then
		set recreate = true
	elseif uid == 'h01R' then
		call RemoveUnit(u)
		call AdjustPlayerStateBJ(300, p, PLAYER_STATE_RESOURCE_LUMBER)
	endif
	
	if recreate then
		call RemoveUnit(u)
		call CreateUnit(p, uid, GetUnitX(u), GetUnitY(u), bj_UNIT_FACING)
	endif
endfunction

function OnCardinalsResearched takes nothing returns nothing
	if GetResearched() == 'R001' then
		call SetPlayerUnitAvailableBJ('h035', true, GetOwningPlayer(GetTriggerUnit()))
	endif
endfunction

function OnBarracksSwitch takes nothing returns nothing
	if GetSpellAbilityId() == 'A000' or GetSpellAbilityId() == 'Arav' then
		call SetUnitAnimation(GetTriggerUnit(), "stand")
	endif
endfunction

function OnAdvTowerDeath takes nothing returns nothing
	local unit u
	set u = GetTriggerUnit()
	if GetUnitTypeId(u) == 'h00F' then
		call RemoveUnit(u)
		call AddSpecialEffectTargetUnitBJ("origin", u, "Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl")
	endif
endfunction

function OnNeutralAutoUpgrade takes nothing returns nothing
	local player p
	set p = Player(12)
	call SetPlayerTechResearchedSwap('Rhde', 1, p)
	call TriggerSleepAction(200.)
	call SetPlayerTechResearchedSwap('Rhme', 1, p)
	call SetPlayerTechResearchedSwap('Rhar', 1, p)
	call SetPlayerTechResearchedSwap('Rhla', 1, p)
	call SetPlayerTechResearchedSwap('Rora', 1, p)
	call TriggerSleepAction(400.)
	call SetPlayerTechResearchedSwap('Rhme', 2, p)
	call SetPlayerTechResearchedSwap('Rhar', 2, p)
	call SetPlayerTechResearchedSwap('Rhla', 2, p)
	call SetPlayerTechResearchedSwap('Rora', 2, p)
	call TriggerSleepAction(600.)
	call SetPlayerTechResearchedSwap('Rhme', 3, p)
	call SetPlayerTechResearchedSwap('Rhar', 3, p)
	call SetPlayerTechResearchedSwap('Rhla', 3, p)
	call SetPlayerTechResearchedSwap('Rora', 3, p)
	call SetPlayerTechResearchedSwap('Rhss', 1, p)
	call TriggerSleepAction(800.)
	call SetPlayerTechResearchedSwap('Rhss', 2, p)
	call SetPlayerTechResearchedSwap('Rhra', 1, p)
	call SetPlayerTechResearchedSwap('Rhme', 4, p)
	call SetPlayerTechResearchedSwap('Rhar', 4, p)
	call SetPlayerTechResearchedSwap('Rhla', 4, p)
	call SetPlayerTechResearchedSwap('Rora', 4, p)
	call TriggerSleepAction(1000.)
	call SetPlayerTechResearchedSwap('Rhra', 2, p)
	call SetPlayerTechResearchedSwap('Rhme', 5, p)
	call SetPlayerTechResearchedSwap('Rhar', 5, p)
	call SetPlayerTechResearchedSwap('Rhla', 5, p)
	call SetPlayerTechResearchedSwap('Rora', 5, p)
endfunction

function OnPirateFrigateSold takes nothing returns nothing
	if GetUnitTypeId(GetSoldUnit()) == 'h00D' then
		call SetUnitColor(GetSoldUnit(), ConvertPlayerColor(12))
	endif
endfunction

function OnItemTaken takes nothing returns nothing
	local integer i
	local integer n
	local unit u
	local item itm
	
	set u = GetManipulatingUnit()
	set itm = GetManipulatedItem()
	
	if GetItemType(itm) != ITEM_TYPE_PERMANENT then
		return
	endif
		
	set n = 0
	set i = 0
	loop
		if GetItemType(UnitItemInSlot(u, i)) == GetItemType(itm) then
			set n = n + 1
		endif
		set i = i + 1
		exitwhen i > 5
	endloop
	
	if n > 1 then
		call UnitRemoveItemSwapped(itm, GetManipulatingUnit())
		call DisplayTimedTextToPlayer(GetOwningPlayer(u), 0, 0, 10., "Вы можете носить только одну корону.")
	endif
endfunction

function OnChargedAttack takes nothing returns nothing
	local unit attacked
	local texttag tag
	
	if UnitHasBuffBJ(GetAttacker(), 'B004') then
		set attacked = GetTriggerUnit()
		call UnitRemoveAbility(GetAttacker(), 'B004')
		call SetWidgetLife(attacked, GetUnitStateSwap(UNIT_STATE_LIFE, attacked) - 10.)

		set tag = CreateTextTagUnitBJ("|cffff000010", attacked, 0, 10,'d','d','d',0) 
		call SetTextTagPermanent(tag, false)
		call SetTextTagLifespan(tag, 5.)
		call SetTextTagFadepoint(tag, 3.)
		call SetTextTagVelocityBJ(tag, 46., 90)
		call PolledWait(5.)
		call DestroyTextTag(tag)
	endif
endfunction

function OnSacrificeCasted takes nothing returns nothing
	if GetSpellAbilityId() == 'A00E' then
		call AddSpecialEffectTargetUnitBJ("overhead", GetTriggerUnit(), "Abilities\\Spells\\Orc\\Disenchant\\DisenchantSpecialArt.mdl")
		call SetWidgetLife(GetTriggerUnit(), GetUnitStateSwap(UNIT_STATE_LIFE, GetTriggerUnit()) / 2.)
	endif
endfunction

function OnPlayerGoldLimitReached takes nothing returns nothing
	call SetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD, gold_limit)
endfunction

function OnPlayerLumberLimitReached takes nothing returns nothing
	call SetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER, lumber_limit)
endfunction

function OnChatMsgCamera takes nothing returns nothing
	call PlayerSetCameraLevel(GetTriggerPlayer(), S2I(GetEventPlayerChatString()))
endfunction

function OnChatMsgNames takes nothing returns nothing
	local integer i
	local player sender
	local player p
	
	set sender = GetTriggerPlayer()
	if mod_anonymity then
		call DisplayTimedTextToPlayer(sender, 0, 0, 15., "|cffffcc00В режиме анонимности вы не можете узнать ники игроков!")
		return
	endif
	
	set i = 0
	loop
		set p = Player(i)
		if PlayerAlive(p) then
			call DisplayTimedTextToPlayer(sender, 0, 0, 15., player_nick[i] + " - " + GetPlayerName(p))
		endif
		set i = i + 1
		exitwhen i > 11
	endloop
endfunction

function OnPlayerLeave takes nothing returns nothing
	local player p
	local integer pid
	
	set p = GetTriggerPlayer()
	set pid = GetPlayerId(p)
	
	call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 30., GetPlayerName(p) + " вышел из игры!")
	call SetPlayerName(p, "|cff444444" + GetPlayerName(p))
	call MultiboardSetItemValueBJ(brd_stats, col_country, player_stats_pos[pid], player_nick[pid])
endfunction

function OnSettingsChooseTimeout takes nothing returns nothing
	call StartGame()
endfunction

function Initialization takes nothing returns nothing
	call SetMapFlag(MAP_LOCK_ALLIANCE_CHANGES, false)
	call InitNeutralForces()
	call InitQuests()
	call InitCountries()
	call InitPlayers()
	
	call TriggerSleepAction(5.)
	call StartSound(snd_game_enter)
endfunction

function OnPeaceTimeExpired takes nothing returns nothing
	call GlobalPeace(false)
	
	call DestroyTimerDialog(tdlg_peace)
	call PauseTimer(tmr_peace)
	call DestroyTimer(tmr_peace)
	
	call StartSound(snd_peace_time_expired)
	call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 10., "|cffffcc00Настал час молота!")
endfunction

function OnPlayerAllianceChanged takes nothing returns nothing
	if react_alliance_change and love_and_peace then
		call GlobalPeace(true)
	endif
endfunction

function InitTriggers2 takes nothing returns nothing
	local integer i
	local integer j
	local player p
	
	set tgr_chat_msg_camera = CreateTrigger()
	set tgr_chat_msg_names = CreateTrigger()
	set tgr_player_gold_limit_reached = CreateTrigger()
	set tgr_player_lumber_limit_reached = CreateTrigger()
	set tgr_player_leave = CreateTrigger()
	set tgr_player_alliance_changed = CreateTrigger()
	
	set tgr_player_country_chosen = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(tgr_player_country_chosen, EVENT_PLAYER_UNIT_SELL)
	call TriggerAddAction(tgr_player_country_chosen, function OnPlayerCountryChosen)
	
	set tgr_game_start = CreateTrigger()
	call TriggerRegisterTimerExpireEvent(tgr_game_start, tmr_game_start)
	call TriggerAddAction(tgr_game_start, function OnGameStart)
	
	set tgr_settings_choose_timeout = CreateTrigger()
	call TriggerRegisterTimerExpireEvent(tgr_settings_choose_timeout, tmr_settings)
	call TriggerAddAction(tgr_settings_choose_timeout, function OnSettingsChooseTimeout)

	set tgr_peace_time_expired = CreateTrigger()
	call TriggerRegisterTimerExpireEvent(tgr_peace_time_expired, tmr_peace)
	call TriggerAddAction(tgr_peace_time_expired, function OnPeaceTimeExpired)
	
	set i = 0
	loop
		set p = Player(i)
		set j = 1
		loop
			call TriggerRegisterPlayerChatEvent(tgr_chat_msg_camera, p, I2S(j), true)
			set j = j + 1
			exitwhen j > 5
		endloop
		
		call TriggerRegisterPlayerChatEvent(tgr_chat_msg_names, p, "-names", true)
		call TriggerRegisterPlayerStateEvent(tgr_player_gold_limit_reached, p, PLAYER_STATE_RESOURCE_GOLD, GREATER_THAN, gold_limit)
		call TriggerRegisterPlayerStateEvent(tgr_player_lumber_limit_reached, p, PLAYER_STATE_RESOURCE_LUMBER, GREATER_THAN, lumber_limit)
		call TriggerRegisterPlayerEventLeave(tgr_player_leave, p)
		call TriggerRegisterPlayerEventAllianceChanged(tgr_player_alliance_changed, p)
		
		set i = i + 1
		exitwhen i > 11
	endloop
	
	call TriggerAddAction(tgr_chat_msg_camera, function OnChatMsgCamera)
	call TriggerAddAction(tgr_chat_msg_names, function OnChatMsgNames)
	call TriggerAddAction(tgr_player_gold_limit_reached, function OnPlayerGoldLimitReached)
	call TriggerAddAction(tgr_player_lumber_limit_reached, function OnPlayerLumberLimitReached)
	call TriggerAddAction(tgr_player_leave, function OnPlayerLeave)
	call TriggerAddAction(tgr_player_alliance_changed, function OnPlayerAllianceChanged)
endfunction

function OnTomeOfLearningPicked takes nothing returns nothing
	local item itm
	local unit u
	
	set u = GetManipulatingUnit()
	set itm = GetManipulatedItem()
	
	if GetItemTypeId(itm) == 'tgxp' then
		if IsUnitType(u, UNIT_TYPE_HERO) then
			call UnitAddItemByIdSwapped('I005', u)
		else
			call CreateItem(GetItemTypeId(itm), GetUnitX(u), GetUnitY(u))
		endif
	endif
endfunction

function OnFriendlyUnitAttacked takes nothing returns nothing
	local player p
	set p = GetOwningPlayer(GetTriggerUnit())
	if not love_and_peace or p == GetOwningPlayer(GetAttacker()) or GetPlayerId(p) > 11 then
		return
	endif
	call ExplodeUnitBJ(GetAttacker())
endfunction

function InitTriggers takes nothing returns nothing
	local trigger t
	set tgr_tome_of_learning_picked = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(tgr_tome_of_learning_picked, EVENT_PLAYER_UNIT_PICKUP_ITEM)
	call TriggerAddAction(tgr_tome_of_learning_picked, function OnTomeOfLearningPicked)
	
	set tgr_country_choose_timeout = CreateTrigger()
	call TriggerRegisterTimerEventSingle(tgr_country_choose_timeout, country_choose_time)
	call TriggerAddAction(tgr_country_choose_timeout, function OnCountryChooseTimeout)
	
	set tgr_settings_dialog_button_clicked = CreateTrigger()
	call TriggerRegisterDialogEvent(tgr_settings_dialog_button_clicked, dlg_settings)
	call TriggerAddAction(tgr_settings_dialog_button_clicked, function OnSettingsDialogButtonClicked)
	
	set tgr_game_initialization = CreateTrigger()
	call TriggerRegisterTimerEventSingle(tgr_game_initialization, 0.01)
	call TriggerAddAction(tgr_game_initialization, function GameInitialization)
	
	set tgr_taxes = CreateTrigger()
	call DisableTrigger(tgr_taxes)
	call TriggerRegisterTimerExpireEvent(tgr_taxes, tmr_taxes)
	call TriggerAddAction(tgr_taxes, function OnTaxes)
	
	set tgr_city_captured = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(tgr_city_captured, EVENT_PLAYER_UNIT_ATTACKED)
	call TriggerAddAction(tgr_city_captured, function OnCityCaptured)
	
	set tgr_city_destroyed = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(tgr_city_destroyed, EVENT_PLAYER_UNIT_DEATH)
	call TriggerAddAction(tgr_city_destroyed, function OnCityDestroyed)
	
	set tgr_update_stats_army = CreateTrigger()
	call DisableTrigger(tgr_update_stats_army)
	call TriggerRegisterAnyUnitEventBJ(tgr_update_stats_army, EVENT_PLAYER_UNIT_TRAIN_START)
	call TriggerRegisterAnyUnitEventBJ(tgr_update_stats_army, EVENT_PLAYER_UNIT_SELL)
	call TriggerRegisterAnyUnitEventBJ(tgr_update_stats_army, EVENT_PLAYER_UNIT_DEATH)
	call TriggerRegisterAnyUnitEventBJ(tgr_update_stats_army, EVENT_PLAYER_UNIT_TRAIN_CANCEL)
	call TriggerAddAction(tgr_update_stats_army, function UpdateStatsArmy)
	
	set tgr_player_influence_changed = CreateTrigger()
	call DisableTrigger(tgr_player_influence_changed)
	call TriggerRegisterAnyUnitEventBJ(tgr_player_influence_changed, EVENT_PLAYER_UNIT_TRAIN_START)
	call TriggerRegisterAnyUnitEventBJ(tgr_player_influence_changed, EVENT_PLAYER_UNIT_TRAIN_FINISH)
	call TriggerRegisterAnyUnitEventBJ(tgr_player_influence_changed, EVENT_PLAYER_UNIT_TRAIN_CANCEL)
	call TriggerRegisterAnyUnitEventBJ(tgr_player_influence_changed, EVENT_PLAYER_UNIT_SELL)
	call TriggerRegisterAnyUnitEventBJ(tgr_player_influence_changed, EVENT_PLAYER_UNIT_RESEARCH_FINISH)
	call TriggerRegisterAnyUnitEventBJ(tgr_player_influence_changed, EVENT_PLAYER_UNIT_DEATH)
	call TriggerAddAction(tgr_player_influence_changed, function OnPlayerInfluenceChanged)

	set tgr_capital_upgrade = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(tgr_capital_upgrade, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
	call TriggerAddAction(tgr_capital_upgrade, function OnCapitalUpgrade)
	
	set tgr_unit_upgraded = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(tgr_unit_upgraded, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
	call TriggerAddAction(tgr_unit_upgraded, function OnUnitUpgraded)
	
	set tgr_cardinals_researched = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(tgr_cardinals_researched, EVENT_PLAYER_UNIT_RESEARCH_FINISH)
	call TriggerAddAction(tgr_cardinals_researched, function OnCardinalsResearched)
	
	set tgr_barracks_switch = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(tgr_barracks_switch, EVENT_PLAYER_UNIT_SPELL_FINISH)
	call TriggerAddAction(tgr_barracks_switch, function OnBarracksSwitch)
	
	set tgr_adv_tower_death = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(tgr_adv_tower_death, EVENT_PLAYER_UNIT_DEATH)
	call TriggerAddAction(tgr_adv_tower_death, function OnAdvTowerDeath)
	
	set tgr_neutral_auto_upgrade = CreateTrigger()
	call TriggerRegisterTimerEventSingle(tgr_neutral_auto_upgrade, 240.)
	call TriggerAddAction(tgr_neutral_auto_upgrade, function OnNeutralAutoUpgrade)
	
	set tgr_pirate_frigate_sold = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(tgr_pirate_frigate_sold, EVENT_PLAYER_UNIT_SELL)
	call TriggerAddAction(tgr_pirate_frigate_sold, function OnPirateFrigateSold)
	
	set tgr_item_taken = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(tgr_item_taken, EVENT_PLAYER_UNIT_PICKUP_ITEM)
	call TriggerAddAction(tgr_item_taken, function OnItemTaken)
	
	set tgr_charged_attack = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(tgr_charged_attack, EVENT_PLAYER_UNIT_ATTACKED)
	call TriggerAddAction(tgr_charged_attack, function OnChargedAttack)
	
	set t = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_ATTACKED)
	call TriggerAddAction(t, function OnFriendlyUnitAttacked)
	
	set tgr_sacrifice_casted = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(tgr_sacrifice_casted, EVENT_PLAYER_UNIT_SPELL_FINISH)
	call TriggerAddAction(tgr_sacrifice_casted, function OnSacrificeCasted)
		
	call InitTriggers2()
	
	set tgr_initialization = CreateTrigger()
	call TriggerAddAction(tgr_initialization, function Initialization)
	
	call ConditionalTriggerExecute(tgr_initialization)
endfunction

function InitCustomTeams takes nothing returns nothing
    call SetPlayerTeam(Player(0), 0)
    call SetPlayerTeam(Player(1), 1)
    call SetPlayerTeam(Player(2), 1)
    call SetPlayerTeam(Player(3), 1)
    call SetPlayerTeam(Player(4), 1)
    call SetPlayerTeam(Player(5), 1)
    call SetPlayerTeam(Player(6), 1)
    call SetPlayerTeam(Player(7), 1)
    call SetPlayerTeam(Player(8), 1)
    call SetPlayerTeam(Player(9), 1)
    call SetPlayerTeam(Player(10), 1)
    call SetPlayerTeam(Player(11), 1)
endfunction

function CreateRegions takes nothing returns nothing
	set rct_egypt_start=Rect(12000.,-12032.,12192.,-11808.)
	set rct_liban_start=Rect(15264.,-9760.,15456.,-9536.)
	set rct_turkey_start=Rect(17568.,-6432.,17760.,-6208.)
	set rct_greece_start=Rect(7104.,-5536.,7296.,-5312.)
	set rct_hungary_start=Rect(6016.,-2112.,6208.,-1888.)
	set rct_russia_start=Rect(15744.,4704.,15936.,4928.)
	set rct_moscow_start=Rect(17536.,9056.,17728.,9280.)
	set rct_finland_start=Rect(2112.,6112.,2304.,6336.)
	set rct_sweden_start=Rect(4128.,4992.,4320.,5216.)
	set rct_ukraine_start=Rect(13088.,-288.,13280.,-64.)
	set rct_italy_start=Rect(1856.,-5152.,2048.,-4928.)
	set rct_spain_start=Rect(-8512.,-4800.,-8320.,-4576.)
	set rct_almohads_start=Rect(-11616.,-9248.,-11424.,-9024.)
	set rct_england_start=Rect(-3552.,3200.,-3360.,3424.)
	set rct_france_start=Rect(-2976.,-1376.,-2784.,-1152.)
	set rct_germany_start=Rect(2784.,960.,2976.,1184.)
	set rct_poland_start=Rect(8288.,3456.,8480.,3680.)
	set rct_byzantine_start=Rect(9856.,-6880.,10048.,-6656.)
	set rct_beni_gania_start=Rect(-1760.,-8960.,-1568.,-8736.)
	
	set rct_england_zone=Rect(-10368.,-192.,-1152.,11296.)
	set rct_finland_zone=Rect(992.,4896.,9472.,11552.)
	set rct_moscow_zone=Rect(9056.,3648.,20320.,11424.)
	set rct_russia_zone=Rect(10944.,-2112.,20224.,9504.)
	set rct_ukraine_zone=Rect(8672.,-2176.,18688.,3904.)
	set rct_turkey_zone=Rect(12736.,-11424.,19200.,-1472.)
	set rct_byzantine_zone=Rect(6432.,-9760.,16384.,-3360.)
	set rct_egypt_zone=Rect(352.,-12320.,19392.,-10528.)
	set rct_beni_gania_zone=Rect(-6080.,-12352.,3360.,-7520.)
	set rct_almohads_zone=Rect(-12224.,-12192.,-2496.,-7296.)
	set rct_hungary_zone=Rect(2848.,-6048.,11392.,768.)
	set rct_poland_zone=Rect(4448.,-1088.,12448.,4992.)
	set rct_italy_zone=Rect(-2400.,-6912.,4992.,-1312.)
	set rct_france_zone=Rect(-6240.,-3520.,-832.,2112.)
	set rct_spain_zone=Rect(-11296.,-6656.,-3840.,-2528.)
	set rct_germany_zone=Rect(-928.,-2016.,6176.,4896.)
	set rct_greece_zone=Rect(2816.,-8480.,10688.,-1536.)
	set rct_liban_zone=Rect(11232.,-12512.,19840.,-3616.)
	
	set rct_country_choose = Rect(-12288.,10688.,-11232.,11744.)
endfunction

function CreateUnits takes nothing returns nothing
	local player p
	local unit u
	set p=Player(12)
	set city_halmstad=CreateUnit(p,'h007',3776.,3584.,270.)
	set city_marcel=CreateUnit(p,'h03K',-1472.,-3904.,270.)
	call CreateUnit(p,'h04X',-12096.,-10624.,270.)
	call CreateUnit(p,'h06Y',-11840.,-8512.,270.)
	call CreateUnit(p,'h04H',-9984.,-7616.,270.)
	call CreateUnit(p,'h065',-832.,-10240.,270.)
	call CreateUnit(p,'h064',-3072.,-10368.,270.)
	call CreateUnit(p,'h02V',7744.,5568.,270.)
	call CreateUnit(p,'h00K',-256.,-8128.,270.)
	call CreateUnit(p,'h00Q',10304.,-11584.,270.)
	call CreateUnit(p,'h00U',18368.,-9728.,270.)
	call CreateUnit(p,'h04V',17280.,-6720.,270.)
	call CreateUnit(p,'h04A',15488.,-1984.,270.)
	call CreateUnit(p,'h04B',17088.,-1728.,270.)
	call CreateUnit(p,'h03J',-2112.,-2112.,270.)
	call CreateUnit(p,'h03A',-3072.,-896.,270.)
	call CreateUnit(p,'h011',-3008.,-2752.,270.)
	call CreateUnit(p,'h03G',-5056.,-1472.,270.)
	call CreateUnit(p,'h038',-5760.,192.,270.)
	call CreateUnit(p,'h012',-3712.,192.,270.)
	call CreateUnit(p,'h039',-2560.,896.,270.)
	call CreateUnit(p,'h04M',2112.,-7744.,270.)
	call CreateUnit(p,'h06V',1984.,-5760.,270.)
	call CreateUnit(p,'h06U',3904.,-5952.,270.)
	call CreateUnit(p,'h03N',1984.,-4032.,270.)
	call CreateUnit(p,'h03M',1728.,-3008.,270.)
	call CreateUnit(p,'h02W',-1408.,640.,270.)
	call CreateUnit(p,'h017',-192.,1472.,270.)
	call CreateUnit(p,'h02X',1728.,576.,270.)
	call CreateUnit(p,'h018',1600.,3712.,270.)
	call CreateUnit(p,'h031',2944.,2240.,270.)
	call CreateUnit(p,'h02Y',2368.,1280.,270.)
	call CreateUnit(p,'h032',3136.,384.,270.)
	call CreateUnit(p,'h033',4928.,2048.,270.)
	call CreateUnit(p,'h046',6336.,2496.,270.)
	call CreateUnit(p,'h01A',7488.,2624.,270.)
	call CreateUnit(p,'h03S',4928.,704.,270.)
	call CreateUnit(p,'h02F',7872.,4544.,270.)
	call CreateUnit(p,'h01C',4608.,-3904.,270.)
	call CreateUnit(p,'h01D',5312.,-5184.,270.)
	call CreateUnit(p,'h02J',5952.,-2816.,270.)
	call CreateUnit(p,'h03V',6592.,-1344.,270.)
	call CreateUnit(p,'h01E',6400.,-704.,270.)
	call CreateUnit(p,'h019',15936.,5312.,270.)
	call CreateUnit(p,'h03Y',12736.,-128.,270.)
	call CreateUnit(p,'h02N',9216.,4864.,270.)
	call CreateUnit(p,'h006',14528.,960.,270.)
	call CreateUnit(p,'h02Q',17024.,1664.,270.)
	call CreateUnit(p,'h06Z',20032.,4928.,270.)
	call CreateUnit(p,'h034',20160.,6720.,270.)
	call CreateUnit(p,'h02O',4864.,5504.,270.)
	call CreateUnit(p,'h03R',18240.,8896.,270.)
	call CreateUnit(p,'h02S',17088.,8832.,270.)
	call CreateUnit(p,'h005',14080.,9792.,270.)
	call CreateUnit(p,'h02H',11200.,8128.,270.)
	call CreateUnit(p,'h03T',9216.,8000.,270.)
	call CreateUnit(p,'h02G',12608.,4800.,270.)
	call CreateUnit(p,'h02R',7040.,7168.,270.)
	call CreateUnit(p,'h03S',11648.,11072.,270.)
	call CreateUnit(p,'h03O',8640.,10880.,270.)
	call CreateUnit(p,'h02E',7104.,10048.,270.)
	call CreateUnit(p,'h04D',1600.,6016.,270.)
	call CreateUnit(p,'h03P',4160.,7104.,270.)
	call CreateUnit(p,'h03X',6080.,7936.,270.)
	call CreateUnit(p,'h04E',5696.,10624.,270.)
	call CreateUnit(p,'h02Z',3840.,1984.,270.)
	call CreateUnit(p,'h04Z',-11008.,-9344.,270.)
	call CreateUnit(p,'h04I',-7808.,-8000.,270.)
	call CreateUnit(p,'h04J',-6912.,-8064.,270.)
	call CreateUnit(p,'h069',13440.,-12096.,270.)
	call CreateUnit(p,'h04Q',-9280.,-6208.,270.)
	call CreateUnit(p,'h003',11264.,-1856.,270.)
	call CreateUnit(p,'h04L',-3456.,-8064.,270.)
	call CreateUnit(p,'h00M',-5568.,-8000.,270.)
	call CreateUnit(p,'h00N',-5504.,-10432.,270.)
	call CreateUnit(p,'h066',832.,-10752.,270.)
	call CreateUnit(p,'h00O',3008.,-11648.,270.)
	call CreateUnit(p,'h067',5696.,-11776.,270.)
	call CreateUnit(p,'h00P',7744.,-11264.,270.)
	call CreateUnit(p,'h00R',12352.,-11200.,270.)
	call CreateUnit(p,'h00S',14848.,-10944.,270.)
	call CreateUnit(p,'h00T',15616.,-8896.,270.)
	call CreateUnit(p,'h047',12288.,-6720.,270.)
	call CreateUnit(p,'h048',13952.,-6080.,270.)
	call CreateUnit(p,'h049',15680.,-6336.,270.)
	call CreateUnit(p,'h04C',18240.,-1600.,270.)
	call CreateUnit(p,'h00V',17856.,-4096.,270.)
	call CreateUnit(p,'h00W',18944.,-3904.,270.)
	call CreateUnit(p,'h01T',-5952.,4544.,270.)
	call CreateUnit(p,'h02U',-2944.,2816.,270.)
	call CreateUnit(p,'h02T',-4416.,3008.,270.)
	call CreateUnit(p,'h01U',-4224.,3904.,270.)
	call CreateUnit(p,'h02M',-2944.,4480.,270.)
	call CreateUnit(p,'h02L',-4288.,4928.,270.)
	call CreateUnit(p,'h02K',-3584.,5568.,270.)
	call CreateUnit(p,'h00E',-3456.,7168.,270.)
	call CreateUnit(p,'h00X',-9536.,10944.,270.)
	call CreateUnit(p,'h00Y',-10368.,-4928.,270.)
	call CreateUnit(p,'h00Z',-9984.,-3904.,270.)
	call CreateUnit(p,'h03I',-6400.,-3264.,270.)
	call CreateUnit(p,'h00L',-7872.,-2560.,270.)
	call CreateUnit(p,'h004',-8512.,-3328.,270.)
	call CreateUnit(p,'h040',-8192.,-5056.,270.)
	call CreateUnit(p,'h010',-6976.,-6272.,270.)
	call CreateUnit(p,'h042',-5568.,-4992.,270.)
	call CreateUnit(p,'h041',-4032.,-4096.,270.)
	call CreateUnit(p,'h03H',-5184.,-2816.,270.)
	call CreateUnit(p,'h043',-512.,-5952.,270.)
	call CreateUnit(p,'h013',8064.,-9216.,270.)
	call CreateUnit(p,'h014',13312.,-9152.,270.)
	call CreateUnit(p,'h04P',7680.,-7296.,270.)
	call CreateUnit(p,'h04O',6656.,-8000.,270.)
	call CreateUnit(p,'h015',6912.,-5760.,270.)
	call CreateUnit(p,'h070',832.,-2368.,270.)
	call CreateUnit(p,'h016',384.,-1792.,270.)
	call CreateUnit(p,'h03L',-576.,-2624.,270.)
	call CreateUnit(p,'h04K',640.,-640.,270.)
	call CreateUnit(p,'h030',3136.,-1088.,270.)
	call CreateUnit(p,'h01B',3776.,-2368.,270.)
	call CreateUnit(p,'h01F',8576.,-2112.,270.)
	call CreateUnit(p,'h01G',8832.,-320.,270.)
	call CreateUnit(p,'h01H',9280.,1152.,270.)
	call CreateUnit(p,'h044',10176.,-5504.,270.)
	call CreateUnit(p,'h03W',10560.,640.,270.)
	call CreateUnit(p,'h02P',11776.,2816.,270.)
	call CreateUnit(p,'h024',11648.,5440.,270.)
	call CreateUnit(p,'h01S',11264.,-5888.,270.)
	call CreateUnit(p,'h01V',9664.,-7680.,270.)
	call CreateUnit(p,'h00H',6660.6,-7713.4,47.032)
	call CreateUnit(p,'h00J',664.1,-2502.9,225.646)
	call CreateUnit(p,'h00J',746.2,-2558.5,280.947)
	call CreateUnit(p,'h00J',861.3,-2554.8,256.358)
	call CreateUnit(p,'h00J',956.7,-2481.7,4.714)
	call CreateUnit(p,'h00J',1002.9,-2388.4,319.964)
	call CreateUnit(p,'h00J',623.6,-2453.4,236.989)
	call CreateUnit(p,'h00H',6766.1,-7790.2,64.049)
	call CreateUnit(p,'h00H',6837.1,-7876.,75.765)
	call CreateUnit(p,'n00M',6777.9,-7865.8,68.987)
	call CreateUnit(p,'h00I',7438.8,-7302.2,152.569)
	call CreateUnit(p,'h00I',7433.9,-7382.2,139.591)
	call CreateUnit(p,'h00H',7524.4,-7184.2,177.712)
	call CreateUnit(p,'h00H',7534.4,-7426.,143.809)
	call CreateUnit(p,'n00M',7517.6,-7316.2,156.343)
	call CreateUnit(p,'n00M',8212.2,-9261.,358.071)
	call CreateUnit(p,'n00M',8168.,-9358.2,292.07)
	call CreateUnit(p,'n00M',7989.,-9369.5,263.298)
	call CreateUnit(p,'n00M',7909.,-9296.9,202.331)
	call CreateUnit(p,'h00I',13210.5,-9268.9,263.106)
	call CreateUnit(p,'h00H',13138.1,-9160.9,219.79)
	call CreateUnit(p,'h00H',13364.9,-9291.6,282.08)
	call CreateUnit(p,'h00H',13448.3,-9208.5,341.883)
	call CreateUnit(p,'n00M',13337.1,-8987.1,84.771)
	call CreateUnit(p,'n00M',13465.6,-9053.3,43.713)
	call CreateUnit(p,'n00M',18196.3,-9629.7,154.239)
	call CreateUnit(p,'n00M',18551.8,-9861.1,308.803)
	call CreateUnit(p,'h00H',18226.7,-9793.6,220.509)
	call CreateUnit(p,'h00H',18363.5,-9920.4,263.67)
	call CreateUnit(p,'h00H',18355.1,-9559.,93.722)
	call CreateUnit(p,'h00H',18506.,-9672.4,9.624)
	call CreateUnit(p,'h00I',13789.6,-6141.4,237.202)
	call CreateUnit(p,'h00I',13803.2,-5892.7,110.906)
	call CreateUnit(p,'h00I',14116.7,-6030.,32.501)
	call CreateUnit(p,'h00I',14079.3,-6239.,301.222)
	call CreateUnit(p,'h00J',-7199.7,-6243.6,133.13)
	call CreateUnit(p,'h00I',-5742.7,-4888.5,138.565)
	call CreateUnit(p,'h00J',-9429.7,10811.,235.811)
	call CreateUnit(p,'h00J',-9380.,10758.6,226.964)
	call CreateUnit(p,'h00J',-9328.1,10698.6,217.023)
	call CreateUnit(p,'h00J',-9263.,10641.1,206.853)
	call CreateUnit(p,'h00J',-9247.7,10708.1,212.595)
	call CreateUnit(p,'n00M',15630.,-1922.8,37.644)
	call CreateUnit(p,'n00M',15662.1,-2023.,11.277)
	call CreateUnit(p,'n00M',18041.1,-1421.9,115.024)
	call CreateUnit(p,'n00M',17973.9,-1560.2,146.218)
	call CreateUnit(p,'h00I',16980.1,-1838.3,230.909)
	call CreateUnit(p,'h00I',17145.4,-1877.7,310.538)
	call CreateUnit(p,'h00I',17211.2,-1704.8,.873)
	call CreateUnit(p,'h00J',-7983.1,-7987.7,255.448)
	call CreateUnit(p,'h00J',-8061.5,-7963.5,260.132)
	call CreateUnit(p,'h00J',-7952.8,-8177.2,250.1)
	call CreateUnit(p,'h00I',-11912.,-10550.7,353.684)
	call CreateUnit(p,'h00I',-11909.,-10723.2,27.914)
	call CreateUnit(p,'n00M',-5389.9,-8088.4,260.239)
	call CreateUnit(p,'n00M',-6774.6,-8169.5,19.397)
	call CreateUnit(p,'n00M',-6745.9,-7998.1,335.953)
	call CreateUnit(p,'h00I',-6955.3,-8245.,254.86)
	call CreateUnit(p,'h00I',-5559.8,-10640.9,311.153)
	call CreateUnit(p,'h00H',-5340.5,-10507.8,287.04)
	call CreateUnit(p,'n00M',-5668.9,-10479.2,309.419)
	call CreateUnit(p,'n00M',-5346.,-10353.3,284.056)
	call CreateUnit(p,'h00J',-7875.,-8102.1,247.145)
	call CreateUnit(p,'h00J',-7839.,-8222.3,241.632)
	call CreateUnit(p,'h00I',-5657.2,-8194.5,274.306)
	call CreateUnit(p,'n00M',-5718.1,-8122.6,277.519)
	call CreateUnit(p,'h00H',-5565.6,-8189.7,268.539)
	call CreateUnit(p,'h00J',-7733.8,-8210.9,236.043)
	call CreateUnit(p,'h00J',-7713.3,-8116.1,238.133)
	call CreateUnit(p,'h00J',-7124.3,-8017.6,227.92)
	call CreateUnit(p,'h00I',694.4,-10790.8,205.137)
	call CreateUnit(p,'h00I',828.9,-10849.6,287.838)
	call CreateUnit(p,'n00M',3065.5,-11791.9,313.582)
	call CreateUnit(p,'n00M',3132.9,-11732.2,304.934)
	call CreateUnit(p,'n00M',3161.8,-11636.7,298.173)
	call CreateUnit(p,'n00M',2918.6,-11801.4,322.876)
	call CreateUnit(p,'h00I',5574.4,-11863.6,225.089)
	call CreateUnit(p,'h00I',5669.4,-11913.2,297.055)
	call CreateUnit(p,'h00I',7786.5,-11390.6,277.194)
	call CreateUnit(p,'h00I',7877.5,-11297.3,335.6)
	call CreateUnit(p,'h00H',7611.5,-11319.2,174.298)
	call CreateUnit(p,'h00H',7631.6,-11427.5,192.962)
	call CreateUnit(p,'h00H',18935.1,-4144.1,308.474)
	call CreateUnit(p,'h00H',19051.2,-4085.8,289.35)
	call CreateUnit(p,'h00H',19119.7,-3822.3,17.195)
	call CreateUnit(p,'h00H',19061.7,-3715.,358.112)
	call CreateUnit(p,'n00M',18949.3,-4061.5,308.437)
	call CreateUnit(p,'n00M',19034.8,-3804.2,11.123)
	call CreateUnit(p,'h00H',3662.4,-2144.9,145.436)
	call CreateUnit(p,'h00H',3574.,-2245.1,105.523)
	call CreateUnit(p,'h00H',3862.1,-2476.7,257.059)
	call CreateUnit(p,'h00H',3650.7,-2504.,289.613)
	call CreateUnit(p,'h00I',3096.7,-921.7,101.518)
	call CreateUnit(p,'h00I',2989.6,-1119.1,183.623)
	call CreateUnit(p,'h00I',3190.1,-1229.4,278.822)
	call CreateUnit(p,'h00I',-556.7,-6125.5,355.769)
	call CreateUnit(p,'h00I',-440.3,-6104.5,352.907)
	call CreateUnit(p,'h00I',-374.5,-5978.6,339.1)
	call CreateUnit(p,'h00I',-413.2,-5821.9,327.555)
	call CreateUnit(p,'n00M',-175.4,-4883.4,327.749)
	call CreateUnit(p,'n00M',-167.2,-4711.3,311.634)
	call CreateUnit(p,'n00M',-30.2,-4740.2,300.628)
	call CreateUnit(p,'n00M',-52.1,-4880.9,316.16)
	call CreateUnit(p,'h00H',1863.2,-7639.8,273.575)
	call CreateUnit(p,'h00H',1952.4,-7571.4,267.386)
	call CreateUnit(p,'h00H',1816.2,-7779.3,278.375)
	call CreateUnit(p,'h00H',1958.2,-7923.2,264.962)
	call CreateUnit(p,'h00H',2521.1,-8152.,205.06)
	call CreateUnit(p,'h00H',2564.2,-7970.1,215.6)
	call CreateUnit(p,'h00H',2281.6,-8025.6,228.095)
	call CreateUnit(p,'n00M',2472.8,-8044.9,214.965)
	call CreateUnit(p,'n00M',2355.2,-7898.2,230.592)
	call CreateUnit(p,'n00M',2352.3,-7741.4,237.697)
	call CreateUnit(p,'n00M',2487.1,-7701.1,232.015)
	call CreateUnit(p,'n00M',2429.9,-7806.3,230.633)
	call CreateUnit(p,'h00I',2099.7,-7959.7,248.607)
	call CreateUnit(p,'h00I',2197.3,-7968.1,238.73)
	call CreateUnit(p,'h00I',-763.9,-2730.9,269.724)
	call CreateUnit(p,'h00I',-625.3,-2839.4,250.473)
	call CreateUnit(p,'h00I',-519.3,-2752.,243.014)
	call CreateUnit(p,'h00I',-1601.,-3713.7,90.371)
	call CreateUnit(p,'h00H',-1495.,-3670.8,98.738)
	call CreateUnit(p,'h00H',-1423.2,-3669.8,104.218)
	call CreateUnit(p,'n00M',-3046.6,-2935.6,341.19)
	call CreateUnit(p,'n00M',-2880.7,-2694.1,305.834)
	call CreateUnit(p,'h00H',-2828.3,-2811.,309.93)
	call CreateUnit(p,'h00H',-2895.9,-2908.3,328.942)
	call CreateUnit(p,'h00H',-5084.2,-2650.4,336.098)
	call CreateUnit(p,'h00H',-5026.1,-2795.8,9.252)
	call CreateUnit(p,'h00H',-5104.9,-2958.6,35.228)
	call CreateUnit(p,'h00H',-9339.9,-6073.8,37.757)
	call CreateUnit(p,'h00H',-9175.9,-6118.7,94.258)
	call CreateUnit(p,'h00H',-7090.7,-6136.4,43.727)
	call CreateUnit(p,'h00H',-6810.8,-6167.7,104.509)
	call CreateUnit(p,'n00M',-6517.1,-3024.1,219.755)
	call CreateUnit(p,'n00M',-6560.7,-3235.,194.151)
	call CreateUnit(p,'n00M',-6510.7,-3355.7,172.741)
	call CreateUnit(p,'h00I',-5630.5,-4815.,61.453)
	call CreateUnit(p,'h00I',-5495.7,-4828.2,79.58)
	call CreateUnit(p,'h00I',-5407.1,-4930.7,91.853)
	call CreateUnit(p,'h00H',-4217.7,-4129.,135.674)
	call CreateUnit(p,'h00H',-4193.8,-3977.3,168.996)
	call CreateUnit(p,'n00M',-5911.,12.8,1.03)
	call CreateUnit(p,'n00M',-5974.5,150.3,348.732)
	call CreateUnit(p,'n00M',-5882.1,300.9,333.018)
	call CreateUnit(p,'n00M',-5677.8,339.1,317.205)
	call CreateUnit(p,'n00M',-5718.,-16.8,5.985)
	call CreateUnit(p,'h00I',-5611.6,100.,344.38)
	call CreateUnit(p,'n00M',-2618.5,732.,348.494)
	call CreateUnit(p,'n00M',-2479.5,742.,339.629)
	call CreateUnit(p,'n00M',-2411.,856.9,308.69)
	call CreateUnit(p,'n00M',-2436.2,978.6,299.934)
	call CreateUnit(p,'h00I',-1386.9,850.,51.991)
	call CreateUnit(p,'h00I',-1272.2,720.5,82.919)
	call CreateUnit(p,'h00H',210.9,-1763.6,90.518)
	call CreateUnit(p,'h00H',253.4,-1686.7,92.439)
	call CreateUnit(p,'h00H',393.,-1641.5,98.896)
	call CreateUnit(p,'h00H',469.5,-1652.5,102.2)
	call CreateUnit(p,'h00H',513.,-1735.8,103.24)
	call CreateUnit(p,'n00M',-382.6,1545.2,227.921)
	call CreateUnit(p,'n00M',-350.6,1396.1,208.999)
	call CreateUnit(p,'n00M',-269.8,1277.6,189.103)
	set u=CreateUnit(p,'n00M',810.1,-587.3,69.767)
	call SetUnitState(u,UNIT_STATE_MANA,0)
	set u=CreateUnit(p,'n00M',732.8,-499.5,51.035)
	call SetUnitState(u,UNIT_STATE_MANA,0)
	call CreateUnit(p,'h00I',806.1,-484.6,61.317)
	call CreateUnit(p,'h00I',460.4,-469.7,137.953)
	call CreateUnit(p,'h00H',471.9,-581.8,122.174)
	call CreateUnit(p,'h00H',509.4,-503.7,139.741)
	call CreateUnit(p,'h00I',4791.9,1879.1,279.923)
	call CreateUnit(p,'h00I',4971.8,1874.6,267.374)
	call CreateUnit(p,'h00I',4809.9,842.7,76.681)
	call CreateUnit(p,'h00I',5017.6,887.,101.036)
	call CreateUnit(p,'n00M',4921.,874.8,89.077)
	call CreateUnit(p,'h00H',4870.7,1791.,275.021)
	call CreateUnit(p,'h00H',11087.,-1789.9,83.812)
	call CreateUnit(p,'h00H',11424.3,-1805.8,101.371)
	call CreateUnit(p,'h00H',11263.3,-1626.1,93.702)
	call CreateUnit(p,'h00I',11146.4,-1640.1,86.451)
	call CreateUnit(p,'h00I',11361.3,-1665.1,99.359)
	call CreateUnit(p,'n00M',8386.5,-2052.8,92.386)
	call CreateUnit(p,'n00M',8711.8,-1953.,133.967)
	call CreateUnit(p,'n00M',8488.6,-1893.1,112.192)
	call CreateUnit(p,'n00M',8654.7,-383.3,281.568)
	call CreateUnit(p,'h00I',8866.8,-508.6,261.798)
	call CreateUnit(p,'h00I',8969.4,-435.2,253.543)
	call CreateUnit(p,'h00H',9123.5,1166.,115.478)
	call CreateUnit(p,'h00H',9129.8,1317.2,129.658)
	call CreateUnit(p,'h00H',9214.,1389.,150.744)
	call CreateUnit(p,'h00H',9285.4,1393.8,156.804)
	call CreateUnit(p,'h00H',9354.4,1356.9,155.944)
	call CreateUnit(p,'h00H',9113.6,1054.7,109.122)
	call CreateUnit(p,'n00M',6344.8,2302.2,282.511)
	call CreateUnit(p,'n00M',6488.1,2550.6,18.027)
	call CreateUnit(p,'h00I',6527.9,2384.2,322.398)
	call CreateUnit(p,'h00I',10658.3,479.2,31.422)
	call CreateUnit(p,'h00I',10673.9,811.9,343.959)
	call CreateUnit(p,'h00H',10698.7,612.7,15.955)
	call CreateUnit(p,'h00H',19908.7,4735.,162.124)
	call CreateUnit(p,'h00H',19848.9,4859.3,175.121)
	call CreateUnit(p,'h00H',19838.4,4938.8,185.501)
	call CreateUnit(p,'h00H',19829.9,5034.6,197.967)
	call CreateUnit(p,'h00H',19888.2,5079.2,200.691)
	call CreateUnit(p,'h00H',19957.1,5078.2,198.187)
	call CreateUnit(p,'n00M',11608.6,2657.9,330.339)
	call CreateUnit(p,'n00M',11586.4,2835.2,322.672)
	call CreateUnit(p,'n00M',11699.9,3006.6,311.972)
	call CreateUnit(p,'n00M',11824.3,3028.7,306.073)
	call CreateUnit(p,'h00I',12056.7,2869.8,299.166)
	call CreateUnit(p,'h00I',12042.4,2730.4,306.018)
	call CreateUnit(p,'h00I',11757.8,2455.5,338.347)
	call CreateUnit(p,'h00I',11836.1,2520.,330.947)
	call CreateUnit(p,'h00H',11860.6,2654.,320.963)
	call CreateUnit(p,'h00H',11929.8,2746.1,312.219)
	call CreateUnit(p,'h00H',-3632.1,7053.9,282.989)
	call CreateUnit(p,'h00H',-3545.8,6973.9,274.072)
	call CreateUnit(p,'h00H',-3427.5,6956.1,257.804)
	call CreateUnit(p,'n00M',7609.1,5653.1,58.862)
	call CreateUnit(p,'n00M',7733.5,5741.7,69.46)
	call CreateUnit(p,'n00M',7875.2,5658.2,93.78)
	call CreateUnit(p,'h00I',9336.5,5071.3,355.279)
	call CreateUnit(p,'h00I',9371.3,4867.6,36.609)
	call CreateUnit(p,'h00H',11489.5,5401.3,121.802)
	call CreateUnit(p,'h00H',11462.1,5478.1,124.171)
	call CreateUnit(p,'h00H',11494.8,5558.1,135.177)
	call CreateUnit(p,'h00H',11579.6,5606.,148.262)
	call CreateUnit(p,'h00H',11693.,5608.1,155.144)
	call CreateUnit(p,'h00H',11063.1,7924.2,311.541)
	call CreateUnit(p,'h00H',11199.8,7905.7,296.098)
	call CreateUnit(p,'h00H',11330.8,8025.4,272.394)
	call CreateUnit(p,'h00I',6997.1,7014.,330.378)
	call CreateUnit(p,'h00I',7177.8,7100.1,299.88)
	call CreateUnit(p,'n00M',9080.9,8163.4,235.3)
	call CreateUnit(p,'n00M',9022.7,8026.3,233.26)
	call CreateUnit(p,'n00M',9093.2,7842.4,220.64)
	call CreateUnit(p,'n00M',9190.8,7806.9,214.293)
	call CreateUnit(p,'n00M',9282.1,7869.2,214.292)
	call CreateUnit(p,'h00I',8493.5,10757.8,299.381)
	call CreateUnit(p,'h00I',8626.7,10685.,286.723)
	call CreateUnit(p,'h00I',8766.,10768.5,265.554)
	call CreateUnit(p,'h00I',8795.9,10874.3,263.271)
	call CreateUnit(p,'n00M',11547.9,11229.6,226.925)
	call CreateUnit(p,'n00M',11680.5,11200.1,220.785)
	call CreateUnit(p,'n00M',11837.1,11068.5,210.62)
	call CreateUnit(p,'n00M',11877.2,10985.,205.976)
	call CreateUnit(p,'h00I',11324.6,11206.9,236.78)
	call CreateUnit(p,'h00I',11528.8,10925.7,213.046)
	call CreateUnit(p,'h00H',11412.5,11129.1,228.958)
	call CreateUnit(p,'h00H',11490.6,11039.1,220.929)
	call CreateUnit(p,'n00M',6984.3,9837.2,183.456)
	call CreateUnit(p,'n00M',6905.3,9965.7,210.069)
	call CreateUnit(p,'n00M',6864.8,10124.3,234.847)
	call CreateUnit(p,'h00H',5578.7,10412.,314.892)
	call CreateUnit(p,'h00H',5710.3,10342.4,307.513)
	call CreateUnit(p,'h00H',5807.3,10391.8,289.225)
	call CreateUnit(p,'h00H',5843.,10504.1,280.005)
	call CreateUnit(p,'h00H',5901.7,10730.4,271.557)
	call CreateUnit(p,'h611',7496.8,-9611.5,295.713)
	call CreateUnit(p,'h611',8118.1,-9623.3,237.856)
	call CreateUnit(p,'h009',12808.1,-9524.4,261.103)
	call CreateUnit(p,'h009',2460.9,-8536.4,245.404)
	call CreateUnit(p,'h611',2220.4,-8406.8,259.183)
	call CreateUnit(p,'h611',68.7,-5387.9,354.358)
	call CreateUnit(p,'h611',325.3,-4866.4,282.335)
	call CreateUnit(p,'h009',150.5,-6509.2,26.347)
	call CreateUnit(p,'h611',-11516.1,-1817.7,321.42)
	call CreateUnit(p,'h611',-11519.2,-1403.5,303.863)
	call CreateUnit(p,'h611',-11132.6,-1657.3,288.202)
	call CreateUnit(p,'h611',-7165.5,-1087.2,27.029)
	call CreateUnit(p,'h611',-6933.9,-830.2,12.056)
	call CreateUnit(p,'h611',-7176.,-594.9,349.214)
	call CreateUnit(p,'h009',-7245.9,-857.1,9.242)
	call CreateUnit(p,'h009',-9952.5,530.3,300.244)
	call CreateUnit(p,'h009',-7771.1,2204.3,93.403)
	call CreateUnit(p,'h009',-9881.4,2524.2,314.474)
	call CreateUnit(p,'h611',-8790.5,5199.7,18.315)
	call CreateUnit(p,'h611',-8702.3,5581.1,326.858)
	call CreateUnit(p,'h611',-1086.1,4271.7,291.948)
	call CreateUnit(p,'h009',-935.5,4303.7,270.463)
	call CreateUnit(p,'h009',-1604.6,7602.9,319.857)
	call CreateUnit(p,'h611',-1056.,8063.2,270.293)
	call CreateUnit(p,'h611',-1854.1,7995.9,47.286)
	call CreateUnit(p,'h611',1430.4,10131.2,304.009)
	call CreateUnit(p,'h611',1223.4,10015.2,320.668)
	call CreateUnit(p,'h611',1048.6,9831.8,337.339)
	call CreateUnit(p,'h611',1000.3,9638.1,350.397)
	call CreateUnit(p,'h009',-1740.9,10497.6,345.309)
	call CreateUnit(p,'h611',-1528.6,10708.5,297.301)
	call CreateUnit(p,'h611',-6702.8,9149.4,71.333)
	call CreateUnit(p,'h611',-6533.4,9026.,87.099)
	call CreateUnit(p,'h611',-9497.2,7427.4,178.348)
	call CreateUnit(p,'h009',-9699.9,7798.9,226.834)
	call CreateUnit(p,'h009',-11469.4,9906.6,335.302)
	call CreateUnit(p,'h00H',-3351.,7015.2,250.566)
	call CreateUnit(p,'h00H',-3736.3,5606.2,123.308)
	call CreateUnit(p,'h00H',-3691.2,5691.9,133.892)
	call CreateUnit(p,'h00H',-3575.4,5715.,144.608)
	call CreateUnit(p,'h00J',-6173.4,4631.,246.135)
	call CreateUnit(p,'h00J',-6149.7,4509.3,227.688)
	call CreateUnit(p,'h00J',-5995.8,4743.8,85.429)
	call CreateUnit(p,'h00J',-5917.9,4743.4,105.952)
	call CreateUnit(p,'h00J',-5778.1,4572.2,331.273)
	call CreateUnit(p,'h00J',-5777.7,4477.1,354.529)
	call CreateUnit(p,'h00J',-6000.5,4357.1,285.423)
	call CreateUnit(p,'h00J',-5911.7,4367.3,258.418)
	call CreateUnit(p,'h00H',-6092.5,4400.2,195.181)
	call CreateUnit(p,'h00H',-6120.5,4756.8,167.221)
	call CreateUnit(p,'h00H',-5793.2,4690.3,64.092)
	call CreateUnit(p,'h00I',-5792.7,4398.8,14.505)
	call CreateUnit(p,'n00M',-6095.1,4618.5,233.221)
	call CreateUnit(p,'n00M',-6089.3,4491.1,214.916)
	call CreateUnit(p,'n00M',-5850.6,4447.2,1.987)
	call CreateUnit(p,'n00M',-5859.8,4658.1,51.275)
	call CreateUnit(p,'n00M',-5950.5,4705.2,96.437)
	call CreateUnit(p,'n00M',-9915.2,11008.1,285.206)
	call CreateUnit(p,'n00M',-9862.3,11153.5,278.509)
	call CreateUnit(p,'n00M',-9770.2,11058.2,271.825)
	call CreateUnit(p,'n00M',-9689.9,11151.,265.512)
	call CreateUnit(p,'h00H',-9906.2,10835.7,289.693)
	call CreateUnit(p,'h00H',-9826.6,10872.4,279.257)
	call CreateUnit(p,'h00H',-9745.,10907.9,269.536)
	call CreateUnit(p,'h00H',-9676.8,10924.9,262.208)
	call CreateUnit(p,'h00I',-9766.5,10807.7,272.43)
	call CreateUnit(p,'h00I',-9689.3,10843.8,262.379)
	call CreateUnit(p,'h00J',-7085.,-8122.9,196.626)
	call CreateUnit(p,'h00J',-6838.6,-8240.8,285.881)
	call CreateUnit(p,'n00M',1445.8,3558.7,210.021)
	call CreateUnit(p,'n00M',1428.3,3685.3,289.18)
	call CreateUnit(p,'h00J',-3244.3,-10487.9,332.98)
	call CreateUnit(p,'h00J',-3117.7,-10593.1,335.529)
	call CreateUnit(p,'h00J',-2976.7,-10601.4,331.273)
	call CreateUnit(p,'h00J',-2847.,-10531.9,319.783)
	call CreateUnit(p,'h00J',-2803.2,-10435.3,310.825)
	call CreateUnit(p,'h00J',-2824.4,-10348.1,307.641)
	call CreateUnit(p,'h00J',-2865.5,-10267.3,306.474)
	call CreateUnit(p,'n00M',-3137.9,-10485.3,329.695)
	call CreateUnit(p,'n00M',-2939.2,-10475.9,321.11)
	call CreateUnit(p,'n00M',-2937.4,-10357.,314.42)
	call CreateUnit(p,'h00J',-5660.8,-10628.5,248.002)
	call CreateUnit(p,'h00J',-5458.9,-10684.9,269.615)
	call CreateUnit(p,'h00J',-5368.1,-10607.,312.703)
	call CreateUnit(p,'h00J',-5308.8,-10431.7,4.742)
	call CreateUnit(p,'h00J',-12060.5,-10852.1,288.754)
	call CreateUnit(p,'h00J',-11966.8,-10813.9,301.451)
	call CreateUnit(p,'h00J',-11908.2,-10630.5,348.829)
	call CreateUnit(p,'n00M',1458.9,3802.2,102.264)
	call CreateUnit(p,'n00M',1553.3,3869.1,129.489)
	call CreateUnit(p,'n00M',1675.6,3865.2,171.326)
	call CreateUnit(p,'n00M',1745.9,3785.,14.491)
	call CreateUnit(p,'n00M',1758.4,3631.5,259.153)
	call CreateUnit(p,'n00M',1675.4,3532.8,37.53)
	call CreateUnit(p,'n00M',1544.6,3513.7,246.607)
	call CreateUnit(p,'h00J',636.4,-10725.,206.613)
	call CreateUnit(p,'h00J',935.1,-10861.,270.998)
	call CreateUnit(p,'h00J',-9301.7,10783.7,222.641)
	call CreateUnit(p,'h00J',-9353.1,10847.6,231.299)
	call CreateUnit(p,'n00M',-9270.4,10891.4,225.448)
	call CreateUnit(p,'n00M',-9222.8,10803.4,214.902)
	call CreateUnit(p,'h00I',-3608.,6925.4,285.36)
	call CreateUnit(p,'h00I',-3490.2,6887.3,272.875)
	call CreateUnit(p,'h00I',-3359.9,6910.6,258.029)
endfunction

function main takes nothing returns nothing
	local integer i
    call SetCameraBounds(-12160. + GetCameraMargin(CAMERA_MARGIN_LEFT), -12416. + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 20352. - GetCameraMargin(CAMERA_MARGIN_RIGHT), 11648. - GetCameraMargin(CAMERA_MARGIN_TOP), -12160. + GetCameraMargin(CAMERA_MARGIN_LEFT),11648. - GetCameraMargin(CAMERA_MARGIN_TOP), 20352. - GetCameraMargin(CAMERA_MARGIN_RIGHT), -12416. + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
	call SetDayNightModels("Environment\\DNC\\DNCDalaran\\DNCDalaranTerrain\\DNCDalaranTerrain.mdl", "Environment\\DNC\\DNCDalaran\\DNCDalaranUnit\\DNCDalaranUnit.mdl")
	call NewSoundEnvironment("lake")
	call SetAmbientDaySound("AshenvaleDay")
	call SetAmbientNightSound("AshenvaleNight")
	call SetMapMusic("Music", true, 0)
	
	set snd_capital_upgrade = CreateSound("Sound\\Interface\\ArrangedTeamInvitation.wav", false, false, false, 10, 10, "")
	call SetSoundParamsFromLabel(snd_capital_upgrade, "ArrangedTeamInvitation")
	call SetSoundDuration(snd_capital_upgrade, 2914)
	
	set snd_game_enter = CreateSound("Sound\\Ambient\\DoodadEffects\\TheHornOfCenarius.wav", false, false, false, 10, 10, "DefaultEAXON")
	call SetSoundParamsFromLabel(snd_game_enter, "HornOfCenariusSound")
	call SetSoundDuration(snd_game_enter, 12121)
	
	set snd_game_started = CreateSound("Sound\\Interface\\ClanInvitation.wav", false, false, false, 10 ,10, "DefaultEAXON")
	call SetSoundParamsFromLabel(snd_game_started, "ClanInvitation")
	call SetSoundDuration(snd_game_started, 4296)
	
	set snd_peace_time_expired = CreateSound("Units\\Human\\HeroPaladin\\HeroPaladinPissed1.wav", false, false, false, 10, 10, "DefaultEAXON")
	call SetSoundParamsFromLabel(snd_peace_time_expired, "HeroPaladinPissed")
	call SetSoundDuration(snd_peace_time_expired, 2096)
	
	call CreateRegions()
	call CreateUnits()
	call InitBlizzard()
	
	set i = 0
	loop
    	set player_city_count[i] = 0
    	set player_nick[i] = ""
    	set player_required_influence[i] = 0
		set player_influence[i] = 0

    	set player_influence_balance[i] = 0
		set player_country[i] = -1
		set player_random_country[i] = -1
		set player_age[i] = 1
    	set i = i + 1
		exitwhen i > 11
	endloop
	
	set capital_upgrade_name[2] = "эпохи феодализма"
	set capital_upgrade_name[3] = "эпохи замков"
	set capital_upgrade_name[4] = "эпохи империй"
	set capital_upgrade_name[5] = "эпохи пороха"
	
	set age_tech_id[2] = 'R002'
	set age_tech_id[3] = 'R003'
	set age_tech_id[4] = 'R004'
	set age_tech_id[5] = 'R005'
	
	set g_cities = CreateGroup()
	set tmr_game_start = CreateTimer()
	set tmr_taxes = CreateTimer()
	set tmr_settings = CreateTimer()
	set tmr_peace = CreateTimer()
	set f_north_players = CreateForce()
	set f_south_players = CreateForce()
	set dlg_settings = DialogCreate()	
	
	call InitTriggers()
endfunction

function config takes nothing returns nothing
	local integer i
	local player p
    call SetMapName("TRIGSTR_3745")
    call SetMapDescription("TRIGSTR_3355")
    call SetPlayers(12)
    call SetTeams(2)
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
	
	set i = 0
	loop
		set p = Player(i)
		call DefineStartLocation(i, -11776.,11200.)
		call SetPlayerStartLocation(p, i)
		call ForcePlayerStartLocation(p, i)
		call SetPlayerColor(p, ConvertPlayerColor(i))
		call SetPlayerRacePreference(p, RACE_PREF_HUMAN)
		call SetPlayerRaceSelectable(p, false)
		call SetPlayerController(p, MAP_CONTROL_USER)
	
		set i = i + 1
		exitwhen i > 11
	endloop
	
    call InitCustomTeams()
endfunction
