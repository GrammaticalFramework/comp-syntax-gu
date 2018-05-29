resource MiniResJap = open Prelude in {

param
  Number = Sg | Pl ;
  Case = Nom | Acc ;
  Person = Per1 | Per2 | Per3 ;
  VPol = VPos | VNeg ;
  Position = Top | Init | Prepos ;

  Agreement = Agr Number Person ;

  VForm = Inf ;

oper
  Noun : Type = {s : Str} ;

  mkN : Str -> Noun = \s -> {s = s} ;

  ProperName : Type = {s : Str} ;

  mkPN : Str -> ProperName = \s -> {s = s} ;

  Adjective : Type = {s : Str} ;

  mkA : Str -> Adjective = \s -> {s = s} ;

  Verb : Type = {s : VPol => Str} ;

  mkVerb : Str -> Str -> Verb = \positiveForm,negativeForm -> {
    s = table { VPos => positiveForm ;
                VNeg => negativeForm }
    } ;

  smartVerb : Str -> Verb = \inf -> case inf of {
     -- Irregular verbs
     "kuru" => mkVerb ("kimasu") ("kimasen") ;
     "desu" => mkVerb ("desu") ("dewa arimasen") ;
     "sumu" => mkVerb ("sundeimasu") ("sundeimasen") ;
     "iru" => mkVerb ("imasu") ("imasen") ;
     -- Regular verbs
     -- Godan (consonant-stem verbs)
     s + "mu" => mkVerb (s + "mimasu") (s + "mimasen") ;
     s + "su" => mkVerb (s + "shimasu") (s + "shimasen") ;
     s + "ku" => mkVerb (s + "kimasu") (s + "kimasen") ;
     s + "gu" => mkVerb (s + "gimasu") (s + "gimasen") ;
     s + "tsu" => mkVerb (s + "chimasu") (s + "chimasen") ;
     s + "bu" => mkVerb (s + "bimasu") (s + "bimasen") ;
     s + "shiru" => mkVerb (s + "shimasu") (s + "shimasen") ;
     s + "suru" => mkVerb (s + "shimasu") (s + "shimasen") ;
     -- Ichidan (vowel-stem verbs)
     s + "eru" => mkVerb (s + "emasu") (s + "emasen") ;
     s + "iru" => mkVerb (s + "imasu") (s + "imasen") ;
     _ => mkVerb inf inf
     } ;

  mkV = overload {
    mkV : Str -> Verb = smartVerb ;
    -- mkV : Str -> Verb = \inf -> mkVerb inf ; -- Issues here!
    } ;

  Verb2 : Type = Verb ;

  mkV2 = overload {
    mkV2 : Str         -> Verb2 = \s   -> mkV s ;
    mkV2 : Verb        -> Verb2 = \v   -> v ;
    } ;

  Adverb : Type = {s : Str ; pos : Position} ;

  mkAdv : Str -> Position -> Adverb = \s,p -> {s = s ; pos = p} ;

  emptyAdv : Adverb = mkAdv "" Init ;

  Determiner : Type = {s : Str ; n : Number} ;

  mkDeterminer : (s : Str) -> Number -> Determiner
    = \s,n -> {
      s = s ;
      n = n ;
     } ;

  copula : Verb = mkV "desu" ;

  negation : VPol -> Str = \p -> case p of {
    VPos => [] ;
    VNeg => []
  } ;

}
