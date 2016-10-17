// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Senyan_EXIT(C_INFO)
{
	npc			= SFB_1000_Senyan;
	nr			= 999;
	condition	= DIA_Senyan_EXIT_Condition;
	information	= DIA_Senyan_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Senyan_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Senyan_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_Senyan_Hello(C_INFO)
{
	npc			= SFB_1000_Senyan;
	nr			= 1;
	condition	= DIA_Senyan_Hello_Condition;
	information	= DIA_Senyan_Hello_Info;
	permanent	= 0;
	description = "Przybywasz z Wolnej Kopalni, tak?";
};                       

FUNC INT DIA_Senyan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Senyan_Hello_Info()
{	
	AI_Output (other, self,"DIA_Senyan_Hello_15_00"); //Przybywasz z Wolnej Kopalni, tak?
	AI_Output (self, other,"DIA_Senyan_Hello_01_01"); //Tak. Sk¹d wiesz?
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_Senyan_JustTalk(C_INFO)
{
	npc			= SFB_1000_Senyan;
	nr			= 1;
	condition	= DIA_Senyan_JustTalk_Condition;
	information	= DIA_Senyan_JustTalk_Info;
	permanent	= 1;
	description = "Chcê z tob¹ chwilê porozmawiaæ.";
};                       

FUNC INT DIA_Senyan_JustTalk_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Senyan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Senyan_JustTalk_Info()
{	
	AI_Output (other, self,"DIA_Senyan_JustTalk_15_00"); //Chcê z tob¹ chwilê porozmawiaæ.
	AI_Output (self, other,"DIA_Senyan_JustTalk_01_01"); //Nie przyszed³em tutaj, ¿eby gadaæ.
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GOR_NA_LIN
//========================================

INSTANCE DIA_Senyan_GOR_NA_LIN (C_INFO)
{
   npc          = SFB_1000_Senyan;
   nr           = 1;
   condition    = DIA_Senyan_GOR_NA_LIN_Condition;
   information  = DIA_Senyan_GOR_NA_LIN_Info;
   permanent	= FALSE;
   description	= "Powiesz mi coœ o Gor Na Linie?";
};

FUNC INT DIA_Senyan_GOR_NA_LIN_Condition()
{
    if (!Npc_KnowsInfo (hero, DIA_Senyan_GoldMine))
    && (Npc_KnowsInfo (hero, DIA_GorNaLin_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Senyan_GOR_NA_LIN_Info()
{
    AI_Output (other, self ,"DIA_Senyan_GOR_NA_LIN_15_01"); //Powiesz mi coœ o Gor Na Linie?
    AI_Output (self, other ,"DIA_Senyan_GOR_NA_LIN_03_02"); //A co mnie on obchodzi? Daj mi spokój. Chcê siê napiæ.
    B_LogEntry                     (CH2_MissedSpy,"Senyan raczej nie jest chêtny do rozmowy. Mo¿e uda mi siê go jakoœ przekonaæ.");
};


//========================================
//-----------------> ALCO
//========================================

INSTANCE DIA_Senyan_ALCO (C_INFO)
{
   npc          = SFB_1000_Senyan;
   nr           = 1;
   condition    = DIA_Senyan_ALCO_Condition;
   information  = DIA_Senyan_ALCO_Info;
   permanent	= true;
   description	= "Nie ma sprawy! Ja stawiam. ";
};

FUNC INT DIA_Senyan_ALCO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Senyan_GOR_NA_LIN))
    && (MIS_MissedSpy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Senyan_ALCO_Info()
{
    AI_Output (other, self ,"DIA_Senyan_ALCO_15_01"); //Nie ma sprawy! Ja stawiam. 
    AI_Output (self, other ,"DIA_Senyan_ALCO_03_02"); //A co masz dobrego?

    Info_ClearChoices		(DIA_Senyan_ALCO);
    Info_AddChoice		(DIA_Senyan_ALCO, DIALOG_BACK, DIA_Senyan_ALCO_BACK);
	if (Npc_HasItems (other, ItFoWine) >=1)
	{
    Info_AddChoice		(DIA_Senyan_ALCO, "Mo¿e winko?", DIA_Senyan_ALCO_WINO);
	};	
	if (Npc_HasItems (other, ItFoBeer) >=1)
	{
    Info_AddChoice		(DIA_Senyan_ALCO, "Napijmy siê zwyk³ego piwa.", DIA_Senyan_ALCO_PIWO);
	};
	if (Npc_HasItems (other, ItFoNalewkaApple) >=1) 
	{
    Info_AddChoice		(DIA_Senyan_ALCO, "Mam tutaj nalewkê jab³kow¹.", DIA_Senyan_ALCO_NALEWKI);
	};
	if (Npc_HasItems (other, ItFoBimber) >=1) 
	{
    Info_AddChoice		(DIA_Senyan_ALCO, "Napijmy siê bimbru.", DIA_Senyan_ALCO_BIMBER);
	};
	if (Npc_HasItems (other, ItFoCiosSztyletu) >=1) 
	{
    Info_AddChoice		(DIA_Senyan_ALCO, "Mam coœ mocniejszego (Zaproponuj Cios sztyletu).", DIA_Senyan_ALCO_CIOS);
	};
};

FUNC VOID DIA_Senyan_ALCO_BACK()
{
    Info_ClearChoices		(DIA_Senyan_ALCO);
};

FUNC VOID DIA_Senyan_ALCO_WINO()
{
    AI_Output (other, self ,"DIA_Senyan_ALCO_WINO_15_01"); //Mo¿e winko?
    AI_Output (self, other ,"DIA_Senyan_ALCO_WINO_03_02"); //Winko? Jedyn¹ butelkê wina w okolicy widzia³em w chacie Laresa. Czy¿byœ okrad³ szefa?
    AI_Output (other, self ,"DIA_Senyan_ALCO_WINO_15_03"); //Ale¿ sk¹d.
    AI_Output (self, other ,"DIA_Senyan_ALCO_WINO_03_04"); //Nie wierzê ci. Nie chcê mieæ potem k³opotów. Masz coœ innego?
};

FUNC VOID DIA_Senyan_ALCO_PIWO()
{
    AI_Output (other, self ,"DIA_Senyan_ALCO_PIWO_15_01"); //Napijmy siê zwyk³ego piwa.
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_02"); //Ha! Stare dobre piwo. Rzygam ju¿ ry¿ówk¹. Dawaj.
    B_GiveInvItems (other, self, ItFoBeer, 1);
    AI_UseItem (self, ItFoBeer);
	upojenie_senyan = 0;
	upojenie_senyan = upojenie_senyan + 1;
	if (Npc_HasItems (other, ItFoBeer) >=1)
	{
    B_GiveInvItems (other, self, ItFoBeer, 1);
	CreateInvItems (self,ItFoBeer,3);
    AI_UseItem (self, ItFoBeer);	
	upojenie_senyan = upojenie_senyan + 1;
	
	}
	else
	{
//	 AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_03"); //Ju¿ nie masz? Nawet nie zd¹¿y³em siê upiæ. He he. 
	 DIA_Senyan_ALCO.permanent = 1;
	};
	
	if (Npc_HasItems (other, ItFoBeer) >=1)
	{
    B_GiveInvItems (other, self, ItFoBeer, 1);
    AI_UseItem (self, ItFoBeer);	
	upojenie_senyan = upojenie_senyan + 1;
	}
	else
	{
//	 AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_03"); //Ju¿ nie masz? Nawet nie zd¹¿y³em siê upiæ. He he. 
	 DIA_Senyan_ALCO.permanent = 1;
	};
	if (Npc_HasItems (other, ItFoBeer) >=1)
	{
    B_GiveInvItems (other, self, ItFoBeer, 1);
    AI_UseItem (self, ItFoBeer);	
	upojenie_senyan = upojenie_senyan + 1;
	}	else
	{
	// AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_03"); //Ju¿ nie masz? Nawet nie zd¹¿y³em siê upiæ. He he. 
	 DIA_Senyan_ALCO.permanent = 1;
	};
	if (Npc_HasItems (other, ItFoBeer) >=1)
	{
    B_GiveInvItems (other, self, ItFoBeer, 1);
    AI_UseItem (self, ItFoBeer);	
	upojenie_senyan = upojenie_senyan + 1;
	}	else
	{
	 AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_03"); //Ju¿ nie masz? Nawet nie zd¹¿y³em siê upiæ. He he. 
	 DIA_Senyan_ALCO.permanent = 1;
	 
	};
	/*
	if (Npc_HasItems (other, ItFoBeer) >=1)
	{
    B_GiveInvItems (other, self, ItFoBeer, 1);
    AI_UseItem (self, ItFoBeer);	
	upojenie_senyan = upojenie_senyan + 1;
	}	else
	{
	 AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_03"); //Ju¿ nie masz? Nawet nie zd¹¿y³em siê upiæ. He he. 
	};
	if (Npc_HasItems (other, ItFoBeer) >=1)
	{
    B_GiveInvItems (other, self, ItFoBeer, 1);
    AI_UseItem (self, ItFoBeer);	
	upojenie_senyan = upojenie_senyan + 1;
	}else
	{
	 AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_03"); //Ju¿ nie masz? Nawet nie zd¹¿y³em siê upiæ. He he. 
	};*/
	if upojenie_senyan >= 3
	{
	AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_05"); //Uch... Ju¿ wystarczy. 
    AI_Output (other,self ,"DIA_Senyan_ALCO_PIWO_03_06"); //Powiesz mi coœ o tym Gor Na Linie.
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_07"); //Goœæ przyszed³ tu kilka tygodni temu...
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_08"); //Krêci³ siê w okolicy, du¿o gada³ z ludŸmi.
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_09"); //Hip... Przepraszam... Hyp... Ups. Przepraszam.
    AI_Output (other, self ,"DIA_Senyan_ALCO_PIWO_15_10"); //Spokojnie. Mów dalej.
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_11"); //No i jak ten goœæ tu przyszed³... hip...
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_12"); //Na czym to ja...? Hip...
    AI_Output (other, self ,"DIA_Senyan_ALCO_PIWO_15_13"); //Przyszed³ do Obozu, gada³ z ludŸmi... Co dalej?
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_14"); //Aha! No i wtedy ten... nooo... zakumplowa³ siê z ludŸmi Laresa. Hip... Znaczy no ten... na ry¿ówkê go zawo³ali.
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_15"); //I tak co dzieñ. Goœciowi siê chyba... hip... spodoba³o.
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_16"); //He he. Potem wiesz... noo... kazali mu pobiæ tego, no, Bustera. Goœæ dosta³ nieŸle w pysk. Hip...
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_17"); //Butch nieŸle siê wkurzy³... i ten... posz...przyje... a, wiem... pobi³ tego, noo... Okonia... nie, nie... Lina albo Karpia.
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_18"); //Potem wziêli go i wytarzali w b³ocie... he he... wygl¹da³ jak dzika œwinia. Ha ha...
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_19"); //A i zabrali mu pancerz. Chyba sprzedali komuœ. Hip...
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_20"); //Potem ju¿ siê do niego nie odzy... hip... nie odzywali.
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_21"); //Sam pije wódeczkê... skurczybyk jeden! Ha ha!
    AI_Output (other, self ,"DIA_Senyan_ALCO_PIWO_15_22"); //Wiesz sk¹d bierze "wódeczkê"?
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_23"); //Ja... ee... tego to ju¿ nie. Mazin mu coœ tam gada³, gdzie wódeczki szukaæ, bo Silas to go ma w samej dupie. He he. 
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_24"); //Zarzyga³ mu pó³ pod³ogi skurwiel... hip... ma szczêœcie, ¿e mu zostaæ pozwoli³, ale bêcki niez³e zebra³.
    AI_Output (other, self ,"DIA_Senyan_ALCO_PIWO_15_25"); //Dziêki za informacje.
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_26"); //Dziêki za piwko, przyjacielu. 
	B_LogEntry                     (CH2_MissedSpy,"Z trudem uda³o mi siê wyci¹gn¹æ informacje od pijanego jak bela Senyana.  Okazuje siê, ¿e Gor Na Lin za bardzo spoufali³ siê z ludŸmi Laresa. Szkodniki zabra³y mu pancerz i pewnie resztê ekwipunku. Stra¿nik zacz¹³ piæ samotnie. Niestety kret nie wie, sk¹d Lin bierze alkohol. Coœ wiêcej ma mi powiedzieæ Mazin. ");
	DIA_Senyan_ALCO.permanent = 0;
	b_givexp (75);
	Info_ClearChoices		(DIA_Senyan_ALCO);
    AI_StopProcessInfos	(self);
	};
};

FUNC VOID DIA_Senyan_ALCO_NALEWKI()
{
    AI_Output (other, self ,"DIA_Senyan_ALCO_NALEWKI_15_01"); //Mam tutaj nalewki.
    AI_Output (self, other ,"DIA_Senyan_ALCO_NALEWKI_03_02"); //Takiego alkoholu jeszcze nie pi³em. 
    AI_Output (self, other ,"DIA_Senyan_ALCO_NALEWKI_03_03"); //Mo¿emy siê napiæ.
	 B_GiveInvItems (other, self, ItFoNalewkaApple, 1);
    AI_UseItem (self, ItFoNalewkaApple);
	upojenie_senyan = 0;
	upojenie_senyan = upojenie_senyan + 1;
	if (Npc_HasItems (other, ItFoNalewkaApple) >=1)
	{
    B_GiveInvItems (other, self, ItFoNalewkaApple, 1);
    AI_UseItem (self, ItFoNalewkaApple);	
	upojenie_senyan = upojenie_senyan + 1;
	}
	else
	{
	 AI_Output (self, other ,"DIA_Senyan_ALCO_NALEWKI_03_03"); //Ju¿ nie masz? Nawet nie zd¹¿y³em siê upiæ. He he. 
	 DIA_Senyan_ALCO.permanent = 1;
	};
	if (Npc_HasItems (other, ItFoNalewkaApple) >=1)
	{
    B_GiveInvItems (other, self, ItFoNalewkaApple, 1);
    AI_UseItem (self, ItFoNalewkaApple);	
	upojenie_senyan = upojenie_senyan + 1;
	}
	else
	{
	 AI_Output (self, other ,"DIA_Senyan_ALCO_NALEWKI_03_03"); //Ju¿ nie masz? Nawet nie zd¹¿y³em siê upiæ. He he. 
	 DIA_Senyan_ALCO.permanent = 1;
	};
	if (Npc_HasItems (other, ItFoNalewkaApple) >=1)
	{
    B_GiveInvItems (other, self, ItFoNalewkaApple, 1);
    AI_UseItem (self, ItFoNalewkaApple);	
	upojenie_senyan = upojenie_senyan + 1;
	}	else
	{
	 AI_Output (self, other ,"DIA_Senyan_ALCO_NALEWKI_03_03"); //Ju¿ nie masz? Nawet nie zd¹¿y³em siê upiæ. He he. 
	 DIA_Senyan_ALCO.permanent = 1;
	};
	
if upojenie_senyan >= 4
	{
	AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_05"); //Uch... Ju¿ wystarczy. 
    AI_Output (other,self ,"DIA_Senyan_ALCO_PIWO_03_06"); //Powiesz mi coœ o tym Gor Na Linie.
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_07"); //Goœæ przyszed³ tu kilka tygodni temu...
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_08"); //Krêci³ siê w okolicy, du¿o gada³ z ludŸmi.
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_09"); //Hip... Przepraszam... Hyp... Ups. Przepraszam.
    AI_Output (other, self ,"DIA_Senyan_ALCO_PIWO_15_10"); //Spokojnie. Mów dalej.
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_11"); //No i jak ten goœæ tu przyszed³... hip...
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_12"); //Na czym to ja...? Hip...
    AI_Output (other, self ,"DIA_Senyan_ALCO_PIWO_15_13"); //Przyszed³ do Obozu, gada³ z ludŸmi... Co dalej?
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_14"); //Aha! No i wtedy ten... nooo... zakumplowa³ siê z ludŸmi Laresa. Hip... Znaczy no ten... na ry¿ówkê go zawo³ali.
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_15"); //I tak co dzieñ. Goœciowi siê chyba... hip... spodoba³o.
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_16"); //He he. Potem wiesz... noo... kazali mu pobiæ tego, no, Bustera. Goœæ dosta³ nieŸle w pysk. Hip...
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_17"); //Butch nieŸle siê wkurzy³... i ten... posz...przyje... a, wiem... pobi³ tego, noo... Okonia... nie, nie... Lina albo Karpia.
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_18"); //Potem wziêli go i wytarzali w b³ocie... he he... wygl¹da³ jak dzika œwinia. Ha ha...
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_19"); //A i zabrali mu pancerz. Chyba sprzedali komuœ. Hip...
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_20"); //Potem ju¿ siê do niego nie odzy... hip... nie odzywali.
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_21"); //Sam pije wódeczkê... skurczybyk jeden! Ha ha!
    AI_Output (other, self ,"DIA_Senyan_ALCO_PIWO_15_22"); //Wiesz sk¹d bierze "wódeczkê"?
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_23"); //Ja... ee... tego to ju¿ nie. Mazin mu coœ tam gada³, gdzie wódeczki szukaæ, bo Silas to go ma w samej dupie. He he. 
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_24"); //Zarzyga³ mu pó³ pod³ogi skurwiel... hip... ma szczêœcie, ¿e mu zostaæ pozwoli³, ale bêcki niez³e zebra³.

    AI_Output (other, self ,"DIA_Senyan_ALCO_PIWO_15_25"); //Dziêki za informacje.
    AI_Output (self, other ,"DIA_Senyan_ALCO_PIWO_03_26"); //Dziêki za nale...naleœniki... Nie, nie. Dziêki za nalewki... hip...
	    B_LogEntry                     (CH2_MissedSpy,"Z trudem uda³o mi siê wyci¹gn¹æ informacje od pijanego jak bela Senyana. Okazuje siê, ¿e Gor Na Lin za bardzo spoufali³ siê z ludŸmi Laresa. Szkodniki zabra³y mu pancerz i pewnie resztê ekwipunku. Stra¿nik zacz¹³ piæ samotnie. Niestety Kret nie wie, sk¹d Lin bierze alkohol. Coœ wiêcej ma mi powiedzieæ Mazin. ");
DIA_Senyan_ALCO.permanent = 0;
    B_GiveXP (100);
	    Info_ClearChoices		(DIA_Senyan_ALCO);
    AI_StopProcessInfos	(self);
	};
};

FUNC VOID DIA_Senyan_ALCO_BIMBER()
{
    AI_Output (other, self ,"DIA_Senyan_ALCO_BIMBER_15_01"); //Napijmy siê bimbru.
    AI_Output (self, other ,"DIA_Senyan_ALCO_BIMBER_03_02"); //O nie! Ostatnio jak poczêstowa³em siê bimbrem jednego ze Szkodników...
    AI_Output (self, other ,"DIA_Senyan_ALCO_BIMBER_03_03"); //Cholera do tej pory nie wiem co robi³em rankiem go³y na œrodku jeziora.
    AI_Output (other, self ,"DIA_Senyan_ALCO_BIMBER_15_04"); //No dobrze...
};

FUNC VOID DIA_Senyan_ALCO_CIOS()
{
    AI_Output (other, self ,"DIA_Senyan_ALCO_CIOS_15_01"); //Mam coœ mocniejszego...
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_02"); //Bimber?
    AI_Output (other, self ,"DIA_Senyan_ALCO_CIOS_15_03"); //Nie. To naprawdê wyrafinowany alkohol. 
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_04"); //No dobra. Spróbujmy. 
    B_GiveInvItems (other, self, ItFoCiosSztyletu, 1);
    AI_UseItem (self, ItFoCiosSztyletu);
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_05"); //Cholera. Jakie mocne.
    AI_Output (other,self ,"DIA_Senyan_ALCO_CIOS_03_06"); //Powiesz mi coœ o tym Gor Na Linie.
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_07"); //Goœæ przyszed³ tu kilka tygodni temu...
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_08"); //Krêci³ siê w okolicy, du¿o gada³ z ludŸmi.
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_09"); //Hip... Przepraszam... Hyp... Ups. Przepraszam.
    AI_Output (other, self ,"DIA_Senyan_ALCO_CIOS_15_10"); //Spokojnie. Mów dalej.
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_11"); //No i jak ten goœæ tu przyszed³... hip...
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_12"); //Na czym to ja...? Hip...
    AI_Output (other, self ,"DIA_Senyan_ALCO_CIOS_15_13"); //Przyszed³ do obozu, gada³ z ludŸmi... Co dalej?
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_14"); //Aha! No i wtedy ten... nooo... zakumplowa³ siê z ludŸmi Laresa. Hip... Znaczy no ten... na ry¿ówkê go zawo³ali.
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_15"); //I tak co dzieñ. Goœciowy siê chyba... hip... spodoba³o.
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_16"); //He he. Potem wiesz... noo... kazali mu pobiæ tego, no, Bustera. Goœæ dosta³ nieŸle w pysk. Hip...
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_17"); //Butch nieŸle siê wkurzy³... i ten... posz...przyje... a, wiem... pobi³ tego, noo... Okonia... nie, nie... Lina albo Karpia.
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_18"); //Potem wziêli go i wytarzali w b³ocie... he he... wygl¹da³ jak dzika œwinia. Ha ha...
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_19"); //A i zabrali mu pancerz. Chyba sprzedali komuœ. Hip...
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_20"); //Potem ju¿ siê do niego nie odzy... hip... nie odzywali.
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_21"); //Sam pije wódeczkê... skurczybyk jeden! Ha ha!
    AI_Output (other, self ,"DIA_Senyan_ALCO_CIOS_15_22"); //Wiesz sk¹d bierze "wódeczkê"?
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_23"); //Ja... ee... tego to ju¿ nie. Mazin mu coœ tam gada³, gdzie wódeczki szukaæ, bo Silas to go ma w samej dupie. He he. 
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_24"); //Zarzyga³ mu pó³ pod³ogi skurwiel... hip... ma szczêœcie, ¿e mu zostaæ pozwoli³, ale bêcki niez³e zebra³.

    AI_Output (other, self ,"DIA_Senyan_ALCO_CIOS_15_25"); //Dziêki za informacje.
    AI_Output (self, other ,"DIA_Senyan_ALCO_CIOS_03_26"); //Dziêki za wódeczkê brachu. 
	    B_LogEntry                     (CH2_MissedSpy,"Z trudem uda³o mi siê wyci¹gn¹æ informacje od pijanego jak bela Senyana.  Okazuje siê, ¿e Gor Na Lin za bardzo spoufali³ siê z ludŸmi Laresa. Szkodniki zabra³y mu pancerz i pewnie resztê ekwipunku. Stra¿nik zacz¹³ piæ samotnie. Niestety kret nie wie, sk¹d Lin bierze alkohol. Coœ wiêcej ma mi powiedzieæ Mazin. ");
DIA_Senyan_ALCO.permanent = 0;
    B_GiveXP (150);
    Info_ClearChoices		(DIA_Senyan_ALCO);
    AI_StopProcessInfos	(self);
};

// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> Surprised
//========================================

INSTANCE DIA_Senyan_Surprised (C_INFO)
{
   npc          = SFB_1000_Senyan;
   nr           = 1;
   condition    = DIA_Senyan_Surprised_Condition;
   information  = DIA_Senyan_Surprised_Info;
   permanent	= FALSE;
   description	= "Co ty tu robisz?";
};

FUNC INT DIA_Senyan_Surprised_Condition()
{
    if (Kapitel > 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Senyan_Surprised_Info()
{
    AI_Output (other, self ,"DIA_Senyan_Surprised_15_01"); //Co ty tu robisz?
    AI_Output (self, other ,"DIA_Senyan_Surprised_03_02"); //Wykorzystujê wielk¹ szansê! Spadaj!
    AI_StopProcessInfos (self);
};








//========================================
//-----------------> GoldMine
//========================================

INSTANCE DIA_Senyan_GoldMine (C_INFO)
{
   npc          = SFB_1000_Senyan;
   nr           = 1;
   condition    = DIA_Senyan_GoldMine_Condition;
   information  = DIA_Senyan_GoldMine_Info;
   permanent	= FALSE;
   description	= "Chcesz pracowaæ w kopalni z³ota?";
};

FUNC INT DIA_Senyan_GoldMine_Condition()
{
    if (MIS_KopalniaZlota == LOG_RUNNING) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Senyan_GoldMine_Info()
{
    AI_Output (other, self ,"DIA_Senyan_GoldMine_15_01"); //Chcesz pracowaæ w kopalni z³ota?
    AI_Output (self, other ,"DIA_Senyan_GoldMine_03_02"); //Kopalni z³ota powiadasz? A gdzie ona jest?
    AI_Output (other, self ,"DIA_Senyan_GoldMine_15_04"); //Nie mogê ci powiedzieæ, bo sam nie wiem.
    AI_Output (self, other ,"DIA_Senyan_GoldMine_03_05"); //Czegoœ tu nie rozumiem...
    AI_Output (other, self ,"DIA_Senyan_GoldMine_15_06"); //Spotykamy siê na górnym piêtrze karczmy na jeziorze. Will ci wszystko wyjaœni.
    AI_Output (self, other ,"DIA_Senyan_GoldMine_03_07"); //Dobra, zjawiê siê tam.
    B_LogEntry                     (CH1_KopalniaZlota,"Senyan przyjdzie na spotkanie do karczmy.");
	Npc_ExchangeRoutine (self, "karczma");
    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

