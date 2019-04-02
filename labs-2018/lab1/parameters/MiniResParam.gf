resource MiniResParam = open Prelude in {

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
    s : Number => Case => Str ;
    g : Gender ;
    } ;

  mkNoun  : (sgNom,sgAcc,plNom,plAcc : Str) -> Gender -> Noun
    = \sgNom,sgAcc,plNom,plAcc,g -> {
      s = table {
        Sg => table {
	  Nom => sgNom ;
	  Acc => sgAcc
	  } ;
        Pl => table {
	  Nom => plNom ;
	  Acc => plAcc
	  }
        } ;
      g = g ;
      } ;
  

  -- smart paradigm
  smartNoun : Str -> Noun = \sgNom -> case sgNom of {
    s + "us" => mkNoun s (s + "um") (s + "i") (s + "os") Masc ;
    s + "a"  => mkNoun s (s + "am") (s + "ae") (s + "as") Fem ;
    s + "e"  => mkNoun s (s + "em") (s + "es") (s + "es") Fem ;
    _        => mkNoun sgNom sgNom sgNom sgNom Masc  ----
    } ;

  mkN = overload {
   mkN : Str -> Noun = smartNoun ;
   mkN : Str -> Gender -> Noun = \s,g -> smartNoun s ** {g = g} ;
   mkN : (sgNom,sgAcc,plNom,plAcc : Str) -> Gender -> Noun = mkNoun ;
   } ;

  ProperName : Type = {
    s : Case => Str ;
    g : Gender
    } ;

  mkProperName : (nom,acc : Str) -> Gender -> ProperName
    = \nom,acc,g -> {
      s = table {
        Nom => nom ;
	Acc => acc
	} ;
      g = g ;
      } ;

  mkPN = overload {
    mkPN : Str -> ProperName = \s -> mkProperName s s Masc ;
    mkPN : (nom,acc : Str) -> Gender -> ProperName = mkProperName ;
    } ;

  Adjective : Type = {
    s : Gender => Number => Case => Str
    } ;

  mkAdjective : Noun -> Noun -> Adjective =
    \m,f -> {
      s = table {
        Masc => m.s ;
	Fem  => f.s
      } ;
    } ;

  mkA = overload {
    mkA : Str -> Adjective = \s -> mkAdjective (mkN s) (mkN s) ; ----
    } ;

  Verb : Type = {
    s : Number => Person => Str
    } ;

  mkVerb : (sg1,sg2,sg3,pl1,pl2,pl3 : Str) -> Verb
    = \sg1,sg2,sg3,pl1,pl2,pl3 -> {
      s = table {
        Sg => table {
	  P1 => sg1 ;
	  P2 => sg2 ;
	  P3 => sg3
	  } ;
        Pl => table {
	  P1 => pl1 ;
	  P2 => pl2 ;
	  P3 => pl3
	  }
	} ;
      } ;


  smartVerb : Str -> Verb = \inf -> case inf of {
    s + "are" => mkVerb (s + "o") (s + "as") (s + "at") (s + "amus") (s + "atis") (s + "ant") ; 
    s +  "re" => mkVerb (s + "o") (s + "s") (s + "t") (s + "mus") (s + "tis") (s + "nt") ;
    _ => mkVerb inf inf inf inf inf inf  --Predef.error "expected -re"
    } ;
 
  mkV = overload {
    mkV : Str -> Verb = smartVerb ;
    mkV : (sg1,sg2,sg3,pl1,pl2,pl3 : Str) -> Verb = mkVerb ;
    } ;

  Verb2 : Type = Verb ** {c : Complement} ;

  Complement : Type = {prep : Str ; c : Case} ;

  mkV2 = overload {
    mkV2 : Str -> Verb2 = \s -> mkV s ** {c = {prep = [] ; c = Acc}} ; -- direct transitive
    } ;

  Adverb : Type = {s : Str} ;

  mkAdv : Str -> Adverb = \s -> {s = s} ;

  Determiner : Type = {s : Gender => Case => Str ; n : Number} ;

  mkDeterminer : (mNom,mAcc,fNom,dAcc : Str) -> Number -> Determiner
    = \mNom,mAcc,fNom,fAcc,n -> {
      s = table {
        Masc => table {
	  Nom => mNom ;
	  Acc => mAcc 
	  } ;
        Fem => table {
	  Nom => fNom ;
	  Acc => fAcc 
	  }
	} ;
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

  copula : Verb = mkV "sum" "es" "est" "sumus" "estis" "sunt" ;

  negation : Polarity -> Str = \p -> case p of {
    Pos => [] ;
    Neg => "non"
    } ;

}
