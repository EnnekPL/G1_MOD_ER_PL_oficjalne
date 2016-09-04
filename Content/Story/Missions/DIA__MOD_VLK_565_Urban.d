//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Urban_EXIT(C_INFO)
{
	npc             = VLK_565_Buddler;
	nr              = 999;
	condition		= DIA_Urban_EXIT_Condition;
	information		= DIA_Urban_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Urban_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Urban_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Beer
//========================================
var int Urban_drunked;

INSTANCE DIA_Urban_Beer (C_INFO)
{
   npc          = VLK_565_Buddler;
   nr           = 1;
   condition    = DIA_Urban_Beer_Condition;
   information  = DIA_Urban_Beer_Info;
   permanent	= 1;
   description	= "Mo�e napijesz si� ze mn� piwka?";
};

FUNC INT DIA_Urban_Beer_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Karczmarz_LookingForWorkers)) && MIS_ZmianaLorenza == LOG_RUNNING && (Urban_drunked == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Urban_Beer_Info()
{
    AI_Output (other, self ,"DIA_Urban_Beer_15_01"); //Mo�e napijesz si� ze mn� piwka?
    AI_Output (self, other ,"DIA_Urban_Beer_03_02"); //A masz co�? 
	if Npc_HasItems (other,itfobeer) >= 5
	{
	AI_Output (other, self ,"DIA_Urban_Beer_15_03"); //Trzymaj.
	AI_Output (self, other ,"DIA_Urban_Beer_03_04"); //A� pi�� butelek. Co� ty taki szczodry? Czego chcesz?
	AI_Output (other, self ,"DIA_Urban_Beer_15_05"); //Po prostu chcia�em z kim� pogada�. Wiesz, jestem nowy...
	B_Giveinvitems (other,self,itfobeer,5);
	AI_StandUp (self);
	AI_UseItem (self,itfobeer);
	AI_Output (self, other ,"DIA_Urban_Beer_03_06"); //A no to �wietnie! M�w, co tam s�ycha�, albo pytaj o co chcesz. 
	Urban_drunked = true;
	Info_ClearChoices(DIA_Urban_Beer);
	if MIS_FightWithNaldur == LOG_SUCCESS
	{
	Info_AddChoice	 (DIA_Urban_Beer, "Ostatnio utar�em nosa Erensowi...",DIA_Urban_Beer_Erens);
	};
	if Snaf_Zutaten == LOG_SUCCESS
	{
	Info_AddChoice	 (DIA_Urban_Beer, "Snaf poprosi� mnie o odnalezienie sk�adnik�w.",DIA_Urban_Beer_Snaf);
	};
	Info_AddChoice	 (DIA_Urban_Beer, "Co my�lisz o Stra�nikach?",DIA_Urban_Beer_Gardists);//nie wiem co tu da�
	//Info_AddChoice	 (DIA_Urban_Beer, "�adna dzi� pogoda.",DIA_Urban_Beer_Weather);//nie wiem co tu da�
	}
	else
	{
	Urban_drunked = false;
	AI_Output (other, self ,"DIA_Urban_Beer_15_07"); //Hmm...
	AI_Output (self, other ,"DIA_Urban_Beer_03_08"); //�eby zaszumia�o to trzeba chocia� z pi�� butelek. Masz taki s�aby �eb? Ja zawsze zaczynam od pi�ciu piwek. 
	B_LogEntry               (CH1_ZmianaLorenza,"�eby upi� Urbana potrzebuj� pi�� butelek piwa. ");	
	};
};

func void DIA_Urban_Beer_Erens ()
{
	AI_Output (other, self ,"DIA_Urban_Beer_Erens_15_01"); //Ostatnio utar�em nosa Erensowi...
	AI_Output (self, other ,"DIA_Urban_Beer_Erens_03_02"); //Co ty powiesz? Opowiadaj!
	AI_UseItem (self,itfobeer);
	AI_Output (other, self ,"DIA_Urban_Beer_Erens_15_03"); //Przechodzi�em obok jego chaty, a on zaczepi� mnie i zacz�� prowokowa� do k��tni. Zagrozi�em mu, a on zaproponowa� mi zak�ad.
	AI_Output (self, other ,"DIA_Urban_Beer_Erens_03_04"); //Hip...Jaki zak�ad?
	AI_UseItem (self,itfobeer);
	AI_Output (other, self ,"DIA_Urban_Beer_Erens_15_05"); //Kaza� mi walczy� z Naldurem postawi� na niego sto bry�ek rudy. Wygra�em walk� bez wi�kszych trudno�ci.
	AI_Output (self, other ,"DIA_Urban_Beer_Erens_03_06"); //Ha ha ha! Nale�a�o im si�! Erens to stary cap, kt�ry wszystkich wkurza! Ha ha. (pijacki �miech)
	AI_UseItem (self,itfobeer);
	AI_Output (self, other ,"DIA_Urban_Beer_Erens_03_07"); //Twoje zdrowie! Hip... Chcia�bym to... zobaczy�...
	AI_Output (other, self ,"DIA_Urban_Beer_Erens_15_08"); //Mo�e p�jdziemy si� troch� z niego ponabija�?
	AI_Output (self, other ,"DIA_Urban_Beer_Erens_03_09"); //Dobry pomys�! Po piwkach mam ci�ty dowcip! Cholera, szkoda, �e na zewn�trz jest tak ciemno. Poprowadzisz?
	AI_Output (other, self ,"DIA_Urban_Beer_Erens_15_10"); //Jasne! Za mn�.
	Mdl_ApplyOverlayMds	(self,"Humans_drunken.mds");
	Npc_ExchangeRoutine (self,"follow");
	AI_StopProcessInfos	(self);	
	UrbanIdzie = true;
};

func void DIA_Urban_Beer_Snaf ()
{
	AI_Output (other, self ,"DIA_Urban_Beer_Snaf_15_01"); //Snaf poprosi� mnie o odnalezienie sk�adnik�w.
	AI_Output (self, other ,"DIA_Urban_Beer_Snaf_03_02"); //Do potrawki z chrz�szcza? Ha ha! Ten sukinsyn te� mnie o to prosi�.
	AI_UseItem (self,itfobeer);
	AI_Output (other, self ,"DIA_Urban_Beer_Snaf_15_03"); //Domy�lam si�, �e mu nie przynios�e�, tak?
	AI_Output (self, other ,"DIA_Urban_Beer_Snaf_03_04"); //A id� mi z tym g�wnem. Ka�demu nowemu zawraca tym g�ow�. Grubas ruszy�by si� sam, a nie szuka� g�upiego.
	AI_UseItem (self,itfobeer);
	AI_Output (self, other ,"DIA_Urban_Beer_Snaf_03_05"); //Zreszt� tego si� nie da je��!
	AI_Output (other, self ,"DIA_Urban_Beer_Snaf_15_06"); //Czyli nie przepadasz za Snafem?
	AI_Output (self, other ,"DIA_Urban_Beer_Snaf_03_07"); //Nie cierpi� go! Kiedy� poprosi�em go o porcj� roso�u, to powiedzia�, �ebym si� nie zbli�a� do kot�a. Co za gnida!
	AI_Output (self, other ,"DIA_Urban_Beer_Snaf_03_08"); //A� mam ch�� mu przywali�! Chod�, zaprowadzisz mnie, bo ma�o co widz� w tym mroku.
	Mdl_ApplyOverlayMds	(self,"Humans_drunken.mds");
	Npc_ExchangeRoutine (self,"follow");
	AI_StopProcessInfos	(self);	
	UrbanIdzie = true;
};

func void DIA_Urban_Beer_Gardists ()
{
	AI_Output (other, self ,"DIA_Urban_Beer_Lorenzo_15_01"); //Co my�lisz o Stra�nikach?
	AI_Output (self, other ,"DIA_Urban_Beer_Lorenzo_03_02"); //To w wi�kszo�ci szuje, kt�re �eruj� na s�abszych. Jednak nie wszyscy. Niekt�rzy s� w porz�dku i broni� mnie przed Manheimem. 
	AI_UseItem (self,itfobeer);
	AI_Output (self, other ,"DIA_Urban_Beer_Lorenzo_03_03"); //Powiem ci w sekrecie, �e ten typ chyba chce mnie wywali� z karczmy. Gdy sobie o tym hip... pomy�l�, to ogarnia mnie... hip... �al...
	AI_Output (self, other ,"DIA_Urban_Beer_Lorenzo_03_04"); //Musz� si� napi�...
	AI_UseItem (self,itfobeer);
	AI_Output (other, self ,"DIA_Urban_Beer_Lorenzo_15_05"); //Powiem ci co�: oni ci� oszukuj�. Tak naprawd� ci� nie lubi�. Mszcz� si� na Manheimie za to, �e ma pozwolenie na prowadzenie karczmy.
	AI_Output (self, other ,"DIA_Urban_Beer_Lorenzo_03_06"); //CO? A to fa�szywe... hip... gnidy! 
	AI_UseItem (self,itfobeer);
	AI_Output (self, other ,"DIA_Urban_Beer_Lorenzo_03_07"); //Mam ch�� obi� kt�remu� z nich mord�! Gdzie� tu si� kr�ci� Trip. Zaraz go... hip... rozwal�!
	AI_Output (other, self ,"DIA_Urban_Beer_Lorenzo_15_08"); //Nie, poczekaj! Ostatnio w Obozie pojawi� si� nowy Stra�nik. Chod� do niego!
	AI_Output (self, other ,"DIA_Urban_Beer_Lorenzo_03_09"); //Ha ha! �wietny pomys�! Prowad�.
	Mdl_ApplyOverlayMds	(self,"Humans_drunken.mds");
	Npc_ExchangeRoutine (self,"follow");
	AI_StopProcessInfos	(self);
	UrbanIdzie = true;
};

//========================================
//-----------------> BITKA
//========================================

INSTANCE DIA_Urban_BITKA (C_INFO)
{
   npc          = VLK_565_Buddler;
   nr           = 1;
   condition    = DIA_Urban_BITKA_Condition;
   information  = DIA_Urban_BITKA_Info;
   permanent	= 0;
   important	= 1;
};

FUNC INT DIA_Urban_BITKA_Condition()
{
	if (kapitel == 10)//(Npc_GetDistToNpc (self,GRD_201_Jackal) < 1000) && MIS_ZmianaLorenza == LOG_RUNNING && UrbanIdzie == true
	{
    return TRUE;
	};
};

FUNC VOID DIA_Urban_BITKA_Info()
{
	AI_Output (self, other ,"DIA_Urban_BITKA_03_01"); //Ju� dotarli�my? To ten sukinsyn? Dawaj, lejemy go!
	AI_StopProcessInfos (self);
	var c_npc Szakal;    	Szakal = Hlp_GetNpc(GRD_201_Jackal); 
    var c_npc Urban; 		Urban = Hlp_GetNpc(VLK_565_Buddler);
	Npc_SetTarget (Urban,Szakal);
    AI_StartState (Urban,ZS_ATTACK,1,"");
	Npc_SetTarget (Szakal,Urban);
    AI_StartState (Szakal,ZS_ATTACK,1,"");
	UrbanPobity = true;
	
};

//========================================
//-----------------> OHMYHEAD
//========================================

INSTANCE DIA_Urban_OHMYHEAD (C_INFO)
{
   npc          = VLK_565_Buddler;
   nr           = 1;
   condition    = DIA_Urban_OHMYHEAD_Condition;
   information  = DIA_Urban_OHMYHEAD_Info;
   permanent	= 0;
   important	= 1;
};

FUNC INT DIA_Urban_OHMYHEAD_Condition()
{
	if MIS_ZmianaLorenza == LOG_RUNNING && npc_knowsinfo (hero,DIA_Jackal_ANGRYMAN)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Urban_OHMYHEAD_Info()
{
	AI_Output (self, other ,"DIA_Urban_OHMYHEAD_03_01"); //Jasna cholera, moja g�owa... Co to si� sta�o?
	AI_Output (other, self ,"DIA_Urban_OHMYHEAD_15_02"); //Po pijaku wda�e� si� w b�jk� z Szakalem. Pr�bowa�em ci� powstrzyma� i za�agodzi� sytuacj�. Dzi�ki mnie jeszcze �yjesz...
	AI_Output (self, other ,"DIA_Urban_OHMYHEAD_03_03"); //Jak to?
	AI_Output (other, self ,"DIA_Urban_OHMYHEAD_15_04"); //Szakal chcia� ci� zabi� na miejscu, ale poprosi�em go, �eby lepiej po prostu ci� ukara�. Niestety b�dziesz musia� wr�ci� do pracy w Kopalni.
	AI_Output (self, other ,"DIA_Urban_OHMYHEAD_03_05"); //Dzi�ki, stary. Naprawd� chyba czas co� zmieni� w swoim �yciu... I tak ko�czy�a mi si� ju� ruda...
	AI_Output (other, self ,"DIA_Urban_OHMYHEAD_15_06"); //Spotykamy si� pod chat� Lorenzo. Wyruszymy, gdy tylko b�dzie gotowa kolejna zmiana. 
	
	B_LogEntry               (CH1_ZmianaLorenza,"Sprawa z Urbanem zosta�a ju� za�atwiona. Mamy si� spotka� przed chat� Lorenzo.");	
	B_GiveXP (100);
	Npc_ExchangeRoutine (self,"lorenzo");
	MDL_REMOVEOVERLAYMDS (self, "HUMANS_DRUNKEN.MDS");	
	AI_StopProcessInfos (self);
};