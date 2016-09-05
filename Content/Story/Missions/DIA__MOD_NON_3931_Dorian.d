//***** WI�ZIE� DORIAN ********
//***** DIALOGI *******
//POPRAWIONE, RUTYNY DODANE, WP W �WIECIE
//****** OK **************

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Dorian_EXIT(C_INFO)
{
	npc             = NON_3931_Dorian;
	nr              = 999;
	condition	= DIA_Dorian_EXIT_Condition;
	information	= DIA_Dorian_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Dorian_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Dorian_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Dorian_HELLO1 (C_INFO)
{
   npc          = NON_3931_Dorian;
   nr           = 1;
   condition    = DIA_Dorian_HELLO1_Condition;
   information  = DIA_Dorian_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Dorian_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Dorian_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Dorian_HELLO1_03_01"); //Czego chcesz? My�la�em, �e to Bullit idzie z jedzeniem dla mnie, albo z zaproszeniem do sali tortur dla mojego kumpla z celi (pogardliwie).
    AI_Output (other, self ,"DIA_Dorian_HELLO1_15_02"); //By�em po prostu ciekaw, czy w lochach s� zamkni�ci skaza�cy.
    AI_Output (self, other ,"DIA_Dorian_HELLO1_03_03"); //Jak widzisz s�. Co lepsze, nikt z nas nie zosta� tu zamkni�ty bez powodu.�
    AI_Output (other, self ,"DIA_Dorian_HELLO1_15_04"); //A ty? Dlaczego ci� zamkn�li?
    AI_Output (self, other ,"DIA_Dorian_HELLO1_03_05"); //By�em kurierem mag�w. Drago, Mag Ognia kt�ry jest instruktorem magii, wys�a� mnie z misj� do Zewn�trznego Pier�cienia.
	AI_Output (self, other ,"DIA_Dorian_HELLO1_03_06"); //Ale to nie twoja sprawa, co to za zadanie, wi�c lepiej daj mi spok�j!
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Dorian_HELLO2 (C_INFO)
{
   npc          = NON_3931_Dorian;
   nr           = 2;
   condition    = DIA_Dorian_HELLO2_Condition;
   information  = DIA_Dorian_HELLO2_Info;
   permanent	= FALSE;
   description	= "Jestem jeszcze ciekaw, za co trafi�e� do Kolonii.";
};

FUNC INT DIA_Dorian_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Dorian_HELLO1))

    {
    return TRUE;
    };
};


FUNC VOID DIA_Dorian_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Dorian_HELLO2_15_01"); //Jestem jeszcze ciekaw za co trafi�e� do Kolonii.
    AI_Output (self, other ,"DIA_Dorian_HELLO2_03_02"); //Bo przespa�em si� z owc� Betsy... Przesta� zadawa� g�upie pytania!
    AI_Output (other, self ,"DIA_Dorian_HELLO2_15_03"); //Nie mo�esz po prostu powiedzie�?
    AI_Output (self, other ,"DIA_Dorian_HELLO2_03_04"); //Dobra opowiem ci. Pracowa�em na farmie Onara, tu na wyspie Khorinis. Pewnego dnia po�ar�em si� mocno z Thekl�, kuchark� Onara. 
	AI_Output (self, other ,"DIA_Dorian_HELLO2_03_05"); //Nie chcia�a mi potem wyda� obiadu, a kiszki a� mi si� skr�ca�y. No to wzi��em �y�k� i waln��em j� w �eb. I tyle.
    AI_Output (self, other ,"DIA_Dorian_HELLO2_03_06"); //Onar jednak si� troch� w�ciek� i da� mi ultimatum. Albo p�jd� do Khorinis i zg�osz� si� dobrowolnie do S�dziego, albo mog� wi�cej nie pokazywa� si� na farmie. 
	AI_Output (self, other ,"DIA_Dorian_HELLO2_03_07"); //Z dwojga z�ego wybra�em niestety t� pierwsz� opcj�.
    AI_Output (self, other ,"DIA_Dorian_HELLO2_03_08"); //S�dzia okaza� si� kawa�em sukinsyna, sku� mnie w kajdany i wys�a� do koszar, gdzie zosta�em zamkni�ty przez Wulfgara, dow�dc� stra�y miejskiej. 
	AI_Output (self, other ,"DIA_Dorian_HELLO2_03_09"); //Dwa dni p�niej wys�ano mnie z karnym konwojem do G�rniczej Doliny. Ot ca�a historia. Szkoda, �e nie uciek�em wtedy z farmy Onara.
    AI_Output (self, other ,"DIA_Dorian_HELLO2_03_10"); //Mog�em zaszy� si� na przyk�ad na farmie Akila, posiedzie� w "Martwej Harpii" lub nawet wst�pi� do Klasztoru. Przynajmniej by�bym wolny.�
	/* ****OD KIEDY W KOLONI ROZDAJE SI� PREZENTY? ***** ~Facebook
	if (Npc_HasItems (other, ItMiJoint_2) >=1)
    {
	B_GiveInvItems (other, self, ItMiJoint_2, 1);   
	AI_Output (other, self ,"DIA_Dorian_HELLO2_15_11"); //Dzi�ki skaza�cu, tylko tyle chcia�em wiedzie�. Zapal sobie na popraw� humoru.
    AI_UseItem (self, ItMiJoint_2);
    AI_Output (self, other ,"DIA_Dorian_HELLO2_03_12"); //Dzi�ki, mam nadzieje, �e Bullit nie wyczuje dymu ze skr�ta, bo inaczej b�d� mia� k�opty.
	};*/
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Dorian_HELLO3 (C_INFO)
{
   npc          = NON_3931_Dorian;
   nr           = 3;
   condition    = DIA_Dorian_HELLO3_Condition;
   information  = DIA_Dorian_HELLO3_Info;
   permanent	= FALSE;
   description	= "Jeste� wolny.";
};

FUNC INT DIA_Dorian_HELLO3_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(EBR_100_Gomez);
    if (Npc_KnowsInfo (hero, DIA_Dorian_HELLO2))
    && (Npc_IsDead(EBR_100_Gomez))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dorian_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Dorian_HELLO3_15_01"); //Jeste� wolny, Gomez dosta� nauczk�. Podobnie jak reszta Stra�nik�w i Magnat�w.
    AI_Output (self, other ,"DIA_Dorian_HELLO3_03_02"); //No prosz�, kto by si� spodziewa�. A co z Drago i Magami Ognia? 
	AI_Output (self, other ,"DIA_Dorian_HELLO3_03_03"); //Za�o�� si�, �e po �mierci Gomeza, sytuacja zostanie wykorzystana i zjawi� si� tu ludzie Lee i Laresa, zajmuj�c Ob�z. 
    AI_Output (other, self ,"DIA_Dorian_HELLO3_15_04"); //Magowie Ognia nie �yj�. Jaki� czas temu zawali�a si� Stara Kopalnia, przez co Gomez zamierza� zaj�� Woln� Kopalni� nale��c� do Nowego Obozu. 
	AI_Output (other, self ,"DIA_Dorian_HELLO3_15_05"); //Corristo i jego ludzie sprzeciwili si� Gomezowi i kaza� Stra�nikom ich zamordowa�.
    AI_Output (other, self ,"DIA_Dorian_HELLO3_15_06"); //Tylko Corristo i Milten wyszli z tego ca�o, z pewno�ci� nie wr�c� oni do Starego Obozu, nawet po zaj�ciu go przez Lee.�
    AI_Output (self, other ,"DIA_Dorian_HELLO3_03_07"); //Dzi�ki za informacje. Widz�, �e sporo si� wydarzy�o. Id� na g�r� dowiedzie� si� wszystkiego. Powodzenia!
	Npc_ExchangeRoutine	(NON_3931_Dorian, "free");
	NON_3931_Dorian.flags = 2;
};

