//poprawione i sprawdzone - Nocturn

//poprawione b³êdy g1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Steh_EXIT(C_INFO)
{
	npc             = NOV_5006_Steh;
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
   npc          = NOV_5006_Steh;
   nr           = 1;
   condition    = DIA_Steh_HELLO_Condition;
   information  = DIA_Steh_HELLO_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Steh_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Steh_HELLO_Info()
{
    AI_Output (other, self ,"DIA_Steh_HELLO_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Steh_HELLO_03_02"); //Czego chcesz? Jestem Steh.
    AI_Output (self, other ,"DIA_Steh_HELLO_03_03"); //Badam okoliczne tereny.
	AI_Output (other, self ,"DIA_Steh_HELLO_15_04"); //A czego tu szukasz?
    AI_Output (self, other ,"DIA_Steh_HELLO_03_05"); //Ró¿nych rzeczy. Nie interesuj siê.
    B_LogEntry                     (GE_TraderPSI,"Steh handluje przy moœcie prowadz¹cym z Obozu wg³¹b bagien.");
};

//========================================
//-----------------> HANDEL
//========================================

INSTANCE DIA_Steh_HANDEL (C_INFO)
{
   npc          = NOV_5006_Steh;
   nr           = 600;
   condition    = DIA_Steh_HANDEL_Condition;
   information  = DIA_Steh_HANDEL_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Poka¿ mi swoje towary!";
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
    AI_Output (other, self ,"DIA_Steh_HANDEL_15_01"); //Poka¿ mi swoje towary!
    AI_Output (self, other ,"DIA_Steh_HANDEL_03_02"); //Wybierz coœ.
};

var int steh_badania;
//========================================
//-----------------> QUEST_BADANIA
//========================================

INSTANCE DIA_Steh_QUEST_BADANIA (C_INFO)
{
   npc          = NOV_5006_Steh;
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
    AI_Output (self, other ,"DIA_Steh_QUEST_BADANIA_03_02"); //Nie jest Ÿle. Odkry³em, ¿e na tych terenach mieszka³a prastara cywilizacja.
    AI_Output (self, other ,"DIA_Steh_QUEST_BADANIA_03_03"); //Niestety, moje badania na razie stoj¹.
    AI_Output (other, self ,"DIA_Steh_QUEST_BADANIA_15_04"); //Dlaczego?
    AI_Output (self, other ,"DIA_Steh_QUEST_BADANIA_03_05"); //Otó¿ dawni mieszkañcy tych terenów do spisywania swojej historii u¿ywali kamiennych tabliczek.
    AI_Output (self, other ,"DIA_Steh_QUEST_BADANIA_03_06"); //S¹ czarne i nie rzucaj¹ siê w oczy.
    AI_Output (self, other ,"DIA_Steh_QUEST_BADANIA_03_07"); //Potrzebujê ich do badañ. Niestety, nie jestem zbyt dobrym wojownikiem...
	AI_Output (other, self ,"DIA_Steh_QUEST_BADANIA_15_08"); //Wiem, co dalej.
    AI_Output (other, self ,"DIA_Steh_QUEST_BADANIA_15_09"); //Ile mi zap³acisz?
	if (kapitel == 1)
	{
	AI_Output (self, other ,"DIA_Steh_QUEST_BADANIA_03_13"); //Tobie? Nie wygl¹dasz mi na wojownika. Wróæ, gdy siê czegoœ nauczysz.
	//DIA_Steh_QUEST_BADANIA.permanent = true;
	}
	else
	{
    AI_Output (self, other ,"DIA_Steh_QUEST_BADANIA_03_10"); //300 bry³ek rudy i tabliczkê, dziêki której lepiej wykorzystasz swoj¹ si³ê.
    AI_Output (other, self ,"DIA_Steh_QUEST_BADANIA_15_11"); //Dobrze. Odszukam te twoje tabliczki.
    AI_Output (self, other ,"DIA_Steh_QUEST_BADANIA_03_12"); //Patrz uwa¿nie. Mog¹ byæ ukryte w bagnie. Piêæ powinno wystarczyæ.
    MIS_Tabliczki = LOG_RUNNING;

    Log_CreateTopic          (CH1_Tabliczki, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Tabliczki, LOG_RUNNING);
    B_LogEntry               (CH1_Tabliczki,"Steh kaza³ mi odnaleŸæ na bagnie kilka kamiennych tabliczek. S¹ czarne i mog¹ znajdowaæ siê w bagnie.");
	//DIA_Steh_QUEST_BADANIA.permanent = false;
	steh_badania = true;
    };
};

//========================================
//-----------------> QUEST_TABLICE
//========================================

INSTANCE DIA_Steh_QUEST_TABLICE (C_INFO)
{
   npc          = NOV_5006_Steh;
   nr           = 4;
   condition    = DIA_Steh_QUEST_TABLICE_Condition;
   information  = DIA_Steh_QUEST_TABLICE_Info;
   permanent	= FALSE;
   description	= "Mam twoje tabliczki.";
};

FUNC INT DIA_Steh_QUEST_TABLICE_Condition()
{
    if (Npc_HasItems (other, BlackPlate01) >=5)
    && (MIS_Tabliczki == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Steh_QUEST_TABLICE_Info()
{
    AI_Output (other, self ,"DIA_Steh_QUEST_TABLICE_15_01"); //Mam twoje tabliczki.
    AI_Output (self, other ,"DIA_Steh_QUEST_TABLICE_03_02"); //Naprawdê je znalaz³eœ?! Bardzo ci dziêkujê.
    AI_Output (self, other ,"DIA_Steh_QUEST_TABLICE_03_03"); //To z pewnoœci¹ przyspieszy moje badania.
    AI_Output (self, other ,"DIA_Steh_QUEST_TABLICE_03_04"); //Oto twoja nagroda.
    B_LogEntry                     (CH1_Tabliczki,"Odnalaz³em tabliczki dla Steha.");
    Log_SetTopicStatus       (CH1_Tabliczki, LOG_SUCCESS);
    MIS_Tabliczki = LOG_SUCCESS;
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
   npc          = NOV_5006_Steh;
   nr           = 5;
   condition    = DIA_Steh_QUEST2_YOU_Condition;
   information  = DIA_Steh_QUEST2_YOU_Info;
   permanent	= FALSE;
   description	= "To ty sprzedajesz Nowicjuszom artefakty!";
};

FUNC INT DIA_Steh_QUEST2_YOU_Condition()
{
    if (Npc_KnowsInfo (hero, Nov_1371_BaalNetbek_QUEST))
    && (MIS_HandlarzSteh == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Steh_QUEST2_YOU_Info()
{
    AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_15_01"); //To ty sprzedajesz Nowicjuszom artefakty!
    AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_03_02"); //Mistrzu, to wszystko nie tak!
    AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_03_03"); //Jak uda³o ci siê rozwik³aæ tê zagadkê? Myœla³em, ¿e jestem nieuchwytny. 
    AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_15_04"); //Zostawi³eœ za sob¹ kilka œladów. Czemu to robisz? Dobrze wiesz, ¿e tylko Guru mog¹ handlowaæ magicznymi artefaktami.
	AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_03_05"); //Proszê, wybacz mi. Potrzebowa³em rudy. W Obozie mówi siê o prawdziwej naturze Œni¹cego... Chcia³em st¹d uciec.
	Info_ClearChoices	(DIA_Steh_QUEST2_YOU);
	Info_AddChoice		(DIA_Steh_QUEST2_YOU,"(Sk³am o Œni¹cym)", DIA_Steh_QUEST2_YOU_LIE);
	Info_AddChoice		(DIA_Steh_QUEST2_YOU,"(Powiedz prawdê o Œni¹cym)",DIA_Steh_QUEST2_YOU_TRUE);
};

FUNC VOID DIA_Steh_QUEST2_YOU_LIE ()
{
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_LIE_15_01"); //Œni¹cy nie jest demonem!
    AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_LIE_03_02"); //Jak to? Przecie¿ rytua³ przywo³ania siê nie uda³. Y'Berion nie ¿yje, Cor Kalom uciek³, a nowym Guru zosta³eœ ty - cz³owiek, którego nikt nie zna.
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_LIE_15_03"); //Rytua³ przywo³ania przebieg³ tak jak powinien. Y'Berion po prostu nie wytrzyma³, bo nie by³ odpowiednio przygotowany. Wszyscy ubolewamy nad jego œmierci¹.
	AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_LIE_03_04"); //Naprawdê tak by³o? Wszystko z pozoru wygl¹da³o inaczej.
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_LIE_15_05"); //Masz racjê, z pozoru... Tak naprawdê nie ma czego siê obawiaæ. Œni¹cy nam nie zagra¿a. Mo¿e nas nawet ocaliæ!
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_LIE_15_06"); //Musimy skorzystaæ z tej szansy, ale aby to siê sta³o Bractwo nie mo¿e upaœæ! 
	AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_LIE_03_07"); //Jestem gotowy poddaæ siê twojej woli! Co mam zrobiæ? 
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_LIE_15_08"); //Zanieœ wszystkie artefakty, które masz przy sobie do Gor Na Dhuna, a potem oddaj siê pracy na rzecz wspólnoty.
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_LIE_15_09"); //A i zapamiêtaj: nigdy nie lekcewa¿ zakazów narzuconych przez Guru!
	AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_LIE_03_10"); //Dziêkujê za drug¹ szansê!
	B_LogEntry     (CH1_HandlarzSteh,"Nowicjuszem, który sprzedaje artefakty jest niejaki Steh, krêc¹cy siê przy palisadzie chroni¹cej Obóz przed b³otnymi wê¿ami. Rozmawia³em z nim i musia³em posun¹æ siê do k³amstwa, ¿eby dobrowolnie odda³ wszystkie artefakty, a przy tym nie opuœci³ Obozu.");
	Info_ClearChoices	(DIA_Steh_QUEST2_YOU);
};

FUNC VOID DIA_Steh_QUEST2_YOU_TRUE ()
{
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_TRUE_15_01"); //Masz racjê, Œni¹cy jest demonem. 
	AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_TRUE_03_02"); //Wiedzia³em, wiedzia³em, ¿e to musi byæ prawda! Co teraz z nami bêdzie?
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_TRUE_15_03"); //Musimy mieæ siê na bacznoœci, uwa¿aæ, ¿eby Œni¹cy nie przej¹³ nad nami w³adzy.
	AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_TRUE_03_04"); //Co to znaczy?
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_TRUE_15_05"); //Œni¹cy wci¹¿ jest dla nas szans¹ na ucieczkê. Musimy j¹ wykorzystaæ, bêd¹c przy tym niezwykle ostro¿nymi. 
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_TRUE_15_06"); //Dlatego tak wa¿ne jest ¿eby przestrzegaæ nakazów Guru. Robimy to wszystko ze wzglêdów ostro¿noœci. 
	AI_Output (other, self ,"DIA_Steh_QUEST2_YOU_TRUE_15_07"); //Sprzedaj¹c te artefakty nieodpowiednim osobom, powa¿nie szkodzisz ca³emu Bractwu. Przemyœl to. 
	AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_TRUE_03_08"); //No dobrze. Oddam wszystkie artefakty do œwi¹tyni, a póŸniej odejdê. Wybacz, Mistrzu, ale g³êboko wierzy³em w Œni¹cego.
	AI_Output (self, other ,"DIA_Steh_QUEST2_YOU_TRUE_03_09"); //Teraz... teraz to wszystko nie ma dla mnie sensu...
	B_LogEntry     (CH1_HandlarzSteh,"Nowicjuszem, który sprzedaje artefakty jest niejaki Steh, krêc¹cy siê przy palisadzie chroni¹cej Obóz przed b³otnymi wê¿ami. Rozmawia³em z nim i postanowi³em powiedzieæ mu prawdê. Prawda o Œni¹cym bardzo go zabola³a. Postanowi³ jednak, ¿e odda wszystkie artefakty zanim odejdzie z Obozu.");
	Info_ClearChoices	(DIA_Steh_QUEST2_YOU);
	Npc_ExchangeRoutine(self,"tot");
};
