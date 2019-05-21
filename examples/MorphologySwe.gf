resource MorphologySwe = open Prelude in {

param
  Number = Sg | Pl ;
  Species = Indef | Def ;
  Gender = Utr | Neutr ;

  Case = Nom | Gen ;

oper
  N : Type = {s : Number => Species => Case => Str ; g : Gender} ;

  fullN : (sgi,sgd,pli,pld : Str) -> Gender -> N = \sgi,sgd,pli,pld,g -> {
    s = table {
          Sg => table {Indef => addCase sgi ; Def => addCase sgd} ;
	  Pl => table {Indef => addCase pli ; Def => addCase pld}
	  } ;
    g = g
    } ; 

  addCase : Str -> Case => Str = \s ->
    table {Nom => s ; Gen => s + "s"} ;

-- the textbook declensions

   declI : Str -> N = \apa ->
     fullN apa (apa+"n") (init apa +"or") (init apa+"orna") Utr ;
     
   declII : Str -> N = \bil -> case bil of {
     pojk + "e" => fullN bil (pojk+"en") (pojk+"ar") (pojk+"arna") Utr ;
     _          => fullN bil (bil+"en") (bil+"ar") (bil+"arna") Utr
     } ;
     
   declIII : Str -> N = \tant ->
     fullN tant (tant+"en") (tant+"er") (tant+"erna") Utr ;
     
   declIV : Str -> N = \rike ->
     fullN rike (rike+"t") (rike+"n") (rike+"na") Neutr ;

   declV : Str -> N = \hus ->
     fullN hus (hus+"et") hus (hus+"en") Neutr ;


-- as in dictionaries: "apa, apor"

   dictN : (sg,pl : Str) -> N = \sg,pl -> case pl of {
     _ + "or" => declI sg ;
     _ + "ar" => declII sg ;
     _ + "er" => fullN sg (sg+"en") pl (pl+"na") Utr ;
     _ + "en" => declIV sg ;
     _ => declV sg
     } ;

-- smart paradigm: from one form

   smartN : Str -> N = \sg -> case sg of {
     _ + "a" => declI sg ;
     _ + "e" => declIV sg ;
     _ + "ing" => declII sg ;
     _ + ("ion" | "het") => declIII sg ;
     _ => declII sg
     } ;

   mkN = overload {
     mkN : Str -> N = smartN ;
     mkN : (sg,pl : Str) -> N = \sg,pl -> case pl of {
        "I"   => declI sg ;
        "II"  => declII sg ;
        "III" => declIII sg ;
        "IV"  => declIV sg ;
        "V"   => declV sg ;
        _ => dictN sg pl
        } ;
     mkN : (sgi,sgd,pli,pld : Str) -> N = \sgi,sgd,pli,pld -> case sgd of {
       "n" => fullN sgi sgd pli pld Utr ;
       _   => fullN sgi sgd pli pld Neutr
       } ;
     } ;

  flicka_N : N = mkN "flicka" ;
  tjej_N : N = mkN "tjej" "tjejer" ;
  station_N : N = mkN "station" ;
  spårvagn_N : N = mkN "spårvagn" ;
  tåg_N : N = mkN "tåg" "V" ;
  tand_N : N = mkN "tand" "tänder" ;
  mus_N : N = mkN "mus" "musen" "möss" "mössen" ;
  vin_N : N = mkN "vin" "vinet" "viner" "vinerna" ;
  

   








}



















{-

Task: noun inflections of type

   {s : Number => Species => Str ; g : Gender}

of the following types

   decl 1: apa apan apor aporna Utr
   decl 2: bil bilen bilar bilarna Utr
               pojke pojken pojkar pojkarna Utr
   decl 3: vision visionen visioner visionerna Utr
   decl 4: rike riket riken rikena Neutr
   decl 5: hus huset hus husen Neutr

There should be
- a worst-case paradigm with 5 arguments
- a smartest paradigm of just 1 argument
- a widely applicable paradigm of 2 arguments (sg,pl indefinite)

The smartest one could capture patterns such as -a, -e, -ion, -ing, -het

-}
