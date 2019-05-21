concrete RestaurantEng of Restaurant =

  open SyntaxEng, ParadigmsEng in {

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