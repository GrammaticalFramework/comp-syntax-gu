concrete RestaurantFunctorEng of Restaurant = RestaurantFunctor with (Syntax = SyntaxEng) **

  open SyntaxEng, ParadigmsEng in {

lin

  pizza = mkCN (mkN "pizza") ;

  beer  = mkCN (mkN "beer") ;
  taco  = mkCN (mkN "taco" "tacos") ;
  pasta  = mkCN (mkN "pasta") ;

  italian = mkAP (mkA "Italian") ;
  good = mkAP (mkA "good") ;
  delicious = mkAP (mkA "delicious") ;
  horrible = mkAP (mkA "horrible") ;

oper
  like_V2 : V2 = mkV2 (mkV "like") ;

}
