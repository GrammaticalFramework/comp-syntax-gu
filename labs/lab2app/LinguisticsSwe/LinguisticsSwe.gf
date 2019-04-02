concrete LinguisticsSwe of Linguistics =

 open
   SyntaxSwe,
   SymbolicSwe,
   ParadigmsSwe
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
   languageRuleStatement language rule = mkUtt (mkS (SyntaxSwe.mkAdv in_Prep language) rule) ;

   categoryInflectedRule category types = mkS (mkCl (mkNP aPl_Det category) (mkV2 (mkV "böjs") for_Prep) types.bare) ;
   categoryNotInflectedRule category = mkS negativePol (mkCl (mkNP aPl_Det category) (mkV "böjs")) ;

   categoryInherentRule category types = mkS (mkCl (mkNP aPl_Det category) have_V2 types.indef) ;

   parameterTypeRule ptype pvalues = mkS (mkCl (mkNP thePl_Det ptype) pvalues) ;
   parameterValueRule pvalues ptype = mkS (mkCl pvalues ptype) ;

   wordFormRule pvalue category wordlemma wordform = mkS (mkCl (mkNP pvalue (SyntaxSwe.mkAdv possess_Prep (mkNP the_Det (mkCN category wordlemma)))) wordform) ;
   wordInherentRule ptype category word pvalue = mkS (mkCl (mkNP (mkNP the_Det ptype) (SyntaxSwe.mkAdv possess_Prep (mkNP the_Det (mkCN category word)))) pvalue) ;

   wordCategoryRule word category = mkS (mkCl word category) ;
   syntaxCombinationRule category categories = mkS (mkCl (mkNP a_Det category) can_VV (mkVP (passiveVP (mkV2 "forma")) (SyntaxSwe.mkAdv from_Prep categories))) ;

   agreementRule cat1 cat2 ptypes = mkS (mkCl (mkNP the_Det cat1) (mkVP (mkVP (mkV2 (mkV "kongruera") with_Prep) (mkNP the_Det cat2)) (SyntaxSwe.mkAdv in_Prep ptypes.bare))) ;
   orderBeforeRule cat1 cat2 = mkS (mkCl (mkNP the_Det cat1) (mkVP (passiveVP (mkV2 "placera")) (SyntaxSwe.mkAdv before_Prep (mkNP the_Det cat2)))) ;
   orderAfterRule cat1 cat2 = mkS (mkCl (mkNP the_Det cat1) (mkVP (passiveVP (mkV2 "placera")) (SyntaxSwe.mkAdv after_Prep (mkNP the_Det cat2)))) ;

   stringWord string = symb ("//" ++ string.s ++ "//") ;

   englishLanguage = mkNP (mkPN "engelska") ;
   swedishLanguage = mkNP (mkPN "svenska") ;
   latinLanguage = mkNP (mkPN "latin") ;

   nounCategory = mkCN (mkN "substantiv" "substantiv") ;
   pronounCategory = mkCN (mkN "pronomen" "pronomen") ;
   interrogativePronounCategory = mkCN (mkA "interrogativ") (mkN "pronomen" "pronomen") ;
   relativePronounCategory = mkCN (mkA "relativ") (mkN "pronomen" "pronomen") ;
   articleCategory = mkCN (mkN "artikel" "artiklar") ;
   determinerCategory = mkCN (mkN "determinerare" "determinerare") ;
   particleCategory = mkCN (mkN "partikel" "partiklar") ;

   utteranceCategory = mkCN (mkN "yttrande" "yttranden") ;
   sentenceCategory = mkCN (mkN "mening" "meningar") ;
   questionCategory = mkCN (mkN "fråga" "frågor") ;
   relativeClauseCategory = mkCN (mkN "relativsats" "relativsatser") ;

   verbCategory = mkCN (mkN "verb" "verb") ;
   adjectiveCategory = mkCN (mkN "adjektiv" "adjektiv") ;
   adverbCategory = mkCN (mkN "adverb" "adverb") ;
   conjunctionCategory = mkCN (mkN "konjunktion" "konjunktioner") ;
   subjunctionCategory = mkCN (mkN "subjunktion" "subjunktioner") ;
   interjectionCategory = mkCN (mkN "interjektion" "interjektioner") ;
   prepositionCategory = mkCN (mkN "preposition" "prepositioner") ;
   nounPhraseCategory = mkCN (mkN "nominalfras" "nominalfraser") ;
   verbPhraseCategory = mkCN (mkN "verbfras" "verbfraser") ;
   adjectivalPhraseCategory = mkCN (mkN "adjektivfras" "adjektivfraser") ;
   adverbialPhraseCategory = mkCN (mkN "adverbfras" "adverbfraser") ;
   transitiveVerbCategory = mkCN (mkA "transitiv" "transitivt" "transitiva") (mkN "verb" "verb") ;

   numberParameterType = mkCN (mkN "numerus" "numerus" "numerus" "numerus") ;
   caseParameterType = mkCN (mkN "kasus" "kasus" "kasus" "kasus") ;

   genderParameterType = mkCN (mkN "genus" "genuset" "genus" "genusen") ;
   personParameterType = mkCN (mkN "person" "person" "person" "person") ;
   tenseParameterType = mkCN (mkN "tempus" "tempuset" "tempus" "tempusen") ;

   singularParameterValue   = mkParameterValue (mkCN (mkN "singular" "singularet" "singular" "singularen")) ;
   pluralParameterValue     = mkParameterValue (mkCN (mkN "plural" "pluralen" "plural" "plural")) ;

   nominativeParameterValue = mkParameterValue (mkCN (mkN "nominativ" "nominativet" "nominativ" "nominativen")) ;
   genitiveParameterValue   = mkParameterValue (mkCN (mkN "genitiv" "genitivet" "genitiv" "genitiven")) ;
   accusativeParameterValue = mkParameterValue (mkCN (mkN "ackusativ" "ackusativet" "ackusativ" "ackusativen")) ;

   masculineParameterValue = mkParameterValue (mkCN (mkN "maskulinum" "maskulinum" "maskulinum" "maskulinum")) ;
   feminineParameterValue  = mkParameterValue (mkCN (mkN "femininum" "femininet" "femininum" "femininum")) ;
   neuterParameterValue    = mkParameterValue (mkCN (mkN "neutrum" "neutrumet" "neutrum" "neutrum")) ;
   uterParameterValue      = mkParameterValue (mkCN (mkN "utrum" "utrum" "utrum" "utrum")) ;

   firstParameterValue  = mkParameterValue (mkCN (mkA "första") (mkN "person" "personen" "personer" "personerna")) ;
   secondParameterValue = mkParameterValue (mkCN (mkA "andra") (mkN "person" "personen" "personer" "personerna")) ;
   thirdParameterValue  = mkParameterValue (mkCN (mkA "tredje") (mkN "person" "personen" "personer" "personerna")) ;

   presentParameterValue = mkParameterValue (mkCN (mkN "presens" "presens" "presens" "presens")) ;
   pastParameterValue = mkParameterValue (mkCN (mkN "preteritum" "preteritum" "preteritum" "presens")) ;
   futureParameterValue = mkParameterValue (mkCN (mkN "futurum" "futurum" "futurum" "futurum")) ;

   infinitiveParameterValue = mkParameterValue (mkCN (mkN "infinitiv" "infinitivet" "infinitiv" "infinitiven")) ;
   indicativeParameterValue = mkParameterValue (mkCN (mkN "indikativ" "indikativet" "indikativ" "indikativen")) ;
   imperativeParameterValue = mkParameterValue (mkCN (mkN "imperativ" "imperativet" "imperativ" "imperativen")) ;
   participleParameterValue = mkParameterValue (mkCN (mkN "particip" "participet" "particip" "participen")) ;
   conjunctiveParameterValue = mkParameterValue (mkCN (mkN "konjunktiv" "konjunktivet" "konjunktiv" "konjunktiven")) ;
   -- When trying to look up the gender of these above words, the only answer I found was that they are "utrum".
   -- This feels ridiculous to me though, and I specifically checked with some other native speakers to confirm my own intuition.
   -- This is the result of that, as my intuition was confirmed.

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
