concrete LinguisticsGF of Linguistics =

 open
   Prelude
 in {

lincat
   Statement = Str ;
   Rule = Str ;
   Language = Str ;
   Category = Str ;
   ParameterType = Str ;
   ParameterValue = Str ;
   [ParameterType] = Str ;
   [ParameterValue] = Str ;
   [Category] = Str ;
   Word = Str ;

lin
   ruleStatement rule = rule ++ ";" ;
   languageRuleStatement language rule = rule ++ ";" ++ "--" ++ language ;

   categoryInflectedRule category types = "lincat" ++ category ++ "=" ++ types ++ "=>" ++ "Str" ;
   categoryNotInflectedRule category = "lincat" ++ category ++ "=" ++ "Str" ;
  
   categoryInherentRule category types = "oper" ++ "inherent" ++ ":" ++ category ++ "->" ++ types ;

   parameterTypeRule ptype pvalues = "param" ++ ptype ++ "=" ++ pvalues ;
   parameterValueRule pvalues ptype = "--" ++ ptype ++ "=" ++ pvalues ++ "|" ++ "..." ;
  
   wordFormRule pvalue category wordlemma wordform = "fun" ++ wordlemma ++ ":" ++ category ++ ";" ++ "--" ++ wordlemma ++ "!" ++ pvalue ++ "=" ++ quoted wordform ;
   wordInherentRule ptype category word pvalue = "fun" ++ word ++ ":" ++ category ++ ";" ++ "--" ++ word ++ "." ++ ptype ++ "=" ++ pvalue ;

   wordCategoryRule word category = "fun" ++ word ++ ":" ++ category ;
   syntaxCombinationRule category categories = "fun" ++ "F" ++ ":" ++ categories ++ "->" ++ category ;

   agreementRule cat1 cat2 ptypes = "--" ++ cat1 ++ "!" ++ cat2 ++ "." ++ ptypes ;
   orderBeforeRule cat1 cat2 = "--" ++ cat1 ++ "++" ++ cat2 ;
   orderAfterRule cat1 cat2 = "--" ++ cat2 ++ "++" ++ cat1 ;

   stringWord string = string.s ;
   
   englishLanguage = "Eng" ;
   swedishLanguage = "Swe" ;
   latinLanguage = "Lat" ;
   
   nounCategory = "N" ;
 
   verbCategory = "V" ;
   adjectiveCategory = "A" ;
   adverbCategory = "Adv" ;
   sentenceCategory = "S" ;
   nounPhraseCategory = "NP" ;
   verbPhraseCategory = "VP" ;
   transitiveVerbCategory = "TV" ;

   numberParameterType = "Number" ;
   caseParameterType = "Case" ;
  
   genderParameterType = "Gender" ;
   personParameterType = "Person" ;
   tenseParameterType = "Tense" ;

   singularParameterValue   = "Sg" ;
   pluralParameterValue     = "Pl" ;
   
   nominativeParameterValue = "Nom" ;
   genitiveParameterValue   = "Gen" ;
   accusativeParameterValue = "Acc" ;

   masculineParameterValue = "Masc" ;
   feminineParameterValue  = "Fem" ;
   neuterParameterValue    = "Neutr" ;

   firstParameterValue  = "P1" ;
   secondParameterValue = "P2" ;
   thirdParameterValue  = "P3" ;
   
   presentParameterValue = "Pres" ;
   pastParameterValue = "Past" ;
   futureParameterValue = "Fut" ;

   BaseCategory c = c ;
   ConsCategory c cs = c ++ "->" ++ cs ;
   
   BaseParameterValue pv = pv ;
   ConsParameterValue pv pvs = pv ++ "|" ++ pvs ;

   BaseParameterType pt = pt ;
   ConsParameterType pt pts = pt ++ "*" ++ pts ;

oper
  quoted : Str -> Str = \str -> "\"" ++ str ++ "\"" ;
   
}