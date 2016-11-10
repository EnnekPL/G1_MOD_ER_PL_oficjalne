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
	description = "Czeœæ.";
};                       

FUNC INT DIA_Bukhart_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Bukhart_Hello_Info()
{
	AI_Output (other, self,"DIA_Bukhart_Hello_15_00"); //Czeœæ.
	AI_Output (self, other,"DIA_Bukhart_Hello_01_01"); //Nowa twarz. Mi³o ciê poznaæ. Jestem Bukhart.
};

INSTANCE DIA_Bukhart_WhereFrom (C_INFO)
{
	npc			= VLK_508_Buddler;
	nr			= 1;
	condition	= DIA_Bukhart_WhereFrom_Condition;
	information	= DIA_Bukhart_WhereFrom_Info;
	permanent	= 0;
	description = "Jak tu trafi³eœ?";
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
	AI_Output (other, self,"DIA_Bukhart_WhereFrom_15_00"); //Jak tu trafi³eœ?
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_01"); //Przez morze, z kontynentu. By³em farmerem, ¿y³em nieopodal Silden, choæ moi przodkowie przywêdrowali tam z mroŸnego Nordmaru. 
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_02"); //Pewnie dalej bym sobie siedzia³ na swojej farmie, gdyby nie ten durny wieprz.
	AI_Output (other, self,"DIA_Bukhart_WhereFrom_15_03"); //Problemy z s¹siadem?
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_04"); //Raczej z wieprzem s¹siada. Wszystko by³o w porz¹dku dopóki s¹siad nie kupi³ tej œwini.
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_05"); //Ponoæ jakiœ krewniak wyjawi³ mu przepis na paszê, która pozwoli utuczyæ wieprza do rozmiarów cieniostwora.
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_06"); //Nie wiem, czym ten s¹siad karmi³ t¹ œwiniê i co z ni¹ robi³, lecz ta wredna bestia godzinami potrafi³a kwiczeæ i kwiczeæ. 
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_07"); //Próbowa³em to za³atwiæ z s¹siadem, lecz ten zby³ mnie tym, ¿e œwinia jest od tego, by kwicza³a.
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_08"); //Nie mog³em ju¿ znieœæ tego ci¹g³ego zawodzenia. Pewnej nocy wzi¹³em siekierê i zrobi³em porz¹dek z t¹ œwini¹.
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_09"); //Szkoda, ¿e nie zrobi³em tego samego z s¹siadem, bo menda nastêpnego dnia donios³a na mnie stra¿om.
	AI_Output (self, other,"DIA_Bukhart_WhereFrom_01_10"); //Tak w³aœnie tutaj trafi³em.
};

INSTANCE DIA_Bukhart_HowAreYou (C_INFO)
{
	npc			= VLK_508_Buddler;
	nr			= 1;
	condition	= DIA_Bukhart_HowAreYou_Condition;
	information	= DIA_Bukhart_HowAreYou_Info;
	permanent	= 1;
	description = "Co s³ychaæ?";
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
	AI_Output (other, self,"DIA_Bukhart_HowAreYou_15_00"); //Co s³ychaæ?
	AI_Output (self, other,"DIA_Bukhart_HowAreYou_01_01"); //Raczej czego nie s³ychaæ. A mówiê o tym cholernym kwiczeniu. Jeszcze trochê i bym chyba zwariowa³. 
};

INSTANCE DIA_Bukhart_AnyAdvice (C_INFO)
{
	npc			= VLK_508_Buddler;
	nr			= 1;
	condition	= DIA_Bukhart_AnyAdvice_Condition;
	information	= DIA_Bukhart_AnyAdvice_Info;
	permanent	= 0;
	description = "Mo¿esz mi coœ doradziæ?";
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
	AI_Output (other, self,"DIA_Bukhart_AnyAdvice_15_00"); //Mo¿esz mi coœ doradziæ?
	AI_Output (self, other,"DIA_Bukhart_AnyAdvice_01_01"); //Wieczorami Gomez opuszcza sw¹ siedzibê i udaje siê na arenê.
	AI_Output (self, other,"DIA_Bukhart_AnyAdvice_01_02"); //Rzecz jasna nie walczy. Ma przygotowan¹ lo¿ê, z której obserwuje walki i pokazy.
	AI_Output (self, other,"DIA_Bukhart_AnyAdvice_01_03"); //Na twoim miejscu jednak nie próbowa³bym podchodziæ wtedy do szefa Magnatów. 
	AI_Output (self, other,"DIA_Bukhart_AnyAdvice_01_04"); //Snaf kiedyœ opowiada³ jak jakiœ g³upiec postanowi³ wejœæ do lo¿y i zaoferowaæ Gomezowi swe us³ugi. Thorus na miejscu roz³upa³ temu kretynowi czaszkê.
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
	description = "Przysy³a mnie Uscan.";
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
	AI_Output (other, self,"DIA_Bukhart_UscanPlan_15_00"); //Przysy³a mnie Uscan. Ma pewien plan zemsty na Eskelu.
	AI_Output (self, other,"DIA_Bukhart_UscanPlan_01_01"); //Ja nie wiem o niczym. Poza tym jestem zajêty.
	AI_Output (other, self,"DIA_Bukhart_UscanPlan_15_02"); //Czerwona Latarnia.
	AI_Output (self, other,"DIA_Bukhart_UscanPlan_01_03"); //Przecie¿ to burdel w dzielnicy portowej w Khorinis. Ano tak, chodzi o to has³o co to je ustaliliœmy z Uscanem.
 	AI_Output (self, other,"DIA_Bukhart_UscanPlan_01_04"); //Ile to ju¿ lat tam nie by³em? Jeszcze chyba jak za m³odu. A niech mnie, kiedyœ muszê znów odwiedziæ to miasto! No dobrze, bo siê rozgada³em...
 	AI_Output (other, self,"DIA_Bukhart_UscanPlan_15_05"); //Uscan powiedzia³, ¿e potrafisz dobrze wymieszaæ m¹kê z piaskiem, by Eskel nic nie zauwa¿y³ i upiek³ z tego chleb.
 	AI_Output (self, other,"DIA_Bukhart_UscanPlan_01_06"); //Znam siê na tym. Pamiêtam te¿ tego z³oœliwca Eskela. Ludzie opowiadali o nim w portowej karczmie, jak tracili przez niego zêby.
 	AI_Output (self, other,"DIA_Bukhart_UscanPlan_01_07"); //Mam m¹kê, muszê j¹ jeszcze odpowiednio wymieszaæ z piaskiem. Wróæ do mnie za 2 godziny.
	AI_Output (other, self,"DIA_Bukhart_UscanPlan_15_08"); //Tak zrobiê.
	
	BukhartTime = Wld_GetDay() * 24 + Wld_GetHour() + 2;
	
	B_LogEntry(CH1_WhoeverPoursSand, "Bukhart wymiesza m¹kê z piaskiem. Mam wróciæ do niego za dwie godziny.");
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
	AI_Output (self, other,"DIA_Bukhart_TwoHoursLater_01_01"); //Tak, bierz ten worek. Teraz ostro¿nie podrzuæ go do chaty Eskela, a równoczeœnie gwizdnij worek z dobr¹ m¹k¹.
	AI_Output (self, other,"DIA_Bukhart_TwoHoursLater_01_02"); //I niech ten gnojek poczuje wreszcie prawdziwy smak w³asnych wyrobów!
	AI_Output (other, self,"DIA_Bukhart_TwoHoursLater_15_03"); //Z³o¿ê mu teraz niezapowiedzian¹ wizytê.
	
	B_LogEntry(CH1_WhoeverPoursSand, "Mam worek m¹ki z piaskiem. Czas udaæ siê do Eskela.");
	
	B_GiveInvItems (self,other, ItMi_FlourBagWithSand, 2);
	
};
