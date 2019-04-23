--# -path=.:../abstract

resource MiniParadigmsSwe = open

  MiniGrammarSwe,
  MiniResSwe
  
in {

oper
  mkN = overload {
    mkN : Str -> Noun   -- predictable noun, e.g. flicka-flickor, rike-riken
      = \n -> lin N (smartNoun n) ;
    mkN : (sg,pl : Str) -> Noun  -- regular noun, when plural is known, e.g. bil-bilar, hus-hus
      = \sg,pl -> lin N (dictNoun sg pl) ;
    mkN : (sgi,sgd,pli,pld : Str) -> Gender -> Noun  -- full forms and gender
      = \sgi,sgd,pli,pld,g -> lin N (fullNoun sgi sgd pli pld g) ;
    } ;

  mkPN = overload {
    mkPN : Str -> PN
      = \s -> lin PN {s = s ; g = Utr} ;
    mkPN : Str -> Gender -> PN
      = \s,g -> lin PN {s = s ; g = g} ;
    } ;

  mkA = overload {
    mkA : Str -> A
     = \s -> lin A (smartAdjective s) ;
    mkA : (utr,neutr,pl : Str) -> A
     = \utr,neutr,pl -> lin A (fullAdjective utr neutr pl) ;
    } ;
    
  mkV = overload {
    mkV : Str -> V  -- predictable verb; better with present tense, e.g. hittar, leker
      = \s -> lin V (smartVerb s) ;
    mkV : (inf,past,sup : Str) -> V  -- irregular verb, e.g. dricka-drack-druckit
      = \inf,past,sup -> lin V (irregVerb inf past sup) ;
    mkV : (inf,pres,past,sup,imp : Str) -> V
    = \inf,pres,past,sup,imp -> lin V (fullVerb inf pres past sup imp) ;
    } ;

  mkV2 = overload {
    mkV2 : Str -> V2          -- predictable verb with direct object, e.g. "dräper"
      = \s   -> lin V2 (smartVerb s ** {c = []}) ;
    mkV2 : Str -> Str -> V2  -- predictable verb with preposition, e.g. "titta - på"
      = \s,p -> lin V2 (smartVerb s ** {c = p}) ;
    mkV2 : V -> V2            -- any verb with direct object, e.g. dricka_V
      = \v   -> lin V2 (v ** {c = []}) ;
    mkV2 : V -> Str -> V2     -- any verb with preposition
      = \v,p -> lin V2 (v ** {c = p}) ;
    } ;

  mkAdv : Str -> Adv
    = \s -> lin Adv {s = s} ;
  
  mkPrep : Str -> Prep
    = \s -> lin Prep {s = s} ;

}