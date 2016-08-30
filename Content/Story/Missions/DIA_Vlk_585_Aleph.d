//poprawione i sprawdzone - Nocturn

// ************************ EXIT **************************

instance  VLK_585_Aleph_Exit (C_INFO)
{
	npc			=  VLK_585_Aleph;
	nr			=  999;
	condition	=  VLK_585_Aleph_Exit_Condition;
	information	=  VLK_585_Aleph_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_585_Aleph_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_585_Aleph_Exit_Info()
{
	if	!Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH)
	{
		AI_Output (other, self,"VLK_585_Aleph_Exit_Info_15_01"); //Powodzenia!
		AI_Output (self, other,"VLK_585_Aleph_Exit_Info_05_02"); //C�, wiesz, gdzie mnie znale��.
	};
	
	AI_StopProcessInfos	( self );

};
// ***************** ALEPH IST EIN FAULPELZ *****************************
instance VLK_585_Aleph_CLEVER (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_CLEVER_Condition;
	information		= VLK_585_Aleph_CLEVER_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  VLK_585_Aleph_CLEVER_Condition()
{
	return 1;
};

func void  VLK_585_Aleph_CLEVER_Info()
{
	AI_Output (self,other,"VLK_585_Aleph_CLEVER_Info_05_01"); //He he he, Stra�nicy nigdy mnie nie z�api�!
};
// ***************** ALEPH ERKL�RT SEINE ARBEITSHALTUNG *****************************

instance  VLK_585_Aleph_GUARDS (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_GUARDS_Condition;
	information		= VLK_585_Aleph_GUARDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co masz na my�li?"; 
};

FUNC int  VLK_585_Aleph_GUARDS_Condition()
{	
	if Npc_KnowsInfo (hero,VLK_585_Aleph_CLEVER) && (kapitel < 4)
	{
		return 1;
	};
};

FUNC void  VLK_585_Aleph_GUARDS_Info()
{
	AI_Output (other, self,"VLK_585_Aleph_GUARDS_Info_15_01"); //Co masz na my�li?
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_02"); //Pracuj� tylko wtedy, gdy w pobli�u jest jaki� Stra�nik, kt�ry mo�e mnie zobaczy�. Poza tym tylko sobie odpoczywam.
	AI_Output (other, self,"VLK_585_Aleph_GUARDS_Info_15_03"); //I nie robi� si� podejrzliwi?
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_04"); //Oczywi�cie, �e tak! Wydobywam mniej rudy ni� inny Kopacze, wi�c musz� nadrabia� braki drobnym handlem wymiennym.
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_05"); //Mam oczy szeroko otwarte, wi�c dowiedzia�em si� kilku ciekawych rzeczy. Masz mo�e przy sobie troch� rudy? Jakie� 10 bry�ek?

	Npc_ExchangeRoutine (self,"BUSY");
	
	var C_Npc Brandick; 				
	Brandick = Hlp_GetNpc(GRD_261_Brandick);
	Npc_ExchangeRoutine (Brandick,"WATCH");
	AI_ContinueRoutine(Brandick);	// TEST!!!
};
// ***************** ALEPH BIETET INFO *****************************

instance VLK_585_Aleph_INFO (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_INFO_Condition;
	information		= VLK_585_Aleph_INFO_Info;
	important		= 0;
	permanent		= 0;
	description		= "(daj 10 bry�ek rudy)";
};

FUNC int  VLK_585_Aleph_INFO_Condition()
{
	if ( Npc_HasItems (hero,ItMinugget) ) >= 10 &&  (Npc_KnowsInfo (hero, VLK_585_Aleph_GUARDS) )  && (kapitel < 4)
	{
		return 1;
	};
};

func void  VLK_585_Aleph_INFO_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_INFO_Info_15_01"); //Jasne, oto 10 bry�ek.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_02"); //Dzi�ki. Id� do g��wnego szybu i zejd� na d� po rusztowaniu. Powiniene� trafi� na dwie boczne jaskinie.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_03"); //W drugiej z nich jest Stra�nik i stary rozdrabniacz.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_04"); //Gdzie� niedaleko znajdziesz nap�j uzdrawiaj�cy, tylko uwa�aj na pe�zacze!
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_05"); //Gdyby� potrzebowa� naj�wie�szych informacji zg�o� si� do mnie. Na pewno b�d� m�g� ci pom�c.
	
	B_GiveInvItems (hero, other, ItMiNugget,10);
};
// ***************** WIRD ALEPH ANGESCHW�RZT IST ER SAUER*****************************
instance VLK_585_Aleph_ANGRY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_ANGRY_Condition;
	information		= VLK_585_Aleph_ANGRY_Info;
	important		= 1;
	permanent		= 0;
};	

FUNC int  VLK_585_Aleph_ANGRY_Condition()
{
	if ( Npc_KnowsInfo (hero,GRD_261_Brandick_ALEPH) ) && (kapitel < 4)
	{
		return 1;
	};
};

func void  VLK_585_Aleph_ANGRY_Info()
{
	
	AI_Output (self,other,"VLK_585_Aleph_ANGRY_Info_05_01"); //Donios�e� na mnie Brandickowi? Spadaj st�d!
	
	AI_StopProcessInfos	( self );
	Npc_SetTempAttitude (self,ATT_ANGRY);
};
//***************** LOCKPICKS*****************************
instance VLK_585_Aleph_KEY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_KEY_Condition;
	information		= VLK_585_Aleph_KEY_Info;
	important		= 0;
	permanent		= 0;
	description     = "Masz dla mnie jeszcze jakie� po�yteczne informacje?";
};
FUNC int  VLK_585_Aleph_KEY_Condition()
{
	if ! ( Npc_KnowsInfo (hero,GRD_261_Brandick_ALEPH) ) &&  ( Npc_KnowsInfo (hero, VLK_585_Aleph_INFO)) && (kapitel < 4)
	{
		return 1;
	};
};

func void  VLK_585_Aleph_KEY_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_KEY_Info_15_01"); //Masz dla mnie jeszcze jakie� po�yteczne informacje?
	AI_Output (self,other,"VLK_585_Aleph_KEY_Info_05_02"); //Jasne, a masz 10 bry�ek rudy?
};

//***************** LOCKPICKS*****************************
instance VLK_585_Aleph_GLEN (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_GLEN_Condition;
	information		= VLK_585_Aleph_GLEN_Info;
	important		= 0;
	permanent		= 0;
	description     = "(daj 10 bry�ek rudy)";
};
FUNC int  VLK_585_Aleph_GLEN_Condition()
{
	if ( Npc_HasItems (hero,ItMinugget) ) >= 10 &&  ( Npc_KnowsInfo (hero,VLK_585_Aleph_KEY) ) && (kapitel < 4)
	{
		return 1;
	};
};

func void  VLK_585_Aleph_GLEN_Info()
{
	
	AI_Output (other,self,"VLK_585_Aleph_GLEN_Info_15_01"); //Za tak� cen� oczekuj� czego� naprawd� dobrego!
	AI_Output (self,other,"VLK_585_Aleph_GLEN_Info_05_02"); //W kopalni mo�na znale�� mn�stwo zamkni�tych skrzy�. Glen, jeden z Kopaczy na g�rze, mo�e ci dostarczy� par� wytrych�w.
	
	B_GiveInvItems (hero, self, ItMinugget,10); 
};
//***************** LAGERSCHUPPENSCHL�SSEL*****************************
func void B_Aleph_StorageShedKey()
{
	B_LogEntry		(CH2_StorageShed,	"Aleph sprzeda� mi klucz do skrzy� ze sk�adowiska!");
};

instance VLK_585_Aleph_SCHUPPEN (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_SCHUPPEN_Condition;
	information		= VLK_585_Aleph_SCHUPPEN_Info;
	important		= 0;
	permanent		= 0;
	description     = "Wiesz mo�e co� o kluczu do skrzyni ze sk�adowiska?";
};
FUNC int  VLK_585_Aleph_SCHUPPEN_Condition()
{
	if ( Npc_KnowsInfo (hero, GRD_271_ULBERT_DRUNK) ) && ( !Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH) ) && (kapitel < 4)
	{
		return 1;
	};
};

func void  VLK_585_Aleph_SCHUPPEN_Info()
{
	
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_01"); //Wiesz mo�e co� o kluczu do skrzyni ze sk�adowiska?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_02"); //C�... To zale�y...
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_03"); //Od ilo�ci bry�ek rudy, kt�re jestem got�w zap�aci�?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_04"); //Szybko si� uczysz.
	
	Info_ClearChoices ( VLK_585_Aleph_SCHUPPEN );
	
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,DIALOG_BACK 	   ,VLK_585_Aleph_SCHUPPEN_Back);
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Zap�a� 50 bry�ek rudy.",VLK_585_Aleph_SCHUPPEN_50 );
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Zap�a� 30 bry�ek rudy.",VLK_585_Aleph_SCHUPPEN_30 );
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Zap�a� 15 bry�ek rudy.",VLK_585_Aleph_SCHUPPEN_15 );
};


func void VLK_585_Aleph_SCHUPPEN_50 ()
{
	
	if (Npc_HasItems (hero, ItMiNugget) >= 50)
	{ 
		AI_Output			(other,self,"VLK_585_Aleph_SCHUPPEN_50_15_01"); //50 bry�ek to chyba uczciwa cena!
		AI_Output			(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_02"); //Jeste� bardzo hojny! Oto klucz. We� te� ten pier�cie�. Zawsze przynosi� mi szcz�cie.

		CreateInvItems		(self, ItKe_OM_03,	1);			// nur f�r die korrekte Textausgaben!!!
		B_GiveInvItems      (self, hero, ItKe_OM_03, 2);
		Npc_RemoveInvItem	(hero, ItKe_OM_03);

		Npc_RemoveInvItem	(self, Staerkering);
		CreateInvItem		(hero, Staerkering);

		B_GiveInvItems	    (hero, self, ItMinugget,50);  

		Npc_SetPermAttitude (self, ATT_FRIENDLY ); 
		Info_ClearChoices	(VLK_585_Aleph_SCHUPPEN);
		VLK_585_Aleph_SCHUPPEN.permanent = 0;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_50_05_03"); //Nie masz tyle przy sobie!
		VLK_585_Aleph_SCHUPPEN.permanent = 1;
	};
};

func void VLK_585_Aleph_SCHUPPEN_30 ()
{
	
	
	if (Npc_HasItems (hero, ItMiNugget) >= 30)
	{ 
		CreateInvItem		(self, ItKe_OM_03);
		B_GiveInvItems      (self, other, ItKe_OM_03, 1);
		B_GiveInvItems	(hero, self, ItMinugget,30);  
		Info_ClearChoices	(VLK_585_Aleph_SCHUPPEN );
		AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_30_15_01"); //30 bry�ek powinno wystarczy�.
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_30_05_02"); //W porz�dku. Tak si� sk�ada, �e mam ten klucz przy sobie.
		VLK_585_Aleph_SCHUPPEN.permanent = 0;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_30_05_03"); //Nie masz tyle przy sobie!
		VLK_585_Aleph_SCHUPPEN.permanent = 1;
	}; 
};	
func void VLK_585_Aleph_SCHUPPEN_15 ()
{
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_15_15_01"); //15 bry�ek wystarczy?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_15_05_02"); //15 bry�ek? Za 15 bry�ek nie mam poj�cia o jakim kluczu m�wisz!
	VLK_585_Aleph_SCHUPPEN.permanent = 0;
};	
func void VLK_585_Aleph_SCHUPPEN_Back ()
{
	Info_ClearChoices	(  VLK_585_Aleph_SCHUPPEN );
	VLK_585_Aleph_SCHUPPEN.permanent = 1;
};

// WENN DER SPIELER ALEPH BEI BRANDICK ANGESCHW�RZT HAT
instance  VLK_585_Aleph_DIRTY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_DIRTY_Condition;
	information		= VLK_585_Aleph_DIRTY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wiesz mo�e co� o kluczu do skrzyni ze sk�adowiska?"; 
};

FUNC int  VLK_585_Aleph_DIRTY_Condition()
{
	if ( Npc_KnowsInfo (hero, GRD_271_ULBERT_DRUNK) ) && ( Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH) ) && (kapitel < 4)
	{
		return 1;
	};
};


FUNC void  VLK_585_Aleph_DIRTY_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_Info_15_01"); //Wiesz mo�e co� o kluczu do skrzyni ze sk�adowiska?
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_Info_05_02"); //C�, to zale�y...
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_Info_15_03"); //Od ilo�ci bry�ek rudy, kt�re jestem got�w zap�aci�?
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_Info_05_04"); //Szybko si� uczysz. To ci� b�dzie kosztowa� 100 bry�ek.
	
	Info_ClearChoices ( VLK_585_Aleph_DIRTY );
	
	Info_AddChoice ( VLK_585_Aleph_DIRTY,"(Zap�a� 100 bry�ek rudy)",VLK_585_Aleph_DIRTY_100 );
	Info_AddChoice ( VLK_585_Aleph_DIRTY,"(Nie p�a�)",VLK_585_Aleph_DIRTY_NO );
};  
func void VLK_585_Aleph_DIRTY_100()
{
	if Npc_HasItems (hero,ItMinugget)>=100
	{ 
		AI_Output (other,self,"VLK_585_Aleph_DIRTY_100_Info_15_01"); //Niech b�dzie, ty zdzierco. Masz tu swoje 100 bry�ek.
		AI_Output (self,other,"VLK_585_Aleph_DIRTY_100_Info_05_02"); //Trzeba by�o ze mn� nie zadziera�. Oto tw�j klucz.
		B_GiveInvItems	(hero, self, ItMinugget,100);
		CreateInvItem		(self, ItKe_OM_03);
		B_GiveInvItems      (self, other, ItKe_OM_03, 1);
		Info_ClearChoices	( VLK_585_Aleph_DIRTY );
		VLK_585_Aleph_DIRTY.permanent = 0;	
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_DIRTY_100_Info_05_03"); //Masz mnie za g�upca?! 100 bry�ek, to moje ostatnie s�owo!
		VLK_585_Aleph_DIRTY.permanent = 1;
	};
};
func void VLK_585_Aleph_DIRTY_NO()
{
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_NO_Info_15_01"); //Nie b�d� wyrzuca� w b�oto takiej ilo�ci rudy!
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_NO_Info_05_02"); //To po co mnie w og�le zaczepiasz?
	VLK_585_Aleph_DIRTY.permanent = 0;	
};

//========================================
//-----------------> MAGZYN
//========================================

INSTANCE DIA_Aleph_MAGZYN (C_INFO)
{
   npc          = VLK_585_Aleph;
   nr           = 8;
   condition    = DIA_Aleph_MAGZYN_Condition;
   information  = DIA_Aleph_MAGZYN_Info;
   permanent	= FALSE;
   description	= "Garp pyta, czy zajmiesz si� skrzyniami.";
};

FUNC INT DIA_Aleph_MAGZYN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Garp_AKSZYN)) && (kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Aleph_MAGZYN_Info()
{
    AI_Output (other, self ,"DIA_Aleph_MAGZYN_15_01"); //Garp pyta, czy zajmiesz si� skrzyniami.
    AI_Output (self, other ,"DIA_Aleph_MAGZYN_03_02"); //Chyba do reszty zg�upia�.
    AI_Output (self, other ,"DIA_Aleph_MAGZYN_03_03"); //Nie jestem samob�jc�. 
    AI_Output (other, self ,"DIA_Aleph_MAGZYN_15_04"); //Podobno ju� si� zgodzi�e�. 
    AI_Output (self, other ,"DIA_Aleph_MAGZYN_03_05"); //To, co m�wi�em przy piwie dwa dni temu to inna sprawa.
    AI_Output (self, other ,"DIA_Aleph_MAGZYN_03_06"); //Oni naprawd� my�l�, �e mog� co� zdzia�a�.
    AI_Output (self, other ,"DIA_Aleph_MAGZYN_03_07"); //Przecie� to oczywiste, �e je�li to si� wyda, wszyscy zawisn�.
    AI_Output (self, other ,"DIA_Aleph_MAGZYN_03_08"); //Ja umywam od tego r�ce. Niech szukaj� innego frajera.
    B_LogEntry                     (CH1_ActionOM,"Kr�tko m�wi�c, Aleph ma gdzie� ca�� t� akcje Kopaczy. Uwa�a, �e s� z g�ry skazani na pora�k�. Garp nie b�dzie zadowolony.");

    B_GiveXP (130);
};

//========================================
//-----------------> ZAMKI
//========================================

INSTANCE DIA_Aleph_ZAMKI (C_INFO)
{
   npc          = VLK_585_Aleph;
   nr           = 9;
   condition    = DIA_Aleph_ZAMKI_Condition;
   information  = DIA_Aleph_ZAMKI_Info;
   permanent	= FALSE;
   description	= "Nauczysz mnie otwiera� zamki?";
};

FUNC INT DIA_Aleph_ZAMKI_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Aleph_MAGZYN)) && (kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Aleph_ZAMKI_Info()
{
    AI_Output (other, self ,"DIA_Aleph_ZAMKI_15_01"); //Nauczysz mnie otwiera� zamki?
    AI_Output (self, other ,"DIA_Aleph_ZAMKI_03_02"); //Nie. Spadaj! Nie mieszam si� w te wasze bunty.
    B_LogEntry                     (CH1_ActionOM,"Aleph nie nauczy mnie otwierania zamk�w. Musz� pogada� z kim� z zewn�trz.");
};


//========================================
//-----------------> KAPITEL4_DIALOG
//========================================

INSTANCE DIA_Aleph_KAPITEL4_DIALOG (C_INFO)
{
   npc          = VLK_585_Aleph;
   nr           = 1;
   condition    = DIA_Aleph_KAPITEL4_DIALOG_Condition;
   information  = DIA_Aleph_KAPITEL4_DIALOG_Info;
   permanent	= FALSE;
   description	= "No, no... Jak zawsze wykaza�e� si� sprytem.";
};

FUNC INT DIA_Aleph_KAPITEL4_DIALOG_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Aleph_KAPITEL4_DIALOG_Info()
{
    AI_Output (other, self ,"DIA_Aleph_KAPITEL4_DIALOG_15_01"); //No, no... Jak zawsze wykaza�e� si� sprytem.
    AI_Output (self, other ,"DIA_Aleph_KAPITEL4_DIALOG_03_02"); //Taa... Ledwo nam si� uda�o zbiec z kopalni. Na szcz�cie ci przebrzydli Stra�nicy, z Brandickiem na czele dostali nauczk�.
    AI_Output (self, other ,"DIA_Aleph_KAPITEL4_DIALOG_03_03"); //Stara Kopalnia jest teraz jednym wielkim grobem. Niemal wszyscy zgin�li. Jak tylko woda opadnie, ich zw�oki na zawsze tam zostan�.
};

//========================================
//-----------------> ABOUT_GOMEZ
//========================================

INSTANCE DIA_Aleph_ABOUT_GOMEZ (C_INFO)
{
   npc          = VLK_585_Aleph;
   nr           = 2;
   condition    = DIA_Aleph_ABOUT_GOMEZ_Condition;
   information  = DIA_Aleph_ABOUT_GOMEZ_Info;
   permanent	= FALSE;
   description	= "My�lisz, �e Gomez b�dzie chcia� odbudowa� kopalnie?";
};

FUNC INT DIA_Aleph_ABOUT_GOMEZ_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(ebr_100_gomez);
    if (Npc_KnowsInfo (hero, DIA_Aleph_KAPITEL4_DIALOG))
    && (!Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Aleph_ABOUT_GOMEZ_Info()
{
    AI_Output (other, self ,"DIA_Aleph_ABOUT_GOMEZ_15_01"); //Nie s�dzisz, �e z czasem Gomez b�dzie chcia� odbudowa� kopalni�?
    AI_Output (self, other ,"DIA_Aleph_ABOUT_GOMEZ_03_02"); //Nie wiem. Teraz o ile dobrze s�ysza�em zamierza zaj�� Woln� Kopalnie. Je�li mu si�, uda nie b�dzie potrzebowa� �adnych innych kopal�.
    AI_Output (self, other ,"DIA_Aleph_ABOUT_GOMEZ_03_03"); //Z tego co mi m�wi� m�j kumpel Senyan z Nowego Obozu, ta kopalnia jest niezmiernie bogata w surowce.
};

//========================================
//-----------------> NEW_CAMP
//========================================

INSTANCE DIA_Aleph_NEW_CAMP (C_INFO)
{
   npc          = VLK_585_Aleph;
   nr           = 3;
   condition    = DIA_Aleph_NEW_CAMP_Condition;
   information  = DIA_Aleph_NEW_CAMP_Info;
   permanent	= TRUE;
   description	= "Jak si� maj� sprawy?";
};

FUNC INT DIA_Aleph_NEW_CAMP_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Aleph_KAPITEL4_DIALOG))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Aleph_NEW_CAMP_Info()
{
    AI_Output (other, self ,"DIA_Aleph_NEW_CAMP_15_01"); //Jak si� maj� sprawy?
    AI_Output (self, other ,"DIA_Aleph_NEW_CAMP_03_02"); //Na razie odpoczywamy. Potem pewnie udamy si� do Nowego Obozu.
    AI_Output (other, self ,"DIA_Aleph_NEW_CAMP_15_03"); //Odpoczynek to twoja specjalno��.
    AI_Output (self, other ,"DIA_Aleph_NEW_CAMP_03_04"); //Hehe... No jasne. 
};

