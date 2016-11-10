// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Bukhart_Exit (C_INFO)
{
	npc			= VLK_508_Buddler;
	nr			= 999;
	condition	= DIA_Bukhart_Exit_Condition;
	information	= DIA_Bukhart_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Bukhart_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Bukhart_Exit_Info()
{
	AI_StopProcessInfos(self);
};

INSTANCE DIA_Bukhart_Hello (C_INFO)
{
	npc			= VLK_508_Buddler;
	nr			= 1;
	condition	= DIA_Bukhart_Hello_Condition;
	information	= DIA_Bukhart_Hello_Info;
	permanent	= 0;
	description = "Cze��.";
};                       

FUNC INT DIA_Bukhart_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Bukhart_Hello_Info()
{
	AI_Output (other, self,"DIA_Bukhart_Hello_15_00"); //Cze��.
	AI_Output (self, other,"DIA_Bukhart_Hello_01_01"); //Nowa twarz. Mi�o ci� pozna�. Jestem Bukhart.
};

INSTANCE DIA_Bukhart_WhereFrom (C_INFO)
{
	npc			= VLK_508_Buddler;
	nr			= 1;
	condition	= DIA_Bukhart_WhereFrom_Condition;
	information	= DIA_Bukhart_WhereFrom_Info;
	permanent	= 0;
	description = "Jak tu trafi�e�?";
};                       

FUNC INT DIA_Bukhart_WhereFrom_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Bukhart_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Bukhart_WhereFrom_Info()
{
	AI_Output (other, self,"DIA_Bukhart_WhereFrom_15_00"); //Jak tu trafi�e�?
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_01"); //Przez morze, z kontynentu. By�em farmerem, �y�em nieopodal Silden, cho� moi przodkowie przyw�drowali tam z mro�nego Nordmaru. 
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_02"); //Pewnie dalej bym sobie siedzia� na swojej farmie, gdyby nie ten durny wieprz.
	AI_Output (other, self,"DIA_Bukhart_WhereFrom_15_03"); //Problemy z s�siadem?
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_04"); //Raczej z wieprzem s�siada. Wszystko by�o w porz�dku dop�ki s�siad nie kupi� tej �wini.
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_05"); //Pono� jaki� krewniak wyjawi� mu przepis na pasz�, kt�ra pozwoli utuczy� wieprza do rozmiar�w cieniostwora.
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_06"); //Nie wiem, czym ten s�siad karmi� t� �wini� i co z ni� robi�, lecz ta wredna bestia godzinami potrafi�a kwicze� i kwicze�. 
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_07"); //Pr�bowa�em to za�atwi� z s�siadem, lecz ten zby� mnie tym, �e �winia jest od tego, by kwicza�a.
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_08"); //Nie mog�em ju� znie�� tego ci�g�ego zawodzenia. Pewnej nocy wzi��em siekier� i zrobi�em porz�dek z t� �wini�.
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_09"); //Szkoda, �e nie zrobi�em tego samego z s�siadem, bo menda nast�pnego dnia donios�a na mnie stra�om.
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_10"); //Tak w�a�nie tutaj trafi�em.
};

INSTANCE DIA_Bukhart_HowAreYou (C_INFO)
{
	npc			= VLK_508_Buddler;
	nr			= 1;
	condition	= DIA_Bukhart_HowAreYou_Condition;
	information	= DIA_Bukhart_HowAreYou_Info;
	permanent	= 1;
	description = "Co s�ycha�?";
};                       

FUNC INT DIA_Bukhart_HowAreYou_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Bukhart_WhereFrom))
	{
		return 1;
	};
};

FUNC VOID DIA_Bukhart_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_Bukhart_HowAreYou_15_00"); //Co s�ycha�?
	AI_Output (self, other,"DIA_Bukhart_HowAreYou_01_01"); //Raczej czego nie s�ycha�. A m�wi� o tym cholernym kwiczeniu. Jeszcze troch� i bym chyba zwariowa�. 
};

INSTANCE DIA_Bukhart_AnyAdvice (C_INFO)
{
	npc			= VLK_508_Buddler;
	nr			= 1;
	condition	= DIA_Bukhart_AnyAdvice_Condition;
	information	= DIA_Bukhart_AnyAdvice_Info;
	permanent	= 0;
	description = "Mo�esz mi co� doradzi�?";
};                       

FUNC INT DIA_Bukhart_AnyAdvice_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Bukhart_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Bukhart_AnyAdvice_Info()
{
	AI_Output (other, self,"DIA_Bukhart_AnyAdvice_15_00"); //Mo�esz mi co� doradzi�?
	AI_Output (self, other,"DIA_Bukhart_AnyAdvice_01_01"); //Wieczorami Gomez opuszcza sw� siedzib� i udaje si� na aren�.
	AI_Output (self, other,"DIA_Bukhart_AnyAdvice_01_02"); //Rzecz jasna nie walczy. Ma przygotowan� lo��, z kt�rej obserwuje walki i pokazy.
	AI_Output (self, other,"DIA_Bukhart_AnyAdvice_01_03"); //Na twoim miejscu jednak nie pr�bowa�bym podchodzi� wtedy do szefa Magnat�w. 
	AI_Output (self, other,"DIA_Bukhart_AnyAdvice_01_04"); //Snaf kiedy� opowiada� jak jaki� g�upiec postanowi� wej�� do lo�y i zaoferowa� Gomezowi swe us�ugi. Thorus na miejscu roz�upa� temu kretynowi czaszk�.
};

//========================================
// Zadanie "Kto komu piasek sypie"
//========================================
var int BukhartTime;

INSTANCE DIA_Bukhart_UscanPlan (C_INFO)
{
	npc			= VLK_508_Buddler;
	nr			= 1;
	condition	= DIA_Bukhart_UscanPlan_Condition;
	information	= DIA_Bukhart_UscanPlan_Info;
	permanent	= 0;
	description = "Przysy�a mnie Uscan.";
};                       

FUNC INT DIA_Bukhart_UscanPlan_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Uscan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Bukhart_UscanPlan_Info()
{
	AI_Output (other, self,"DIA_Bukhart_UscanPlan_15_00"); //Przysy�a mnie Uscan. Ma pewien plan zemsty na Eskelu.
	AI_Output (self, other,"DIA_Bukhart_UscanPlan_01_01"); //Ja nie wiem o niczym. Poza tym jestem zaj�ty.
	AI_Output (other, self,"DIA_Bukhart_UscanPlan_15_02"); //Czerwona Latarnia.
	AI_Output (self, other,"DIA_Bukhart_UscanPlan_01_03"); //Przecie� to burdel w dzielnicy portowej w Khorinis. Ano tak, chodzi o to has�o co to je ustalili�my z Uscanem.
 	AI_Output (self, other,"DIA_Bukhart_UscanPlan_01_04"); //Ile to ju� lat tam nie by�em? Jeszcze chyba jak za m�odu. A niech mnie, kiedy� musz� zn�w odwiedzi� to miasto! No dobrze, bo si� rozgada�em...
 	AI_Output (other, self,"DIA_Bukhart_UscanPlan_15_05"); //Uscan powiedzia�, �e potrafisz dobrze wymiesza� m�k� z piaskiem, by Eskel nic nie zauwa�y� i upiek� z tego chleb.
 	AI_Output (self, other,"DIA_Bukhart_UscanPlan_01_06"); //Znam si� na tym. Pami�tam te� tego z�o�liwca Eskela. Ludzie opowiadali o nim w portowej karczmie, jak tracili przez niego z�by.
 	AI_Output (self, other,"DIA_Bukhart_UscanPlan_01_07"); //Mam m�k�, musz� j� jeszcze odpowiednio wymiesza� z piaskiem. Wr�� do mnie za 2 godziny.
	AI_Output (other, self,"DIA_Bukhart_UscanPlan_15_08"); //Tak zrobi�.
	
	BukhartTime = Wld_GetDay() * 24 + Wld_GetHour() + 2;
	
	B_LogEntry(CH1_WhoeverPoursSand, "Bukhart wymiesza m�k� z piaskiem. Mam wr�ci� do niego za dwie godziny.");
};

INSTANCE DIA_Bukhart_TwoHoursLater (C_INFO)
{
	npc			= VLK_508_Buddler;
	nr			= 1;
	condition	= DIA_Bukhart_TwoHoursLater_Condition;
	information	= DIA_Bukhart_TwoHoursLater_Info;
	permanent	= 0;
	description = "No i jak, wszystko gotowe?";
};                       

FUNC INT DIA_Bukhart_TwoHoursLater_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Bukhart_UscanPlan) && (BukhartTime <= Wld_GetDay() * 24 + Wld_GetHour()))
	{
		return 1;
	};
};

FUNC VOID DIA_Bukhart_TwoHoursLater_Info()
{
	AI_Output (other, self,"DIA_Bukhart_TwoHoursLater_15_00"); //No i jak, wszystko gotowe?
	AI_Output (self, other,"DIA_Bukhart_TwoHoursLater_01_01"); //Tak, bierz ten worek. Teraz ostro�nie podrzu� go do chaty Eskela, a r�wnocze�nie gwizdnij worek z dobr� m�k�.
	AI_Output (self, other,"DIA_Bukhart_TwoHoursLater_01_02"); //I niech ten gnojek poczuje wreszcie prawdziwy smak w�asnych wyrob�w!
	AI_Output (other, self,"DIA_Bukhart_TwoHoursLater_15_03"); //Z�o�� mu teraz niezapowiedzian� wizyt�.
	
	B_LogEntry(CH1_WhoeverPoursSand, "Mam worek m�ki z piaskiem. Czas uda� si� do Eskela.");
	
	B_GiveInvItems (self,other, ItMi_FlourBagWithSand, 2);
	
};
