resource MiniResCat = open Prelude in {


param
  Number   = Sg | Pl ;
  Gender   = Masc | Fem ;
  Case     = Nom | ENom | Acc ;
  Person   = P1 | P2 | P3 ;
  Polarity = Pos | Neg ;


oper
  Agr : Type = {g : Gender ; n : Number ; p : Person} ;

  Noun : Type = {
    s : Number => Str ;
    g : Gender ;
  } ;

  mkNoun  : (sg,pl : Str) -> Gender -> Noun
    = \sg,pl,g -> {
      s = table {
        Sg => sg ;
        Pl => pl
      } ;
      g = g ;
    } ;

  smartNoun : Str -> Noun = \sg -> case sg of {
    ("pa"|"vi") => mkNoun sg (sg + "ns") Masc ;
    {- The following rule is only valid for cases like "gos"(sg)-"gossos"(pl) where the s is pronounced as a voiceless [s].
    There are others like "cas"(sg)-"casos"(pl) where the "s" is the voiced [z].
    They cannot be distinguished in their singular written form, but it affects the written form of the plural: -ss- for [s] and -s- for [z].-}
    s + "s" => mkNoun sg (s + "ssos") Masc ; 
    s + "x" => mkNoun sg (sg + "os") Masc ; --There are some exceptions like "apèndix"(sg)-"apèndixs"(pl).
    s + ("o"|"ó") => mkNoun sg (sg + "ns") Masc ;
    s + "ca" => mkNoun sg (s + "ques") Fem ;
    s + "ga" => mkNoun sg (s + "gues") Fem ;
    s + "a" => mkNoun sg (s + "es") Fem ;
    _       => mkNoun sg (sg + "s") Masc
  } ;

  mkN = overload {
    mkN : Str -> Noun = smartNoun ;
    mkN : Str -> Gender -> Noun = \s,g -> smartNoun s ** {g = g} ;
    mkN : (sg,pl : Str) -> Gender -> Noun = mkNoun ;
  } ;


  ProperName : Type = {
    s : Str ;
    g : Gender
  } ;

  mkProperName : Str -> Gender -> ProperName
    = \nom,g -> {
      s = nom ;
      g = g ;
    } ;

  mkPN = overload {
    mkPN : Str -> ProperName = \s -> mkProperName s Masc;
    mkPN : Str -> Gender -> ProperName = mkProperName ;
  } ;


  Adjective : Type = {
    s : Gender => Number => Str
  } ;

  mkAdjective : Noun -> Noun -> Adjective = 
    \m,f -> {
      s = table {
        Masc => m.s ;
        Fem  => f.s
      } ;
    } ;

  smartAdjective : Str -> Adjective = \sg -> case sg of {
    ("dolent"|"calent") => mkAdjective (mkN sg) (mkN (sg + "a")) ;
    "jove" => mkAdjective (mkN sg) (mkN sg) ;
    "bo" => mkAdjective (mkN sg) (mkN (sg + "na")) ;
    s + "au" => mkAdjective (mkN sg) (mkN (s + "ava")) ;
    s + "iu" => mkAdjective (mkN sg) (mkN (s + "iva")) ;
    s + "ou" => mkAdjective (mkN sg) (mkN (s + "ova")) ;
    s + "oc" => mkAdjective (mkN sg) (mkN (s + "oga")) ;
    s + "at" => mkAdjective (mkN sg) (mkN (s + "ada")) ;
    s + "e" => mkAdjective (mkN sg) (mkN (s + "a")) ;
    s + ("n"|"nt") => mkAdjective (mkN sg) (mkN sg) ;
    _       => mkAdjective (mkN sg) (mkN (sg + "a"))
  } ;

  mkA = overload {
    mkA : Str -> Adjective = smartAdjective ;
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
    -- Irregular verbs
    "anar" => mkVerb ("vaig") ("vas") ("va") ("anem") ("aneu") ("van") ;
    "estar" => mkVerb ("estic") ("estàs") ("està") ("estem") ("esteu") ("estan") ;
    "ser" => mkVerb ("sóc") ("ets") ("és") ("som") ("sou") ("són") ;
    "beure" => mkVerb ("bec") ("beus") ("beu") ("bevem") ("beveu") ("beuen") ;
    "entendre" => mkVerb ("entenc") ("entens") ("entén") ("entenem") ("enteneu") ("entenen") ;
    "veure" => mkVerb ("veig") ("veus") ("veu") ("veiem") ("veieu") ("veuen") ;
    "viure" => mkVerb ("visc") ("vius") ("viu") ("vivim") ("viviu") ("viuen") ;
    "venir" => mkVerb ("vinc") ("véns") ("ve") ("venim") ("veniu") ("vénen") ;
    -- Regular verbs
    -- First conjugation (-ar)
    s + "gar" => mkVerb (s + "go") (s + "gues") (s + "ga") (s + "guem") (s + "gueu") (s + "guen") ;
    s + "jar" => mkVerb (s + "jo") (s + "ges") (s + "ja") (s + "gem") (s + "geu") (s + "gen") ;
    s + "car" => mkVerb (s + "co") (s + "ques") (s + "ca") (s + "quem") (s + "queu") (s + "quen") ;
    s + "ar" => mkVerb (s + "o") (s + "es") (s + "a") (s + "em") (s + "eu") (s + "en") ; 
    -- Second conjugation (-re/-er)
    s + "córrer" => mkVerb (s + "corro") (s + "corres") (s + "corre") (s + "correm") (s + "correu") (s + "corren") ;
    s + "re" => mkVerb (s + "o") (s + "s") s (s + "em") (s + "eu") (s + "en") ;
    -- All (or almost all) the infinitives with -er termination have written accent (e.g. "córrer"), but this is not in the majority of the verb forms.
    s + "er" => mkVerb (s + "o") (s + "s") s (s + "em") (s + "eu") (s + "en") ;
    -- Third conjugation (-ir)
    --The 3rd conjugation verbs have two regular verb paradigms. They cannot be distinguished by any trait of the infinitive form.
    "dormir" => mkVerb ("dormo") ("dorms") ("dorm") ("dormim") ("dormiu") ("dormen") ; 
    s + "ir" => mkVerb (s + "eixo") (s + "eixes") (s + "eix") (s + "im") (s + "iu") (s + "eixen") ; --Of the two regular forms with -ir verbs, this is the most common
    _ => mkVerb inf inf inf inf inf inf
  } ;

  mkV = overload {
    mkV : Str -> Verb = smartVerb ;
    mkV : (sg1,sg2,sg3,pl1,pl2,pl3 : Str) -> Verb = mkVerb ;
  } ;


  Verb2 : Type = Verb ** {c : Complement} ;

  Complement : Type = {prep : Str ; c : Case} ;

  mkV2 = overload {
    mkV2 : Str -> Verb2 = \s -> mkV s ** {c = {prep = ([]|["a"]) ; c = Acc}} ;
  } ;
  {-
  I have written an alternative with preposition "a" as it is used in direct objects with pronouns.
    "Ella veu a tú" = "She sees you" 
      Note: in fact, it should be "Ella et veu a tú", but my Mini resource grammar is not capable of dealing with clitics.
  I have kept also the possibility of direct objects without the preposition because it is the standard when the direct object is a Noun.
    "Ella veu el gos" = "She sees the dog"
  But "a" can also appear even if the core of the direct object is not a pronoun.
    "Trobo a la noia" = "I find the girl"
  -}


  Adverb : Type = {s : Str} ;

  mkAdv : Str -> Adverb = \s -> {s = s} ;


  Determiner : Type = {
    s : Gender => Str ;
    n : Number 
  } ;

  mkDeterminer : (m,f : Str) -> Number -> Determiner
    = \m,f,n -> {
      s = table {
        Masc => m ;
        Fem => f
      } ;
      n = n ;
    } ;


  Pronoun : Type = {
    s : Case => Str ;
    a : Agr
  } ;

  mkPronoun : (nom,enom,acc : Str) -> Gender -> Number -> Person -> Pronoun
    = \nom,enom,acc,g,n,p -> {
      s = table {
        Nom => nom ;
        ENom => enom ; --empty nominative case (elliptical subject)
        Acc => acc
      } ;
      a = {g = g ; n = n ; p = p} ;
    } ;


  copula : Verb = smartVerb "ser" ;


  negation : Polarity -> Str = \p -> case p of {
    Pos => [] ;
    Neg => "no"
  } ;

}
