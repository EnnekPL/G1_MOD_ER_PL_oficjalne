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
//				Hallo und tschüß
//***********************************************

instance  DIA_Rodriguez_Hello (C_INFO)
{
	npc			=  KDF_400_Rodriguez;
	nr			=  1;
	condition	=  DIA_Rodriguez_Hello_Condition;
	information	=  DIA_Rodriguez_Hello_Info;
	permanent	=  0;
	description =  "Szukam Arcymistrza Magów Ognia!";
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
	AI_Output (other, self,"DIA_Rodriguez_Hello_15_00"); //Szukam Arcymistrza Magów Ognia!
	AI_Output (self, other,"DIA_Rodriguez_Hello_12_01"); //Zg³oœ siê do Miltena. On siê zajmuje kurierami.
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
    AI_Output (self, other ,"DIA_Rodriguez_ImportantQuest_03_01"); //PodejdŸ, Stra¿niku. Czy to nie ciebie wys³ano z misj¹ do obozu Moroka?
    AI_Output (other, self ,"DIA_Rodriguez_ImportantQuest_15_02"); //Tak, w³aœnie dlatego tu przyby³em.
    AI_Output (self, other ,"DIA_Rodriguez_ImportantQuest_03_03"); //Co siê tam dzieje? Jak wygl¹da sytuacja?
    AI_Output (self, other ,"DIA_Rodriguez_ImportantQuest_03_04"); //Mo¿liwe, ¿e nie wiesz, ale Gomez powierzy³ mi was wspieraæ.
    AI_Output (other, self ,"DIA_Rodriguez_ImportantQuest_15_05"); //Odkryliœmy, ¿e œwi¹tynia jest wykorzystywana do jakichœ orkowych rytua³ów.
    AI_Output (other, self ,"DIA_Rodriguez_ImportantQuest_15_06"); //Orkowie i ich szamani chyba sk³adaj¹ tam mod³y. Morok nie jest pewien jak powinien dalej post¹piæ.
    AI_Output (self, other ,"DIA_Rodriguez_ImportantQuest_03_07"); //To miejsce trzeba jak najszybciej zniszczyæ. Przeka¿ moje polecenia swojemu prze³o¿onemu.
    AI_Output (self, other ,"DIA_Rodriguez_ImportantQuest_03_08"); //A i weŸ te magiczne zwoje. Jeœli potrafisz je wykorzystaæ, przechyl¹ szalê zwyciêstwa na twoj¹ stronê.
    AI_Output (self, other ,"DIA_Rodriguez_ImportantQuest_03_09"); //Niestety nie mogê ci daæ ¿adnej broni. Powinieneœ j¹ raczej kupiæ u kowala.
    AI_Output (other, self ,"DIA_Rodriguez_ImportantQuest_15_10"); //Myœlê, ¿e te zwoje wystarcz¹.
	AI_Output (self, other ,"DIA_Rodriguez_ImportantQuest_03_11"); //Powodzenia! Niech Innos ma was w opiece!
    CreateInvItems (self, ItArScrollFirestorm, 3);
    B_GiveInvItems (self, other, ItArScrollFirestorm, 3);
    CreateInvItems (self, ItArScrollFireball, 5);
    B_GiveInvItems (self, other, ItArScrollFireball, 5);
    CreateInvItems (self, ItArScrollHeal, 2);
    B_GiveInvItems (self, other, ItArScrollHeal, 2);

    B_LogEntry                     (CH3_QuestForHeavyArmor,"Otrzyma³em od Rodrigueza sporo przydatnych zwojów. Razem z oddzia³em Moroka mamy zniszczyæ wszystko, co znajduje siê w œwi¹tyni.");

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
    AI_Output (self, other ,"DIA_Rodriguez_DIALOG_START_03_02"); //Innos z tob¹, bracie. Jestem Rodriguez, Mag Ognia.
	AI_Output (self, other ,"DIA_Rodriguez_DIALOG_START_03_03"); //Zajmujê siê wszystkim, co zwi¹zane z walk¹ wrêcz. Poszerzam wiedzê Magów i naszych kurierów na temat walki kosturem. 
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
   description	= "Co mo¿esz mi powiedzieæ o Magach Ognia?";
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
    AI_Output (other, self ,"DIA_Rodriguez_SECOND_15_01"); //Co mo¿esz mi powiedzieæ o Magach Ognia?
    AI_Output (self, other ,"DIA_Rodriguez_SECOND_03_02"); //S³u¿ymy Innosowi. Pan Ognia i sprawiedliwoœci daje nam si³ê w pokonywaniu przeciwnoœci losu.
    AI_Output (self, other ,"DIA_Rodriguez_SECOND_03_03"); //Jesteœmy najbardziej rozpowszechnionym zakonem Magów na œwiecie. W przeciwieñstwie do Magów Wody, czy Czarnych Magów, posiadamy liczne klasztory.
    AI_Output (self, other ,"DIA_Rodriguez_SECOND_03_04"); //Naszymi wojownikami s¹ mê¿ni paladyni, którzy walcz¹ ze z³em z imieniem Pana Ognia na ustach.
    AI_Output (other, self ,"DIA_Rodriguez_SECOND_15_05"); //Paladyni? 
    AI_Output (self, other ,"DIA_Rodriguez_SECOND_03_06"); //Tak, paladyni! S³u¿¹ wiernie królowi Rhobarowi na kontynencie. Ich dowódca to Lord Etienne. najmê¿niejszy wojownik Innosa. Tu, w Khorinis, raczej ich nie spotkasz, twierdze zakonu znajduj¹ siê w Myrtanie. 
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
	description =  "Potrzebujê kostura.";
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
	AI_Output (other, self,"DIA_Rodriguez_FirstStaff_15_00"); //Potrzebujê kostura. Corristo przyj¹³ mnie w poczet Magów Ognia.
	AI_Output (self, other,"DIA_Rodriguez_FirstStaff_12_01"); //Dokona³eœ wielkich czynów i zas³ugujesz na miano Maga. Oto twój pierwszy kostur. Jeœli bêdziesz chcia³, za drobn¹ op³at¹ przyst¹pimy do konsekracji. 
	AI_Output (self, other,"DIA_Rodriguez_FirstStaff_12_02"); //Konsekracja pozwoli na wydobycie mocy z kryszta³u osadzonego w broni. Bêdzie on razi³ p³omieniami Innosa twoich wrogów. 
	CreateInvItems (self, ItMw_2H_Staff_FireMage_01,1);
	B_GiveInvItems (self,other, ItMw_2H_Staff_FireMage_01,1);
	Log_CreateTopic	(OtherInfos,	LOG_NOTE);
	B_LogEntry		(OtherInfos,	"Mag Ognia Rodriguez mo¿e konsekrowaæ mój kostur, oraz wydaæ mi lepszy, gdy bêdê gotów.");
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
	description =  "Potrzebujê lepszego kostura.";
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
	AI_Output (other, self,"DIA_Rodriguez_SecondStaff_15_00"); //Potrzebujê lepszego kostura. Corristo wtajemniczy³ mnie w trzeci kr¹g.
	AI_Output (self, other,"DIA_Rodriguez_SecondStaff_12_01"); //Trzeci kr¹g to ju¿ powa¿ne wtajemniczenie. Z pewnoœci¹ zapozna³eœ siê ju¿ z kul¹ ognia. To niezwykle potê¿ne zaklêcie. 
	AI_Output (self, other,"DIA_Rodriguez_SecondStaff_12_02"); //Niektórzy nazywaj¹ je symbolem Magów Ognia, a to dlatego, ¿e czêsto z niego korzystamy. Có¿, w wielu wypadkach jest skuteczne.
	AI_Output (self, other,"DIA_Rodriguez_SecondStaff_12_03"); //A wracaj¹c do kostura. Oto on. Kostur Maga Ognia. Mo¿esz go ulepszyæ, a póŸniej konsekrowaæ. 
	AI_Output (self, other,"DIA_Rodriguez_SecondStaff_12_04"); //Zwiêkszy to jego moc, ale i wymagania wobec ciebie. Pamiêtaj o tym. 
	
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
	description =  "Konsekrujmy mój kostur.";
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
	AI_Output (other, self,"DIA_Rodriguez_Konsekracja_15_00"); //Konsekrujmy mój kostur.
	AI_Output (self, other,"DIA_Rodriguez_Konsekracja_12_01"); //Pamiêtaj, ¿e po konsekracji wzrosn¹ wymagania kostura. Bêdziesz musia³ posiadaæ wiêksz¹ moc magiczn¹ i si³ê.
	Info_ClearChoices	(DIA_Rodriguez_Konsekracja);
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_01)
	{
    Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Konsekruj podstawowy kostur (500 bry³ek rudy, wzrost wym. mana: 35, obra¿enia: 45 + 3 od ognia)", DIA_Rodriguez_Konsekracja_01); 
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_03)
	{
    Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Wzmocnij kostur Maga Ognia(750 bry³ek rudy, wzrost wym. mana: 50, si³a: 35 obra¿enia: 55 + 5 od ognia)", DIA_Rodriguez_Konsekracja_02);
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_04)
	{
	Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Konsekruj kostur Maga Ognia(1500 bry³ek rudy, wzrost wym. mana: 60, si³a: 45 obra¿enia: 60 + 8 od ognia)", DIA_Rodriguez_Konsekracja_03);
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
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon1"); //Innosie, przelej czêœæ swej boskiej mocy do tego magicznego kryszta³u. Niech twe p³omienie ra¿¹ twoich wrogów.
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon2"); //Niech ten Mag kroczy œcie¿k¹ twojego œwiat³a i niechaj spogl¹daj¹c na twój œwiêty kostur zawsze wie, jak¹ decyzjê podj¹æ. 
}
else
{
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon_NoOre"); //Konsekracja wymaga z³o¿enia wspomo¿enia koœcio³a Innosa darem. 
};
Info_ClearChoices	(DIA_Rodriguez_Konsekracja);
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_01)
	{
    Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Konsekruj podstawowy kostur (500 bry³ek rudy, wzrost wym. mana: 35, obra¿enia: 45 + 3 od ognia)", DIA_Rodriguez_Konsekracja_01); 
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_03)
	{
    Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Wzmocnij kostur Maga Ognia(750 bry³ek rudy, wzrost wym. mana: 50, si³a: 35 obra¿enia: 55 + 5 od ognia)", DIA_Rodriguez_Konsekracja_02);
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_04)
	{
	Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Konsekruj kostur Maga Ognia(1500 bry³ek rudy, wzrost wym. mana: 60, si³a: 45 obra¿enia: 60 + 8 od ognia)", DIA_Rodriguez_Konsekracja_03);
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
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon1"); //Innosie, przelej czêœæ swej boskiej mocy do tego magicznego kryszta³u. Niech twe p³omienie ra¿¹ twoich wrogów.
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon2"); //Niech ten Mag kroczy œcie¿k¹ twojego œwiat³a i niechaj spogl¹daj¹c na twój œwiêty kostur zawsze wie, jak¹ decyzjê podj¹æ. 
}
else
{
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon_NoOre"); //Konsekracja wymaga z³o¿enia wspomo¿enia koœcio³a Innosa darem. 
};
Info_ClearChoices	(DIA_Rodriguez_Konsekracja);
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_01)
	{
    Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Konsekruj podstawowy kostur (500 bry³ek rudy, wzrost wym. mana: 35, obra¿enia: 45 + 3 od ognia)", DIA_Rodriguez_Konsekracja_01); 
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_03)
	{
    Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Wzmocnij kostur Maga Ognia(750 bry³ek rudy, wzrost wym. mana: 50, si³a: 35 obra¿enia: 55 + 5 od ognia)", DIA_Rodriguez_Konsekracja_02);
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_04)
	{
	Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Konsekruj kostur Maga Ognia(1500 bry³ek rudy, wzrost wym. mana: 60, si³a: 45 obra¿enia: 60 + 8 od ognia)", DIA_Rodriguez_Konsekracja_03);
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
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon1"); //Innosie, przelej czêœæ swej boskiej mocy do tego magicznego kryszta³u. Niech twe p³omienie ra¿¹ twoich wrogów.
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon2"); //Niech ten Mag kroczy œcie¿k¹ twojego œwiat³a i niechaj spogl¹daj¹c na twój œwiêty kostur zawsze wie, jak¹ decyzjê podj¹æ. 
}
else
{
AI_Output (self, other,"DIA_Rodriguez_Konsekracja_Kon_NoOre"); //Konsekracja wymaga z³o¿enia wspomo¿enia koœcio³a Innosa darem. 
};
Info_ClearChoices	(DIA_Rodriguez_Konsekracja);
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_01)
	{
    Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Konsekruj podstawowy kostur (500 bry³ek rudy, wzrost wym. mana: 35, obra¿enia: 45 + 3 od ognia)", DIA_Rodriguez_Konsekracja_01); 
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_03)
	{
    Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Wzmocnij kostur Maga Ognia(750 bry³ek rudy, wzrost wym. mana: 50, si³a: 35 obra¿enia: 55 + 5 od ognia)", DIA_Rodriguez_Konsekracja_02);
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_FireMage_04)
	{
	Info_AddChoice		(DIA_Rodriguez_Konsekracja, "Konsekruj kostur Maga Ognia(1500 bry³ek rudy, wzrost wym. mana: 60, si³a: 45 obra¿enia: 60 + 8 od ognia)", DIA_Rodriguez_Konsekracja_03);
	};
};