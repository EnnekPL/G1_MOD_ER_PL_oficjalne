//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Ghoran_EXIT(C_INFO)
{
	npc             = NOV_9001_Ghoran;
	nr              = 999;
	condition		= DIA_Ghoran_EXIT_Condition;
	information		= DIA_Ghoran_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Ghoran_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ghoran_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoYou2
//========================================

INSTANCE DIA_Ghoran_WhoYou2 (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_WhoYou2_Condition;
   information  = DIA_Ghoran_WhoYou2_Info;
   permanent	= FALSE;
   description	= "Widz�, �e robicie wino.";
};

FUNC INT DIA_Ghoran_WhoYou2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ghoran_WhoYou2_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_WhoYou2_15_01"); //Widz�, �e robicie wino.
    AI_Output (self, other ,"DIA_Ghoran_WhoYou2_03_02"); //Dobrze widzisz. Ja i ci Nowicjusze zajmujemy si� upraw� winogron i produkcj� wina. 
	AI_Output (other, self ,"DIA_Ghoran_WhoYou2_15_03"); //Zajmujesz si� te� handlem? 
	AI_Output (self, other ,"DIA_Ghoran_WhoYou2_03_04"); //W sensie, czy sprzedaj� wino? Oczywi�cie! Ca�kiem sporo Nowicjuszy si� u mnie zaopatruje. No i oczywi�cie Gor Boba. 
	AI_Output (self, other ,"DIA_Ghoran_WhoYou2_03_05"); //Najlepszy margunios robiony w Kolonii Karnej tylko u mnie, rzecz jasna mo�esz te� kupi� owoce. Zawsze mamy jaki� zapas na produkcj� wina. 

	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);//fix
	B_LogEntry		(GE_TraderPSI,	"U Ghorana kupi� wino i owoce. Handluje w okolicach placu �wi�tynnego. Trudno go przeoczy�.");
};

//========================================
//-----------------> Handel
//========================================

INSTANCE DIA_Ghoran_Handel (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 3;
   condition    = DIA_Ghoran_Handel_Condition;
   information  = DIA_Ghoran_Handel_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Chc� co� kupi�.";
};

FUNC INT DIA_Ghoran_Handel_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ghoran_WhoYou2))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Ghoran_Handel_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_Handel_15_01"); //Chc� co� kupi�.
    AI_Output (self, other ,"DIA_Ghoran_Handel_03_02"); //Wybieraj.
};

//========================================
//-----------------> AboutYou
//========================================

INSTANCE DIA_Ghoran_AboutYou (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_AboutYou_Condition;
   information  = DIA_Ghoran_AboutYou_Info;
   permanent	= FALSE;
   description	= "Jak trafi�e� do Kolonii Karnej?";
};

FUNC INT DIA_Ghoran_AboutYou_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ghoran_WhoYou2))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Ghoran_AboutYou_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_AboutYou_15_01"); //Jak trafi�e� do Kolonii Karnej? 
    AI_Output (self, other ,"DIA_Ghoran_AboutYou_03_02"); //To proste. By�em ch�opem przypisanym do ziemi, kt�ra od pokole� nale�a�a do szlachcica Zandora i jego rodziny. Gdy zbieg�em z jego maj�tku, rozes�a� za mn� list go�czy. 
	AI_Output (self, other ,"DIA_Ghoran_AboutYou_03_03"); //Gdy stra�nicy kr�lewscy mnie schwytali, zosta�em wys�any do Kolonii Karnej. 
	AI_Output (other, self ,"DIA_Ghoran_AboutYou_15_04"); //Przecie� Zandor na tym nic nie zyska�. 
	AI_Output (self, other ,"DIA_Ghoran_AboutYou_03_05"); //Nie znasz kr�lewskiego prawa? Pojmanego zbiega mo�na albo odes�a� do miejsca jego przypisania, albo w zamian za kilka z�otych monet zrzec si� do niego praw. 
	AI_Output (self, other ,"DIA_Ghoran_AboutYou_03_06"); //W tym drugim przypadku, zbieg nie jest ju� traktowany jako podleg�y panu, lecz jako przest�pca, wi�c zostaje zes�any tutaj.
	AI_Output (self, other ,"DIA_Ghoran_AboutYou_03_07"); //Widocznie moja praca by�a dla niego mniej warta ni� kilka z�otych monet. 
};

//========================================
//-----------------> Plants
//========================================

INSTANCE DIA_Ghoran_Plants (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_Plants_Condition;
   information  = DIA_Ghoran_Plants_Info;
   permanent	= FALSE;
   description	= "Sk�d pozyskujecie winogrona?";
};

FUNC INT DIA_Ghoran_Plants_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ghoran_WhoYou2))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Ghoran_Plants_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_Plants_15_01"); //Sk�d pozyskujecie winogrona?
    AI_Output (self, other ,"DIA_Ghoran_Plants_03_02"); //Rozejrzyj si�. 
	AI_PlayAni (hero, "T_SEARCH");
	AI_Output (self, other ,"DIA_Ghoran_Plants_03_03"); //Widzisz te zielone pn�cza? No w�a�nie. Kilka lat temu uda�o nam si� sprowadzi� kilka sadzonek. Wi�kszo�� z nich si� przyj�a i chwali� los, dot�d wspaniale owocuj�. 
	AI_Output (other, self ,"DIA_Ghoran_Plants_15_04"); //Przyznasz chyba, �e to do�� nowatorski pomys�, by zak�ada� winnic� na bagnie i to jeszcze w Kolonii Karnej. 
	AI_Output (self, other ,"DIA_Ghoran_Plants_03_05"); //Fakt, pocz�tkowo wi�kszo�� moich wsp�braci by�a do�� sceptyczna co do pomys�u, by rozpocz�� na bagnach produkcj� wina. 
	AI_Output (self, other ,"DIA_Ghoran_Plants_03_06"); //Nawet m�j kompan, Severio nie dowierza� w to, �e to mo�e si� uda� si� uda. A tu prosz� - wszystko wysz�o nawet lepiej, ni� sam si� spodziewa�em.	
};

//========================================
//-----------------> Margunios
//========================================

INSTANCE DIA_Ghoran_Margunios (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_Margunios_Condition;
   information  = DIA_Ghoran_Margunios_Info;
   permanent	= FALSE;
   description	= "Co to jest margunios?";
};

FUNC INT DIA_Ghoran_Margunios_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ghoran_WhoYou2))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Ghoran_Margunios_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_Margunios_15_01"); //Co to jest margunios?
    AI_Output (self, other ,"DIA_Ghoran_Margunios_03_02"); //Nie wiesz, co to jest margunios? To jest bia�e wino z okolic Ardei i Cape Dun. 
	AI_Output (self, other ,"DIA_Ghoran_Margunios_03_03"); //Dawniej jego produkcja znajdowa�a si� w r�kach rodu Margunios, ale gdy r�d zubo�a�, to odsprzeda� swe winnice radzie wioski Ardei. 
	AI_Output (self, other ,"DIA_Ghoran_Margunios_03_04"); //Niegdy� rywalizowa�o z winem vengardzkim o arystokratyczne sto�y, ale teraz obni�y�o nieco swe loty i jako trunek kr�luje w domach kupc�w oraz drobnego rycerstwa. 
	AI_Output (other, self ,"DIA_Ghoran_Margunios_15_05"); //A ty je teraz tu produkujesz!?
	AI_Output (self, other ,"DIA_Ghoran_Margunios_03_06"); //Tak, ale jego obozow� wersj� na miar� miejsca i warunk�w. 
};

///////////////////////////////////////////////
// ZADANIE Z ALKOHOLEM OD BANDYT�W
///////////////////////////////////////////////

//========================================
//-----------------> AlcoSell
//========================================

INSTANCE DIA_Ghoran_AlcoSell (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 2;
   condition    = DIA_Ghoran_AlcoSell_Condition;
   information  = DIA_Ghoran_AlcoSell_Info;
   permanent	= FALSE;
   description	= "Kupicie alkohol od Bandyt�w?";
};

FUNC INT DIA_Ghoran_AlcoSell_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_Sprawa))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ghoran_AlcoSell_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_AlcoSell_15_01"); //Kupicie alkohol od Bandyt�w?
    AI_Output (self, other ,"DIA_Ghoran_AlcoSell_03_02"); //Za ile?
    AI_Output (other, self ,"DIA_Ghoran_AlcoSell_15_03"); //No nie wiem. 15 bry�ek rudy za butelk�? Naprawd� warto!
    AI_Output (self, other ,"DIA_Ghoran_AlcoSell_03_04"); //Szkodnicy chc� od nas 20 bry�ek rudy.
    AI_Output (self, other ,"DIA_Ghoran_AlcoSell_03_05"); //Teoretycznie op�aca nam si� to, jednak nie jestem pewien waszych intencji.
    AI_Output (self, other ,"DIA_Ghoran_AlcoSell_03_06"); //Przypuszczam, �e chcecie sprzeda� nam jakie� �wi�stwo.
    AI_Output (other, self ,"DIA_Ghoran_AlcoSell_15_07"); //Ten alkohol jest taki sam, jak ten oferowany przez Szkodnik�w. Powiedzia�bym nawet, �e jest lepszy.
    AI_Output (self, other ,"DIA_Ghoran_AlcoSell_03_08"); //No nie wiem. Udowodnij mi, �e wasz jest lepszy.
    AI_Output (self, other ,"DIA_Ghoran_AlcoSell_03_09"); //Wtedy si� zastanowi�.
    B_LogEntry                     (CH1_SellAlco,"Ghoran nie jest przekonany do naszego produktu. Mam udowodni�, �e jest lepszy od tego oferowanego przez Szkodnik�w. Musz� z nim pokombinowa� na stole alchemicznym. ");
	GhoranTalk = true;
};



//========================================
//-----------------> Sprobuj
//========================================
//edit by Nocturn

INSTANCE DIA_Ghoran_Sprobuj (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_Sprobuj_Condition;
   information  = DIA_Ghoran_Sprobuj_Info;
   permanent	= FALSE;
   description	= "Sam spr�buj.";
};

FUNC INT DIA_Ghoran_Sprobuj_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ghoran_AlcoSell)) && (Npc_HasItems (other, ItMi_Alchemy_Alcohol_02) >=1)
    && (MIS_SellAlco == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ghoran_Sprobuj_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_Sprobuj_15_01"); //Sam spr�buj.
	B_GiveInvItems (hero,self,ItMi_Alchemy_Alcohol_02,1);
	CreateInvItem (self,itfowine);
	AI_UseItem	(self,ItFoWine);
    AI_Output (self, other ,"DIA_Ghoran_Sprobuj_03_02"); //Hmmm. Ten alkohol jest naprawd� dobry. Lepszy od tego, kt�ry do tej pory kupowali�my.
    AI_Output (self, other ,"DIA_Ghoran_Sprobuj_03_03"); //My�l�, �e mo�emy go wykorzysta� do produkcji specjalnych nalewek.
    AI_Output (self, other ,"DIA_Ghoran_Sprobuj_03_04"); //Nowicjusze i Guru z pewno�ci� skusz� si� na nasz nowy towar. 
    AI_Output (self, other ,"DIA_Ghoran_Sprobuj_03_05"); //Chc� tego wi�cej.
    AI_Output (other, self ,"DIA_Ghoran_Sprobuj_15_06"); //Wiedzia�em, �e ci si� spodoba.
    B_LogEntry                     (CH1_SellAlco,"Ghoram by� bardzo zadowolony z naszego alkoholu. My�l�, �e przekona�em go t� ma�� przer�bk�.");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> FirstDostawa
//========================================

INSTANCE DIA_Ghoran_FirstDostawa (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_FirstDostawa_Condition;
   information  = DIA_Ghoran_FirstDostawa_Info;
   permanent	= FALSE;
   description	= "Przynios�em pierwsz� dostaw�.";
};

FUNC INT DIA_Ghoran_FirstDostawa_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_Dostwy))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ghoran_FirstDostawa_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_FirstDostawa_15_01"); //Przynios�em pierwsz� dostaw�.
    AI_Output (self, other ,"DIA_Ghoran_FirstDostawa_03_02"); //Dobra, dawaj.
    B_LogEntry                     (CH1_Dostawy,"Bractwo - alkohol dostarczony.");

    B_GiveXP (50);
    B_GiveInvItems (other, self, ItMi_Alchemy_Alcohol_01, 10);
    AI_StopProcessInfos	(self);
};

////////////////////////////////////////////
// ZADANIE Z POSZUKIWANIEM WSP�LNIKA
////////////////////////////////////////////

//========================================
//-----------------> VineQuest
//========================================

INSTANCE DIA_Ghoran_VineQuest (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_VineQuest_Condition;
   information  = DIA_Ghoran_VineQuest_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ghoran_VineQuest_Condition()
{
    if (Npc_GetTrueGuild (hero) == GIL_NOV)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ghoran_VineQuest_Info()
{
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_01"); //Bracie, zaczekaj, zaczekaj!
    AI_Output (other, self ,"DIA_Ghoran_VineQuest_15_02"); //Czego chcesz?
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_03"); //Nowicjusze m�wi�, �e do�� cz�sto opuszczasz Ob�z, wi�c pewnie spotykasz troch� ludzi na swojej drodze. 
    AI_Output (other, self ,"DIA_Ghoran_VineQuest_15_04"); //Ca�kiem mo�liwe...
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_05"); //No widzisz. Jest sprawa... i troch� nie wiem od czego zacz��. 
    AI_Output (other, self ,"DIA_Ghoran_VineQuest_15_06"); //Najlepiej zacznij od pocz�tku.
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_07"); //Od pocz�tku, to by za d�ugo si� zesz�o. Powiem wi�c wprost. Wi�kszo�� moich klient�w to Nowicjusze, je�eli nie liczy� poczciwego Gor Boby. 
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_08"); //Reszta Stra�nik�w woli kupi� wino pochodz�ce z handlu ze Starym Obozem, czyli importowane ze �wiata Zewn�trznego.
    AI_Output (other, self ,"DIA_Ghoran_VineQuest_15_09"); //Wi�c mo�e spr�buj produkowa� lepsze wino?
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_10"); //Gdyby to wszystko by�o takie proste. To co wiem o produkcji wina... Tego nauczy�em si� w Kolonii od Severio, a i tak m�j przyjaciel zdo�a� mi przekaza� jedynie cz�stk� swojej wiedzy. 
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_11"); //Potrzebuj� wi�c kogo�, kto si� dobrze na tym zna.
    AI_Output (other, self ,"DIA_Ghoran_VineQuest_15_12"); //Czyli mam ci znale�� w Kolonii wsp�lnika? 
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_13"); //Dok�adnie. I jakby� m�g�, to nie rozpowiadaj w Bractwie o moich poszukiwaniach. Nie chc� by moi wsp�bracia poczuli si� ura�eni. 
	
	MIS_GhoransVine = LOG_RUNNING;
		
    Log_CreateTopic		(CH1_GhoransVine, LOG_MISSION);
	Log_SetTopicStatus	(CH1_GhoransVine, LOG_RUNNING);
	B_LogEntry					(CH1_GhoransVine, "Nowicjusz Ghoran wyrabiaj�cy w Bractwie wino potrzebuje kogo�, kto zna si� lepiej od niego na produkcji. Powinienem popyta� o to kogo� obeznanego. By� mo�e karczmarz ze Starego Obozu b�dzie co� wiedzia�.");
};

//========================================
//-----------------> AbelIsWorker
//========================================

INSTANCE DIA_Ghoran_AbelIsWorker (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_AbelIsWorker_Condition;
   information  = DIA_Ghoran_AbelIsWorker_Info;
   permanent	= FALSE;
   description	= "W Obozie zjawi� si� ju� Abel?";
};

FUNC INT DIA_Ghoran_AbelIsWorker_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Abel_Win))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ghoran_AbelIsWorker_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_AbelIsWorker_15_01"); //W Obozie zjawi� si� ju� Abel?
    AI_Output (self, other ,"DIA_Ghoran_AbelIsWorker_03_02"); //Tak. Jestem ci naprawd� wdzi�czny. Ten go�� naprawd� ma poj�cie o winie. My�l�, �e b�dzie nam si� dobrze pracowa�.
	AI_Output (self, other ,"DIA_Ghoran_AbelIsWorker_03_03"); //Da�em mu troch� czasu na wytchnienie i zapoznanie si� z Obozem. Sk�d�e ty� go wzi��? Nerwowy jakby uciek� z kr�lewskiego wi�zienia.
	AI_Output (other, self ,"DIA_Ghoran_AbelIsWorker_15_04"); //To d�uga historia. Mo�e sam ci kiedy� opowie...
	AI_Output (self, other ,"DIA_Ghoran_AbelIsWorker_03_05"); //Mam nadziej�. Od�o�y�em dla ciebie troch� rudy ze sprzeda�y wina. My�l�, �e to wystarczy na pokrycie koszt�w. 
	AI_Output (other, self ,"DIA_Ghoran_AbelIsWorker_15_06"); //Miliony to to nie s�, ale zadowol� si�.
	
	CreateInvItems (self, itminugget,100);
    B_GiveInvItems (self, hero, itminugget, 100);
	
	MIS_GhoransVine = LOG_SUCCESS;
		
	Log_SetTopicStatus	(CH1_GhoransVine, LOG_SUCCESS);
	B_LogEntry			(CH1_GhoransVine, "Ghoran wynagrodzi� mnie za sprowadzenie mu pomocnika. My�l�, �e dogadaj� si� razem z Ablem.");
	
	B_GiveXP (220);
	
    AI_StopProcessInfos	(self);
	
	B_ChangeGuild    (VLK_7003_Abel,GIL_NOV);  
	B_SetPermAttitude	(VLK_7003_Abel,	ATT_FRIENDLY);
};
