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
  letsGrabPhrase product = lets_Utt (mkVP (mkV2 "grab") product) ; 

  propertyFact place property = mkCl place property ;
  sellFact place product = mkCl place (mkV2 "sell") product ;
  likeFact person place = mkCl person (mkV2 "like") place ;

  qualifiedPlace property placetype = mkCN property placetype ;

  thePlace placetype = mkNP the_Det placetype ;
  allPlace placetype = mkNP all_Predet (mkNP aPl_Det placetype) ;

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

  beerProduct = mkNP (mkN "beer") ;
  sandwichesProduct = mkNP aPl_Det (mkN "sandwich") ;
  drugsMedicalProduct = mkNP aPl_Det (mkN "drug") ;
  drugsNarcoticProduct = mkNP aPl_Det (mkN "drug") ;

  iPerson = i_NP ;
  youPerson = you_NP ;

}