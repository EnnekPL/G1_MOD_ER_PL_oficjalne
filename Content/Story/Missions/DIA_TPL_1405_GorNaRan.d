//poprawione i sprawdzone - Nocturn

// *******************************
// 				EXIT
// *******************************

instance  DIA_GorNaRan_Exit (C_INFO)
{
	npc			=  TPL_1405_GorNaRan;
	nr			=  999;
	condition	=  DIA_GorNaRan_Exit_Condition;
	information	=  DIA_GorNaRan_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_GorNaRan_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_GorNaRan_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
/*------------------------------------------------------------------------
							ARMBRUST TALK							
------------------------------------------------------------------------*/
var int log_gornarancrossbow;
instance  GRD_205_gornaran_CROSSBOW (C_INFO)
{
	npc				= TPL_1405_GorNaRan;
	condition		= GRD_205_gornaran_CROSSBOW_Condition;
	information		= GRD_205_gornaran_CROSSBOW_Info;
	important		= 0;
	permanent		= 1;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC int  GRD_205_gornaran_CROSSBOW_Condition()
{	
if (!kapitel == 6)
{
		return TRUE;
	};

};
FUNC void  GRD_205_gornaran_CROSSBOW_Info()
{
	AI_Output (other, self,"GRD_205_gornaran_CROSSBOW_Info_15_01"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other,"GRD_205_gornaran_CROSSBOW_Info_13_02"); //Mog� ci� nauczy� strzelania z kuszy. To ci� b�dzie kosztowa� 200 bry�ek. 
	if (log_gornarancrossbow == FALSE)
	
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Gor Na Ran poka�e mi jak strzela� z kuszy za 200 bry�ek rudy.");
		log_gornarancrossbow = TRUE;
	};
	
	Info_ClearChoices (GRD_205_gornaran_CROSSBOW);
	Info_Addchoice 	(GRD_205_gornaran_CROSSBOW,B_BuildLearnString(NAME_LearnCrossbow_1,	LPCOST_TALENT_CROSSBOW_1,200),GRD_205_gornaran_CROSSBOW_OK);
	Info_Addchoice 	(GRD_205_gornaran_CROSSBOW,DIALOG_BACK,GRD_205_gornaran_CROSSBOW_BACK);

};  
func void GRD_205_gornaran_CROSSBOW_BACK()
{
	Info_ClearChoices	(GRD_205_gornaran_CROSSBOW );
};

func void GRD_205_gornaran_CROSSBOW_OK()
{
	AI_Output (other, self,"GRD_205_gornaran_CROSSBOW_OK_15_01"); //Umowa stoi. Poka� mi jak obchodzi� si� z kusz�.
	if (hero.attribute[ATR_Dexterity] >= 50)
	{
	if (Npc_HasItems (hero,ItMiNugget)>= 200)
	{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 1, LPCOST_TALENT_CROSSBOW_1))
		{
			AI_Output (self, other,"GRD_205_gornaran_CROSSBOW_OK_13_02"); //Dobra. Bierzmy si� do roboty.
			AI_Output (self, other,"GRD_205_gornaran_CROSSBOW_OK_13_03"); //Z�ap kusz� mocno i oprzyj j� o rami�. To powinno zwi�kszy� celno�� strza�u.
			AI_Output (self, other,"GRD_205_gornaran_CROSSBOW_OK_13_04"); //Przez kilka pierwszych dni twoje rami� da ci si� nie�le we znaki, ale z czasem przywykniesz.
			AI_Output (self, other,"GRD_205_gornaran_CROSSBOW_OK_13_05"); //Po jakim� tygodniu b�dziesz mia� r�ce ze stali!
			AI_Output (self, other,"GRD_205_gornaran_CROSSBOW_OK_13_06"); //Wyceluj spokojnie i powoli �ci�gnij spust. Be�t niesie ze sob� wi�cej si�y ni� strza�a, dlatego powoduje wi�ksze zniszczenia.
			B_GiveInvItems (hero,other,ItMiNugget,200);
			GRD_205_gornaran_CROSSBOW.permanent = 0;
		};
	}
	else
	{
	 AI_Output (self, other,"GRD_205_gornaran_CROSSBOW_OK_13_07"); //Zap�a� 200 bry�ek, a b�d� ci� uczy�.
	};
		}
	else
	{
	AI_Output			(self,other,"DIA_goran_NO_ENOUGHT_STR_1"); //Musisz by� znacznie zr�czniejszy!
	PrintScreen	("Warunek: Zr�czno�� 50", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

/*------------------------------------------------------------------------
							ARMBRUST TALENT2									
------------------------------------------------------------------------*/

instance  GRD_205_gornaran_CROSSBOW2 (C_INFO)
{
	npc				= TPL_1405_GorNaRan;
	condition		= GRD_205_gornaran_CROSSBOW2_Condition;
	information		= GRD_205_gornaran_CROSSBOW2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chcia�bym dowiedzie� si� czego� wi�cej o strzelaniu z kuszy."; 
};

FUNC int  GRD_205_gornaran_CROSSBOW2_Condition()
{
	if (Npc_GetTalentSkill  ( hero, NPC_TALENT_CROSSBOW ) == 1) 
	{
		return TRUE;
	};

};
FUNC void  GRD_205_gornaran_CROSSBOW2_Info()
{
	AI_Output (other, self,"GRD_205_gornaran_CROSSBOW2_Info_15_01"); //Chcia�bym dowiedzie� si� czego� wi�cej o strzelaniu z kuszy.
	AI_Output (self, other,"GRD_205_gornaran_CROSSBOW2_Info_13_02"); //To ci� b�dzie kosztowa� 300 bry�ek rudy.
  
	Info_ClearChoices (GRD_205_gornaran_CROSSBOW2);
	Info_Addchoice 	(GRD_205_gornaran_CROSSBOW2,B_BuildLearnString(NAME_LearnCrossbow_2,	LPCOST_TALENT_CROSSBOW_2,300),GRD_205_gornaran_CROSSBOW2_OK);
	Info_Addchoice 	(GRD_205_gornaran_CROSSBOW2,DIALOG_BACK,  GRD_205_gornaran_CROSSBOW2_BACK);
	

};  
func void GRD_205_gornaran_CROSSBOW2_BACK()
{
	Info_ClearChoices (GRD_205_gornaran_CROSSBOW);
};

func void GRD_205_gornaran_CROSSBOW2_OK()
{
	AI_Output (other, self,"GRD_205_gornaran_CROSSBOW2_OK_15_01"); //Zaczynajmy.
	if (hero.attribute[ATR_Dexterity] >= 100)
	{
	if (Npc_HasItems (hero,ItMiNugget)>= 300)
	{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 2, LPCOST_TALENT_CROSSBOW_2))
		{
		AI_Output (self, other,"GRD_205_gornaran_CROSSBOW2_OK_13_02"); //Dobra. Twoje strza�y b�d� celniejsze, je�li przed �ci�gni�ciem spustu ugniesz nieco nogi w kolanach.
		AI_Output (self, other,"GRD_205_gornaran_CROSSBOW2_OK_13_03"); //Naucz si� poprawnie ocenia� pr�dko�� z jak� porusza si� tw�j cel.
		AI_Output (self, other,"GRD_205_gornaran_CROSSBOW2_OK_13_04"); //Wystrzel pocisk tak, by w odpowiednim miejscu i czasie przeci�� �cie�k�, kt�r� porusza si� cel.
		AI_Output (self, other,"GRD_205_gornaran_CROSSBOW2_OK_13_05"); //Je�li atakujesz wi�cej ni� jeden cel, nie tra� czasu: musisz mo�liwie szybko przygwo�dzi� jeden za drugim dobrze wymierzonymi strza�ami.
		AI_Output (self, other,"GRD_205_gornaran_CROSSBOW2_OK_13_06"); //To by by�o na tyle.
		B_GiveInvItems (hero,other,ItMiNugget,300);
		GRD_205_gornaran_CROSSBOW2.permanent = 0;
		};
	}
	else
	{
	 AI_Output (self, other,"GRD_205_gornaran_CROSSBOW2_OK_13_07"); //Najpierw postaraj si� zdoby� te TRZYSTA BRY�EK RUDY!
	};
	}
	else
	{
	AI_Output			(self,other,"DIA_goran_NO_ENOUGHT_STR_1"); //Musisz by� znacznie zr�czniejszy!
	PrintScreen	("Warunek: Zr�czno�� 100", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};
// *******************************
// 				Wache
// *******************************

instance  DIA_GorNaRan_Wache (C_INFO)
{
	npc			=  TPL_1405_GorNaRan;
	nr			=  1;
	condition	=  DIA_GorNaRan_Wache_Condition;
	information	=  DIA_GorNaRan_Wache_Info;
	permanent	=  1;
	description = "Co tu robisz?";
};                       

FUNC int  DIA_GorNaRan_Wache_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_GorNaRan_Wache_Info()
{
	AI_Output (other, self,"DIA_GorNaRan_Wache_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_01"); //Pilnuj�, �eby b�otne w�e nie podp�ywa�y zbyt blisko Obozu.
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_02"); //Na twoim miejscu trzyma�bym si� od nich z dala. W walce z takim potworem nie masz najmniejszych szans!
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_03"); //A teraz id� ju� sobie. Musz� mie� oczy szeroko otwarte.
	AI_StopProcessInfos	( self );
};



//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_GorNaRan_HELLO1 (C_INFO)
{
   npc          = TPL_1405_GorNaRan;
   nr           = 1;
   condition    = DIA_GorNaRan_HELLO1_Condition;
   information  = DIA_GorNaRan_HELLO1_Info;
   permanent	= FALSE;
   description	= "Dzia�o si� ostatnio co� ciekawego?";
};

FUNC INT DIA_GorNaRan_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_GorNaRan_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_GorNaRan_HELLO1_15_01"); //Dzia�o si� ostatnio co� ciekawego?
    AI_Output (self, other ,"DIA_GorNaRan_HELLO1_03_02"); //Niestety b�otny w�� po�ar� jednego z naszych ludzi. Na moich oczach bestia wy�oni�a si� z bagna i wci�gn�a brodz�cego w wodzie cz�owieka!
    AI_Output (self, other ,"DIA_GorNaRan_HELLO1_03_03"); //Ha! Ta bestia ze�ar�a nawet miecz! Oby mu tak utkn�� w gardle!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Fumes
//========================================

INSTANCE DIA_GorNaRan_Fumes (C_INFO)
{
   npc          = TPL_1405_GorNaRan;
   nr           = 1;
   condition    = DIA_GorNaRan_Fumes_Condition;
   information  = DIA_GorNaRan_Fumes_Info;
   permanent	= FALSE;
   description	= "Baal Orun wys�a� mnie za tob�. Mamy ustali� sk�d unosz� si� truj�ce gazy.";
};

FUNC INT DIA_GorNaRan_Fumes_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalOrun_ToxicFumes))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaRan_Fumes_Info()
{
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_01"); //Baal Orun wys�a� mnie za tob�. Mamy ustali� sk�d unosz� si� truj�ce opary.
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_02"); //Ju� to zrobi�em.
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_03"); //A wi�c?
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_04"); //Z oddali widzia�em ork�w na Cmentarzysku, przewodzi�o im jaki� szaman. Urz�dzali jaki� rytua�.
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_05"); //Palili ca�e g�ry zw�ok innych zielonosk�rych. 
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_06"); //To zapewne efekt mojej niedawnej wizyty w tym miejscu. W takim razie trzeba wys�a� do Beliara r�wnie� i tych ork�w. Pal� truch�a, a opary z nich wkr�tce wyko�cz� ca�e Bractwo.
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_07"); //Chyba musimy si� ich pozby�.
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_08"); //Jacy my? Otrzyma�em rozkaz, by rozejrze� si� i ustali� sk�d wydobywaj� si� te truj�ce gazy.
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_09"); //Nikt nie m�wi� mi, �e mam walczy� z orkami. A ju� na pewno ty mi tego nie wm�wisz.
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_10"); //Chyba nie p�jdziesz, sobie st�d od tak?
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_11"); //Mi�ej zabawy z orkami. 
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_12"); //Ty... Niewa�ne.
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "START");
	
	B_LogEntry          (CH4_ToxicFumes,"Spotka�em Gor Na Rana na miejscu. Stwierdzi�, �e jaki� orkowy szaman prowadzi tam wraz z kilkoma orkami rytua� pogrzebowy. Pal� oni cia�a poleg�ych ork�w. My�l�, �e te trupy pochodz� z Cmentarzyska Ork�w. By�em tam jaki� czas temu...");
	
	B_GiveXP (100);
};