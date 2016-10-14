//poprawione i sprawdzone - Nocturn

//poprawione b��dy g1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Steh_EXIT(C_INFO)
{
	npc             = NOV_1376_Steh;
	nr              = 999;
	condition	= DIA_Steh_EXIT_Condition;
	information	= DIA_Steh_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Steh_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Steh_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Steh_HELLO (C_INFO)
{
   npc          = NOV_1376_Steh;
   nr           = 1;
   condition    = DIA_Steh_HELLO_Condition;
   information  = DIA_Steh_HELLO_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Steh_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Steh_HELLO_Info()
{
    AI_Output (other, self ,"DIA_Steh_HELLO_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Steh_HELLO_03_02"); //Czego chcesz? Jestem Steh.
    AI_Output (self, other ,"DIA_Steh_HELLO_03_03"); //Badam okoliczne tereny.
	AI_Output (other, self ,"DIA_Steh_HELLO_15_04"); //A czego tu szukasz?
    AI_Output (self, other ,"DIA_Steh_HELLO_03_05"); //R�nych rzeczy. Nie interesuj si�.
    B_LogEntry                     (GE_TraderPSI,"Steh handluje przy mo�cie prowadz�cym z Obozu wg��b bagien.");
};

//========================================
//-----------------> HANDEL
//========================================

INSTANCE DIA_Steh_HANDEL (C_INFO)
{
   npc          = NOV_1376_Steh;
   nr           = 600;
   condition    = DIA_Steh_HANDEL_Condition;
   information  = DIA_Steh_HANDEL_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Poka� mi swoje towary!";
};

FUNC INT DIA_Steh_HANDEL_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Steh_HELLO))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Steh_HANDEL_Info()
{
    AI_Output (other, self ,"DIA_Steh_HANDEL_15_01"); //Poka� mi swoje towary!
    AI_Output (self, other ,"DIA_Steh_HANDEL_03_02"); //Wybierz co�.
};

var int steh_badania;
//========================================
//-----------------> QUEST_BADANIA
//========================================

INSTANCE DIA_Steh_QUEST_BADANIA (C_INFO)
{
   npc          = NOV_1376_Steh;
   nr           = 3;
   condition    = DIA_Steh_QUEST_BADANIA_Condition;
   information  = DIA_Steh_QUEST_BADANIA_Info;
   permanent	= true;
   description	= "Jak twoje badania?";
};

FUNC INT DIA_Steh_QUEST_BADANIA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Steh_HELLO)) && steh_badania == false
    {
    return TRUE;
    };
};


FUNC VOID DIA_Steh_QUEST_BADANIA_Info()
{
    AI_Output (other, self ,"DIA_Steh_QUEST_BADANIA_15_01"); //Jak twoje badania?
    AI_Output (self, other ,"DIA_Steh_QUEST_BADANIA_03_02"); //Dokona�em pewnych post�p�w. Odkry�em, �e na tych terenach mieszka�a prastara cywilizacja.
    AI_Output (self, other ,"DIA_Steh_QUEST_BADANIA_03_03"); //Niestety, moje badania na razie stoj�.
    AI_Output (other, self ,"DIA_Steh_QUEST_BADANIA_15_04"); //Dlaczego?
    AI_Output (self, other ,"DIA_Steh_QUEST_BADANIA_03_05"); //Ot� dawni mieszka�cy tych teren�w do spisywania swojej historii u�ywali kamiennych tabliczek.
    AI_Output (self, other ,"DIA_Steh_QUEST_BADANIA_03_06"); //S� czarne i nie rzucaj� si� w oczy.
    AI_Output (self, other ,"DIA_Steh_QUEST_BADANIA_03_07"); //Potrzebuj� ich do bada�. Niestety, nie jestem zbyt dobrym wojownikiem...
	AI_Output (other, self ,"DIA_Steh_QUEST_BADANIA_15_08"); //Wiem, co dalej.
    AI_Output (other, self ,"DIA_Steh_QUEST_BADANIA_15_09"); //Ile mi zap�acisz?
	if (kapitel == 1)
	{
	AI_Output (self, other ,"DIA_Steh_QUEST_BADANIA_03_13"); //Tobie? Nie wygl�dasz mi na wojownika. Wr��, gdy si� czego� nauczysz.
	//DIA_Steh_QUEST_BADANIA.permanent = true;
	}
	else
	{
    AI_Output (self, other ,"DIA_Steh_QUEST_BADANIA_03_10"); //300 bry�ek rudy i tabliczk�, dzi�ki kt�rej lepiej wykorzystasz swoj� si��.
    AI_Output (other, self ,"DIA_Steh_QUEST_BADANIA_15_11"); //Dobrze. Odszukam te twoje tabliczki.
    AI_Output (self, other ,"DIA_Steh_QUEST_BADANIA_03_12"); //Patrz uwa�nie. Mog� by� ukryte w bagnie. Pi�� powinno wystarczy�.
    MIS_Plates = LOG_RUNNING;

    Log_CreateTopic          (CH2_Plates, LOG_MISSION);
    Log_SetTopicStatus       (CH2_Plates, LOG_RUNNING);
    B_LogEntry               (CH2_Plates,"Steh kaza� mi odnale�� na bagnie kilka kamiennych tabliczek. S� czarne i mog� znajdowa� si� w bagnie.");
	//DIA_Steh_QUEST_BADANIA.permanent = false;
	steh_badania = true;
    };
};

//========================================
//-----------------> QUEST_TABLICE
//========================================

INSTANCE DIA_Steh_QUEST_TABLICE (C_INFO)
{
   npc          = NOV_1376_Steh;
   nr           = 4;
   condition    = DIA_Steh_QUEST_TABLICE_Condition;
   information  = DIA_Steh_QUEST_TABLICE_Info;
   permanent	= FALSE;
   description	= "Mam twoje tabliczki.";
};

FUNC INT DIA_Steh_QUEST_TABLICE_Condition()
{
    if (Npc_HasItems (other, BlackPlate01) >=5)
    && (MIS_Plates == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Steh_QUEST_TABLICE_Info()
{
    AI_Output (other, self ,"DIA_Steh_QUEST_TABLICE_15_01"); //Mam twoje tabliczki.
    AI_Output (self, other ,"DIA_Steh_QUEST_TABLICE_03_02"); //Naprawd� je znalaz�e�?! Bardzo ci dzi�kuj�.
    AI_Output (self, other ,"DIA_Steh_QUEST_TABLICE_03_03"); //To z pewno�ci� przyspieszy moje badania.
    AI_Output (self, other ,"DIA_Steh_QUEST_TABLICE_03_04"); //Oto twoja nagroda.
    B_LogEntry                     (CH2_Plates,"Odnalaz�em tabliczki dla Steha.");
    Log_SetTopicStatus       (CH2_Plates, LOG_SUCCESS);
    MIS_Plates = LOG_SUCCESS;
	var int ilosc_tabliczek;
	ilosc_tabliczek = Npc_hasitems (hero, BlackPlate01);
    B_GiveInvItems (hero,self,BlackPlate01,ilosc_tabliczek);
    B_GiveXP (ilosc_tabliczek*100);
    CreateInvItems (self, ItMiNugget, ilosc_tabliczek*10); //1.24 fixed
    B_GiveInvItems (self, other, ItMiNugget, ilosc_tabliczek*10);
	CreateInvItems (self, BlackPlateSTR, 1);
    B_GiveInvItems (self, other, BlackPlateSTR, 1);
};

//========================================
//-----------------> QUEST2_YOU
//========================================

INSTANCE DIA_Steh_QUEST2_YOU (C_INFO)
{
   npc          = NOV_1376_Steh;
   nr           = 5;
   condition    = DIA_Steh_QUEST2_YOU_Condition;
   information  = DIA_Steh_QUEST2_YOU_Info;
   permanent	= FALSE;
   description	= "To ty sprzedajesz Nowicjuszom artefakty!";
};

FUNC INT DIA_Steh_QUEST2_YOU_Condition()
{
    if (Npc_KnowsInfo (hero, Nov_1371_BaalNetbek_QUEST))
    && (MIS_StrangeResearcher == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Steh_QUEST2_YOU_Info()
{
    AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_15_01"); //To ty sprzedajesz Nowicjuszom artefakty!
    AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_03_02"); //Mistrzu, to wszystko nie tak!
    AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_03_03"); //Jak uda�o ci si� rozwik�a� t� zagadk�? My�la�em, �e jestem nieuchwytny. 
    AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_15_04"); //Zostawi�e� za sob� kilka �lad�w. Czemu to robisz? Dobrze wiesz, �e tylko Guru mog� handlowa� magicznymi artefaktami.
	AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_03_05"); //Prosz�, wybacz mi. Potrzebowa�em rudy. W Obozie m�wi si� o prawdziwej naturze �ni�cego... Chcia�em st�d uciec.
	Info_ClearChoices	(DIA_Steh_QUEST2_YOU);
	Info_AddChoice		(DIA_Steh_QUEST2_YOU,"(Sk�am o �ni�cym)", DIA_Steh_QUEST2_YOU_LIE);
	Info_AddChoice		(DIA_Steh_QUEST2_YOU,"(Powiedz prawd� o �ni�cym)",DIA_Steh_QUEST2_YOU_TRUE);
};

FUNC VOID DIA_Steh_QUEST2_YOU_LIE ()
{
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_LIE_15_01"); //�ni�cy nie jest demonem!
    AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_LIE_03_02"); //Jak to? Przecie� rytua� przywo�ania si� nie uda�. Y'Berion nie �yje, Cor Kalom uciek�, a nowym Guru zosta�e� ty - cz�owiek, kt�rego nikt nie zna.
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_LIE_15_03"); //Rytua� przywo�ania przebieg� tak jak powinien. Y'Berion po prostu nie wytrzyma�, bo nie by� odpowiednio przygotowany. Wszyscy ubolewamy nad jego �mierci�.
	AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_LIE_03_04"); //Naprawd� tak by�o? Wszystko z pozoru wygl�da�o inaczej.
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_LIE_15_05"); //Masz racj�, z pozoru... Tak naprawd� nie ma czego si� obawia�. �ni�cy nam nie zagra�a. Mo�e nas nawet ocali�!
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_LIE_15_06"); //Musimy skorzysta� z tej szansy, ale aby to si� sta�o Bractwo nie mo�e upa��! 
	AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_LIE_03_07"); //Jestem gotowy podda� si� twojej woli! Co mam zrobi�? 
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_LIE_15_08"); //Zanie� wszystkie artefakty, kt�re masz przy sobie do Shawna, a potem oddaj si� pracy na rzecz wsp�lnoty.
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_LIE_15_09"); //A i zapami�taj: nigdy nie lekcewa� zakaz�w narzuconych przez Guru!
	AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_LIE_03_10"); //Dzi�kuj� za drug� szans�!
	B_LogEntry     (CH3_StrangeResearcher,"Nowicjuszem, kt�ry sprzedaje artefakty jest niejaki Steh, kr�c�cy si� przy palisadzie chroni�cej Ob�z przed b�otnymi w�ami. Rozmawia�em z nim i musia�em posun�� si� do k�amstwa, �eby dobrowolnie odda� wszystkie artefakty, a przy tym nie opu�ci� Obozu.");
	Info_ClearChoices	(DIA_Steh_QUEST2_YOU);
};

FUNC VOID DIA_Steh_QUEST2_YOU_TRUE ()
{
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_TRUE_15_01"); //Masz racj�, �ni�cy jest demonem. 
	AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_TRUE_03_02"); //Wiedzia�em, wiedzia�em, �e to musi by� prawda! Co teraz z nami b�dzie?
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_TRUE_15_03"); //Musimy mie� si� na baczno�ci, uwa�a�, �eby �ni�cy nie przej�� nad nami w�adzy.
	AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_TRUE_03_04"); //Co to znaczy?
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_TRUE_15_05"); //�ni�cy wci�� jest dla nas szans� na ucieczk�. Musimy j� wykorzysta�, b�d�c przy tym niezwykle ostro�nymi. 
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_TRUE_15_06"); //Dlatego tak wa�ne jest �eby przestrzega� nakaz�w Guru. Robimy to wszystko ze wzgl�d�w ostro�no�ci. 
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_TRUE_15_07"); //Sprzedaj�c te artefakty nieodpowiednim osobom, powa�nie szkodzisz ca�emu Bractwu. Przemy�l to. 
	AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_TRUE_03_08"); //No dobrze. Oddam wszystkie artefakty do �wi�tyni, a p�niej odejd�. Wybacz, Mistrzu, ale g��boko wierzy�em w �ni�cego.
	AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_TRUE_03_09"); //Teraz... teraz to wszystko nie ma dla mnie sensu...
	B_LogEntry     (CH3_StrangeResearcher,"Nowicjuszem, kt�ry sprzedaje artefakty jest niejaki Steh, kr�c�cy si� przy palisadzie chroni�cej Ob�z przed b�otnymi w�ami. Rozmawia�em z nim i postanowi�em powiedzie� mu prawd�. Prawda o �ni�cym bardzo go zabola�a. Postanowi� jednak, �e odda wszystkie artefakty zanim odejdzie z Obozu.");
	Info_ClearChoices	(DIA_Steh_QUEST2_YOU);
	Npc_ExchangeRoutine(self,"tot");
};