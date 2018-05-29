concrete LinguisticsEng of Linguistics =

 open
   SyntaxEng,
   SymbolicEng,
   ParadigmsEng
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
   languageRuleStatement language rule = mkUtt (mkS (SyntaxEng.mkAdv in_Prep language) rule) ;

   categoryInflectedRule category types = mkS (mkCl (mkNP aPl_Det category) (mkV2 (mkV "inflect") for_Prep) types.bare) ;
   categoryNotInflectedRule category = mkS negativePol (mkCl (mkNP aPl_Det category) (mkV "inflect")) ;
  
   categoryInherentRule category types = mkS (mkCl (mkNP aPl_Det category) have_V2 types.indef) ;

   parameterTypeRule ptype pvalues = mkS (mkCl (mkNP thePl_Det ptype) pvalues) ;
   parameterValueRule pvalues ptype = mkS (mkCl pvalues ptype) ;
  
   wordFormRule pvalue category wordlemma wordform = mkS (mkCl (mkNP pvalue (SyntaxEng.mkAdv possess_Prep (mkNP the_Det (mkCN category wordlemma)))) wordform) ;
   wordInherentRule ptype category word pvalue = mkS (mkCl (mkNP (mkNP the_Det ptype) (SyntaxEng.mkAdv possess_Prep (mkNP the_Det (mkCN category word)))) pvalue) ;

   wordCategoryRule word category = mkS (mkCl word category) ;
   syntaxCombinationRule category categories = mkS (mkCl (mkNP a_Det category) can_VV (mkVP (passiveVP (mkV2 "form")) (SyntaxEng.mkAdv from_Prep categories))) ;

   agreementRule cat1 cat2 ptypes = mkS (mkCl (mkNP the_Det cat1) (mkVP (mkVP (mkV2 (mkV "agree") with_Prep) (mkNP the_Det cat2)) (SyntaxEng.mkAdv in_Prep ptypes.bare))) ;
   orderBeforeRule cat1 cat2 = mkS (mkCl (mkNP the_Det cat1) (mkVP (passiveVP (mkV2 "place")) (SyntaxEng.mkAdv before_Prep (mkNP the_Det cat2)))) ;
   orderAfterRule cat1 cat2 = mkS (mkCl (mkNP the_Det cat1) (mkVP (passiveVP (mkV2 "place")) (SyntaxEng.mkAdv after_Prep (mkNP the_Det cat2)))) ;

   stringWord string = symb ("//" ++ string.s ++ "//") ; 
   
   englishLanguage = mkNP (mkPN "English") ;
   swedishLanguage = mkNP (mkPN "Swedish") ;
   latinLanguage = mkNP (mkPN "Latin") ;
   
   nounCategory = mkCN (mkN "noun") ;
 
   verbCategory = mkCN (mkN "verb") ;
   adjectiveCategory = mkCN (mkN "adjective") ;
   adverbCategory = mkCN (mkN "adverb") ;
   sentenceCategory = mkCN (mkN "sentence") ;
   nounPhraseCategory = mkCN (mkN "noun phrase") ;
   verbPhraseCategory = mkCN (mkN "verb phrase") ;
   transitiveVerbCategory = mkCN (mkA "transitive") (mkN "verb") ;

   numberParameterType = mkCN (mkN "number") ;
   caseParameterType = mkCN (mkN "case") ;
  
   genderParameterType = mkCN (mkN "gender") ;
   personParameterType = mkCN (mkN "person") ;
   tenseParameterType = mkCN (mkN "tense") ;

   singularParameterValue   = mkParameterValue "singular" ;
   pluralParameterValue     = mkParameterValue "plural" ;
   
   nominativeParameterValue = mkParameterValue "nominative" ;
   genitiveParameterValue   = mkParameterValue "genitive" ;
   accusativeParameterValue = mkParameterValue "accusative" ;

   masculineParameterValue = mkParameterValue "masculine" ;
   feminineParameterValue  = mkParameterValue "feminine" ;
   neuterParameterValue    = mkParameterValue "neuter" ;

   firstParameterValue  = mkParameterValue (mkCN (mkA "first") (mkN "person")) ;
   secondParameterValue = mkParameterValue (mkCN (mkA "second") (mkN "person")) ;
   thirdParameterValue  = mkParameterValue (mkCN (mkA "third") (mkN "person")) ;
   
   presentParameterValue = mkParameterValue "present" ;
   pastParameterValue = mkParameterValue "past" ;
   futureParameterValue = mkParameterValue "future" ;

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