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
	description = "Cześć.";
};                       

FUNC INT DIA_Bukhart_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Bukhart_Hello_Info()
{
	AI_Output (other, self,"DIA_Bukhart_Hello_15_00"); //Cześć.
	AI_Output (self, other,"DIA_Bukhart_Hello_01_01"); //Nowa twarz. Miło cię poznać. Jestem Bukhart.
};

INSTANCE DIA_Bukhart_WhereFrom (C_INFO)
{
	npc			= VLK_508_Buddler;
	nr			= 1;
	condition	= DIA_Bukhart_WhereFrom_Condition;
	information	= DIA_Bukhart_WhereFrom_Info;
	permanent	= 0;
	description = "Jak tu trafiłeś?";
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
	AI_Output (other, self,"DIA_Bukhart_WhereFrom_15_00"); //Jak tu trafiłeś?
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_01"); //Przez morze, z kontynentu. Byłem farmerem, żyłem nieopodal Silden, choć moi przodkowie przywędrowali tam z mroźnego Nordmaru. 
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_02"); //Pewnie dalej bym sobie siedział na swojej farmie, gdyby nie ten durny wieprz.
	AI_Output (other, self,"DIA_Bukhart_WhereFrom_15_03"); //Problemy z sąsiadem?
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_04"); //Raczej z wieprzem sąsiada. Wszystko było w porządku dopóki sąsiad nie kupił tej świni.
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_05"); //Ponoć jakiś krewniak wyjawił mu przepis na paszę, która pozwoli utuczyć wieprza do rozmiarów cieniostwora.
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_06"); //Nie wiem, czym ten sąsiad karmił tą świnię i co z nią robił, lecz ta wredna bestia godzinami potrafiła kwiczeć i kwiczeć. 
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_07"); //Próbowałem to załatwić z sąsiadem, lecz ten zbył mnie tym, że świnia jest od tego, by kwiczała.
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_08"); //Nie mogłem już znieść tego ciągłego zawodzenia. Pewnej nocy wziąłem siekierę i zrobiłem porządek z tą świnią.
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_09"); //Szkoda, że nie zrobiłem tego samego z sąsiadem, bo menda następnego dnia doniosła na mnie strażom.
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_10"); //Tak właśnie tutaj trafiłem.
};

INSTANCE DIA_Bukhart_HowAreYou (C_INFO)
{
	npc			= VLK_508_Buddler;
	nr			= 1;
	condition	= DIA_Bukhart_HowAreYou_Condition;
	information	= DIA_Bukhart_HowAreYou_Info;
	permanent	= 1;
	description = "Co słychać?";
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
	AI_Output (other, self,"DIA_Bukhart_HowAreYou_15_00"); //Co słychać?
	AI_Output (self, other,"DIA_Bukhart_HowAreYou_01_01"); //Raczej czego nie słychać. A mówię o tym cholernym kwiczeniu. Jeszcze trochę i bym chyba zwariował. 
};

INSTANCE DIA_Bukhart_AnyAdvice (C_INFO)
{
	npc			= VLK_508_Buddler;
	nr			= 1;
	condition	= DIA_Bukhart_AnyAdvice_Condition;
	information	= DIA_Bukhart_AnyAdvice_Info;
	permanent	= 0;
	description = "Możesz mi coś doradzić?";
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
	AI_Output (other, self,"DIA_Bukhart_AnyAdvice_15_00"); //Możesz mi coś doradzić?
	AI_Output (self, other,"DIA_Bukhart_AnyAdvice_01_01"); //Wieczorami Gomez opuszcza swą siedzibę i udaje się na arenę.
	AI_Output (self, other,"DIA_Bukhart_AnyAdvice_01_02"); //Rzecz jasna nie walczy. Ma przygotowaną lożę, z której obserwuje walki i pokazy.
	AI_Output (self, other,"DIA_Bukhart_AnyAdvice_01_03"); //Na twoim miejscu jednak nie próbowałbym podchodzić wtedy do szefa Magnatów. 
	AI_Output (self, other,"DIA_Bukhart_AnyAdvice_01_04"); //Snaf kiedyś opowiadał jak jakiś głupiec postanowił wejść do loży i zaoferować Gomezowi swe usługi. Thorus na miejscu rozłupał temu kretynowi czaszkę.
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
	description = "Przysyła mnie Uscan.";
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
	AI_Output (other, self,"DIA_Bukhart_UscanPlan_15_00"); //Przysyła mnie Uscan. Ma pewien plan zemsty na Eskelu.
	AI_Output (self, other,"DIA_Bukhart_UscanPlan_01_01"); //Ja nie wiem o niczym. Poza tym jestem zajęty.
	AI_Output (other, self,"DIA_Bukhart_UscanPlan_15_02"); //Czerwona Latarnia.
	AI_Output (self, other,"DIA_Bukhart_UscanPlan_01_03"); //Przecież to burdel w dzielnicy portowej w Khorinis. Ano tak, chodzi o to hasło co to je ustaliliśmy z Uscanem.
 	AI_Output (self, other,"DIA_Bukhart_UscanPlan_01_04"); //Ile to już lat tam nie byłem? Jeszcze chyba jak za młodu. A niech mnie, kiedyś muszę znów odwiedzić to miasto! No dobrze, bo się rozgadałem...
 	AI_Output (other, self,"DIA_Bukhart_UscanPlan_15_05"); //Uscan powiedział, że potrafisz dobrze wymieszać mąkę z piaskiem, by Eskel nic nie zauważył i upiekł z tego chleb.
 	AI_Output (self, other,"DIA_Bukhart_UscanPlan_01_06"); //Znam się na tym. Pamiętam też tego złośliwca Eskela. Ludzie opowiadali o nim w portowej karczmie, jak tracili przez niego zęby.
 	AI_Output (self, other,"DIA_Bukhart_UscanPlan_01_07"); //Mam mąkę, muszę ją jeszcze odpowiednio wymieszać z piaskiem. Wróć do mnie za 2 godziny.
	AI_Output (other, self,"DIA_Bukhart_UscanPlan_15_08"); //Tak zrobię.
	
	BukhartTime = Wld_GetDay() * 24 + Wld_GetHour() + 2;
	
	B_LogEntry(CH1_WhoeverPoursSand, "Bukhart wymiesza mąkę z piaskiem. Mam wrócić do niego za dwie godziny.");
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
	AI_Output (self, other,"DIA_Bukhart_TwoHoursLater_01_01"); //Tak, bierz ten worek. Teraz ostrożnie podrzuć go do chaty Eskela, a równocześnie gwizdnij worek z dobrą mąką.
	AI_Output (self, other,"DIA_Bukhart_TwoHoursLater_01_02"); //I niech ten gnojek poczuje wreszcie prawdziwy smak własnych wyrobów!
	AI_Output (other, self,"DIA_Bukhart_TwoHoursLater_15_03"); //Złożę mu teraz niezapowiedzianą wizytę.
	
	B_LogEntry(CH1_WhoeverPoursSand, "Mam worek mąki z piaskiem. Czas udać się do Eskela.");
	
	B_GiveInvItems (self,other, ItMi_FlourBagWithSand, 2);
	
};
