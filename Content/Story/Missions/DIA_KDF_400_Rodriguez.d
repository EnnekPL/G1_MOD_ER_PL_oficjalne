//poprawione i sprawdzone - Nocturn

//***********************************************
//					EXIT	
//***********************************************

instance  DIA_Rodriguez_Exit (C_INFO)
{
	npc			=  KDF_400_Rodriguez;
	nr			=  999;
	condition	=  DIA_Rodriguez_Exit_Condition;
	information	=  DIA_Rodriguez_Exit_Info;
	permanent	=  1;
	description =  DIALOG_ENDE;
};                       

FUNC int  DIA_Rodriguez_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Rodriguez_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//***********************************************
//				Hallo und tsch��
//***********************************************

instance  DIA_Rodriguez_Hello (C_INFO)
{
	npc			=  KDF_400_Rodriguez;
	nr			=  1;
	condition	=  DIA_Rodriguez_Hello_Condition;
	information	=  DIA_Rodriguez_Hello_Info;
	permanent	=  0;
	description =  "Szukam Arcymistrza Mag�w Ognia!";
};                       

FUNC int  DIA_Rodriguez_Hello_Condition()
{
	if	(Npc_GetTrueGuild(hero) != GIL_KDF)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Rodriguez_Hello_Info()
{
	AI_Output (other, self,"DIA_Rodriguez_Hello_15_00"); //Szukam Arcymistrza Mag�w Ognia!
	AI_Output (self, other,"DIA_Rodriguez_Hello_12_01"); //Zg�o� si� do Miltena. On si� zajmuje kurierami.
	AI_StopProcessInfos	( self );
};
//========================================
//-----------------> ImportantQuest
//========================================

INSTANCE DIA_Rodriguez_ImportantQuest (C_INFO)
{
   npc          = KDF_400_Rodriguez;
   nr           = 1;
   condition    = DIA_Rodriguez_ImportantQuest_Condition;
   information  = DIA_Rodriguez_ImportantQuest_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rodriguez_ImportantQuest_Condition()
{
    if (MIS_FireMage_Help == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rodriguez_ImportantQuest_Info()
{
    AI_Output (self, other ,"DIA_Rodriguez_ImportantQuest_03_01"); //Podejd�, Stra�niku. Czy to nie ciebie wys�ano z misj� do obozu Moroka?
    AI_Output (other, self ,"DIA_Rodriguez_ImportantQuest_15_02"); //Tak, w�a�nie dlatego tu przyby�em.
    AI_Output (self, other ,"DIA_Rodriguez_ImportantQuest_03_03"); //Co si� tam dzieje? Jak wygl�da sytuacja?
    AI_Output (self, other ,"DIA_Rodriguez_ImportantQuest_03_04"); //Mo�liwe, �e nie wiesz, ale Gomez powierzy� mi was wspiera�.
    AI_Output (other, self ,"DIA_Rodriguez_ImportantQuest_15_05"); //Odkryli�my, �e �wi�tynia jest wykorzystywana do jakich� orkowych rytua��w.
    AI_Output (other, self ,"DIA_Rodriguez_ImportantQuest_15_06"); //Orkowie i ich szamani chyba sk�adaj� tam mod�y. Morok nie jest pewien jak powinien dalej post�pi�.
    AI_Output (self, other ,"DIA_Rodriguez_ImportantQuest_03_07"); //To miejsce trzeba jak najszybciej zniszczy�. Przeka� moje polecenia swojemu prze�o�onemu.
    AI_Output (self, other ,"DIA_Rodriguez_ImportantQuest_03_08"); //A i we� te magiczne zwoje. Je�li potrafisz je wykorzysta�, przechyl� szal� zwyci�stwa na twoj� stron�.
    AI_Output (self, other ,"DIA_Rodriguez_ImportantQuest_03_09"); //Niestety nie mog� ci da� �adnej broni. Powiniene� j� raczej kupi� u kowala.
    AI_Output (other, self ,"DIA_Rodriguez_ImportantQuest_15_10"); //My�l�, �e te zwoje wystarcz�.
	AI_Output (self, other ,"DIA_Rodriguez_ImportantQuest_03_11"); //Powodzenia! Niech Innos ma was w opiece!
    CreateInvItems (self, ItArScrollFirestorm, 3);
    B_GiveInvItems (self, other, ItArScrollFirestorm, 3);
    CreateInvItems (self, ItArScrollFireball, 5);
    B_GiveInvItems (self, other, ItArScrollFireball, 5);
    CreateInvItems (self, ItArScrollHeal, 2);
    B_GiveInvItems (self, other, ItArScrollHeal, 2);

    B_LogEntry                     (CH3_QuestForHeavyArmor,"Otrzyma�em od Rodrigueza sporo przydatnych zwoj�w. Razem z oddzia�em Moroka mamy zniszczy� wszystko, co znajduje si� w �wi�tyni.");

    //B_GiveXP (250);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DIALOG_START
//========================================

INSTANCE DIA_Rodriguez_DIALOG_START (C_INFO)
{
   npc          = KDF_400_Rodriguez;
   nr           = 1;
   condition    = DIA_Rodriguez_DIALOG_START_Condition;
   information  = DIA_Rodriguez_DIALOG_START_Info;
   permanent	= FALSE;
   description	= "Witaj, magu!";
};

FUNC INT DIA_Rodriguez_DIALOG_START_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Rodriguez_DIALOG_START_Info()
{
    AI_Output (other, self ,"DIA_Rodriguez_DIALOG_START_15_01"); //Witaj, magu!
    AI_Output (self, other ,"DIA_Rodriguez_DIALOG_START_03_02"); //Innos z tob�, bracie. Jestem Rodriguez, Mag Ognia.
	AI_Output (self, other ,"DIA_Rodriguez_DIALOG_START_03_03"); //Zajmuj� si� wszystkim, co zwi�zane z walk� wr�cz. Poszerzam wiedz� Mag�w i naszych kurier�w na temat walki kosturem. 
};

//========================================
//-----------------> SECOND
//========================================

INSTANCE DIA_Rodriguez_SECOND (C_INFO)
{
   npc          = KDF_400_Rodriguez;
   nr           = 2;
   condition    = DIA_Rodriguez_SECOND_Condition;
   information  = DIA_Rodriguez_SECOND_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o Magach Ognia?";
};

FUNC INT DIA_Rodriguez_SECOND_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rodriguez_DIALOG_START))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rodriguez_SECOND_Info()
{
    AI_Output (other, self ,"DIA_Rodriguez_SECOND_15_01"); //Co mo�esz mi powiedzie� o Magach Ognia?
    AI_Output (self, other ,"DIA_Rodriguez_SECOND_03_02"); //S�u�ymy Innosowi. Pan Ognia i sprawiedliwo�ci daje nam si�� w pokonywaniu przeciwno�ci losu.
    AI_Output (self, other ,"DIA_Rodriguez_SECOND_03_03"); //Jeste�my najbardziej rozpowszechnionym zakonem Mag�w na �wiecie. W przeciwie�stwie do Mag�w Wody, czy Czarnych Mag�w, posiadamy liczne klasztory.
    AI_Output (self, other ,"DIA_Rodriguez_SECOND_03_04"); //Naszymi wojownikami s� m�ni paladyni, kt�rzy walcz� ze z�em z imieniem Pana Ognia na ustach.
    AI_Output (other, self ,"DIA_Rodriguez_SECOND_15_05"); //Paladyni? 
    AI_Output (self, other ,"DIA_Rodriguez_SECOND_03_06"); //Tak, paladyni! S�u�� wiernie kr�lowi Rhobarowi na kontynencie. Ich dow�dca to Lord Etienne. najm�niejszy wojownik Innosa. Tu, w Khorinis, raczej ich nie spotkasz, twierdze zakonu znajduj� si� w Myrtanie. 
    AI_Output (other, self ,"DIA_Rodriguez_SECOND_15_07"); //Rozumiem.
};

//***********************************************
//				Give me Staff 
//***********************************************

instance  DIA_Rodriguez_FirstStaff (C_INFO)
{
	npc			=  KDF_400_Rodriguez;
	nr			=  1;
	condition	=  DIA_Rodriguez_FirstStaff_Condition;
	information	=  DIA_Rodriguez_FirstStaff_Info;
	permanent	=  0;
	description =  "Potrzebuj� kostura.";
};                       

FUNC int  DIA_Rodriguez_FirstStaff_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Rodriguez_FirstStaff_Info()
{
	AI_Output (other, self,"DIA_Rodriguez_FirstStaff_15_00"); //Potrzebuj� kostura. Corristo przyj�� mnie w poczet Mag�w Ognia.
	AI_Output (self, other,"DIA_Rodriguez_FirstStaff_12_01"); //Dokona�e� wielkich czyn�w i zas�ugujesz na miano Maga. Oto tw�j pierwszy kostur. Je�li b�dziesz chcia�, za drobn� op�at� przyst�pimy do konsekracji. 
	AI_Output (self, other,"DIA_Rodriguez_FirstStaff_12_02"); //Konsekracja pozwoli na wydobycie mocy z kryszta�u osadzonego w broni. B�dzie on razi� p�omieniami Innosa twoich wrog�w. 
	CreateInvItems (self, ItMw_2H_Staff_FireMage_01,1);
	B_GiveInvItems (self,other, ItMw_2H_Staff_FireMage_01,1);
	Log_CreateTopic	(OtherInfos,	LOG_NOTE);
	B_LogEntry		(OtherInfos,	"Mag Ognia Rodriguez mo�e konsekrowa� m�j kostur, oraz wyda� mi lepszy, gdy b�d� got�w.");
};

//***********************************************
//				Give me Staff 2
//***********************************************

instance  DIA_Rodriguez_SecondStaff (C_INFO)
{
	npc			=  KDF_400_Rodriguez;
	nr			=  1;
	condition	=  DIA_Rodriguez_SecondStaff_Condition;
	information	=  DIA_Rodriguez_SecondStaff_Info;
	permanent	=  0;
	description =  "Potrzebuj� lepszego kostura.";
};                       

FUNC int  DIA_Rodriguez_SecondStaff_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_KDF) && (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 3)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Rodriguez_SecondStaff_Info()
{
	AI_Output (other, self,"DIA_Rodriguez_SecondStaff_15_00"); //Potrzebuj� lepszego kostura. Corristo wtajemniczy� mnie w trzeci kr�g.
	AI_Output (self, other,"DIA_Rodriguez_SecondStaff_12_01"); //Trzeci kr�g to ju� powa�ne wtajemniczenie. Z pewno�ci� zapozna�e� si� ju� z kul� ognia. To niezwykle pot�ne zakl�cie. 
	AI_Output (self, other,"DIA_Rodriguez_SecondStaff_12_02"); //Niekt�rzy nazywaj� je symbolem Mag�w Ognia, a to dlatego, �e cz�sto z niego korzystamy. C�, w wielu wypadkach jest skuteczne.
	AI_Output (self, other,"DIA_Rodriguez_SecondStaff_12_03"); //A wracaj�c do kostura. Oto on. Kostur Maga Ognia. Mo�esz go ulepszy�, a p�niej konsekrowa�. 
	AI_Output (self, other,"DIA_Rodriguez_SecondStaff_12_04"); //Zwi�kszy to jego moc, ale i wymagania wobec ciebie. Pami�taj o tym. 
	
	CreateInvItems (self, ItMw_2H_Staff_FireMage_03,1);
	B_GiveInvItems (self,other, ItMw_2H_Staff_FireMage_03,1);
};

//***********************************************
//				Konsekracja
//***********************************************

instance  DIA_Rodriguez_Konsekracja (C_INFO)
{
	npc			=  KDF_400_Rodriguez;
	nr			=  1;
	condition	=  DIA_Rodriguez_Konsekracja_Condition;
	information	=  DIA_Rodriguez_Konsekracja_Info;
	permanent	=  1;
	description =  "Konsekrujmy m�j kostur.";
};                       

FUNC int  DIA_Rodriguez_Konsekracja_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_KDF) && Npc_KnowsInfo (hero, DIA_Rodriguez_FirstStaff)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Rodriguez_Konsekracja_Info()
{
	AI_Output (other, self,"DIA_Rodriguez_Konsekracja_15_00"); //Konsekrujmy m�j kostur.
	AI_Output (self, other,"DIA_Rodriguez_Konsekracja_12_01"); //Pami�taj, �e po konsekracji wzrosn� wymagania kostura. B�dziesz musia� posiada� wi�ksz� moc magiczn� i si��.
	Info_ClearChoices	(DIA_Rodriguez_Konsekracja);
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_01)
	{
    Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Konsekruj podstawowy kostur (500 bry�ek rudy, wzrost wym. mana: 35, obra�enia: 45 + 3 od ognia)", DIA_Rodriguez_Konsekracja_01); 
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_03)
	{
    Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Wzmocnij kostur Maga Ognia(750 bry�ek rudy, wzrost wym. mana: 50, si�a: 35 obra�enia: 55 + 5 od ognia)", DIA_Rodriguez_Konsekracja_02);
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_04)
	{
	Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Konsekruj kostur Maga Ognia(1500 bry�ek rudy, wzrost wym. mana: 60, si�a: 45 obra�enia: 60 + 8 od ognia)", DIA_Rodriguez_Konsekracja_03);
	};
};

func void DIA_Rodriguez_Konsekracja_01 ()
{
if (Npc_HasItems(other,itminugget) >= 500)
{
B_GiveInvItems (hero, self, ItMw_2H_Staff_FireMage_01,1);
B_GiveInvItems (hero, self, itminugget,500);
CreateInvItems (self, ItMw_2H_Staff_FireMage_02,1);
B_GiveInvItems (self, hero, ItMw_2H_Staff_FireMage_02,1);
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon1"); //Innosie, przelej cz�� swej boskiej mocy do tego magicznego kryszta�u. Niech twe p�omienie ra�� twoich wrog�w.
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon2"); //Niech ten Mag kroczy �cie�k� twojego �wiat�a i niechaj spogl�daj�c na tw�j �wi�ty kostur zawsze wie, jak� decyzj� podj��. 
}
else
{
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon_NoOre"); //Konsekracja wymaga z�o�enia wspomo�enia ko�cio�a Innosa darem. 
};
Info_ClearChoices	(DIA_Rodriguez_Konsekracja);
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_01)
	{
    Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Konsekruj podstawowy kostur (500 bry�ek rudy, wzrost wym. mana: 35, obra�enia: 45 + 3 od ognia)", DIA_Rodriguez_Konsekracja_01); 
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_03)
	{
    Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Wzmocnij kostur Maga Ognia(750 bry�ek rudy, wzrost wym. mana: 50, si�a: 35 obra�enia: 55 + 5 od ognia)", DIA_Rodriguez_Konsekracja_02);
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_04)
	{
	Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Konsekruj kostur Maga Ognia(1500 bry�ek rudy, wzrost wym. mana: 60, si�a: 45 obra�enia: 60 + 8 od ognia)", DIA_Rodriguez_Konsekracja_03);
	};
};

func void DIA_Rodriguez_Konsekracja_02 ()
{
if (Npc_HasItems(other,itminugget) >= 750)
{
B_GiveInvItems (hero, self, ItMw_2H_Staff_FireMage_03,1);
B_GiveInvItems (hero, self, itminugget,750);
CreateInvItems (self, ItMw_2H_Staff_FireMage_04,1);
B_GiveInvItems (self, hero, ItMw_2H_Staff_FireMage_04,1);
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon1"); //Innosie, przelej cz�� swej boskiej mocy do tego magicznego kryszta�u. Niech twe p�omienie ra�� twoich wrog�w.
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon2"); //Niech ten Mag kroczy �cie�k� twojego �wiat�a i niechaj spogl�daj�c na tw�j �wi�ty kostur zawsze wie, jak� decyzj� podj��. 
}
else
{
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon_NoOre"); //Konsekracja wymaga z�o�enia wspomo�enia ko�cio�a Innosa darem. 
};
Info_ClearChoices	(DIA_Rodriguez_Konsekracja);
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_01)
	{
    Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Konsekruj podstawowy kostur (500 bry�ek rudy, wzrost wym. mana: 35, obra�enia: 45 + 3 od ognia)", DIA_Rodriguez_Konsekracja_01); 
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_03)
	{
    Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Wzmocnij kostur Maga Ognia(750 bry�ek rudy, wzrost wym. mana: 50, si�a: 35 obra�enia: 55 + 5 od ognia)", DIA_Rodriguez_Konsekracja_02);
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_04)
	{
	Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Konsekruj kostur Maga Ognia(1500 bry�ek rudy, wzrost wym. mana: 60, si�a: 45 obra�enia: 60 + 8 od ognia)", DIA_Rodriguez_Konsekracja_03);
	};
};

func void DIA_Rodriguez_Konsekracja_03 ()
{
if (Npc_HasItems(other,itminugget) >= 1500)
{
B_GiveInvItems (hero, self, ItMw_2H_Staff_FireMage_04,1);
B_GiveInvItems (hero, self, itminugget,1500);
CreateInvItems (self, ItMw_2H_Staff_FireMage_05,1);
B_GiveInvItems (self, hero, ItMw_2H_Staff_FireMage_05,1);
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon1"); //Innosie, przelej cz�� swej boskiej mocy do tego magicznego kryszta�u. Niech twe p�omienie ra�� twoich wrog�w.
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon2"); //Niech ten Mag kroczy �cie�k� twojego �wiat�a i niechaj spogl�daj�c na tw�j �wi�ty kostur zawsze wie, jak� decyzj� podj��. 
}
else
{
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon_NoOre"); //Konsekracja wymaga z�o�enia wspomo�enia ko�cio�a Innosa darem. 
};
Info_ClearChoices	(DIA_Rodriguez_Konsekracja);
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_01)
	{
    Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Konsekruj podstawowy kostur (500 bry�ek rudy, wzrost wym. mana: 35, obra�enia: 45 + 3 od ognia)", DIA_Rodriguez_Konsekracja_01); 
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_03)
	{
    Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Wzmocnij kostur Maga Ognia(750 bry�ek rudy, wzrost wym. mana: 50, si�a: 35 obra�enia: 55 + 5 od ognia)", DIA_Rodriguez_Konsekracja_02);
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_04)
	{
	Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Konsekruj kostur Maga Ognia(1500 bry�ek rudy, wzrost wym. mana: 60, si�a: 45 obra�enia: 60 + 8 od ognia)", DIA_Rodriguez_Konsekracja_03);
	};
};