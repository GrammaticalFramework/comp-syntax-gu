concrete RestaurantFunctorSwe of Restaurant = RestaurantFunctor with (Syntax = SyntaxSwe) **

  open SyntaxSwe, ParadigmsSwe in {

lin

 pizza = mkCN (mkN "pizza") ;

  beer  = mkCN (mkN "öl" "öl") ;
  taco  = mkCN (mkN "taco" "tacon" "tacosar" "tacosarna") ;
  pasta  = mkCN (mkN "pasta") ;

  italian = mkAP (mkA "italiensk") ;
  good = mkAP (mkA "god") ;
  delicious = mkAP (mkA "läcker") ;
  horrible = mkAP (mkA "hemsk") ;

oper
  like_V2 : V2 = mkV2 (mkV "gilla") ;

}
