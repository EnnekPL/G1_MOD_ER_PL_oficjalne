//poprawione i sprawdzone - Nocturn

// **************************** 
//				EXIT 
// ****************************

instance  Info_Nefarius_EXIT (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	999;
	condition	=	Info_Nefarius_EXIT_Condition;
	information	=	Info_Nefarius_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Nefarius_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************** 
//			Hallo 
// ****************************

instance  Info_Nefarius_Hallo (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_Hallo_Condition;
	information	=	Info_Nefarius_Hallo_Info;
	permanent	=	0;
	description =	"Kim jeste�?";
};                       

FUNC int  Info_Nefarius_Hallo_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_Hallo_Info()
{
	AI_Output (other, self,"Info_Nefarius_Hallo_15_00"); //Kim jeste�?
	AI_Output (self, other,"Info_Nefarius_Hallo_04_01"); //Nazywam si� Nefarius. Mag Kr�gu Wody.
};

// **************************** 
//			Wo Saturas
// ****************************

instance  Info_Nefarius_WoSaturas (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	2;
	condition	=	Info_Nefarius_WoSaturas_Condition;
	information	=	Info_Nefarius_WoSaturas_Info;
	permanent	=	0;
	description =	"Gdzie mog� znale�� Saturasa?";
};                       

FUNC int  Info_Nefarius_WoSaturas_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_WoSaturas_Info()
{
	AI_Output (other, self,"Info_Nefarius_WoSaturas_15_00"); //Gdzie mog� znale�� Saturasa?
	AI_Output (self, other,"Info_Nefarius_WoSaturas_04_01"); //Poszukaj za t� wielk�, okr�g�� bram�.
};

// **************************** 
//			WannaMage
// ****************************

instance  Info_Nefarius_WannaMage (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_WannaMage_Condition;
	information	=	Info_Nefarius_WannaMage_Info;
	permanent	=	0;
	description =	"Chcia�bym zosta� Magiem Kr�gu Wody.";
};                       

FUNC int  Info_Nefarius_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Hallo)) && (Npc_GetTrueGuild (hero) != GIL_KDW)
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_WannaMage_Info()
{
	AI_Output (other, self,"Info_Nefarius_WannaMage_15_00"); //Chcia�bym zosta� Magiem Kr�gu Wody.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_01"); //Nie tak szybko, m�j ch�opcze!
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_02"); //Nie przyjmujemy do naszego grona byle kogo. Najpierw musisz si� wykaza� czym� niezwyk�ym.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_03"); //Potem czeka ci� okres pr�bny.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_04"); //Je�eli powa�nie my�lisz o zostaniu Magiem Wody, do��cz najpierw do Najemnik�w. W ten spos�b b�dziesz m�g� nam udowodni� swoj� warto��.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_05"); //Kto wie, mo�e pewnego dnia uda ci si� nas przekona�...
};

// **************************** 
//			NowReady
// ****************************

instance  Info_Nefarius_NowReady (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_NowReady_Condition;
	information	=	Info_Nefarius_NowReady_Info;
	permanent	=	1;
	description =	"Czy jestem ju� got�w, by zosta� Magiem Wody?";
};                       

FUNC int  Info_Nefarius_NowReady_Condition()
{
	if	( !FMTaken && Npc_KnowsInfo(hero, Info_Nefarius_WannaMage) && (Npc_GetTrueGuild(hero)!=GIL_KDW) )
	{
		return 1;
	};	
};

FUNC VOID  Info_Nefarius_NowReady_Info()
{
	AI_Output (other, self,"Info_Nefarius_NowReady_15_00"); //Czy jestem ju� got�w, by zosta� Magiem Wody?
	
	if (Npc_GetTrueGuild (hero) != GIL_SLD) 
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_01"); //Najpierw zaci�gnij si� do Najemnik�w, potem - zobaczymy...
	}
	else
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_02"); //Jak widz�, zosta�e� jednym z Najemnik�w. Dobrze, bardzo dobrze!
		AI_Output (self, other,"Info_Nefarius_NowReady_04_03"); //Czekaj teraz cierpliwie na swoj� szans�...
	};
};

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
///////////////		Kapitel 2				//////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

// **************************** 
//			Staff 
// ****************************

instance  Info_Nefarius_Staff (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_Staff_Condition;
	information	=	Info_Nefarius_Staff_Info;
	permanent	=	0;
	description =	"Saturas kaza� mi od ciebie odebra� kostur.";
};                       

FUNC int  Info_Nefarius_Staff_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_KDW) 
	{
	return 1;
	};
};

FUNC VOID  Info_Nefarius_Staff_Info()
{
	AI_Output (other, self,"Info_Nefarius_Staff_15_00"); //Saturas kaza� mi od ciebie odebra� kostur.
	AI_Output (self, other,"Info_Nefarius_Staff_04_01"); //A wi�c nale�ysz ju� do kr�gu Wody. To wspaniale. Oto tw�j pierwszy kostur. Za drobn� op�at� pomog� ci w jego konsekracji.
	AI_Output (self, other,"Info_Nefarius_Staff_04_02"); //Lepszy kostur b�d� m�g� ci sprzeda� dopiero, gdy przyst�pisz do trzeciego kr�gu. 
	
	CreateInvItems (self, ItMw_2H_Staff_WaterMage_01,1);
	B_GiveInvItems (self,other, ItMw_2H_Staff_WaterMage_01,1);
};

//***********************************************
//				Give me Staff 2
//***********************************************

instance  DIA_Nefarius_SecondStaff (C_INFO)
{
	npc			=  KDW_603_Nefarius;
	nr			=  1;
	condition	=  DIA_Nefarius_SecondStaff_Condition;
	information	=  DIA_Nefarius_SecondStaff_Info;
	permanent	=  0;
	description =  "Potrzebuj� lepszego kostura.";
};                       

FUNC int  DIA_Nefarius_SecondStaff_Condition()
{
	if	(Npc_GetTrueGuild (hero) == GIL_KDW) && (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 3)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Nefarius_SecondStaff_Info()
{
	AI_Output (other, self,"DIA_Nefarius_SecondStaff_15_00"); //Potrzebuj� lepszego kostura. Arcymag Saturas wprowadzi� mnie w trzeci kr�g. 
	AI_Output (self, other,"DIA_Nefarius_SecondStaff_12_01"); //Zas�u�y�e�, aby nosi� ten kostur. Je�li chcesz, mo�emy go p�niej ulepszy� i konsekrowa�. 
	AI_Output (self, other,"DIA_Nefarius_SecondStaff_12_02"); //Pami�taj, �e wi�ksza moc, to tak�e wi�ksze wymagania wobec ciebie. Musisz si� ci�gle doskonali�. 
	
	CreateInvItems (self, ItMw_2H_Staff_WaterMage_03,1);
	B_GiveInvItems (self,other, ItMw_2H_Staff_WaterMage_03,1);
};

//***********************************************
//				Konsekracja
//***********************************************

instance  DIA_Nefarius_Konsekracja (C_INFO)
{
	npc			=  KDW_603_Nefarius;
	nr			=  1;
	condition	=  DIA_Nefarius_Konsekracja_Condition;
	information	=  DIA_Nefarius_Konsekracja_Info;
	permanent	=  1;
	description =  "Konsekrujmy m�j kostur.";
};                       

FUNC int  DIA_Nefarius_Konsekracja_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_KDW) && Npc_KnowsInfo (hero, Info_Nefarius_Staff)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Nefarius_Konsekracja_Info()
{
	AI_Output (other, self,"DIA_Nefarius_Konsekracja_15_00"); //Konsekrujmy m�j kostur.
	AI_Output (self, other,"DIA_Nefarius_Konsekracja_12_01"); //Pami�taj, �e po konsekracji wzrosn� wymagania kostura. B�dziesz musia� posiada� wi�ksz� moc magiczn� i si��.
	Info_ClearChoices	(DIA_Nefarius_Konsekracja);
	Info_AddChoice		(DIA_Nefarius_Konsekracja, DIALOG_BACK, DIA_Nefarius_Konsekracja_01_Back); 
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_01)
	{
    Info_AddChoice		(DIA_Nefarius_Konsekracja, "Konsekruj podstawowy kostur (500 bry�ek rudy, wzrost wym. mana: 35, obra�enia: 45 + 3 od magii)", DIA_Nefarius_Konsekracja_01); 
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_03)
	{
    Info_AddChoice		(DIA_Nefarius_Konsekracja, "Wzmocnij kostur Maga Wody(750 bry�ek rudy, wzrost wym. mana: 50, si�a: 35 obra�enia: 55 + 5 od magii)", DIA_Nefarius_Konsekracja_02);
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_04)
	{
	Info_AddChoice		(DIA_Nefarius_Konsekracja, "Konsekruj kostur Maga Wody(1500 bry�ek rudy, wzrost wym. mana: 60, si�a: 45 obra�enia: 60 + 8 od magii)", DIA_Nefarius_Konsekracja_03);
	};
};

func void DIA_Nefarius_Konsekracja_01_Back ()
{
	Info_ClearChoices	(DIA_Nefarius_Konsekracja);
};

func void DIA_Nefarius_Konsekracja_01 ()
{
if (Npc_HasItems(other,itminugget) >= 500)
{
B_GiveInvItems (hero, self, ItMw_2H_Staff_WaterMage_01,1);
B_GiveInvItems (hero, self, itminugget,500);
CreateInvItems (self, ItMw_2H_Staff_WaterMage_02,1);
B_GiveInvItems (self, hero, ItMw_2H_Staff_WaterMage_02,1);
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon1"); //Adanosie, przelej cz�� swej boskiej mocy do tego magicznego kryszta�u. Niech twoja magia r�wnowagi zasieje pogrom w szeregach tych, kt�rzy chc� by� ponad ni�.
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon2"); //Niech ten Mag kroczy �cie�k� twojego �wiat�a i niechaj spogl�daj�c na tw�j �wi�ty kostur zawsze wie, jak� decyzj� podj��. 
}
else
{
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon_NoOre"); //Konsekracja wymaga z�o�enia datku na rzecz naszego Kr�gu.
};
Info_ClearChoices	(DIA_Nefarius_Konsekracja);
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_01)
	{
    Info_AddChoice		(DIA_Nefarius_Konsekracja, "Konsekruj podstawowy kostur (500 bry�ek rudy, wzrost wym. mana: 35, obra�enia: 45 + 3 od magii)", DIA_Nefarius_Konsekracja_01); 
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_03)
	{
    Info_AddChoice		(DIA_Nefarius_Konsekracja, "Wzmocnij kostur Maga Wody(750 bry�ek rudy, wzrost wym. mana: 50, si�a: 35 obra�enia: 55 + 5 od magii)", DIA_Nefarius_Konsekracja_02);
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_04)
	{
	Info_AddChoice		(DIA_Nefarius_Konsekracja, "Konsekruj kostur Maga Wody(1500 bry�ek rudy, wzrost wym. mana: 60, si�a: 45 obra�enia: 60 + 8 od magii)", DIA_Nefarius_Konsekracja_03);
	};
};

func void DIA_Nefarius_Konsekracja_02 ()
{
if (Npc_HasItems(other,itminugget) >= 750)
{
B_GiveInvItems (hero, self, ItMw_2H_Staff_WaterMage_03,1);
B_GiveInvItems (hero, self, itminugget,750);
CreateInvItems (self, ItMw_2H_Staff_WaterMage_04,1);
B_GiveInvItems (self, hero, ItMw_2H_Staff_WaterMage_04,1);
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon1"); //Adanosie, przelej cz�� swej boskiej mocy do tego magicznego kryszta�u. Niech twoja magia r�wnowagi zasieje pogrom w szeregach tych, kt�rzy chc� by� ponad ni�.
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon2"); //Niech ten Mag kroczy �cie�k� twojego �wiat�a i niechaj spogl�daj�c na tw�j �wi�ty kostur zawsze wie, jak� decyzj� podj��. 
}
else
{
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon_NoOre"); //Konsekracja wymaga z�o�enia datku na rzecz naszego Kr�gu.
};
Info_ClearChoices	(DIA_Nefarius_Konsekracja);
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_01)
	{
    Info_AddChoice		(DIA_Nefarius_Konsekracja, "Konsekruj podstawowy kostur (500 bry�ek rudy, wzrost wym. mana: 35, obra�enia: 45 + 3 od magii)", DIA_Nefarius_Konsekracja_01); 
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_03)
	{
    Info_AddChoice		(DIA_Nefarius_Konsekracja, "Wzmocnij kostur Maga Wody(750 bry�ek rudy, wzrost wym. mana: 50, si�a: 35 obra�enia: 55 + 5 od magii)", DIA_Nefarius_Konsekracja_02);
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_04)
	{
	Info_AddChoice		(DIA_Nefarius_Konsekracja, "Konsekruj kostur Maga Wody(1500 bry�ek rudy, wzrost wym. mana: 60, si�a: 45 obra�enia: 60 + 8 od magii)", DIA_Nefarius_Konsekracja_03);
	};
};

func void DIA_Nefarius_Konsekracja_03 ()
{
if (Npc_HasItems(other,itminugget) >= 1500)
{
B_GiveInvItems (hero, self, ItMw_2H_Staff_WaterMage_04,1);
B_GiveInvItems (hero, self, itminugget,1500);
CreateInvItems (self, ItMw_2H_Staff_WaterMage_05,1);
B_GiveInvItems (self, hero, ItMw_2H_Staff_WaterMage_05,1);
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon1"); //Adanosie, przelej cz�� swej boskiej mocy do tego magicznego kryszta�u. Niech twoja magia r�wnowagi zasieje pogrom w szeregach tych, kt�rzy chc� by� ponad ni�.
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon2"); //Niech ten Mag kroczy �cie�k� twojego �wiat�a i niechaj spogl�daj�c na tw�j �wi�ty kostur zawsze wie, jak� decyzj� podj��. 
}
else
{
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon_NoOre"); //Konsekracja wymaga z�o�enia datku na rzecz naszego Kr�gu.
};
Info_ClearChoices	(DIA_Nefarius_Konsekracja);
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_01)
	{
    Info_AddChoice		(DIA_Nefarius_Konsekracja, "Konsekruj podstawowy kostur (500 bry�ek rudy, wzrost wym. mana: 35, obra�enia: 45 + 3 od magii)", DIA_Nefarius_Konsekracja_01); 
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_03)
	{
    Info_AddChoice		(DIA_Nefarius_Konsekracja, "Wzmocnij kostur Maga Wody(750 bry�ek rudy, wzrost wym. mana: 50, si�a: 35 obra�enia: 55 + 5 od magii)", DIA_Nefarius_Konsekracja_02);
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_04)
	{
	Info_AddChoice		(DIA_Nefarius_Konsekracja, "Konsekruj kostur Maga Wody(1500 bry�ek rudy, wzrost wym. mana: 60, si�a: 45 obra�enia: 60 + 8 od magii)", DIA_Nefarius_Konsekracja_03);
	};
};

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
///////////////		Kapitel 4				//////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

// **************************** 
//			OCNews
// ****************************

instance  Info_Nefarius_OCNews (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_OCNews_Condition;
	information	=	Info_Nefarius_OCNews_Info;
	permanent	=	0;
	important	= 	1;
};                       

FUNC int  Info_Nefarius_OCNews_Condition()
{
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID  Info_Nefarius_OCNews_Info()
{
	AI_Output (self, other,"Info_Nefarius_OCNews_04_00"); //S� jakie� wie�ci od naszych przyjaci� ze Starego Obozu?
	AI_Output (other, self,"Info_Nefarius_OCNews_15_01"); //Gomez kaza� wymordowa� wszystkich Mag�w Ognia!
	AI_Output (self, other,"Info_Nefarius_OCNews_04_02"); //Nie! Durny barbarzy�ca! Uprzedza�em Corristo - Gomezowi od pocz�tku nie mo�na by�o ufa�! Musisz donie�� o tym Saturasowi!
	if (Npc_GetTrueGuild(hero)==GIL_SLD) && (player_can_SLD_to_WaterMage == true)
	{
		AI_Output (self, other,"Info_Nefarius_OCNews_04_03"); //Czekaj! 
		AI_Output (self, other,"Info_Nefarius_OCNews_04_04"); //Narazi�e� si� dla nas na nie lada niebezpiecze�stwa.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_05"); //Jeste� ju� chyba godzien, by nosi� szaty Maga Wody.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_06"); //A teraz spiesz do Saturasa! Nie tra� czasu!
	};
	AI_StopProcessInfos	(self);
};
