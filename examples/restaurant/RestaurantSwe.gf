concrete RestaurantSwe of Restaurant =

  open SyntaxSwe, ParadigmsSwe in {

lincat
  Phrase = Utt ;
  Order = NP ;
  Question = QS ;
  Comment = S ;

  Item = NP ;
  Number = Card ;
  Kind = CN ;

  Dish = NP ;
  Quality = AP ;

lin
  order or = mkUtt or ;
  question qu = mkUtt qu ;
  comment co = mkUtt co ;

  numberKind nu ki = mkNP nu ki ;
  qualityKind qu ki = mkCN qu ki ;

  itemOrder it = it ;
  andOrder it or = mkNP and_Conj it or ;

  this ki = mkNP this_Det ki ;
  that ki = mkNP that_Det ki ;

  very qu = mkAP very_AdA qu ;

  doYouHave ki = mkQS (mkQCl (mkCl you_NP have_V2 (mkNP aPl_Det ki))) ;

  isComment di qu = mkS (mkCl di qu) ;
  isNotComment di qu = mkS negativePol (mkCl di qu) ;

  iLikeComment di = mkS (mkCl i_NP like_V2 di) ;
  iDontLikeComment di = mkS negativePol (mkCl i_NP like_V2 di) ;

  one = mkCard "1" ;
  two = mkCard "2" ;
  three = mkCard "3" ;

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