concrete ShopsEng of Shops =
  open
    SyntaxEng,
    ParadigmsEng
  in {

lincat
  Phrase = Utt ;
  Fact = Cl ; 
  Place = NP ;
  PlaceType = CN ;
  Property = AP ;
  Product = NP ;
  Person = NP ;

lin
  statementPhrase fact = mkUtt fact ;
  negativePhrase fact = mkUtt (mkS negativePol fact) ;
  questionPhrase fact = mkUtt (mkQS fact) ;
  wherePhrase place = mkUtt (mkQS (mkQCl where_IAdv place)) ;

  propertyFact place property = mkCl place property ;

  qualifiedPlace property placetype = mkCN property placetype ;

  thePlace placetype = mkNP the_Det placetype ;

  barPlaceType = mkCN (mkN "bar") ;
  groceryPlaceType = mkCN (mkN "grocery") ;
  restaurantPlaceType = mkCN (mkN "restaurant") ;
  pharmacyPlaceType = mkCN (mkN "pharmacy") ;
  
  trendyProperty = mkAP (mkA "trendy") ;
  expensiveProperty = mkAP (mkA "expensive") ;
  shabbyProperty = mkAP (mkA "shabby") ;
  swedishProperty = mkAP (mkA "Swedish") ;
  openProperty = mkAP (mkA "open") ;
  closedProperty = mkAP (mkA "closed") ;

}