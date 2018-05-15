abstract Shops = {

flags startcat = Phrase ;

cat
  Phrase ;   -- statement, question, etc
  Fact ;     -- proposition
  Place ;
  PlaceType ;
  Property ;
  Product ;
  Person ;

fun
  statementPhrase : Fact -> Phrase ;  -- the bar is open
  negativePhrase  : Fact -> Phrase ;  -- the bar is not open
  questionPhrase  : Fact -> Phrase ;  -- is the bar open
  wherePhrase     : Place -> Phrase ; -- where is the bar
  letsGrabPhrase  : Product -> Phrase ; -- let's grab beer

  propertyFact : Place -> Property -> Fact ; -- the bar is open
  sellFact : Place -> Product -> Fact ; -- the bar sells beer
  likeFact : Person -> Place -> Fact ; -- I like the bar

  thePlace : PlaceType -> Place ; -- the bar
  allPlace : PlaceType -> Place ;  -- all bars

  qualifiedPlace : Property -> PlaceType -> PlaceType ; -- trendy bar

  barPlaceType, groceryPlaceType, restaurantPlaceType, pharmacyPlaceType : PlaceType ;

  trendyProperty, expensiveProperty, shabbyProperty, swedishProperty,
  openProperty, closedProperty : Property ;

  beerProduct, sandwichesProduct,
    drugsMedicalProduct, drugsNarcoticProduct : Product ;
  
  iPerson, youPerson : Person ;
}