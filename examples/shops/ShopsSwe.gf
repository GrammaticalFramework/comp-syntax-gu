concrete ShopsSwe of Shops =
  open
    SyntaxSwe,
    ParadigmsSwe
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
  sellFact place product = mkCl place (mkV2 "säljer") product ;
  likeFact person place = mkCl person (mkV2 "gillar") place ;
  letsGrabPhrase product = lets_Utt (mkVP (mkV2 "ta") product) ;
  
  qualifiedPlace property placetype = mkCN property placetype ;

  thePlace placetype = mkNP the_Det placetype ;
  allPlace placetype = mkNP all_Predet (mkNP aPl_Det placetype) ;

  barPlaceType = mkCN (mkN "bar" "barer") ;
  groceryPlaceType = mkCN (mkN "mataffär" "mataffärer") ;
  restaurantPlaceType = mkCN (mkN "restaurang" "restauranger") ;
  pharmacyPlaceType = mkCN (mkN "apotek" "apotek") ;
  
  trendyProperty = mkAP (mkA "trendig") ;
  expensiveProperty = mkAP (mkA "dyr") ;
  shabbyProperty = mkAP (mkA "sjabbig") ;
  swedishProperty = mkAP (mkA "svensk") ;
  openProperty = mkAP (mkA "öppen") ;
  closedProperty = mkAP (mkA "stängd") ;

  beerProduct = mkNP (mkN "öl" "öl") ;
  sandwichesProduct = mkNP aPl_Det (mkN "macka") ;
  drugsMedicalProduct = mkNP aPl_Det (mkN "läkemedel" "läkemedel") ;
  drugsNarcoticProduct = mkNP aPl_Det (mkN "drog" "droger") ;

  iPerson = i_NP ;
  youPerson = you_NP ;

}