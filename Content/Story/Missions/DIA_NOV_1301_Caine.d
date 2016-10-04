// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Caine_Exit (C_INFO)
{
	npc			=  Nov_1301_Caine;
	nr			=  999;
	condition	=  DIA_Caine_Exit_Condition;
	information	=  DIA_Caine_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Caine_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Caine_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hallo
// **************************************************

instance  DIA_Caine_Hallo (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 1;
	condition	= DIA_Caine_Hallo_Condition;
	information	= DIA_Caine_Hallo_Info;
	permanent	= 0;
	description	= "Czeœæ, jestem tu nowy.";
};                       

FUNC int  DIA_Caine_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Caine_Hallo_Info()
{
	AI_Output (other, self,"DIA_Caine_Hallo_15_00"); //Czeœæ, jestem tu nowy.
	AI_Output (self, other,"DIA_Caine_Hallo_13_01"); //Ja... Ja jestem Caine, uczeñ Cor Kaloma. Zapewne ju¿ o nim s³ysza³eœ, co?
			
	Info_ClearChoices	(DIA_Caine_Hallo );
	Info_AddChoice		(DIA_Caine_Hallo,"Nie."	,DIA_Caine_Hallo_Nein);
	Info_AddChoice		(DIA_Caine_Hallo,"Tak."		,DIA_Caine_Hallo_Ja);
};

func void DIA_Caine_Hallo_Ja()
{
	AI_Output (other, self,"DIA_Caine_Hallo_Ja_15_00"); //Tak.
	AI_Output (self, other,"DIA_Caine_Hallo_Ja_13_01"); //Zatem wiesz ju¿, ¿e to najwa¿niejszy cz³owiek w tym obozie, zaraz po Jaœnie Oœwieconym Y'Berionie.
	Info_ClearChoices	(DIA_Caine_Hallo );
};

func void DIA_Caine_Hallo_Nein()
{
	AI_Output (other, self,"DIA_Caine_Hallo_Nein_15_00"); //Nie.
	AI_Output (self, other,"DIA_Caine_Hallo_Nein_13_01"); //Nie?! Chyba jesteœ tu od niedawna, co?
	AI_Output (self, other,"DIA_Caine_Hallo_Nein_13_02"); //Cor Kalom to najwa¿niejszy cz³owiek w Bractwie, po Y'Berionie. To on decyduje, kto zostanie przyjêty w szeregi Nowicjuszy.
	Info_ClearChoices	(DIA_Caine_Hallo );
};

/*
// **************************************************
//						Zu Kalom
// **************************************************

instance  DIA_Caine_WaysToKalom (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 2;
	condition	= DIA_Caine_WaysToKalom_Condition;
	information	= DIA_Caine_WaysToKalom_Info;
	permanent	= 0;
	description	= "Ich würde gerne mit Cor Kalom reden - kannst du mir dabei helfen?";
};                       

FUNC int  DIA_Caine_WaysToKalom_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Caine_Hallo))
	{
		return 1;
	};
};

FUNC VOID  DIA_Caine_WaysToKalom_Info()
{
	AI_Output (other, self,"DIA_Caine_WaysToKalom_15_00"); //Ich würde gerne mit Cor Kalom reden - kannst du mir dabei helfen?
	AI_Output (self, other,"DIA_Caine_WaysToKalom_13_01"); //Wenn du zu Cor Kalom willst, mußt du einen guten Grund haben.
	AI_Output (self, other,"DIA_Caine_WaysToKalom_13_02"); //Die Wache hat Anweisung, nur die vorzulassen, die Alchimistische Substanzen bringen oder von einen der Gurus geschickt wurden.
};

// **************************************************
//				Alchimistische Subsatanzen
// **************************************************

instance  DIA_Caine_Alchemies (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 2;
	condition	= DIA_Caine_Alchemies_Condition;
	information	= DIA_Caine_Alchemies_Info;
	permanent	= 0;
	description	= "Was für alchimistische Substanzen kann ich Kalom bringen?";
};                       

FUNC int  DIA_Caine_Alchemies_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Caine_WaysToKalom))
	{
		return 1;
	};
};

FUNC VOID  DIA_Caine_Alchemies_Info()
{
	AI_Output (other, self,"DIA_Caine_Alchemies_15_00"); //Was für alchimistische Substanzen kann ich Kalom bringen?
	AI_Output (self, other,"DIA_Caine_Alchemies_13_01"); //Kalom benötigt vor allem das Sekret der Minecrawler. Wenn du ihm genug davon beschaffst, wird dich die Wache sicher vorlassen.
	AI_Output (self, other,"DIA_Caine_Alchemies_13_02"); //Er braucht zwar auch Pflanzen und Beeren, die man zwischen den Lagern findet, aber die nimmt Fortuno unten an.
};

*/

// **************************************************
//						Job = Substanzen 
// **************************************************

instance  DIA_Caine_Job (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 2;
	condition	= DIA_Caine_Job_Condition;
	information	= DIA_Caine_Job_Info;
	permanent	= 0;
	description	= "A ty czym siê zajmujesz?";
};                       

FUNC int  DIA_Caine_Job_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Caine_Hallo))
	{
		return 1;
	};
};

FUNC VOID  DIA_Caine_Job_Info()
{
	AI_Output (other, self,"DIA_Caine_Job_15_00"); //A ty czym siê zajmujesz?
	AI_Output (self, other,"DIA_Caine_Job_13_01"); //Pomagam mojemu mistrzowi w pracach nad jego magicznymi wywarami.
	AI_Output (self, other,"DIA_Caine_Job_13_02"); //G³ównie z ziela bagiennego i wydzieliny pe³zaczy. Swoj¹ drog¹, mój mistrz pilnie potrzebuje tej wydzieliny.
};

// **************************************************
//						Wo Sekret
// **************************************************

instance  DIA_Caine_WoSekret (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 2;
	condition	= DIA_Caine_WoSekret_Condition;
	information	= DIA_Caine_WoSekret_Info;
	permanent	= 0;
	description	= "Gdzie mogê zdobyæ tê... Wydzielinê pe³zaczy?";
};                       

FUNC int  DIA_Caine_WoSekret_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Caine_Job))
	{
		return 1;
	};
};

FUNC VOID  DIA_Caine_WoSekret_Info()
{
	AI_Output (other, self,"DIA_Caine_WoSekret_15_00"); //Gdzie mogê zdobyæ tê... Wydzielinê pe³zaczy?
	AI_Output (self, other,"DIA_Caine_WoSekret_13_01"); //Stara Kopalnia a¿ roi siê od pe³zaczy, ale trzeba umieæ pozyskaæ ich wydzielinê.
	AI_Output (self, other,"DIA_Caine_WoSekret_13_02"); //Jeœli powa¿nie myœlisz o walce z pe³zaczami, porozmawiaj z którymœ ze Stra¿ników trudni¹cych siê polowaniem na nie. Na przyk³ad z Gor Na Drakiem.
	AI_Output (self, other,"DIA_Caine_WoSekret_13_03"); //On ka¿dego dnia wyrusza z naszego Obozu do Starej Kopalni. O œwicie znajdziesz go w pobli¿u laboratorium.
};

// **************************************************
//						AddInfoKalom
// **************************************************

instance  DIA_Caine_AddInfoKalom (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 2;
	condition	= DIA_Caine_AddInfoKalom_Condition;
	information	= DIA_Caine_AddInfoKalom_Info;
	permanent	= 0;
	description	= "Co mo¿esz mi jeszcze powiedzieæ o swoim mistrzu?";
};                       

FUNC int  DIA_Caine_AddInfoKalom_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Caine_Job))
	{
		return 1;
	};
};

FUNC VOID  DIA_Caine_AddInfoKalom_Info()
{
	AI_Output (other, self,"DIA_Caine_AddInfoKalom_15_00"); //Co mo¿esz mi jeszcze powiedzieæ o swoim mistrzu?
	AI_Output (self, other,"DIA_Caine_AddInfoKalom_13_01"); //Jest inny ni¿ pozostali Guru. Ka¿dy mo¿e siê do niego odezwaæ, ale NIKOMU nie wolno marnowaæ jego cennego czasu.
};


/*
// **************************************************
//						
// **************************************************

instance  DIA_Caine_WieGuruSend (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 2;
	condition	= DIA_Caine_WieGuruSend_Condition;
	information	= DIA_Caine_WieGuruSend_Info;
	permanent	= 0;
	description	= "Wie bringe ich einen Guru dazu, dass er mich zu Kalom schickt.";
};                       

FUNC int  DIA_Caine_WieGuruSend_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Caine_WaysToKalom))
	{
		return 1;
	};
};

FUNC VOID  DIA_Caine_WieGuruSend_Info()
{
	AI_Output (other, self,"DIA_Caine_WieGuruSend_15_00"); //Wie bringe ich einen Guru dazu, dass er mich zu Kalom schickt.
	AI_Output (self, other,"DIA_Caine_WieGuruSend_13_01"); //Darüber kann die Lester mehr erzählen.
	AI_Output (self, other,"DIA_Caine_WieGuruSend_13_02"); //Bis vor kurzen hat er noch für Cor Kalom gearbeitet, jetzt kümmert er sich zusammen mit den Gurus um die Neuen.
};
*/

/*------------------------------------------------------------------------
						REZEPT INNER TRUHE									
------------------------------------------------------------------------*/

instance  Nov_1301_Caine_CHEST (C_INFO)
{
	npc				= Nov_1301_Caine;
	condition		= Nov_1301_Caine_CHEST_Condition;
	information		= Nov_1301_Caine_CHEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak mogê zdobyæ recepturê Kaloma?"; 
};

FUNC int  Nov_1301_Caine_CHEST_Condition()
{	
	if 	(Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return TRUE;
	};

};
FUNC void  Nov_1301_Caine_CHEST_Info()
{
	AI_Output (other, self,"Nov_1301_Caine_CHEST_Info_15_01"); //Jak mogê zdobyæ recepturê Kaloma?
	AI_Output (self, other,"Nov_1301_Caine_CHEST_Info_13_02"); //Nie mo¿esz. Wszystkie receptury przechowywane s¹ w zamkniêtej skrzyni.
};  

//////////////////////////////////////////////
//	Zadanie: Sprzeda¿ eliksirów
//////////////////////////////////////////////

//========================================
//-----------------> Exposed
//========================================

INSTANCE DIA_Caine_Exposed (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 1;
   condition    = DIA_Caine_Exposed_Condition;
   information  = DIA_Caine_Exposed_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Caine_Exposed_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cipher_WhoSellElixier)) && (Npc_GetDistToWP (self, "OW_NC_ABYSS2") < 700)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Caine_Exposed_Info()
{
    AI_Output (self, other ,"DIA_Caine_Exposed_03_01"); //Co ty tutaj robisz? Sk¹d wiedzia³eœ, ¿e tu bêdê?
    AI_Output (other, self ,"DIA_Caine_Exposed_15_02"); //Wyda³ ciê jeden z twoich odbiorców. Wystarczy³o go odpowiednio zmotykowaæ...
	AI_Output (self, other ,"DIA_Caine_Exposed_03_03"); //Dlaczego zacz¹³eœ wokó³ mnie wêszyæ? Na co ci to by³o? Powinieneœ rozumieæ, ¿e tutaj ten, kto nie kombinuje, szybko ginie.
    AI_Output (other, self ,"DIA_Caine_Exposed_15_04"); //Spraw¹ eliksiru zainteresowali siê Guru. Shawn kaza³ mi to sprawdziæ.
    AI_Output (self, other ,"DIA_Caine_Exposed_03_05"); //Zaczekaj! Czy ty powiedzia³eœ Guru?
    AI_Output (self, other ,"DIA_Caine_Exposed_03_06"); //Nie chcê k³opotów.
    AI_Output (other, self ,"DIA_Caine_Exposed_15_07"); //Trochê na to za póŸno.

    AI_Output (self, other ,"DIA_Caine_Exposed_03_08"); //Poczekaj, dam ci wszystko co do tej pory zarobi³em, jeœli mnie nie wydasz. Bedzie tego z 500 bry³ek rudy!

	B_LogEntry     (CH3_SellElixer,"Noc¹, w umówionym miejscu spotka³em nikogo innego jak Caine'a. Mog³em siê tego domyœleæ. Ten Nowicjusz ca³e dnie spêdza z Cor Kalomem. Mia³ ³atwy dostêp do receptury. Zaproponowa³ mi, ¿e jeœli go nie wydam, otrzymam 500 bry³ek rudy. Muszê podj¹æ decyzjê, co z nim zrobiê.");
	
    Info_ClearChoices	(DIA_Caine_Exposed);
    Info_AddChoice		(DIA_Caine_Exposed, "Zapomnij. Mistrz Shawn o wszystkim siê dowie!", DIA_Caine_Exposed_Nope);
    Info_AddChoice		(DIA_Caine_Exposed, "Dobra. Umowa stoi.", DIA_Caine_Exposed_Money);
};

FUNC VOID DIA_Caine_Exposed_Nope()
{
    AI_Output (other, self ,"DIA_Caine_Exposed_Nope_15_01"); //Zapomnij. Mistrz Shawn o wszystkim siê dowie!
    AI_Output (self, other ,"DIA_Caine_Exposed_Nope_03_02"); //Jesteœ g³upcem. Bêdziesz tego ¿a³owa³, gdy przyciœnie ciê bieda jak mnie!
    AI_Output (other, self ,"DIA_Caine_Exposed_Nope_15_03"); //Skoñcz ju¿ tê paplaninê.
	
    B_LogEntry    (CH3_SellElixer,"Zdecydowa³em, ¿e Caine zas³u¿y³ na karê. Mam zamiar powiedzieæ o wszystkim Shawn'owi.");
	CaineFriend = false;
    Info_ClearChoices		(DIA_Caine_Exposed);
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"start");
};

FUNC VOID DIA_Caine_Exposed_Money()
{
    AI_Output (other, self ,"DIA_Caine_Exposed_Money_15_01"); //Dobra. Umowa stoi!
    AI_Output (self, other ,"DIA_Caine_Exposed_Money_03_02"); //Œwietnie. Oto twoja ruda. Jestem ci naprawdê wdziêczny...
    AI_Output (self, other ,"DIA_Caine_Exposed_Money_03_03"); //Tylko nikomu ani s³owa!
	
    B_LogEntry    (CH3_SellElixer,"Przyj¹³em rudê od Caine. Kolonia to miejsce, w którym najwa¿niejsza jest ruda. Pe³na sakiewka mo¿e mi kiedyœ uratowaæ ¿ycie. Muszê teraz jakoœ wyt³umaczyæ siê Shawn'owi.");
	CaineFriend = true;
    Info_ClearChoices		(DIA_Caine_Exposed);
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"start");
};

//========================================
//-----------------> JadJaszczura
//========================================

INSTANCE DIA_Caine_JadJaszczura (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 1;
   condition    = DIA_Caine_JadJaszczura_Condition;
   information  = DIA_Caine_JadJaszczura_Info;
   permanent	= FALSE;
   description	= "Potrzebujê odtrutki na jad jaszczura!";
};

FUNC INT DIA_Caine_JadJaszczura_Condition()
{
    if (MIS_SickHunter == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Caine_JadJaszczura_Info()
{
    AI_Output (other, self ,"DIA_Caine_JadJaszczura_15_01"); //Potrzebujê odtrutki na jad jaszczura!
    AI_Output (self, other ,"DIA_Caine_JadJaszczura_03_02"); //Mam teraz du¿o pracy dla Cor Kaloma...
    AI_Output (other, self ,"DIA_Caine_JadJaszczura_15_03"); //Nie rozumiesz?! Ten myœliwy mo¿e zgin¹æ.
    AI_Output (self, other ,"DIA_Caine_JadJaszczura_03_04"); //Nie znam twojego przyjaciela. 
    AI_Output (self, other ,"DIA_Caine_JadJaszczura_03_05"); //Nie obchodzi mnie jego ¿ycie, ale skoro tak ci na tym zale¿y, to pewnie nie posk¹pisz kilku bry³ek rudy.
    AI_Output (self, other ,"DIA_Caine_JadJaszczura_03_06"); //300 bry³ek i powiem ci co robiæ.
    B_LogEntry                     (CH2_SickHunter,"Caine pomo¿e mi za 300 bry³ek rudy. Chyba nie mam wyboru. ");
};

//========================================
//-----------------> 300Oreive
//========================================

INSTANCE DIA_Caine_300Oreive (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 1;
   condition    = DIA_Caine_300Oreive_Condition;
   information  = DIA_Caine_300Oreive_Info;
   permanent	= FALSE;
   description	= "No dobra! Bierz rudê! ";
};

FUNC INT DIA_Caine_300Oreive_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Caine_JadJaszczura))
    && (Npc_HasItems (hero, ItMiNugget)>=300)
	&& (!Npc_KnowsInfo (hero, DIA_Caine_MusMixCaine))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Caine_300Oreive_Info()
{
    AI_Output (other, self ,"DIA_Caine_300Oreive_15_01"); //No dobra! Bierz rudê! 
    AI_Output (self, other ,"DIA_Caine_300Oreive_03_02"); //Widaæ, bardzo ci zale¿y.
    B_GiveInvItems (other, self, ItMiNugget, 300);
    AI_Output (self, other ,"DIA_Caine_300Oreive_03_03"); //W porz¹dku. Pomogê ci.
    AI_Output (self, other ,"DIA_Caine_300Oreive_03_04"); //Aby stworzyæ odtrutkê, potrzebujê jadu jaszczura, który ugryz³ twojego przyjaciela.
    AI_Output (self, other ,"DIA_Caine_300Oreive_03_05"); //Przynieœ mi go jak najprêdzej.
    B_LogEntry                     (CH2_SickHunter,"Caine chce, abym przyniós³ mu jad jaszczura, który pogryz³ Clawa. ");
};
//========================================
//-----------------> MusMixCaine
//========================================

INSTANCE DIA_Caine_MusMixCaine (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 1;
   condition    = DIA_Caine_MusMixCaine_Condition;
   information  = DIA_Caine_MusMixCaine_Info;
   permanent	= FALSE;
   description	= "Y'Berion nakaza³ ci sporz¹dziæ miksturê.";
};

FUNC INT DIA_Caine_MusMixCaine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Yberion_MustMix))
    && (MIS_SickHunter == LOG_RUNNING)
    && (!Npc_KnowsInfo (hero, DIA_Caine_300Oreive))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Caine_MusMixCaine_Info()
{
    AI_Output (other, self ,"DIA_Caine_MusMixCaine_15_01"); //Y'Berion nakaza³ ci sporz¹dziæ miksturê.
    AI_Output (other, self ,"DIA_Caine_MusMixCaine_15_02"); //Nie obchodzi mnie czy tego chcesz. To rozkaz Mistrza!
    AI_Output (self, other ,"DIA_Caine_MusMixCaine_03_03"); //Przekabaci³eœ staruszka?! He he. 
    AI_Output (self, other ,"DIA_Caine_MusMixCaine_03_04"); //No dobra. Aby stworzyæ odtrutkê potrzebujê jadu jaszczura, który ugryz³ twojego przyjaciela.
    AI_Output (self, other ,"DIA_Caine_MusMixCaine_03_05"); //Przynieœ mi go jak najprêdzej.
	B_LogEntry                     (CH2_SickHunter,"Caine chce, abym przyniós³ mu jad jaszczura, który pogryz³ Clawa. ");
};


//========================================
//-----------------> JadJaszczuraMAm
//========================================

INSTANCE DIA_Caine_JadJaszczuraMAm (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 2;
   condition    = DIA_Caine_JadJaszczuraMAm_Condition;
   information  = DIA_Caine_JadJaszczuraMAm_Info;
   permanent	= FALSE;
   description	= "Mam jad jaszczura!";
};

FUNC INT DIA_Caine_JadJaszczuraMAm_Condition()
{
    if ((Npc_KnowsInfo (hero, DIA_Caine_300Oreive)) || (Npc_KnowsInfo (hero, DIA_Caine_MusMixCaine)))
    && (Npc_HasItems (other, ItMi_TruciznaJaszczura) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Caine_JadJaszczuraMAm_Info()
{
    AI_Output (other, self ,"DIA_Caine_JadJaszczuraMAm_15_01"); //Mam jad jaszczura!
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_02"); //Dobrze. Daj mi go.
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_03"); //Potrzebny mi jeszcze jeden sk³adnik.
    AI_Output (other, self ,"DIA_Caine_JadJaszczuraMAm_15_04"); //Co konkretnie?
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_05"); //Magiczne ziele.
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_06"); //Jest jednak problem. Na bagnie ros³o tylko kilka tych zió³.
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_07"); //Wszystkie zosta³y zebrane przez Nowicjuszy. 
    AI_Output (other, self ,"DIA_Caine_JadJaszczuraMAm_15_08"); //Co za problem je odkupiæ?
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_09"); //Nasi Nowicjusze nie s¹ tacy g³upi, jak ci siê wydaje.
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_10"); //Wiedz¹, ¿e to ziele jest niezwykle cenne. 
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_11"); //Bêdziesz musia³ jakoœ zdobyæ jedn¹ sadzonkê.
    B_LogEntry                     (CH2_SickHunter,"Muszê zdobyæ sadzonkê magicznego ziela. Jednak te roœliny s¹ wy³¹cznie w posiadaniu Nowicjuszy pracuj¹cych na bagnie.");
	B_GiveInvItems (hero, self, ItMi_TruciznaJaszczura, 1); //1.24
    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZdobylemZiele
//========================================

INSTANCE DIA_Caine_ZdobylemZiele (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 1;
   condition    = DIA_Caine_ZdobylemZiele_Condition;
   information  = DIA_Caine_ZdobylemZiele_Info;
   permanent	= FALSE;
   description	= "Zdoby³em magiczne ziele.";
};

FUNC INT DIA_Caine_ZdobylemZiele_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Caine_JadJaszczuraMAm))
    && (Npc_HasItems (other, ItFo_Plants_MagicHerb_01) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Caine_ZdobylemZiele_Info()
{
    AI_Output (other, self ,"DIA_Caine_ZdobylemZiele_15_01"); //Zdoby³em magiczne ziele.
    AI_Output (self, other ,"DIA_Caine_ZdobylemZiele_03_02"); //Daj mi je. Zaraz sporz¹dzê miksturê.
    B_GiveInvItems (other, self, ItFo_Plants_MagicHerb_01, 1);
    B_LogEntry                     (CH2_SickHunter,"Nowicjusz Caine otrzyma³ wszystkie sk³adniki. Zaraz sporz¹dzi miksturê. ");

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> AntidotumKuhwy
//========================================

INSTANCE DIA_Caine_AntidotumKuhwy (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 1;
   condition    = DIA_Caine_AntidotumKuhwy_Condition;
   information  = DIA_Caine_AntidotumKuhwy_Info;
   permanent	= FALSE;
   description	= "Mikstura gotowa?";
};

FUNC INT DIA_Caine_AntidotumKuhwy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Caine_ZdobylemZiele))
    && (MIS_SickHunter == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Caine_AntidotumKuhwy_Info()
{
    AI_Output (other, self ,"DIA_Caine_AntidotumKuhwy_15_01"); //Mikstura gotowa?
    AI_Output (self, other ,"DIA_Caine_AntidotumKuhwy_03_02"); //Tak. WeŸ j¹ i spiesz siê!
	
    CreateInvItems (self, ItMi_AnitdotumNaJad, 1);
    B_GiveInvItems (self, other, ItMi_AnitdotumNaJad, 1);
	
    B_LogEntry                     (CH2_SickHunter,"Caine sporz¹dzi³ antidotum na jad. Zmarnowa³em ju¿ wiele czasu. Mam kilka minut na dotarcie z powrotem do obozu myœliwych.");

    timer_ClawQuest = 5 * 60;
    AI_StopProcessInfos	(self);
};

