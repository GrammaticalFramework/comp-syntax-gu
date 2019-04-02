abstract Linguistics = {

-- a grammar for expressing linguistic rules
-- the beginning of a possible Lab2 - not yet final!

flags startcat = Statement ;

cat
   Statement ;
   Rule ;
   Language ;
   Category ;
   ParameterType ;
   ParameterValue ;
   [ParameterType] {1} ;
   [ParameterValue] {1} ;
   [Category] {1} ;
   Word ;

fun
   ruleStatement         :             Rule -> Statement ;  -- 
   languageRuleStatement : Language -> Rule -> Statement ;  -- 

   categoryInflectedRule    : Category      -> [ParameterType]  -> Rule ;        -- nouns inflect for number and case
   categoryNotInflectedRule : Category                          -> Rule ;        -- nouns are not inflected
   categoryInherentRule     : Category      -> [ParameterType]  -> Rule ;        -- nouns have a gender
   parameterTypeRule        : ParameterType -> [ParameterValue] -> Rule ;        -- the cases are the nominative and the genitive
   parameterValueRule       : [ParameterValue] -> ParameterType -> Rule ;        -- the masculine is a gender
   
   wordFormRule          : ParameterValue  -> Category -> Word -> Word           -> Rule ; -- the plural of the noun //goose// is //geese//
   wordInherentRule      : ParameterType   -> Category -> Word -> ParameterValue -> Rule ; -- the gender of the noun //domus// is feminine
   
   wordCategoryRule      : Word     -> Category -> Rule ;                        -- //domus// is a noun
   syntaxCombinationRule : Category -> [Category] -> Rule ;                      -- a sentence can be formed from a noun phrase and a verb phrase
   agreementRule         : Category -> Category -> [ParameterType] -> Rule ;     -- the adjective agrees with the noun in number and gender
   orderBeforeRule       : Category -> Category -> Rule ;                        -- the adjective is placed before the noun
   orderAfterRule        : Category -> Category -> Rule ;                        -- the adjective is placed after the noun

   stringWord : String -> Word ; -- //goose//
   
   englishLanguage : Language ;
   swedishLanguage : Language ;
   latinLanguage   : Language ;
   
   nounCategory           : Category ;
   verbCategory           : Category ;
   adjectiveCategory      : Category ;
   adverbCategory         : Category ;
   sentenceCategory       : Category ;
   nounPhraseCategory     : Category ;
   verbPhraseCategory     : Category ;
   transitiveVerbCategory : Category ;
   pronounCategory : Category ;
   determinerCategory : Category ;
   relativePronounCategory : Category ;
   interrogativePronounCategory : Category ;
   conjunctionCategory : Category ;
   subjunctionCategory : Category ;
   particleCategory : Category ;
   articleCategory : Category ;

   utteranceCategory : Category ;
   questionCategory : Category ;
   relativeClauseCategory : Category ;
   adjectivalPhraseCategory : Category ;
   adverbialPhraseCategory : Category ;

   numberParameterType : ParameterType ;
   caseParameterType   : ParameterType ;
   genderParameterType : ParameterType ;
   personParameterType : ParameterType ;
   tenseParameterType  : ParameterType ;

   singularParameterValue   : ParameterValue ;
   pluralParameterValue     : ParameterValue ;
   
   nominativeParameterValue : ParameterValue ;
   genitiveParameterValue   : ParameterValue ;
   accusativeParameterValue : ParameterValue ;

   masculineParameterValue : ParameterValue ;
   feminineParameterValue  : ParameterValue ;
   neuterParameterValue    : ParameterValue ;

   firstParameterValue  : ParameterValue ;
   secondParameterValue : ParameterValue ;
   thirdParameterValue  : ParameterValue ;

   presentParameterValue : ParameterValue ;
   pastParameterValue    : ParameterValue ;
   futureParameterValue  : ParameterValue ;

   indicativeParameterValue  : ParameterValue ;
   conjunctiveParameterValue  : ParameterValue ;
   imperativeParameterValue  : ParameterValue ;
   participleParameterValue  : ParameterValue ;
   
}