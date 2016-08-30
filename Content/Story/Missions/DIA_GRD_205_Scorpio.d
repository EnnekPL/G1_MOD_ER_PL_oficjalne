//poprawione i sprawdzone - Nocturn

// **************************************
//					EXIT 
// **************************************

instance DIA_Scorpio_Exit (C_INFO)
{
	npc			= GRD_205_Scorpio;
	nr			= 999;
	condition	= DIA_Scorpio_Exit_Condition;
	information	= DIA_Scorpio_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Scorpio_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Scorpio_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//			Was willst du hier?
// **************************************

instance DIA_Scorpio_Hello (C_INFO)
{
	npc			= GRD_205_Scorpio;
	nr			= 1;
	condition	= DIA_Scorpio_Hello_Condition;
	information	= DIA_Scorpio_Hello_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Scorpio_Hello_Condition()
{	
	if	!C_NpcBelongsToOldcamp (other)
	&&	(Kapitel < 4)
	&& (Npc_GetDistToNpc(self, other) <= 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Hello_Info()
{
	AI_Output (self, other,"DIA_Scorpio_Hello_13_00"); //Kto ci� tu wpu�ci�?
	AI_Output (other, self,"DIA_Scorpio_Hello_15_01"); //Thorus.
	AI_Output (self, other,"DIA_Scorpio_Hello_13_02"); //I czego tu szukasz?

	Info_ClearChoices 	(DIA_Scorpio_Hello);
	Info_Addchoice 		(DIA_Scorpio_Hello,"Chcia�em si� tylko troch� rozejrze�.",DIA_Scorpio_Hello_JustLooking);
	Info_Addchoice 		(DIA_Scorpio_Hello,"Mam wiadomo�� dla mag�w.",DIA_Scorpio_Hello_Mages);
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		Info_Addchoice 		(DIA_Scorpio_Hello,"Przynios�em bagienne ziele dla Gomeza.",DIA_Scorpio_Hello_Kraut);
	};
	if (Npc_KnowsInfo(hero, Info_Thorus_ReadyForGomez))
	{
		Info_Addchoice 		(DIA_Scorpio_Hello,"Id� zobaczy� si� z Gomezem. Zamierzam do was do��czy�.",DIA_Scorpio_Hello_Join);
	};
};

func void DIA_Scorpio_Hello_JustLooking()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_JustLooking_15_00"); //Chcia�em si� tylko troch� rozejrze�.
	AI_Output (self, other,"DIA_Scorpio_Hello_JustLooking_13_01"); //Bardzo �mieszne.
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Mages()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_Mages_15_00"); //Mam wiadomo�� dla mag�w.
	AI_Output (self, other,"DIA_Scorpio_Hello_Mages_13_01"); //Pracujesz dla mag�w? Nie chc� mie� z nimi nic do czynienia!
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Kraut()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_Kraut_15_00"); //Przynios�em bagienne ziele dla Gomeza.
	AI_Output (self, other,"DIA_Scorpio_Hello_Kraut_13_01"); //To zanie� je do tego domu, kt�rego wej�cia broni dw�ch Stra�nik�w.
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Join()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_Join_15_00"); //Id� zobaczy� si� z Gomezem. Zamierzam do was do��czy�.
	AI_Output (self, other,"DIA_Scorpio_Hello_Join_13_01"); //Ty? A co z ciebie b�dzie za po�ytek?
	AI_Output (other, self,"DIA_Scorpio_Hello_Join_15_02"); //Cienie na mnie nie narzeka�y.
	AI_Output (self, other,"DIA_Scorpio_Hello_Join_13_03"); //Ale my nie chcemy nawet s�ysze� o Cieniach! To MY trzymamy r�k� na pulsie.
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

// **************************************
//			REFUSE TRAIN
// **************************************

instance DIA_Scorpio_REFUSETRAIN (C_INFO)
{
	npc			= GRD_205_Scorpio;
	nr			= 1;
	condition	= DIA_Scorpio_REFUSETRAIN_Condition;
	information	= DIA_Scorpio_REFUSETRAIN_Info;
	permanent	= 0;
	description = "Mo�esz mnie nauczy� lepiej walczy�?";
};                       

FUNC int DIA_Scorpio_REFUSETRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scorpio_Hello) && (Npc_GetTrueGuild (hero) != GIL_GRD) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_REFUSETRAIN_Info()
{
	AI_Output (other, self,"DIA_Scorpio_REFUSETRAIN_15_00"); //Mo�esz mnie nauczy� lepiej walczy�?
	AI_Output (self, other,"DIA_Scorpio_REFUSETRAIN_13_01"); //Szkol� tylko Stra�nik�w, wi�c dop�ki Thorus nie przyjmie ci� w nasze szeregi, musisz poszuka� sobie innego nauczyciela.
	
};

//*******************************
//*********�����������***********
//********* KAPITEL 3 ***********
//*********...........***********
//*******************************


/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_205_Scorpio_WELCOME (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_WELCOME_Condition;
	information		= GRD_205_Scorpio_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_205_Scorpio_WELCOME_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_205_Scorpio_WELCOME_Info()
{
	
	AI_Output (self, other,"GRD_205_Scorpio_WELCOME_Info_13_01"); //Przej�cie do nas by�o najm�drzejsz� decyzj� twojego �ycia!
	AI_StopProcessInfos	( self );
};

/*------------------------------------------------------------------------
							ARMBRUST TALK							
------------------------------------------------------------------------*/

instance  GRD_205_Scorpio_CROSSBOW (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_CROSSBOW_Condition;
	information		= GRD_205_Scorpio_CROSSBOW_Info;
	important		= 0;
	permanent		= 1;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC int  GRD_205_Scorpio_CROSSBOW_Condition()
{	
	if (Kapitel >= 4)
	|| (Npc_GetTrueGuild (hero) == GIL_GRD) 
	
	{
		return TRUE;
	};

};
FUNC void  GRD_205_Scorpio_CROSSBOW_Info()
{
	AI_Output (other, self,"GRD_205_Scorpio_CROSSBOW_Info_15_01"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_Info_13_02"); //Je�li masz do�� rudy, poka�� ci jak pos�ugiwa� si� kusz�. To ci� b�dzie kosztowa� jakie� 200 bry�ek.
	if (log_scorpiocrossbow == FALSE)
	&& (Kapitel <= 4)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry			(GE_TeacherOC,"Skorpion mo�e mnie nauczy� pos�ugiwa� si� kusz�.");
		log_scorpiocrossbow = TRUE;
	}
	else if (log_scorpiocrossbow == FALSE)
	&& (Kapitel > 4)
	{
		Log_CreateTopic   	(GE_TeacherOW,LOG_NOTE);
		B_LogEntry			(GE_TeacherOW,"Skorpion mo�e mnie nauczy� pos�ugiwa� si� kusz�.");
		log_scorpiocrossbow = TRUE;
	};
	Info_ClearChoices (GRD_205_Scorpio_CROSSBOW);
	if ((Npc_GetTalentSkill  ( hero, NPC_TALENT_CROSSBOW ) == 0) )
	{
	Info_Addchoice 	(GRD_205_Scorpio_CROSSBOW,B_BuildLearnString(NAME_LearnCrossbow_1,	LPCOST_TALENT_CROSSBOW_1,200),GRD_205_Scorpio_CROSSBOW_OK);
	};
	Info_Addchoice 	(GRD_205_Scorpio_CROSSBOW,DIALOG_BACK,GRD_205_Scorpio_CROSSBOW_BACK);

};  
func void GRD_205_Scorpio_CROSSBOW_BACK()
{
	Info_ClearChoices	(GRD_205_Scorpio_CROSSBOW );
};

func void GRD_205_Scorpio_CROSSBOW_OK()
{
	AI_Output (other, self,"GRD_205_Scorpio_CROSSBOW_OK_15_01"); //Umowa stoi. Poka� mi jak obchodzi� si� z kusz�.
	if (hero.attribute[ATR_Dexterity] >= 50)
	{
	if (Npc_HasItems (hero,ItMiNugget)>= 200)
	{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 1, LPCOST_TALENT_CROSSBOW_1))
		{
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_02"); //Dobra. Bierzmy si� do roboty.
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_03"); //Z�ap kusz� mocno i oprzyj j� o rami�. To powinno zwi�kszy� celno�� strza�u.
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_04"); //Przez kilka pierwszych dni twoje rami� da ci si� nie�le we znaki, ale z czasem przywykniesz.
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_05"); //Po jakim� tygodniu b�dziesz mia� r�ce ze stali!
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_06"); //Wyceluj spokojnie i powoli �ci�gnij spust. Be�t niesie ze sob� wi�cej si�y ni� strza�a, dlatego powoduje wi�ksze zniszczenia.
			B_GiveInvItems (hero,other,ItMiNugget,200);
			GRD_205_Scorpio_CROSSBOW.permanent = 0;
		};
	}
	else
	{
	 AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_07"); //DWIE�CIE BRY�EK RUDY, p�atne do r�ki i to od razu! Inaczej nie mamy o czym rozmawia�!
	};
	}
	else
	{
	AI_Output			(self,other,"DIA_Scorpio_NO_ENOUGHT_STR_1"); //Musisz by� znacznie zr�czniejszy!
	PrintScreen	("Warunek: Zr�czno�� 50", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

/*------------------------------------------------------------------------
							ARMBRUST TALENT2									
------------------------------------------------------------------------*/

instance  GRD_205_Scorpio_CROSSBOW2 (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_CROSSBOW2_Condition;
	information		= GRD_205_Scorpio_CROSSBOW2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chcia�bym dowiedzie� si� czego� wi�cej o strzelaniu z kuszy."; 
};

FUNC int  GRD_205_Scorpio_CROSSBOW2_Condition()
{
	if (Npc_GetTalentSkill  ( hero, NPC_TALENT_CROSSBOW ) == 1) 
	{
		return TRUE;
	};

};
FUNC void  GRD_205_Scorpio_CROSSBOW2_Info()
{
	AI_Output (other, self,"GRD_205_Scorpio_CROSSBOW2_Info_15_01"); //Chcia�bym dowiedzie� si� czego� wi�cej o strzelaniu z kuszy.
	AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_Info_13_02"); //To ci� b�dzie kosztowa� 300 bry�ek rudy.
  
	Info_ClearChoices (GRD_205_Scorpio_CROSSBOW2);
	Info_Addchoice 	(GRD_205_Scorpio_CROSSBOW2,B_BuildLearnString(NAME_LearnCrossbow_2,	LPCOST_TALENT_CROSSBOW_2,300),GRD_205_Scorpio_CROSSBOW2_OK);
	Info_Addchoice 	(GRD_205_Scorpio_CROSSBOW2,DIALOG_BACK,  GRD_205_Scorpio_CROSSBOW2_BACK);
	

};  
func void GRD_205_Scorpio_CROSSBOW2_BACK()
{
	Info_ClearChoices (GRD_205_Scorpio_CROSSBOW);
};

func void GRD_205_Scorpio_CROSSBOW2_OK()
{
	AI_Output (other, self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01"); //Zaczynajmy.
		if (hero.attribute[ATR_Dexterity] >= 100)
	{
	if (Npc_HasItems (hero,ItMiNugget)>= 300)
	{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 2, LPCOST_TALENT_CROSSBOW_2))
		{
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_02"); //Dobra. Twoje strza�y b�d� celniejsze, je�li przed �ci�gni�ciem spustu ugniesz nieco nogi w kolanach.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_03"); //Naucz si� poprawnie ocenia� pr�dko�� z jak� porusza si� tw�j cel.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_04"); //Wystrzel pocisk tak, by w odpowiednim miejscu i czasie przeci�� �cie�k�, kt�r� porusza si� cel.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_05"); //Je�li atakujesz wi�cej ni� jeden cel, nie tra� czasu: musisz mo�liwie szybko przygwo�dzi� jeden za drugim dobrze wymierzonymi strza�ami.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_06"); //To by by�o na tyle.
		B_GiveInvItems (hero,other,ItMiNugget,300);
		GRD_205_Scorpio_CROSSBOW2.permanent = 0;
		};
	}
	else
	{
	 AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_07"); //Najpierw postaraj si� zdoby� te TRZYSTA BRY�EK RUDY!
	};
		}
	else
	{
	AI_Output			(self,other,"DIA_Scorpio_NO_ENOUGHT_STR_1"); //Musisz by� znacznie zr�czniejszy!
	PrintScreen	("Warunek: Zr�czno�� 100", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};
/*------------------------------------------------------------------------
Ab Kapitel 4 steht Scorpio draussen, damit der Spieler bei ihm noch lernen kann								
------------------------------------------------------------------------*/
/*------------------------------------------------------------------------
//							hey PC!								//
------------------------------------------------------------------------*/
instance GRD_205_Scorpio_HeyPC (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_HeyPC_Condition;
	information		= GRD_205_Scorpio_HeyPC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_205_Scorpio_HeyPC_Condition()
{	
	if (kapitel >= 4)
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  GRD_205_Scorpio_HeyPC_Info()
{
	AI_Output (self, other,"GRD_205_Scorpio_HeyPC_Info_13_01"); //Nie b�j si�, cz�owieku! Chod� no tutaj!
};

/*------------------------------------------------------------------------
//							Scorpio ist abgehauen								//
------------------------------------------------------------------------*/
instance  GRD_205_Scorpio_BANISHED (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_BANISHED_Condition;
	information		= GRD_205_Scorpio_BANISHED_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wszystko w porz�dku?"; 
};

FUNC int  GRD_205_Scorpio_BANISHED_Condition()
{	
	if (Npc_KnowsInfo (hero,GRD_205_Scorpio_HeyPC))
	{
		return TRUE;
	};

};
FUNC void  GRD_205_Scorpio_BANISHED_Info()
{
	AI_Output (other, self,"GRD_205_Scorpio_BANISHED_Info_15_01"); //Wszystko w porz�dku?
	AI_Output (self, other,"GRD_205_Scorpio_BANISHED_Info_13_02"); //Ukrywam si�. Mam ju� do�� machlojek Stra�nik�w.
	AI_Output (self, other,"GRD_205_Scorpio_BANISHED_Info_13_03"); //Ale zabra�em kilka niez�ych cacek ze zbrojowni. Gdyby� potrzebowa� broni - zg�o� si� do mnie.
	if (Scorpio_Exile == FALSE)
	{
	Log_CreateTopic   	(GE_TraderOW,LOG_NOTE);
	B_LogEntry		(GE_TraderOW,   "Skorpion opu�ci� Stary Ob�z i wraz z Cavalornem mieszka teraz w my�liwskiej chacie na drodze do Nowego Obozu.");
	Scorpio_Exile = TRUE;
	};
};  

/*------------------------------------------------------------------------
							TRADE								
------------------------------------------------------------------------*/

instance  GRD_205_Scorpio_TRADE (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_TRADE_Condition;
	information		= GRD_205_Scorpio_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Poka�, co tam masz."; 
	trade			= 1;
};

FUNC int  GRD_205_Scorpio_TRADE_Condition()
{	
	if( Npc_KnowsInfo (hero,GRD_205_Scorpio_BANISHED))
	{
		return TRUE;
	};

};
FUNC void  GRD_205_Scorpio_TRADE_Info()
{
	AI_Output (other, self,"GRD_205_Scorpio_TRADE_Info_15_01"); //Poka�, co tam masz.
	
};  
//========================================
//-----------------> GetInfos
//========================================

INSTANCE DIA_Scorpio_GetInfos (C_INFO)
{
   npc          = GRD_205_Scorpio;
   nr           = 1;
   condition    = DIA_Scorpio_GetInfos_Condition;
   information  = DIA_Scorpio_GetInfos_Info;
   permanent	= FALSE;
   description	= "M�g�by� przekaza� pewn� informacj� Stra�nikom?";
};

FUNC INT DIA_Scorpio_GetInfos_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_TalkAboutMine)) || (Npc_KnowsInfo (hero, DIA_Martin_Trueasd))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scorpio_GetInfos_Info()
{
    AI_Output (other, self ,"DIA_Scorpio_GetInfos_15_01"); //M�g�by� przekaza� pewn� informacj� Stra�nikom?
    AI_Output (self, other ,"DIA_Scorpio_GetInfos_03_02"); //Informacj�? Stra�nikom?
    AI_Output (self, other ,"DIA_Scorpio_GetInfos_03_03"); //Przecie� uciek�em ze Starego Obozu.
    AI_Output (other, self ,"DIA_Scorpio_GetInfos_15_04"); //Stra�nicy z obozu przy Starej Kopalni si� zbuntowali.
    AI_Output (other, self ,"DIA_Scorpio_GetInfos_15_05"); //Postanowili sta� si� niezale�ni.
    AI_Output (other, self ,"DIA_Scorpio_GetInfos_15_06"); //Za wszelk� cen� chcemy, by Gomez si� o tym dowiedzia�.
    AI_Output (self, other ,"DIA_Scorpio_GetInfos_03_07"); //Za wszelk� cen�, powiadasz?
    AI_Output (self, other ,"DIA_Scorpio_GetInfos_03_08"); //No dobrze. Zrobi� to za 1700 bry�ek rudy.
    AI_Output (other, self ,"DIA_Scorpio_GetInfos_15_09"); //Dlaczego tak drogo?
    AI_Output (self, other ,"DIA_Scorpio_GetInfos_03_10"); //To niebezpieczne zadanie. Nie wnikaj.
	if (MIS_SytucajaWOM == LOG_RUNNING)
	{
    B_LogEntry                     (CH1_SytucajaWOM,"Za 1700 bry�ek rudy Skorpion zaniesie informacj� Gomezowi.");
	};
	if (MIS_HelpBrothersBra == LOG_RUNNING)
	{
    B_LogEntry                     (CH1_HelpBrothersBra,"Za 1700 bry�ek rudy Skorpion zaniesie informacj� Gomezowi.");
	};
    //B_GiveXP (350);
};

//========================================
//-----------------> GiveSomeOrexD
//========================================

INSTANCE DIA_Scorpio_GiveSomeOrexD (C_INFO)
{
   npc          = GRD_205_Scorpio;
   nr           = 2;
   condition    = DIA_Scorpio_GiveSomeOrexD_Condition;
   information  = DIA_Scorpio_GiveSomeOrexD_Info;
   permanent	= FALSE;
   description	= "Niech strac�. (zap�a� 1700 bry�ek)";
};

FUNC INT DIA_Scorpio_GiveSomeOrexD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Scorpio_GetInfos))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scorpio_GiveSomeOrexD_Info()
{
    AI_Output (other, self ,"DIA_Scorpio_GiveSomeOrexD_15_01"); //Niech strac�.
    if (Npc_HasItems (hero, ItMiNugget)>=1700)
    {
        AI_Output (other, self ,"DIA_Scorpio_GiveSomeOrexD_15_02"); //Prosz�, oto twoja ruda.
        AI_Output (self, other ,"DIA_Scorpio_GiveSomeOrexD_03_03"); //Dzi�ki. Zajm� si� tym. Nie ma obawy.
        B_GiveInvItems (other, self, ItMiNugget, 1700);
	if (MIS_SytucajaWOM == LOG_RUNNING)
	{
	B_LogEntry                     (CH1_SytucajaWOM,"Zap�aci�em Skorpionowi za zaniesienie informacji do Starego Obozu. Mog� wr�ci� do Quentina.");
	};
	if (MIS_HelpBrothersBra == LOG_RUNNING)
	{
    B_LogEntry                     (CH1_HelpBrothersBra,"Zap�aci�em Skorpionowi za zaniesienie informacji do Starego Obozu. Bandyci powinni by� zadowoleni.");
	};
    //B_GiveXP (350);
	przekupionyGRD = true;
    }
    else
    {
        AI_Output (self, other ,"DIA_Scorpio_GiveSomeOrexD_03_04"); //Nie masz przy sobie tyle rudy!
        DIA_Scorpio_GiveSomeOrexD.permanent = true;
		przekupionyGRD = false;
    };
};