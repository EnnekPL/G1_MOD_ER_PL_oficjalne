//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Naldur_EXIT(C_INFO)
{
	npc             = VLK_577_Buddler;
	nr              = 999;
	condition		= DIA_Naldur_EXIT_Condition;
	information		= DIA_Naldur_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Naldur_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Naldur_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Naldur_HELLO1 (C_INFO)
{
   npc          = VLK_577_Buddler;
   nr           = 1;
   condition    = DIA_Naldur_HELLO1_Condition;
   information  = DIA_Naldur_HELLO1_Info;
   permanent	= 0;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Naldur_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Naldur_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Naldur_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Naldur_HELLO1_03_02"); //Wspania�e pytanie w jeszcze wspanialszym miejscu.
	AI_Output (other, self ,"DIA_Naldur_HELLO1_15_03"); //Co ci� ugryz�o? 
	AI_Output (self, other ,"DIA_Naldur_HELLO1_03_04"); //To, �e przez t� lafirynd� i jej kochasia reszt� �ycia sp�dz� w Kolonii Karnej. 
	AI_Output (other, self ,"DIA_Naldur_HELLO1_15_05"); //No c�...
	AI_Output (self, other ,"DIA_Naldur_HELLO1_03_06"); //Daruj sobie, po prostu nie lubi� tego pytania. 
};

//========================================
//-----------------> PERM
//========================================

INSTANCE DIA_Naldur_PERM (C_INFO)
{
   npc          = VLK_577_Buddler;
   nr           = 800;
   condition    = DIA_Naldur_PERM_Condition;
   information  = DIA_Naldur_PERM_Info;
   permanent	= 1;
   description	= "Co s�ycha�?";
};

FUNC INT DIA_Naldur_PERM_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Naldur_PERM_Info()
{
    AI_Output (other, self ,"DIA_Naldur_PERM_15_01"); //Co s�ycha�?
    AI_Output (self, other ,"DIA_Naldur_PERM_03_02"); //Mniej wi�cej to samo, co pi�tna�cie lat temu, tylko cz�owiekowi przybywa lat na karku i ubywa si� w ramionach. 
};

//========================================
//-----------------> THISPLACE
//========================================

INSTANCE DIA_Naldur_THISPLACE (C_INFO)
{
   npc          = VLK_577_Buddler;
   nr           = 1;
   condition    = DIA_Naldur_THISPLACE_Condition;
   information  = DIA_Naldur_THISPLACE_Info;
   permanent	= 0;
   description	= "Co mo�esz mi powiedzie� o tym miejscu?";
};

FUNC INT DIA_Naldur_THISPLACE_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Naldur_HELLO1)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Naldur_THISPLACE_Info()
{
    AI_Output (other, self ,"DIA_Naldur_THISPLACE_15_01"); //Co mo�esz mi powiedzie� o tym miejscu? 
    AI_Output (self, other ,"DIA_Naldur_THISPLACE_03_02"); //W Starym Obozie mo�na spotka� wys�annik�w z Sekty. Ka�� si� nazywa� Baalami, lecz tak naprawd� nimi nie s�. 
	AI_Output (self, other ,"DIA_Naldur_THISPLACE_03_03"); //Ot� w obozie na bagnie tytu� Baala przys�uguje jedynie dla Guru, kt�rzy przewodz� Sekcie, a �aden z Guru nie robi�by w Starym Obozie za handlarza zielem, czy werbownika. 
	AI_Output (self, other ,"DIA_Naldur_THISPLACE_03_04"); //Taranowi i Parvezowi pozwolono u�ywa� tego tytu�u jedynie poza Obozem i tylko w stosunku do ludzi spoza Sekty. 
	AI_Output (self, other ,"DIA_Naldur_THISPLACE_03_05"); //Chodzi pewnie o to, by miejscowi bardziej szanowali tych wys�annik�w Bractwa, ale i tak wszyscy ich traktuj� jak zwyk�ych handlarzy i to handlarzy z wypranymi m�zgami. 
	AI_Output (self, other ,"DIA_Naldur_THISPLACE_03_06"); //A tak, w obozie na bagnie to ci dwaj 'Baalowie' s� jedynie zwyk�ymi Nowicjuszami i w niczym nie r�ni� si� od tych, kt�rych zagania si� do pracy przy mieszaniu bagiennego ziela. 
};

/*
//========================================
//-----------------> PSI
//========================================

INSTANCE DIA_Naldur_PSI (C_INFO)
{
   npc          = VLK_577_Buddler;
   nr           = 1;
   condition    = DIA_Naldur_PSI_Condition;
   information  = DIA_Naldur_PSI_Info;
   permanent	= 0;
   description	= "Sk�d masz t� wiedz� o Bractwie?";
};

FUNC INT DIA_Naldur_PSI_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Naldur_THISPLACE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Naldur_PSI_Info()
{
    AI_Output (other, self ,"DIA_Naldur_PSI_15_01"); //Sk�d masz t� wiedz� o Bractwie?
    AI_Output (self, other ,"DIA_Naldur_PSI_03_02"); //Ma si� te znajomo�ci, ale nie b�d� wymienia� �adnych imion � to kwestia honoru i lojalno�ci. 
	AI_Output (self, other ,"DIA_Naldur_PSI_03_03"); //Wprawdzie jeste�my skaza�cami, lecz pewne warto�ci z tamtego �wiata dziwnie dobrze sprawdzaj� si� i tutaj. 
};*/

//========================================
//-----------------> BOSS
//========================================

INSTANCE DIA_Naldur_BOSS (C_INFO)
{
   npc          = VLK_577_Buddler;
   nr           = 1;
   condition    = DIA_Naldur_BOSS_Condition;
   information  = DIA_Naldur_BOSS_Info;
   permanent	= 0;
   description	= "Kto tu rz�dzi?";
};

FUNC INT DIA_Naldur_BOSS_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Naldur_HELLO1)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Naldur_BOSS_Info()
{
    AI_Output (other, self ,"DIA_Naldur_BOSS_15_01"); //Kto tu rz�dzi?
    AI_Output (self, other ,"DIA_Naldur_BOSS_03_02"); //Jak to kto? GOMEZ i jego STRA�NICY!
};

//========================================
//-----------------> FIGHT
//========================================

INSTANCE DIA_Naldur_FIGHT (C_INFO)
{
   npc          = VLK_577_Buddler;
   nr           = 1;
   condition    = DIA_Naldur_FIGHT_Condition;
   information  = DIA_Naldur_FIGHT_Info;
   permanent	= 0;
   important 	= 1;
};

FUNC INT DIA_Naldur_FIGHT_Condition()
{
	if Npc_KnowsInfo (hero,TRIA_ZakladyErensa) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN")<500)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Naldur_FIGHT_Info()
{
    AI_Output (self, other ,"DIA_Naldur_FIGHT_03_01"); //A wi�c to z tob� mam walczy�? To nie powinno potrwa� d�ugo. Zaczynajmy!
	
	AI_StopProcessInfos	( self );
	self.npctype = npctype_FRIEND;
	B_ChangeGuild   		 (self,GIL_NONE);  
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

//========================================
//-----------------> WIN
//========================================

INSTANCE DIA_Naldur_WIN (C_INFO)
{
   npc          = VLK_577_Buddler;
   nr           = 1;
   condition    = DIA_Naldur_WIN_Condition;
   information  = DIA_Naldur_WIN_Info;
   permanent	= 0;
   important 	= 1;
};

FUNC INT DIA_Naldur_WIN_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Naldur_FIGHT) && (self.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Naldur_WIN_Info()
{
    AI_Output (self, other ,"DIA_Naldur_WIN_03_01"); //Pokona�e� mnie! Nie doceni�em twojej si�y. 
	
	B_ChangeGuild   		 (self,GIL_VLK);  
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LOSE
//========================================

INSTANCE DIA_Naldur_LOSE (C_INFO)
{
   npc          = VLK_577_Buddler;
   nr           = 1;
   condition    = DIA_Naldur_LOSE_Condition;
   information  = DIA_Naldur_LOSE_Info;
   permanent	= 0;
   important 	= 1;
};

FUNC INT DIA_Naldur_LOSE_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Naldur_FIGHT) && (self.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Naldur_LOSE_Info()
{
    AI_Output (self, other ,"DIA_Naldur_LOSE_03_01"); //Na przysz�o�� nie zadzieraj ze starym Erensem. 
	
	B_ChangeGuild   		 (self,GIL_VLK);  
	AI_StopProcessInfos	(self);
};