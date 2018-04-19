abstract Linguistics = {

-- a grammar for expressing linguistic rules
-- the beginning of a possible Lab2 - not yet final!

flags startcat = Rule ;

cat
   Rule ;
   Language ;
   Category ;
   ParameterType ;
   ParameterValue ;
   [ParameterType] ;
   [ParameterValue] ;
   [Category] ;
   Word ;

fun
   categoryInflectedRule  : Category -> [ParameterType] -> Rule ;             -- nouns are inflected for number and case
   categoryInherentRule  : Category -> [ParameterType] -> Rule ;             -- nouns have a fixed gender
   parameterValueRule    : ParameteType -> [ParameterValue] -> Rule ;   -- the cases are the nominative and the genitive
   
   wordFormRule       : ParameterValue -> Category -> Word -> Word -> Rule ;  -- the plural nominative of the noun "ox" is "oxen"
   wordInherentRule  : ParameterValue -> Category -> Word -> Word -> Rule ;  -- the gender of the noun "foi" is feminine
   
   wordCategoryRule         : Word -> Category -> Rule ;           -- "foi" is a noun
   syntaxCombinationRule : Category -> [Category] -> Rule ;   -- a sentence can be formed from a noun phrase and a verb phrase
   agreementRule              : Category -> Category -> [ParameterType] -> Rule ;     -- the adjective agrees to the noun in number and gender
   orderBeforeRule            : Category -> Category -> Rule ;     -- the adjective is placed before the noun
   orderAfterRule              : Category -> Category -> Rule ;     -- the adjective is placed after the noun
   
 
   
   


}