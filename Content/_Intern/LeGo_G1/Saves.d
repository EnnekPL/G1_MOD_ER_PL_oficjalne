/***********************************\
                SAVES
\***********************************/

func void BW_Savegame() {

};

func void BR_Savegame() {

};

//========================================
// [intern] Gibt Pfad zur Speicherdatei zur�ck
//========================================
func string GetParmValue(var string str) {
	CALL_zStringPtrParam(str);
	CALl_RetValIszString();
	CALL__thisCall(MEM_ReadInt(zoptions_Pointer_Address), 4586784);
	
	return CALL_RetValAszString();
};
func string _BIN_GetSavefilePath(var int slot) {
    var string path;
    var string _BIN_ini;
	
    if(!STR_len(_BIN_ini)) {
        _BIN_ini = GetParmValue("GAME"); // Yea, I've lost a lot of time and patience to resolve crash during saving the game. 
        _BIN_ini = STR_Split(_BIN_ini, ".", 0);
    };
    if(Hlp_StrCmp(_BIN_ini, "GOTHICGAME") || (Hlp_StrCmp(_BIN_ini, ""))) {
        path = "saves";
    }
    else {
        path = ConcatStrings("saves_", _BIN_ini);
    };
    if(slot) {
        path = ConcatStrings(path, "/savegame");
        path = ConcatStrings(path, IntToString(slot));
    }
    else {
        path = ConcatStrings(path, "/quicksave");
    };
    path = ConcatStrings(path, "/SCRPTSAVE.SAV");
    return path;
};

//========================================
// [intern] Speicherslot herausfinden
//========================================
func int _BR_GetSelectedSlot() {
    var CGameManager man; man = _^(MEM_ReadInt(MEMINT_gameMan_Pointer_address));
    return MEM_ReadInt(man.menu_load_savegame + 3276);
};

//========================================
// [intern] Ruft BW_Savegame auf
//========================================
func void _BW_SaveGame() {
    var int ext; ext = MEM_ReadInt(EBP+60);
    if(_LeGo_Flags & LeGo_Gamestate) {
        _Gamestate_Init(Gamestate_Saving);
    };
    if(BW_NewFile(_BIN_GetSavefilePath(ext))) {
        if(_LeGo_Flags & LeGo_PermMem) {
			var int i1; i1 = new(_empty@);
			var int i2; i2 = new(_empty@);
            _PM_Archive();
			delete(i1); delete(i2);
        };
        BW_Savegame();
        BW_Close();
    };
};

//========================================
// [intern] Ruft BR_Savegame auf
//========================================
func void _BR_LoadGame() {
    var int slot; slot = _BR_GetSelectedSlot();
    if(slot == -1) {
        if(_LeGo_Flags & LeGo_Gamestate) {
            _Gamestate_Init(Gamestate_WorldChange);
        };
        return;
    };
    if(BR_OpenFile(_BIN_GetSavefilePath(slot))) {
        if(_LeGo_Flags & LeGo_PermMem) {
            _PM_UnArchive();
        };
        BR_Savegame();
        BR_Close();
    };
    if(_LeGo_Flags & LeGo_Gamestate) {
        _Gamestate_Init(Gamestate_Loaded);
    };
};