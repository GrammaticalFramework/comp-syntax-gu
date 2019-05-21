concrete RestaurantFunctorFin of Restaurant = RestaurantFunctor with (Syntax = SyntaxFin) **

  open SyntaxFin, ParadigmsFin in {

lin

 pizza = mkCN (mkN "pizza") ;

  beer  = mkCN (mkN "olut") ;
  taco  = mkCN (mkN "taco") ;
  pasta  = mkCN (mkN "pasta") ;

  italian = mkAP (mkA "italialainen") ;
  good = mkAP (mkA "hyvä") ;
  delicious = mkAP (mkA "herkullinen") ;
  horrible = mkAP (mkA "kamala") ;

oper
  like_V2 : V2 = mkV2 (mkV "pitää") elative ;

}
