resource MiniResMyeng = open Prelude in {

-- change these params to fit your language
param
  Number = Sg | Pl ;
  Gender = Masc | Fem ;
  Case   = Nom | Acc ;
  Person = P1 | P2 | P3 ;
  Polarity = Pos | Neg ;


oper
  Agr : Type = {g : Gender ; n : Number ; p : Person} ;

  Noun : Type = {
    s : Number => Str ;
    g : Gender ;
    } ;

  mkNoun  : (sgNom,plNom : Str) -> Gender -> Noun
    = \sgNom,plNom,g -> {
      s = table {
        Sg => sgNom ;
        Pl => plNom 
        } ;
      g = g ;
      } ;
  

  -- smart paradigm
  smartNoun : Str -> Noun = \sgNom -> case sgNom of {
    _        => mkNoun sgNom (addS sgNom) Masc -- TODO
    } ;

  mkN = overload {
   mkN : Str -> Noun = smartNoun ;
   mkN : Str -> Gender -> Noun = \s,g -> smartNoun s ** {g = g} ;
   mkN : (sgNom,plNom : Str) -> Gender -> Noun = mkNoun ;
   } ;

  ProperName : Type = {
    s : Str ;
    g : Gender
    } ;

  mkProperName : (nom : Str) -> Gender -> ProperName
    = \nom,g -> {
      s = nom ;
      g = g ;
      } ;

  mkPN = overload {
    mkPN : Str -> ProperName = \s -> mkProperName s Masc ; --- TODO Fem
    } ;

  Adjective : Type = {
    s : Str
    } ;

  mkA = overload {
    mkA : Str -> Adjective = \s -> {s = s} ;
    } ;

  Verb : Type = {
    s : Number => Person => Str
    } ;

  mkVerb : (pl,sg1,sg3 : Str) -> Verb
    = \pl,sg1,sg3 -> {
      s = table {
        Sg => table {
	  P1 => sg1 ;
	  P2 => pl ;
	  P3 => sg3
	  } ;
        Pl => table {
	  _ => pl
	  }
	} ;
      } ;


  smartVerb : Str -> Verb = \inf -> case inf of {
    _ => mkVerb inf inf (addS inf)   -- TODO
    } ;
 
  mkV = overload {
    mkV : Str -> Verb = smartVerb ;
    mkV : (pl,sg1,sg3 : Str) -> Verb = mkVerb ;
    } ;

  Verb2 : Type = Verb ** {c : Complement} ;

  Complement : Type = {prep : Str ; c : Case} ;

  mkV2 = overload {
    mkV2 : Str -> Verb2 = \s -> mkV s ** {c = {prep = [] ; c = Acc}} ; -- direct transitive
    } ;

  Adverb : Type = {s : Str} ;

  mkAdv : Str -> Adverb = \s -> {s = s} ;

  Determiner : Type = {s : Str ; n : Number} ;

  mkDeterminer : (s : Str) -> Number -> Determiner
    = \s,n -> {
      s = s ;
      n = n ;
     } ;

  Pronoun : Type = {
    s : Case => Str ;
    a : Agr
    } ;

  mkPronoun : (nom,acc : Str) -> Gender -> Number -> Person -> Pronoun
    = \nom,acc,g,n,p -> {
      s = table {
        Nom => nom ;
	Acc => acc
	} ;
      a = {g = g ; n = n ; p = p} ;
      } ;

  copula : Verb = mkV "are" "am" "is" ;
  
  do_V : Verb = mkV "do" "do" "does" ;
  dont_V : Verb = mkV "don't" "don't" "doesn't" ;

  negation : Polarity -> Str = \p -> case p of {
    Pos => [] ;
    Neg => "not"
    } ;

  addS : Str -> Str = \s -> case s of {
    bab + "y" => bab + "ies" ;
    _   + "s" => s + "es" ;
    _ => s + "s"
    } ;

}
