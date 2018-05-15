concrete ShopsIta of Shops =
  open
    SyntaxIta,
    ParadigmsIta,
    IrregIta
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
  letsGrabPhrase product = lets_Utt (mkVP (mkV2 prendere_V) product) ;

  propertyFact place property = mkCl place property ;
  sellFact place product = mkCl place (mkV2 "vendere") product ;
  likeFact person place = mkCl place (mkV2 piacere_V dative) person ;

  qualifiedPlace property placetype = mkCN property placetype ;

  thePlace placetype = mkNP the_Det placetype ;
  allPlace placetype = mkNP all_Predet (mkNP thePl_Det placetype) ;

  barPlaceType = mkCN (mkN "bar") ;
  groceryPlaceType = mkCN (mkN "magazzino") ;
  restaurantPlaceType = mkCN (mkN "ristorante") ;
  pharmacyPlaceType = mkCN (mkN "farmacia") ;
  
  trendyProperty = mkAP (mkA "trendy") ;
  expensiveProperty = mkAP (mkA "caro") ;
  shabbyProperty = mkAP (mkA "shabby") ;
  swedishProperty = mkAP (mkA "svedese") ;
  openProperty = mkAP (mkA "aperto") ;
  closedProperty = mkAP (mkA "chiuso") ;

  beerProduct = mkNP (mkN "birra") ;
  sandwichesProduct = mkNP aPl_Det (mkN "panino") ;
  drugsMedicalProduct = mkNP aPl_Det (mkN "medicamento") ;
  drugsNarcoticProduct = mkNP aPl_Det (mkN "droga") ;

  iPerson = i_NP ;
  youPerson = you_NP ;

}