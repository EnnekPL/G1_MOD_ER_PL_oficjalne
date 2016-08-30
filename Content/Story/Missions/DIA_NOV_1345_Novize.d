// *Script was make in Easy Dialog Maker (EDM)
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Novize_EXIT1345(C_INFO)
{
	npc             = NOV_1345_Novize;
	nr              = 999;
	condition	= DIA_Novize_EXIT1345_Condition;
	information	= DIA_Novize_EXIT1345_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Novize_EXIT1345_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Novize_EXIT1345_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Novize_HowAreYou1345 (C_INFO)
{
   npc          = NOV_1345_Novize;
   nr           = 1;
   condition    = DIA_Novize_HowAreYou1345_Condition;
   information  = DIA_Novize_HowAreYou1345_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_Novize_HowAreYou1345_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Novize_HowAreYou1345_Info()
{
    AI_Output (other, self ,"DIA_Novize_HowAreYou1345_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Novize_HowAreYou1345_03_02"); //Witaj, jestem Kendrom - ucze� Baal Cadara.
    AI_Output (self, other ,"DIA_Novize_HowAreYou1345_03_03"); //A ty kim jeste�?
    AI_Output (other, self ,"DIA_Novize_HowAreYou1345_15_04"); //Jestem...
    AI_Output (self, other ,"DIA_Novize_HowAreYou1345_03_05"); //A zreszt� niewa�ne. W Bractwie �ni�cego nie liczy si� imi�, a wiara.
    AI_Output (self, other ,"DIA_Novize_HowAreYou1345_03_06"); //To ona daje nam si�� by pokonywa� przeciwno�ci losu.
};

//========================================
//-----------------> PermDia
//========================================

INSTANCE DIA_Novize_PermDia (C_INFO)
{
   npc          = NOV_1345_Novize;
   nr           = 1;
   condition    = DIA_Novize_PermDia_Condition;
   information  = DIA_Novize_PermDia_Info;
   permanent	= TRUE;
   description	= "Czym si� zajmujesz?";
};

FUNC INT DIA_Novize_PermDia_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Novize_HowAreYou1345))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_PermDia_Info()
{
    AI_Output (other, self ,"DIA_Novize_PermDia_15_01"); //Czym si� zajmujesz?
    AI_Output (self, other ,"DIA_Novize_PermDia_03_02"); //Przewa�nie medytuj� wraz z moim mistrzem, ale w wolnym czasie lubi� spacerowa� po Kolonii.
    AI_Output (self, other ,"DIA_Novize_PermDia_03_03"); //Odkry�em w okolicy naprawd� wiele ciekawych miejsc.
    AI_Output (other, self ,"DIA_Novize_PermDia_15_04"); //Na przyk�ad jakich?

    Info_ClearChoices		(DIA_Novize_PermDia);
    Info_AddChoice		(DIA_Novize_PermDia, DIALOG_BACK, DIA_Novize_PermDia_BACK);
    Info_AddChoice		(DIA_Novize_PermDia, "Opowiedz mi o okolicach Obozu.", DIA_Novize_PermDia_NearbyCamp);
    Info_AddChoice		(DIA_Novize_PermDia, "Co znajd� w g��bi bagien?", DIA_Novize_PermDia_Swamp);
    Info_AddChoice		(DIA_Novize_PermDia, "Co znajd� na wybrze�u?", DIA_Novize_PermDia_Cliff);
    Info_AddChoice		(DIA_Novize_PermDia, "Jest co� ciekawego w g�rach?", DIA_Novize_PermDia_Mountains);
    Info_AddChoice		(DIA_Novize_PermDia, "Co znajd� w lesie? ", DIA_Novize_PermDia_Forest);
};

FUNC VOID DIA_Novize_PermDia_BACK()
{
    Info_ClearChoices		(DIA_Novize_PermDia);
};

FUNC VOID DIA_Novize_PermDia_NearbyCamp()
{
    AI_Output (other, self ,"DIA_Novize_PermDia_NearbyCamp_15_01"); //Opowiedz mi o okolicach Obozu.
    AI_Output (self, other ,"DIA_Novize_PermDia_NearbyCamp_03_02"); //Okolice obozu na bagnie to �wietny teren �owiecki.
    AI_Output (self, other ,"DIA_Novize_PermDia_NearbyCamp_03_03"); //Kr�ci si� tutaj sporo dzikich zwierz�t. Wychodz� z lasu by napi� si� wody z rzeki.
    AI_Output (self, other ,"DIA_Novize_PermDia_NearbyCamp_03_04"); //S� to g��wnie dziki, wilki i �cierwojady.
};

FUNC VOID DIA_Novize_PermDia_Swamp()
{
    AI_Output (other, self ,"DIA_Novize_PermDia_Swamp_15_01"); //Co znajd� w g��bi bagien?
    AI_Output (self, other ,"DIA_Novize_PermDia_Swamp_03_02"); //Bagna to tak�e dobry teren �owiecki, s� jednak bardzo niebezpieczne.
    AI_Output (self, other ,"DIA_Novize_PermDia_Swamp_03_03"); //�yj� tu g��wnie b�otne w�e oraz krwiopijce.
    AI_Output (self, other ,"DIA_Novize_PermDia_Swamp_03_04"); //Na szcz�cie nasi Stra�nicy dobrze wiedz�, jak je odstraszy�.
    AI_Output (self, other ,"DIA_Novize_PermDia_Swamp_03_05"); //Na bagnie przebywaj� r�wnie� dwie grupy zbieraczy ziela.
    AI_Output (self, other ,"DIA_Novize_PermDia_Swamp_03_06"); //Dowodz� nimi Balor i Viran.
    AI_Output (self, other ,"DIA_Novize_PermDia_Swamp_03_07"); //Jest tam tak�e tartak, oraz stara chata.
};

FUNC VOID DIA_Novize_PermDia_Cliff()
{
    AI_Output (other, self ,"DIA_Novize_PermDia_Cliff_15_01"); //Co znajd� na wybrze�u?
    AI_Output (self, other ,"DIA_Novize_PermDia_Cliff_03_02"); //Przede wszystkim jest tam bardzo niebezpiecznie.
    AI_Output (self, other ,"DIA_Novize_PermDia_Cliff_03_03"); //Wybrze�e jest zamieszkiwane przez ogniste jaszczury.
    AI_Output (self, other ,"DIA_Novize_PermDia_Cliff_03_04"); //Nie radz� si� do nich zbli�a�. Mog� ci� nie�le przypiec.
    AI_Output (self, other ,"DIA_Novize_PermDia_Cliff_03_05"); //Poza tym znajduj� si� tam wraki okr�t�w. Pewnie jacy� marynarze rozbili si�, gdy przep�ywali przez Barier�.
    AI_Output (self, other ,"DIA_Novize_PermDia_Cliff_03_06"); //Jest tam tak�e zrujnowana wie�a, ale dobrze ci radz� - nie zbli�aj si� do niej.
    AI_Output (self, other ,"DIA_Novize_PermDia_Cliff_03_07"); //Z jej wn�trza dobiegaj� okropne ha�asy, a w okolicy czu� zew �mierci.
};

FUNC VOID DIA_Novize_PermDia_Mountains()
{
    AI_Output (other, self ,"DIA_Novize_PermDia_Mountains_15_01"); //Jest co� ciekawego w g�rach?
    AI_Output (self, other ,"DIA_Novize_PermDia_Mountains_03_02"); //Oczywi�cie, stara Forteca.
    AI_Output (self, other ,"DIA_Novize_PermDia_Mountains_03_03"); //Niegdy� zamieszkiwa� j� Bergmar, Burgrabia Zachodnich Terytori�w.
    AI_Output (self, other ,"DIA_Novize_PermDia_Mountains_03_04"); //Stamt�d kontrolowa� G�rnicz� Dolin� oraz wszystkie kopalnie.
    AI_Output (self, other ,"DIA_Novize_PermDia_Mountains_03_05"); //Odk�d jednak Kolonia jest w r�kach wi�ni�w, Forteca jest opuszczona.
    AI_Output (self, other ,"DIA_Novize_PermDia_Mountains_03_06"); //Nieopodal jest tak�e stare orkowe miejsce kultu, jednak nie polecam ci tam chodzi�. Ci�gle kr�c� si� tam orkowi zwiadowcy.
};

FUNC VOID DIA_Novize_PermDia_Forest()
{
    AI_Output (other, self ,"DIA_Novize_PermDia_Forest_15_01"); //Co znajd� w lesie? 
    AI_Output (self, other ,"DIA_Novize_PermDia_Forest_03_02"); //Pe�no stworze�, z kt�rymi s�dz�c po twojej posturze na pewno sobie nie poradzisz.
    AI_Output (self, other ,"DIA_Novize_PermDia_Forest_03_03"); //W kniei czaj� si� cieniostwory i orkowe psy.
    AI_Output (self, other ,"DIA_Novize_PermDia_Forest_03_04"); //Wok� lasu kr��� gro�ne watahy wilk�w. Lepiej nie atakowa� ich samemu. 
};



