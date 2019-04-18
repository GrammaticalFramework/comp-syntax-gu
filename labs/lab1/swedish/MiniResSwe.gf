resource MiniResSwe = open Prelude in {

param
  Number = Sg | Pl ;
  Case = Nom | Acc ;
  Species = Indef | Def ;
  Gender = Utr | Neutr ;

  Agreement = Agr Gender Number ;

  -- positive forms of Swe adjectives
  AForm = ASg Gender | APl ;
  
  -- non-participle forms of Swe verbs
  VForm = Inf | Pres | Past | Sup ;

oper
----- nouns ---------------------

  Noun : Type = {s : Number => Species => Str ; g : Gender} ;

  fullNoun : (sgi,sgd,pli,pld : Str) -> Gender -> Noun = \sgi,sgd,pli,pld,g -> {
    s = table {
          Sg => table {Indef => sgi ; Def => sgd} ;
	  Pl => table {Indef => pli ; Def => pld}
	  } ;
    g = g
    } ; 

-- the textbook declensions

   declI : Str -> Noun = \apa ->
     fullNoun apa (apa+"n") (init apa +"or") (init apa+"orna") Utr ;
     
   declII : Str -> Noun = \bil -> case bil of {
     pojk + "e" => fullNoun bil (pojk+"en") (pojk+"ar") (pojk+"arna") Utr ;
     _          => fullNoun bil (bil+"en") (bil+"ar") (bil+"arna") Utr
     } ;
     
   declIII : Str -> Noun = \tant ->
     fullNoun tant (tant+"en") (tant+"er") (tant+"erna") Utr ;
     
   declIV : Str -> Noun = \rike ->
     fullNoun rike (rike+"t") (rike+"n") (rike+"na") Neutr ;

   declV : Str -> Noun = \hus ->
     fullNoun hus (hus+"et") hus (hus+"en") Neutr ;


-- as in dictionaries: "apa, apor"

   dictNoun : (sg,pl : Str) -> Noun = \sg,pl -> case pl of {
     _ + "or" => declI sg ;
     _ + "ar" => declII sg ;
     _ + "er" => fullNoun sg (sg+"en") pl (pl+"na") Utr ;
     _ + "en" => declIV sg ;
     _ => declV sg
     } ;

-- smart paradigm: from one form

   smartNoun : Str -> Noun = \sg -> case sg of {
     _ + "a" => declI sg ;
     _ + "e" => declIV sg ;
     _ + "ing" => declII sg ;
     _ + ("ion" | "het") => declIII sg ;
     _ => declII sg
     } ;

------ adjectives ------------------------------

  Adjective : Type = {s : AForm => Str} ;

  fullAdjective : (utr,neutr,pl : Str) -> Adjective = \utr,neutr,pl -> {
    s = table {ASg Utr => utr ; ASg Neutr => neutr ; APl => pl}
    } ;

  smartAdjective : Str -> Adjective = \utr -> case utr of {
    _  + "tt" => fullAdjective utr utr (utr + "a") ;
    go + "d" => fullAdjective utr (go + "tt") (utr + "a") ;
    _ => fullAdjective utr (utr + "t") (utr + "a")
    } ;


----- verbs ------------------------------------

  Verb : Type = {s : VForm => Str} ;

  mkVerb : (inf,pres,past,sup : Str) -> Verb
    = \inf,pres,past,sup -> {
    s = table {
      Inf => inf ;
      Pres => pres ;
      Past => past ;
      Sup  => sup
      }
    } ;

  conjI : Str -> Verb = \tala ->
    mkVerb tala (tala + "r") (tala + "de") (tala + "t") ;
    
  conjII : Str -> Verb = \leka ->
    let lek = init leka
    in
    case lek of {
      _ + ("k"|"p"|"t") => mkVerb leka (lek + "er") (lek + "te") (lek + "t") ;
      _                 => mkVerb leka (lek + "er") (lek + "de") (lek + "t")
      } ;

  conjIII : Str -> Verb = \ske ->
    mkVerb ske (ske + "r") (ske + "dde") (ske + "tt") ;

  smartVerb : Str -> Verb = \w -> case w of {
    lek + "er" => conjII (lek+"a") ;
    lek + ("ar"|"a") => conjI (lek+"a") ;
    _ => conjIII w
    } ;

  irregVerb : (inf,past,sup : Str) -> Verb = \inf,past,sup ->
    mkVerb inf (init inf + "er") past sup ;

-- two-place verb with "case" as preposition; for transitive verbs, c=[]

  Verb2 : Type = Verb ** {c : Str} ;

----- syntax --------------------------------

  negation : Bool -> Str = \b -> case b of {True => [] ; False => "inte"} ; 

}