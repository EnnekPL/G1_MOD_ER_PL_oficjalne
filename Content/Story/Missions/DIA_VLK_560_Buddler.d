//========================================
//-----------------> HelpWithVine
//========================================

INSTANCE DIA_Gulris_HelpWithVine (C_INFO)
{
   npc          = VLK_560_Buddler;
   nr           = 1;
   condition    = DIA_Gulris_HelpWithVine_Condition;
   information  = DIA_Gulris_HelpWithVine_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gulris_HelpWithVine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Snaf_Margunios))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gulris_HelpWithVine_Info()
{
    AI_Output (self, other ,"DIA_Gulris_HelpWithVine_03_01"); //Hej, ty. S�ysza�em o czym rozmawia�e� ze Snafem i chyba by�bym w stanie ci pom�c. 
    AI_Output (other, self ,"DIA_Gulris_HelpWithVine_15_02"); //Ale?
    AI_Output (self, other ,"DIA_Gulris_HelpWithVine_03_03"); //Ko�czy mi si� ruda, a �rednio chce mi si� wraca� na kolejne tygodnie do rycia w kopalni. 
    AI_Output (other, self ,"DIA_Gulris_HelpWithVine_15_04"); //Ile?
    AI_Output (self, other ,"DIA_Gulris_HelpWithVine_03_05"); //45 bry�ek.

    Info_ClearChoices		(DIA_Gulris_HelpWithVine);
    Info_AddChoice		(DIA_Gulris_HelpWithVine, "Nie mam tylu.", DIA_Gulris_HelpWithVine_Nope);
	if (Npc_HasItems(hero,itminugget) >=30)
	{
    Info_AddChoice		(DIA_Gulris_HelpWithVine, "Dam 30 bry�ek.", DIA_Gulris_HelpWithVine_30Ore);
	};
	if (Npc_HasItems(hero,itminugget) >=45)
	{
    Info_AddChoice		(DIA_Gulris_HelpWithVine, "Masz te 45 bry�ek, tylko gadaj szybko.", DIA_Gulris_HelpWithVine_45Ore);
	};
};

FUNC VOID DIA_Gulris_HelpWithVine_Nope()
{
    AI_Output (other, self ,"DIA_Gulris_HelpWithVine_Nope_15_01"); //Nie mam tylu.
    AI_Output (self, other ,"DIA_Gulris_HelpWithVine_Nope_03_02"); //To przyjd� jak b�dziesz mia�.
    Info_ClearChoices		(DIA_Gulris_HelpWithVine);
    AI_StopProcessInfos	(self);
	HeroNeedCollectMoreOre_VLK_560 = true;
};

FUNC VOID DIA_Gulris_HelpWithVine_30Ore()
{
    AI_Output (other, self ,"DIA_Gulris_HelpWithVine_30Ore_15_01"); //Dam 30 bry�ek.
    AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_02"); //No dobra.
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_03"); //Mieli�my tutaj takiego jednego, co pracowa� w winiarni - nazywa� si� Abel. Jak si� z nim o tym gada�o, to wida� by�o, �e wie o czym m�wi. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_04"); //Kole� jednak zadawa� si� z Bandytami, wi�c si� stra�om, delikatnie m�wi�c, narazi�. W ramach kary wys�ano go do kopalni, ale bez prawa powrotu. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_05"); //W sumie nie wiem czemu go nie zabili - chyba Thorus mia� po prostu lepszy dzie�. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_06"); //Abel przebywa tam ju� od kilku miesi�cy i jak go ostatnim razem widzia�em, to jeszcze �y�. Jak chcesz, to pogadaj z nim. 
    Info_ClearChoices		(DIA_Gulris_HelpWithVine);
    AI_StopProcessInfos	(self);
	
	B_LogEntry			(CH1_GhoransVine, "Kopacz Gulris w zamian za drobn� pomoc finansow� zdradzi� mi, �e niejaki Abel z obozu przed Star� Kopalni� zna si� na rzeczy.");
	
	B_GiveInvItems (other, self, itminugget, 30);
	HeroKnowAbelIsWinemaker = true;
	B_GiveXP (75);
};

FUNC VOID DIA_Gulris_HelpWithVine_45Ore()
{
    AI_Output (other, self ,"DIA_Gulris_HelpWithVine_45Ore_15_01"); //Masz te 45 bry�ek, tylko gadaj szybko.
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_02"); //No dobra.
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_03"); //Mieli�my tutaj takiego jednego, co pracowa� w winiarni - nazywa� si� Abel. Jak si� z nim o tym gada�o, to wida� by�o, �e wie o czym m�wi. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_04"); //Kole� jednak zadawa� si� z Bandytami, wi�c si� stra�om, delikatnie m�wi�c, narazi�. W ramach kary wys�ano go do kopalni, ale bez prawa powrotu. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_05"); //W sumie nie wiem czemu go nie zabili - chyba Thorus mia� po prostu lepszy dzie�. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_06"); //Abel przebywa tam ju� od kilku miesi�cy i jak go ostatnim razem widzia�em, to jeszcze �y�. Jak chcesz, to pogadaj z nim. 
    Info_ClearChoices		(DIA_Gulris_HelpWithVine);
    AI_StopProcessInfos	(self);
	
	B_LogEntry			(CH1_GhoransVine, "Kopacz Gulris w zamian za drobn� pomoc finansow� zdradzi� mi, �e niejaki Abel z obozu przed Star� Kopalni� zna si� na rzeczy.");
	
	B_GiveInvItems (other, self, itminugget, 45);
	HeroKnowAbelIsWinemaker = true;
	B_GiveXP (50);
};

//========================================
//-----------------> 45OreGive
//========================================

INSTANCE DIA_Gulris_45OreGive (C_INFO)
{
   npc          = VLK_560_Buddler;
   nr           = 1;
   condition    = DIA_Gulris_45OreGive_Condition;
   information  = DIA_Gulris_45OreGive_Info;
   permanent	= FALSE;
   description	= "Mam przy sobie 45 bry�ek rudy.";
};

FUNC INT DIA_Gulris_45OreGive_Condition()
{
    if (HeroNeedCollectMoreOre_VLK_560 == true)
    && (Npc_HasItems (hero, ItMiNugget)>=45)
	&& (MIS_GhoransVine == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gulris_45OreGive_Info()
{
    AI_Output (other, self ,"DIA_Gulris_45OreGive_15_01"); //Mam przy sobie 45 bry�ek rudy.
    AI_Output (self, other ,"DIA_Gulris_45OreGive_03_02"); //Dawaj!
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_02"); //No dobra.
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_03"); //Mieli�my tutaj takiego jednego, co pracowa� w winiarni - nazywa� si� Abel. Jak si� z nim o tym gada�o, to wida� by�o, �e wie o czym m�wi. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_04"); //Kole� jednak zadawa� si� z Bandytami, wi�c si� stra�om, delikatnie m�wi�c, narazi�. W ramach kary wys�ano go do kopalni, ale bez prawa powrotu. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_05"); //W sumie nie wiem czemu go nie zabili - chyba Thorus mia� po prostu lepszy dzie�. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_06"); //Abel przebywa tam ju� od kilku miesi�cy i jak go ostatnim razem widzia�em, to jeszcze �y�. Jak chcesz, to pogadaj z nim. 
	
    AI_StopProcessInfos	(self);
	
	B_LogEntry			(CH1_GhoransVine, "Kopacz Gulris w zamian za drobn� pomoc finansow� zdradzi� mi, �e niejaki Abel z obozu przed Star� Kopalni� zna si� na rzeczy.");
	
	B_GiveInvItems (other, self, itminugget, 45);
	HeroKnowAbelIsWinemaker = true;
	B_GiveXP (50);
};

// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Gulris_EXIT(C_INFO)
{
	npc             = VLK_560_Buddler;
	nr              = 999;
	condition	= DIA_Gulris_EXIT_Condition;
	information	= DIA_Gulris_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Gulris_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gulris_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Gulris_HELLO1 (C_INFO)
{
   npc          = VLK_560_Buddler;
   nr           = 1;
   condition    = DIA_Gulris_HELLO1_Condition;
   information  = DIA_Gulris_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Gulris_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gulris_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Gulris_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Gulris_HELLO1_03_02"); //Jestem Gulris, Kopacz i skazaniec, ale to tak jak wszyscy pod t� Magiczn� Barier�.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Gulris_HELLO2 (C_INFO)
{
   npc          = VLK_560_Buddler;
   nr           = 2;
   condition    = DIA_Gulris_HELLO2_Condition;
   information  = DIA_Gulris_HELLO2_Info;
   permanent	= FALSE;
   description	= "Przecie� nie wszyscy s� Kopaczami. ";
};

FUNC INT DIA_Gulris_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gulris_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gulris_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Gulris_HELLO2_15_01"); //Przecie� nie wszyscy s� Kopaczami. 
    AI_Output (self, other ,"DIA_Gulris_HELLO2_03_02"); //Ale �ycie wszystkich w Kolonii Karnej podporz�dkowane jest jednemu celowi - wydobyciu magicznej rudy. 
    AI_Output (self, other ,"DIA_Gulris_HELLO2_03_03"); //Magnaci s� od tego, by prowadzi� handel rud� ze �wiatem Zewn�trznym, Stra�nicy, by pilnowa� Kopaczy.
    AI_Output (self, other ,"DIA_Gulris_HELLO2_03_04"); //A Cienie? No c�, pe�ni� podobn� funkcj� jak Stra�nicy, tylko w przeciwie�stwie do Stra�nik�w nie zdzieraj� z nas rudy. No mo�e nie do ko�ca, bo to w r�kach Cieni le�y handel w naszym obozie, wi�c i tak na sw�j spos�b nas obdzieraj�. 
    AI_Output (self, other ,"DIA_Gulris_HELLO2_03_05"); //Po co s� Kopacze, to chyba nie musz� ju� m�wi�. 
    AI_Output (self, other ,"DIA_Gulris_HELLO2_03_06"); //Jak sam wi�c widzisz, wszystko w G�rniczej Dolinie ��czy si� z magiczn� rud�. 
    AI_Output (self, other ,"DIA_Gulris_HELLO2_03_07"); //Jak si� na to tak spojrzy, to nawet Magnaci s� jedynie trybikiem w tej ca�ej g�rniczej maszynie. 
    AI_Output (other, self ,"DIA_Gulris_HELLO2_15_08"); //W sumie racja. 
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Gulris_HELLO3 (C_INFO)
{
   npc          = VLK_560_Buddler;
   nr           = 3;
   condition    = DIA_Gulris_HELLO3_Condition;
   information  = DIA_Gulris_HELLO3_Info;
   permanent	= FALSE;
   description	= "A co z innymi obozami? ";
};

FUNC INT DIA_Gulris_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gulris_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gulris_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Gulris_HELLO3_15_01"); //A co z innymi obozami? 
    AI_Output (self, other ,"DIA_Gulris_HELLO3_03_02"); //W Starej Kopalni - ryj�. W Wolnej Kopalni te� ryj�. 
    AI_Output (self, other ,"DIA_Gulris_HELLO3_03_03"); //Tylko u sekciarzy nie ma �adnego wydobycia rudy, ale i oni pe�ni� tu pewn� rol�. 
    AI_Output (self, other ,"DIA_Gulris_HELLO3_03_04"); //Nawet oni, kiedy z nimi handlujemy, to wszystko odbywa si� za pomoc� magicznej rudy. 
    AI_Output (self, other ,"DIA_Gulris_HELLO3_03_05"); //Wszystko wi�c sprowadza si� do jednego. 
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Gulris_HELLO4 (C_INFO)
{
   npc          = VLK_560_Buddler;
   nr           = 4;
   condition    = DIA_Gulris_HELLO4_Condition;
   information  = DIA_Gulris_HELLO4_Info;
   permanent	= FALSE;
   description	= "Kto tu rz�dzi?";
};

FUNC INT DIA_Gulris_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gulris_HELLO3))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gulris_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Gulris_HELLO4_15_01"); //Kto tu rz�dzi?
    AI_Output (self, other ,"DIA_Gulris_HELLO4_03_02"); //Magiczna ruda! 
    AI_Output (other, self ,"DIA_Gulris_HELLO4_15_03"); //Gomez z pewno�ci� by si� ucieszy� gdyby to us�ysza�.
	AI_Output (self, other ,"DIA_Gulris_HELLO4_03_04"); //Ej, chwila. Przecie� mu tego nie powiesz. Nie masz z nim �adnego kontaktu. 
	AI_Output (other, self ,"DIA_Gulris_HELLO4_15_05"); //Jeste� pewny?
	AI_Output (self, other ,"DIA_Gulris_HELLO4_03_06"); //Ten... no... Za Gomeza! 
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Gulris_HELLO5 (C_INFO)
{
   npc          = VLK_560_Buddler;
   nr           = 5;
   condition    = DIA_Gulris_HELLO5_Condition;
   information  = DIA_Gulris_HELLO5_Info;
   permanent	= 0;
   description	= "Wi�c kto wed�ug ciebie tu rz�dzi?";
};

FUNC INT DIA_Gulris_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gulris_HELLO4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gulris_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Gulris_HELLO5_15_01"); //Wi�c kto wed�ug ciebie tu rz�dzi?
    AI_Output (self, other ,"DIA_Gulris_HELLO5_03_02"); //Gomez... Oczywi�cie, �e Gomez.
};

