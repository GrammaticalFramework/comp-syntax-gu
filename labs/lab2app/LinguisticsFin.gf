concrete LinguisticsFin of Linguistics =

 open
   SyntaxFin,
   SymbolicFin,
   ParadigmsFin,
   (G = GrammarFin)
 in {

lincat
   Statement = Utt ;
   Rule = S ;
   Language = NP ;
   Category = CN ;
   ParameterType = CN ;
   ParameterValue = NP ;
   [ParameterType] = {bare,indef : NP} ;
   [ParameterValue] = NP ;
   [Category] = NP ;
   Word = NP ;

lin
   ruleStatement rule = mkUtt rule ;
   languageRuleStatement language rule = mkUtt (mkS (SyntaxFin.mkAdv in_Prep language) rule) ;

   categoryInflectedRule category types = mkS (mkCl (mkNP aPl_Det category) (mkV2 (mkV "taipua") in_Prep) types.bare) ;
   categoryNotInflectedRule category = mkS negativePol (mkCl (mkNP aPl_Det category) (mkV "taipua")) ;
  
   categoryInherentRule category types = mkS (mkCl (mkNP aPl_Det category) have_V2 types.indef) ;

   parameterTypeRule ptype pvalues = mkS (mkCl (mkNP thePl_Det ptype) pvalues) ;
   parameterValueRule pvalues ptype = mkS (mkCl pvalues ptype) ;
  
   wordFormRule pvalue category wordlemma wordform = mkS (mkCl (mkNP pvalue (SyntaxFin.mkAdv from_Prep (mkNP the_Det (mkCN category wordlemma)))) wordform) ;
   wordInherentRule ptype category word pvalue = mkS (mkCl (mkNP (G.PossNP ptype (mkNP the_Det (mkCN category word)))) pvalue) ;

   wordCategoryRule word category = mkS (mkCl word category) ;
   syntaxCombinationRule category categories = mkS (mkCl (mkNP a_Det category) can_VV (mkVP (mkVP (mkV "koostua")) (SyntaxFin.mkAdv from_Prep categories))) ;

   agreementRule cat1 cat2 ptypes = mkS (mkCl (mkNP the_Det cat1) (mkVP (mkVP (mkV2 (mkV "kongruoida") with_Prep) (mkNP the_Det cat2)) (SyntaxFin.mkAdv in_Prep ptypes.bare))) ;
   orderBeforeRule cat1 cat2 = mkS (mkCl (mkNP the_Det cat1) (mkVP (passiveVP (mkV2 "sijoittaa")) (SyntaxFin.mkAdv before_Prep (mkNP the_Det cat2)))) ;
   orderAfterRule cat1 cat2 = mkS (mkCl (mkNP the_Det cat1) (mkVP (passiveVP (mkV2 "sijoittaa")) (SyntaxFin.mkAdv after_Prep (mkNP the_Det cat2)))) ;

   stringWord string = symb ("//" ++ string.s ++ "//") ; 
   
   englishLanguage = mkNP (mkPN "englanti") ;
   swedishLanguage = mkNP (mkPN "ruotsi") ;
   latinLanguage = mkNP (mkPN "latina") ;
   
   nounCategory = mkCN (mkN "substantiivi") ;
   verbCategory = mkCN (mkN "verbi") ;
   adjectiveCategory = mkCN (mkN "adjektiivi") ;
   adverbCategory = mkCN (mkN "adverbi") ;
   sentenceCategory = mkCN (mkN "lause") ;
   nounPhraseCategory = mkCN (mkN "nominaalilauseke") ;
   verbPhraseCategory = mkCN (mkN "verbilauseke") ;
   transitiveVerbCategory = mkCN (mkN "transitiivi" (mkN "verbi")) ;
   pronounCategory = mkCN (mkN "pronomini") ;
   determinerCategory = mkCN (mkN "determinaattori") ;
   relativePronounCategory = mkCN (mkN "relatiivipronomini") ;
   interrogativePronounCategory = mkCN (mkN "interrogatiivipronomini") ;
   conjunctionCategory = mkCN (mkN "rinnastuskonjunktio") ;
   subjunctionCategory = mkCN (mkN "alistuskonjunktio") ;
   particleCategory = mkCN (mkN "partikkeli") ;
   articleCategory = mkCN (mkN "artikkeli") ;
   prepositionCategory = mkCN (mkN "prepositio") ;
   interjectionCategory = mkCN (mkN "interjektio") ;

   utteranceCategory = mkCN (mkN "virke") ;
   questionCategory = mkCN (mkN "kysymys") ;
   relativeClauseCategory = mkCN (mkN "relatiivilause") ;
   adjectivalPhraseCategory = mkCN (mkN "adjektiivilauseke") ;
   adverbialPhraseCategory = mkCN (mkN "adverbiaalilauseke") ;

   numberParameterType = mkCN (mkN "luku" "luvun" "lukuja") ;
   caseParameterType = mkCN (mkN "sija") ;
  
   genderParameterType = mkCN (mkN "suku" "suvun" "sukuja") ;
   personParameterType = mkCN (mkN "persoona") ;
   tenseParameterType = mkCN (mkN "aikamuoto") ;

   singularParameterValue   = mkParameterValue "yksikkö" ;
   pluralParameterValue     = mkParameterValue "monikko" ;
   
   nominativeParameterValue = mkParameterValue "nominatiivi" ;
   genitiveParameterValue   = mkParameterValue "genetiivi" ;
   accusativeParameterValue = mkParameterValue "akkusatiivi" ;

   masculineParameterValue = mkParameterValue "maskuliini" ;
   feminineParameterValue  = mkParameterValue "feminiini" ;
   neuterParameterValue    = mkParameterValue "neutri" ;

   firstParameterValue  = mkParameterValue (mkCN (mkA "ensimmäinen") (mkN "persoona")) ;
   secondParameterValue = mkParameterValue (mkCN (mkA "toinen") (mkN "persoona")) ;
   thirdParameterValue  = mkParameterValue (mkCN (mkA (mkN "kolmas" "kolmannen" "kolmansia")) (mkN "persoona")) ;
   
   presentParameterValue = mkParameterValue "preesens" ;
   pastParameterValue = mkParameterValue "imperfekti" ;
   futureParameterValue = mkParameterValue "futuuri" ;

   indicativeParameterValue = mkParameterValue "indikatiivi" ;
   conjunctiveParameterValue = mkParameterValue "konjunktiivi" ;
   imperativeParameterValue = mkParameterValue "imperatiivi" ;
   participleParameterValue = mkParameterValue "partisiippi" ;
   infinitiveParameterValue = mkParameterValue "infinitiivi" ;
 
   BaseCategory c = mkNP a_Det c ;
   ConsCategory c cs = mkNP and_Conj (mkNP a_Det c) cs ;
   
   BaseParameterValue pv = pv ;
   ConsParameterValue pv pvs = mkNP and_Conj pv pvs ;

   BaseParameterType pt = {bare = mkNP pt ; indef = mkNP a_Det pt} ;
   ConsParameterType pt pts = {bare = mkNP and_Conj (mkNP pt) pts.bare ; indef = mkNP and_Conj (mkNP a_Det pt) pts.indef} ;

oper
   mkParameterValue = overload {
     mkParameterValue : Str -> NP = \str -> (mkNP the_Det (mkN str)) ;
     mkParameterValue : CN -> NP = \cn -> (mkNP the_Det cn) ;
     } ;
   
}