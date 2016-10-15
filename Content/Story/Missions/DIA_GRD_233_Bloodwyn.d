//poprawione i sprawdzone - Nocturn

// ******************************************************************
// Zur Info: Bloodwyn: 244, 243; Bloodwyn: 229, 242; Fletcher: 241, 240
//sprawdzone przez gothic1210
// ************************************************************
// 			  				   EXIT_Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_EXIT_Schutzgeld (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 999;
	condition	= Info_Bloodwyn_EXIT_Schutzgeld_Condition;
	information	= Info_Bloodwyn_EXIT_Schutzgeld_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Bloodwyn_EXIT_Schutzgeld_Condition()
{
	return 1;
};

FUNC VOID Info_Bloodwyn_EXIT_Schutzgeld_Info()
{	
	AI_Output (other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00"); //Do zobaczenia.
	if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01"); //Trzymaj si�, kolego.
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02"); //W Obozie nie musisz si� niczego obawia�. B�dziemy mieli na ciebie oko.
	};
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
INSTANCE Info_Bloodwyn_Hello (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Hello_Condition;
	information	= Info_Bloodwyn_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Bloodwyn_Hello_Condition()
{	
	if (Kapitel <= 1) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))//1.24 //1.4.02
	{
		return 1;
	};
};
FUNC VOID Info_Bloodwyn_Hello_Info()
{	
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_00"); //Hej, ty!
	AI_Output (other, self,"Info_Bloodwyn_Hello_15_01"); //M�wisz do mnie?
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_02"); //Ostrzegam ci�! Tacy jak ty �atwo mog� napyta� sobie biedy!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_03"); //W ko�cu wi�kszo�� z tutejszych ludzi to straszne zbiry!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_04"); //Wydaje si� im, �e mog� tu robi�, co im si� �ywnie podoba. No, ale my im na to nie pozwalamy.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_05"); //Gomezowi zale�y na spokoju w Obozie, a do nas - Stra�nik�w - nale�y dbanie o porz�dek. Oczywi�cie jest to bardzo wyczerpuj�ce... i KOSZTOWNE zaj�cie.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_06"); //Dlatego w�a�nie chc� ci� prosi� o drobne wsparcie finansowe... Na znak przyja�ni. Ty pomo�esz nam, a my pomo�emy tobie. Je�li b�dziesz mia� k�opoty - mo�esz na nas liczy�.

	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Czemu by nie? Ile mam ci zap�aci�?"	,Info_Bloodwyn_Hello_HowMuch);
	Info_AddChoice		(Info_Bloodwyn_Hello,"To znaczy, �e mam ci zap�aci� za ochron�? Dzi�ki, ale nie! Sam sobie dam rad�!"	,Info_Bloodwyn_Hello_ForgetIt);
	Info_AddChoice		(Info_Bloodwyn_Hello,"Grozisz mi?"	,Info_Bloodwyn_Hello_SollDrohungSein);
};

func void Info_Bloodwyn_Hello_ForgetIt()
{
	AI_Output (other, self,"Info_Bloodwyn_ForgetIt_15_00"); //To znaczy, �e mam ci zap�aci� za ochron�? Dzi�ki, ale nie! Sam sobie dam rad�!
	AI_Output (self, other,"Info_Bloodwyn_ForgetIt_08_01"); //Jak sobie chcesz, ch�opcze. Ale wkr�tce po�a�ujesz, �e odrzuci�e� t� przyjacielsk� propozycj�!
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_SollDrohungSein()
{
	AI_Output (other, self,"Info_Bloodwyn_SollDrohungSein_15_00"); //Grozisz mi?
	AI_Output (self, other,"Info_Bloodwyn_SollDrohungSein_08_01"); //Wr�cz przeciwnie! Oferuj� ci pomoc!
};

func void Info_Bloodwyn_Hello_HowMuch()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_HowMuch_15_01"); //Czemu by nie? Ile mam ci zap�aci�?
	AI_Output (self, other,"Info_Bloodwyn_Hello_HowMuch_08_02"); //Niewiele. 10 bry�ek rudy, to wszystko.
	
	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Nie mam tyle przy sobie."	,Info_Bloodwyn_Hello_NotNow);
	if (Npc_HasItems(other,itminugget)>=10)
	{
		Info_AddChoice	(Info_Bloodwyn_Hello,"Prosz�, oto ruda. Przyjaci� nigdy nie za wielu."	,Info_Bloodwyn_Hello_OkTakeIt);
	};
};
// -------------------------------------------------------
func void Info_Bloodwyn_Hello_OkTakeIt()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_OkTakeIt_15_00"); //Prosz�, oto ruda. Przyjaci� nigdy nie za wielu.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_01"); //Widz�, �e m�dry z ciebie go��. Od tej pory b�dziemy ci� mieli na oku.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_02"); //Ale to nie znaczy, �e mo�esz tu robi�, co ci si� �ywnie podoba, jasne?
	
	B_GiveInvItems 	    (other, self, itminugget, 10);
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_NotNow()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_NotNow_15_00"); //Nie mam tyle przy sobie.
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_01"); //Trudno. Wezm� co masz. Reszt� dop�acisz przy nast�pnym spotkaniu.
	AI_GotoNpc (self,other);
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_02"); //Zobaczmy...
		
	if (Npc_HasItems(other, itminugget) > 0)
	{
		if (Npc_HasItems(other, itminugget) > 9)
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00"); //No patrzcie pa�stwo! Kto� tu nie umie liczy� do 10, co?
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01"); //Wezm� wszystko co masz. To mi pomo�e zapomnie�, �e pr�bowa�e� mnie wykiwa�.
		}
		else
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00"); //O, przyjmuj� r�wnie� mniejsze datki. W ko�cu liczy si� pami��! Dzi�ki za rud�, ch�opcze!
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01"); //Od tej pory b�d� mia� na ciebie oko. W Obozie nic ci ju� nie grozi.
		};
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00"); //Hmmm, naprawd� jeste� sp�ukany, co? Trudno. Mo�e innym razem...
	};
	
	B_GiveInvItems		(other, self, itminugget, Npc_HasItems(other, itminugget) );//Alle Nuggets entfernen
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

// ************************************************************
// 						Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_PayDay (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_PayDay_Condition;
	information	= Info_Bloodwyn_PayDay_Info;
	permanent	= 1;		
	important   = 1;				//*** NUR, WENN SC AUCH 10 ERZ HAT! ***
};                       

FUNC INT Info_Bloodwyn_PayDay_Condition()
{
	if ( (Kapitel <= 2) && (Bloodwyn_PayDay <= Wld_GetDay()-1) && (Npc_HasItems(other, itminugget)>=10) ) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))//1.24
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayDay_Info()
{	
	if (Bloodwyn_ProtectionPaid == TRUE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_00"); //Mi�o ci� widzie�, przyjacielu!
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_01"); //No i jak tam z twoim wsparciem finansowym? Wci�� zalegasz z 10 bry�kami rudy!
		
		Info_ClearChoices	(Info_Bloodwyn_PayDay );
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Prosz�. Czym jest 10 bry�ek rudy wobec prawdziwej przyja�ni."	,Info_Bloodwyn_PayDay_PayAgain);
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Nie b�d� ci wi�cej p�aci�. Do�� ju� ode mnie dosta�e�!"	,Info_Bloodwyn_PayDay_PayNoMore);
	}
	else if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_00"); //Hej, ty!
		AI_Output (other, self,"Info_Bloodwyn_PayDay_Den_15_01"); //Czego znowu?
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_02"); //Pora udowodni�, �e jeste� prawdziwym przyjacielem.
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_03"); //Marne 10 bry�ek rudy, i wszystko b�dzie w porz�dku. Co ty na to?
	};
	Bloodwyn_PayDay = B_SetDayTolerance();
};

func void Info_Bloodwyn_PayDay_PayAgain()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayAgain_15_00"); //Prosz�. Czym jest 10 bry�ek rudy wobec prawdziwej przyja�ni.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayAgain_08_01"); //Czytasz w moich my�lach!
	
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

func void Info_Bloodwyn_PayDay_PayNoMore()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_00"); //Nie b�d� ci wi�cej p�aci�. Do�� ju� ode mnie dosta�e�!
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_01"); //Zawiod�em si� na tobie! Taki z ciebie przyjaciel? Dobrze, jak sobie chcesz! Od tej pory sam dbaj o siebie. Ja umywam r�ce.
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_02"); //Bez obawy. Jako� sobie poradz� bez twojej pomocy.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_03"); //To si� dopiero oka�e...
	
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Npc_SetPermAttitude (self,ATT_ANGRY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

// ************************************************************
// 						DOCH zahlen
// ************************************************************

INSTANCE Info_Bloodwyn_Doch (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Doch_Condition;
	information	= Info_Bloodwyn_Doch_Info;
	permanent	= 1;
	description = "Zmieni�em zdanie. Postanowi�em jednak zap�aci� ci te 10 bry�ek rudy.";
};                       

FUNC INT Info_Bloodwyn_Doch_Condition()
{
	if (Bloodwyn_ProtectionPaid == FALSE) && (Kapitel <= 1)  && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))//1.24
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_Doch_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_Doch_15_00"); //Zmieni�em zdanie. Postanowi�em jednak zap�aci� ci te 10 bry�ek rudy.
	if (Npc_HasItems(other, itminugget)>=10)
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_01"); //Trzeba tak by�o od razu! M�dry z ciebie go��.
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_02"); //Ale od tej pory b�dziesz p�aci� swoj� dzienn� sk�adk�, co? 
		Bloodwyn_ProtectionPaid = TRUE;
		Herek_ProtectionBully = FALSE;
		Grim_ProtectionBully = FALSE;
		Npc_SetPermAttitude (self,ATT_FRIENDLY);
		Bloodwyn_PayDay = B_SetDayTolerance();
		B_GiveInvItems 	    (other, self, itminugget, 10);
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_NoOre_08_00"); //To wr��, jak b�dziesz mia� troch� rudy.
		AI_StopProcessInfos	(self);
	};
};


	

INSTANCE Info_Bloodwyn_PayForJesse (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 5;
	condition	= Info_Bloodwyn_PayForJesse_Condition;
	information	= Info_Bloodwyn_PayForJesse_Info;
	permanent	= 1;
	description = "Jesse przysy�a mnie, �ebym zap�aci� jego 10 bry�ek.";
};                       

FUNC INT Info_Bloodwyn_PayForJesse_Condition()
{
	if (Jesse_PayForMe == LOG_RUNNING) && (Kapitel <= 1) 
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayForJesse_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_00"); //Jesse przysy�a mnie, �ebym zap�aci� jego 10 bry�ek.
	if  (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_01"); //Powiniene� raczej zap�aci� SWOJE 10 bry�ek.
	};
	AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_02"); //Zapomnij o tym facecie, Jesse i tak d�ugo nie poci�gnie.
	if (Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_03"); //Nie - zap�ac� za niego. Masz tu jego 10 bry�ek i zostaw go w spokoju.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_04"); //Dobra, jak sobie chcesz.
		Jesse_PayForMe = LOG_SUCCESS;
		B_GiveInvItems 	    (other, self, itminugget, 10);
		 B_LogEntry               (CH1_HelpJesse,"Odda�em 10 bry�ek rudy Bloodowynowi.");
	}
	else
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_05"); //Hmmm... W�a�nie sobie przypomnia�em, �e nie mam teraz tyle rudy.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_06"); //To znak, cz�owieku! Przemy�l to sobie. P�ac�c za tego go�cia, wyrzucasz rud� w b�oto!
	};
};
/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_233_Bloodwyn_WELCOME (C_INFO)
{
	npc				= GRD_233_Bloodwyn;
	condition		= GRD_233_Bloodwyn_WELCOME_Condition;
	information		= GRD_233_Bloodwyn_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_233_Bloodwyn_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_233_Bloodwyn_WELCOME_Info()
{
	AI_Output (self, other,"GRD_233_Bloodwyn_WELCOME_Info_08_01"); //Teraz jeste� jednym z nas! Dobra robota! Stra�y przyda si� kto� taki jak ty!
};

//========================================
// Zadanie "Parvez w tarapatach"
//========================================

instance DIA_Bloodwyn_TroublesSolved (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 4;
	condition	= DIA_Bloodwyn_TroublesSolved_Condition;
	information	= DIA_Bloodwyn_TroublesSolved_Info;
	permanent	= 0;
	important 	= TRUE;
};                       

FUNC int DIA_Bloodwyn_TroublesSolved_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_TroublesSolved))
	{
		return 1;
	};
};

FUNC VOID DIA_Bloodwyn_TroublesSolved_Info()
{
	AI_Output(self, other, "DIA_Bloodwyn_TroublesSolved_03_00"); //Prosz�, prosz�, nowy bohater z Bractwa! Zaraz si� zrzygam z rado�ci!
	AI_Output(other, self, "DIA_Bloodwyn_TroublesSolved_15_01"); //Daruj sobie. Tym razem nieco przesadzi�e�. Musia�em po�o�y� temu kres.
	AI_Output(self, other, "DIA_Bloodwyn_TroublesSolved_03_02"); //Taaa... I ta banda na�panych �ysoli dalej podbiera nam ludzi. Ale oczywi�cie to ty masz racje.
	AI_Output(self, other, "DIA_Bloodwyn_TroublesSolved_03_03"); //Przynajmniej na razie...
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info DIE
//***************************************************************************
/*
instance Info_Bloodwyn_DIE (C_INFO)
{
	npc			= Grd_233_Bloodwyn;
	condition	= Info_Bloodwyn_DIE_Condition;
	information	= Info_Bloodwyn_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Bloodwyn_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Bloodwyn_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_01"); //No prosz�, to� to nasz zdrajca! A my ci� uwa�ali�my za jednego z nas.
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_02"); //Widz�, �e przeoczyli�my jednego z Mag�w Ognia!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_03"); //To ten Cie�, kt�ry nas zdradzi�!
		};			

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_04"); //Zaraz! O czym ty m�wisz, Bloodwyn?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_05"); //Spikn��e� si� z Nowym Obozem, tak?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_06"); //Nie, czekaj! Ja dalej...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_07"); //Co, my�la�e�, �e damy si� tak �atwo wykiwa�, h�?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_08"); //Przesta� gada� od rzeczy...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_09"); //Zdrajcy tacy jak ty zas�uguj� tylko na �mier�.
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_10"); //GI�!!!

		if	Npc_KnowsInfo(hero, Info_Fletcher_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,	"Fletcher, kt�ry pilnuje teraz g��wnej bramy, zareagowa� podobnie jak Bloodwyn. Mam wra�enie, �e ma to co� wsp�lnego z moimi poszukiwaniami kamienia ogniskuj�cego dla Nowego Obozu.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,	"Bloodwyn, kt�ry pilnuje teraz po�udniowej bramy Starego Obozu, nazwa� mnie zdrajc�. Nie chcia� mnie nawet wys�ucha� - od razu rzuci� si� do ataku!");
			B_LogEntry			(CH4_BannedFromOC,	"Wygl�da na to, �e zosta�em wygnany ze Starego Obozu!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_11"); //Postanowi�e� zobaczy�, jak wygl�da �wiat na zewn�trz Nowego Obozu, co? To by� b��d!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_12"); //No prosz�, znudzi� ci si� tw�j nowy dom na bagnach? Pope�ni�e� b��d przychodz�c tutaj.
		};

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_13"); //Co? O co ci chodzi?!
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_14"); //Nie s�ysza�e� o ataku na wasz� kopalni�?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_15"); //Chwileczk�...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_16"); //Przykro mi, ale nie mo�emy pozwoli�, �eby� o tym komu� powiedzia�!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_17"); //Hej, nie chc� �adnych k�opot�w...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_18"); //Trzeba by�o o tym pomy�le� troch� wcze�niej!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_19"); //S�uchaj, mam tego serdecznie do��...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_20"); //Ja te�! ZABI� GO!!!
	};
	
	Npc_ExchangeRoutine	(self,				"FMTaken2");	// Verst�rkung vor das Hinterem Tor (Anf�hrer)
	B_ExchangeRoutine	(GRD_232_Gardist,	"FMTaken2");	// Verst�rkung vor das Hinterem Tor
	B_ExchangeRoutine	(GRD_229_Gardist,	"FMTaken2");	// Verst�rkung vor das Hinterem Tor (Fernk�mpfer)
	B_ExchangeRoutine	(GRD_216_Torwache,	"FMTaken2");	// regul�re Wache am Hinteren Tor
	B_ExchangeRoutine	(GRD_217_Torwache,	"FMTaken2");	// regul�re Wache am Hinteren Tor

	B_SetPermAttitude	(GRD_233_Bloodwyn,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_232_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_229_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_216_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_217_Torwache,	ATT_HOSTILE);

	
	if	!Npc_KnowsInfo(hero, Info_Fletcher_DIE)
	{
		B_LogEntry		(CH4_Firemages,	"Bramy do Starego Obozu zosta�y zamkni�te i pozostaj� pilnie strze�one. Stra�nicy atakuj� ka�dego, kto podejdzie w pobli�e Obozu.");
	};
	
	AI_StopProcessInfos	(self);
};
*/
/*
// *Script was make in Easy Dialog Maker (EDM)
var int replyC;
var int przekupiony;
//========================================
//-----------------> UKLAD
//========================================

INSTANCE DIA_Bloodwyn_UKLAD (C_INFO)
{
   npc          = Grd_233_Bloodwyn;
   nr           = 88;
   condition    = DIA_Bloodwyn_UKLAD_Condition;
   information  = DIA_Bloodwyn_UKLAD_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie propozycj�.";
};

FUNC INT DIA_Bloodwyn_UKLAD_Condition()
{
    if (MIS_SpysProblems == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Tippler_NEK_DED))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bloodwyn_UKLAD_Info()
{
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_15_01"); //Mam dla ciebie propozycj�.
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_03_02"); //Czego?

    Info_ClearChoices		(DIA_Bloodwyn_UKLAD);
    Info_AddChoice		(DIA_Bloodwyn_UKLAD, "Masz tu 30 bry�ek rudy.", DIA_Bloodwyn_UKLAD_30B);
   // Info_AddChoice		(DIA_Bloodwyn_UKLAD, "Masz tu 50 bry�ek rudy.", DIA_Bloodwyn_UKLAD_50B);
    Info_AddChoice		(DIA_Bloodwyn_UKLAD, "Masz tu 100 bry�ek rudy.", DIA_Bloodwyn_UKLAD_100B);
    Info_AddChoice		(DIA_Bloodwyn_UKLAD, "Ju� nic.", DIA_Bloodwyn_UKLAD_NO);
};

FUNC VOID DIA_Bloodwyn_UKLAD_30B()
{
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_30B_15_01"); //Masz tu 30 bry�ek rudy.
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_30B_03_02"); //Co mam za to niby zrobi�?
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_30B_15_03"); //Nie b�dziesz pomaga� Z�emu.
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_30B_03_04"); //Zwariowa�e�? Z�y zap�aci� mi znacznie wi�cej.
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_30B_03_05"); //Powiem mu o tym zaj�ciu.
    Info_ClearChoices		(DIA_Bloodwyn_UKLAD);
    B_LogEntry                     (CH1_SpysProblems,"Bloodwyn odrzuci� moj� ofert�. C�, 30 bry�ek rudy to faktycznie niezbyt wiele. Chyba powinienem zaproponowa� wi�cej...");
    Npc_SetPermAttitude (STT_315_Sly, ATT_HOSTILE);
	replyC = true; 
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Bloodwyn_UKLAD_50B()
{
if (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_50B_15_01"); //Masz tu 50 bry�ek rudy.
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_50B_03_02"); //I co mam z tym zrobi�?
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_50B_15_03"); //We� i nie pomagaj Z�emu. Rozumiemy si�?
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_50B_03_04"); //Troch� ma�o... Niech ci b�dzie.
    B_LogEntry                     (CH1_SpysProblems,"Bloodwyn pom�g� mi za 50 bry�ek rudy.");
    B_GiveXP (125);
	przekupiony = true;
    B_GiveInvItems (other, self, ItMiNugget, 50);
    Info_ClearChoices		(DIA_Bloodwyn_UKLAD);
    AI_StopProcessInfos	(self);
}
else
{
 AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_50B_15_01"); //Masz tu 50 bry�ek rudy.
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_50B_03_02"); //Gdzie? Po�wicz liczenie, ch�opcze.
replyC = true;
AI_StopProcessInfos	(self);
};
};

FUNC VOID DIA_Bloodwyn_UKLAD_100B()
{
    if (Npc_HasItems (hero, ItMiNugget)>=100)
    {
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_100B_15_01"); //Masz tu 100 bry�ek rudy.
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_100B_15_02"); //Nie b�dziesz pomaga� Z�emu. Rozumiesz?!
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_100B_03_03"); //Nie tym tonem, ch�opcze.
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_100B_15_04"); //Pomo�esz mi czy nie?
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_100B_03_05"); //Dobra. Id� ju�.
    B_GiveInvItems (other, self, ItMiNugget, 100);
    B_LogEntry                     (CH1_SpysProblems,"Przekupi�em Bloodwyna 100 bry�kami rudy. Cholera, ale drogo...");
    B_GiveXP (50);
	przekupiony = true;
    Info_ClearChoices		(DIA_Bloodwyn_UKLAD);
    AI_StopProcessInfos	(self);
}
else
{
AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_100B_15_01"); //Masz tu 100 bry�ek rudy.
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_100B_03_02"); //Jakie 100 bry�ek? Nie widz� tu tyle! Zje�d�aj!
replyC = true; 
AI_StopProcessInfos	(self);
};
};

FUNC VOID DIA_Bloodwyn_UKLAD_NO()
{
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_NO_15_01"); //Ju� nic.
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_NO_03_02"); //Wi�c nie zawracaj mi g�owy!
replyC = true;   
 Info_ClearChoices		(DIA_Bloodwyn_UKLAD);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZGODA
//========================================

INSTANCE DIA_Bloodwyn_ZGODA (C_INFO)
{
   npc          = Grd_233_Bloodwyn;
   nr           = 82;
   condition    = DIA_Bloodwyn_ZGODA_Condition;
   information  = DIA_Bloodwyn_ZGODA_Info;
   permanent	= FALSE;
   description	= "Mo�e si� jako� dogadamy?";
};

FUNC INT DIA_Bloodwyn_ZGODA_Condition()
{
    if (replyC == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bloodwyn_ZGODA_Info()
{
    AI_Output (other, self ,"DIA_Bloodwyn_ZGODA_15_01"); //Mo�e si� jako� dogadamy?
    AI_Output (self, other ,"DIA_Bloodwyn_ZGODA_03_02"); //Co masz na my�li?
    AI_Output (other, self ,"DIA_Bloodwyn_ZGODA_15_03"); //Dam ci tyle rudy, ile za��dasz.
    AI_Output (self, other ,"DIA_Bloodwyn_ZGODA_03_04"); //Dobra. Przynie� mi...
    AI_Output (self, other ,"DIA_Bloodwyn_ZGODA_03_05"); //300 bry�ek rudy.
    AI_Output (other, self ,"DIA_Bloodwyn_ZGODA_15_06"); //Ile?!
    AI_Output (self, other ,"DIA_Bloodwyn_ZGODA_03_07"); //Przyjd�, gdy b�dziesz mia� rud�.
    B_LogEntry                     (CH1_SpysProblems,"Za 300 bry�ek rudy Bloodwyn b�dzie zn�w skory do rozmowy.");
};

//========================================
//-----------------> REPLYC
//========================================

INSTANCE DIA_Bloodwyn_REPLYC (C_INFO)
{
   npc          = Grd_233_Bloodwyn;
   nr           = 90;
   condition    = DIA_Bloodwyn_REPLYC_Condition;
   information  = DIA_Bloodwyn_REPLYC_Info;
   permanent	= FALSE;
   description	= "Pogadajmy jeszcze. Mam 300 bry�ek.";
};

FUNC INT DIA_Bloodwyn_REPLYC_Condition()
{
    if(Npc_KnowsInfo (hero, DIA_Bloodwyn_ZGODA))
    && (Npc_HasItems (hero, ItMiNugget)>=300)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bloodwyn_REPLYC_Info()
{
    AI_Output (other, self ,"DIA_Bloodwyn_REPLYC_15_01"); //Pogadajmy jeszcze. Mam 300 bry�ek.
    AI_Output (self, other ,"DIA_Bloodwyn_REPLYC_03_02"); //Dobra. Tyle wystarczy.
    AI_Output (other, self ,"DIA_Bloodwyn_REPLYC_15_03"); //Czyli pomo�esz mi?
    AI_Output (self, other ,"DIA_Bloodwyn_REPLYC_03_04"); //Tak, id� ju�.
    B_LogEntry                     (CH1_SpysProblems,"Zap�aci�em Bloodwynowi za zerwanie umowy ze Z�ym.");
	B_GiveInvItems (other, self, ItMiNugget, 300);
   Npc_SetPermAttitude (STT_315_Sly, ATT_NEUTRAL);
};
*/

//========================================
//-----------------> helloFriendCH4
//========================================

INSTANCE DIA_Bloodwyn_helloFriendCH4 (C_INFO)
{
   npc          = Grd_233_Bloodwyn;
   nr           = 1;
   condition    = DIA_Bloodwyn_helloFriendCH4_Condition;
   information  = DIA_Bloodwyn_helloFriendCH4_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bloodwyn_helloFriendCH4_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bloodwyn_helloFriendCH4_Info()
{
    AI_Output (self, other ,"DIA_Bloodwyn_helloFriendCH4_03_01"); //Kogo ja widz�! Cz�owiek, o kt�rym wszscy gadaj�, ale kt�rego nikt nie zna.
    AI_Output (self, other ,"DIA_Bloodwyn_helloFriendCH4_03_02"); //Dobrze ci� widzie�. Akurat jest pewna rzecz, w kt�rej mo�esz mi pom�c.
    AI_Output (other, self ,"DIA_Bloodwyn_helloFriendCH4_15_03"); //Hm?
    AI_Output (self, other ,"DIA_Bloodwyn_helloFriendCH4_03_04"); //Nie ma czasu na wyja�nienia. Chod� za mn�, a poznasz tajemnic� Kruka!
    Npc_ExchangeRoutine (self, "motherfucker");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> MysteryOfRaven
//========================================

INSTANCE DIA_Bloodwyn_MysteryOfRaven (C_INFO)
{
   npc          = Grd_233_Bloodwyn;
   nr           = 2;
   condition    = DIA_Bloodwyn_MysteryOfRaven_Condition;
   information  = DIA_Bloodwyn_MysteryOfRaven_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bloodwyn_MysteryOfRaven_Condition()
{
    if (kapitel >= 4) && (Npc_GetDistToWP (self, "SPAWN_MOLERAT02_SPAWN01") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bloodwyn_MysteryOfRaven_Info()
{
    AI_Output (self, other ,"DIA_Bloodwyn_MysteryOfRaven_03_01"); //Naprawd� dziwi� si�, �e �yjesz tak d�ugo. Jeste� naiwny, a� do b�lu.
    AI_Output (other, self ,"DIA_Bloodwyn_MysteryOfRaven_15_02"); //A mo�e po prostu chcia�em wykorzysta� okazj�, �eby ci� zabi�?
    AI_Output (self, other ,"DIA_Bloodwyn_MysteryOfRaven_03_03"); //Nie dam ci tej przyjemno�ci. Wkr�tce wszystko si� zmieni, ale ty ju� tego nie zobaczysz. 
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};