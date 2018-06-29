concrete LinguisticsCat of Linguistics =

 open
   SyntaxCat,
   SymbolicCat,
   ParadigmsCat
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
   languageRuleStatement language rule = mkUtt (mkS (SyntaxCat.mkAdv in_Prep language) rule) ;

   categoryInflectedRule category types = mkS (mkCl (mkNP thePl_Det category) (mkV2 (mkV "conjugar") for_Prep) types.bare) ;
   categoryNotInflectedRule category = mkS negativePol (mkCl (mkNP thePl_Det category) (mkV "conjugar")) ;
  
   categoryInherentRule category types = mkS (mkCl (mkNP thePl_Det category) have_V2 types.indef) ;

   parameterTypeRule ptype pvalues = mkS (mkCl (mkNP the_Det ptype) pvalues) ;
   parameterValueRule pvalues ptype = mkS (mkCl pvalues ptype) ;
  
   wordFormRule pvalue category wordlemma wordform = mkS (mkCl (mkNP pvalue (SyntaxCat.mkAdv possess_Prep (mkNP the_Det (mkCN category wordlemma)))) wordform) ;
   wordInherentRule ptype category word pvalue = mkS (mkCl (mkNP (mkNP the_Det ptype) (SyntaxCat.mkAdv possess_Prep (mkNP the_Det (mkCN category word)))) pvalue) ;

   wordCategoryRule word category = mkS (mkCl word category) ;
   syntaxCombinationRule category categories = mkS (mkCl (mkNP a_Det category) can_VV (mkVP (passiveVP (mkV2 "formar")) (SyntaxCat.mkAdv from_Prep categories))) ;

   agreementRule cat1 cat2 ptypes = mkS (mkCl (mkNP the_Det cat1) (mkVP (mkVP (mkV2 (mkV "concordar") with_Prep) (mkNP the_Det cat2)) (SyntaxCat.mkAdv in_Prep ptypes.bare))) ;
   orderBeforeRule cat1 cat2 = mkS (mkCl (mkNP the_Det cat1) (mkVP (passiveVP (mkV2 "situar")) (SyntaxCat.mkAdv before_Prep (mkNP the_Det cat2)))) ;
   orderAfterRule cat1 cat2 = mkS (mkCl (mkNP the_Det cat1) (mkVP (passiveVP (mkV2 "situar")) (SyntaxCat.mkAdv after_Prep (mkNP the_Det cat2)))) ;

   stringWord string = symb ("//" ++ string.s ++ "//") ; 
   
   englishLanguage = mkNP (mkPN "anglès") ;
   swedishLanguage = mkNP (mkPN "suec") ;
   latinLanguage = mkNP (mkPN "llatí") ;
   
   nounCategory = mkCN (mkN "nom") ;
 
   verbCategory = mkCN (mkN "verb") ;
   adjectiveCategory = mkCN (mkN "adjectiu") ;
   adverbCategory = mkCN (mkN "adverbi" "adverbis" masculine) ;
   sentenceCategory = mkCN (mkN "oració" feminine) ;
   nounPhraseCategory = mkCN (mkA "nominal") (mkN "sintagma" masculine) ;
   verbPhraseCategory = mkCN (mkA "verbal") (mkN "sintagma" masculine) ;
   transitiveVerbCategory = mkCN (mkA "transitiu") (mkN "verb") ;
   pronounCategory = mkCN (mkN "pronom") ;
   determinerCategory = mkCN (mkN "determinant") ;
   relativePronounCategory = mkCN (mkA "relatiu") (mkN "pronom") ;
   interrogativePronounCategory = mkCN (mkA "interrogatiu") (mkN "pronom") ;
   conjunctionCategory = mkCN (mkN "conjunció" feminine) ;
   subjunctionCategory = mkCN (mkN "subjunció" feminine) ;
   particleCategory = mkCN (mkN "partícula") ;
   articleCategory = mkCN (mkN "article") ;
   prepositionCategory = mkCN (mkN "preposició" feminine) ;
   interjectionCategory = mkCN (mkN "interjecció" feminine) ;

   utteranceCategory = mkCN (mkN "acte de parla" "actes de parla" masculine) ;
   questionCategory = mkCN (mkN "pregunta") ;
   relativeClauseCategory = mkCN (mkA "relatiu") (mkN "oració" feminine) ;
   adjectivalPhraseCategory = mkCN (mkA "adjectival") (mkN "oració" feminine) ;
   adverbialPhraseCategory = mkCN (mkA "adverbial") (mkN "oració" feminine) ;

   numberParameterType = mkCN (mkN "número") ;
   caseParameterType = mkCN (mkN "cas") ;
  
   genderParameterType = mkCN (mkN "gènere") ;
   personParameterType = mkCN (mkN "persona") ;
   tenseParameterType = mkCN (mkN "temps" "temps" masculine) ;

   singularParameterValue   = mkParameterValue "singular" ;
   pluralParameterValue     = mkParameterValue "plural" ;
   
   nominativeParameterValue = mkParameterValue "nominatiu" ;
   genitiveParameterValue   = mkParameterValue "genitiu" ;
   accusativeParameterValue = mkParameterValue "accusatiu" ;

   masculineParameterValue = mkParameterValue "masculí" ;
   feminineParameterValue  = mkParameterValue "femení" ;
   neuterParameterValue    = mkParameterValue "neutre" ;

   firstParameterValue  = mkParameterValue "primera persona" ;
   secondParameterValue = mkParameterValue "segona persona" ;
   thirdParameterValue  = mkParameterValue "tercera persona" ;

   presentParameterValue = mkParameterValue "present" ;
   pastParameterValue = mkParameterValue "passat" ;
   futureParameterValue = mkParameterValue "futur" ;

   indicativeParameterValue = mkParameterValue "indicatiu" ;
   conjunctiveParameterValue = mkParameterValue "conjuntiu" ;
   imperativeParameterValue = mkParameterValue "imperatiu" ;
   participleParameterValue = mkParameterValue "participi" ;
   infinitiveParameterValue = mkParameterValue "infinitiu" ;

   BaseCategory c = mkNP a_Det c ;
   ConsCategory c cs = mkNP and_Conj (mkNP a_Det c) cs ;
   
   BaseParameterValue pv = pv ;
   ConsParameterValue pv pvs = mkNP and_Conj pv pvs ;

   BaseParameterType pt = {bare = mkNP pt ; indef = mkNP pt} ;
   ConsParameterType pt pts = {bare = mkNP and_Conj (mkNP pt) pts.bare ; indef = mkNP and_Conj (mkNP pt) pts.indef} ;

oper
   mkParameterValue = overload {
     mkParameterValue : Str -> NP = \str -> (mkNP the_Det (mkN str)) ;
     mkParameterValue : CN -> NP = \cn -> (mkNP the_Det cn) ;
     } ;
   
}