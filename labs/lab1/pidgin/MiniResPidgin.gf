resource MiniResPidgin = open Prelude in {

oper
  Noun : Type = {s : Str} ;

  mkNoun  : Str -> Noun = \s -> {s = s} ;
  
  regNoun : Str -> Noun = \s -> mkNoun s ;

  -- smart paradigm
  smartNoun : Str -> Noun = \sg -> case sg of {
    _       => regNoun sg
    } ;

  mkN = overload {
   mkN : Str -> Noun = smartNoun ;
   } ;

  ProperName : Type = {s : Str} ;

  mkPN : Str -> ProperName = \s -> {s = s} ;

  Adjective : Type = {s : Str} ;

  mkA : Str -> Adjective = \s -> {s = s} ;

  Verb : Type = {s : Str} ;

  mkVerb : Str -> Verb = \inf -> {s = inf} ;

  smartVerb : Str -> Verb = \inf -> mkVerb inf ;
 
  mkV = overload {
    mkV : Str -> Verb = smartVerb ;
    } ;

  Verb2 : Type = Verb ; 

  mkV2 = overload {
    mkV2 : Str -> Verb2 = \s   -> mkV s ;
    } ;

  Adverb : Type = {s : Str} ;

  mkAdv : Str -> Adverb = \s -> {s = s} ;

  be_Verb : Verb = mkV "be" ;

}
