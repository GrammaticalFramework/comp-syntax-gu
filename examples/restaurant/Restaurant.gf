abstract Restaurant = {

flags startcat = Phrase ;

cat
  Phrase ;
  Order ;   -- two pizzas and three beers
  Question ; -- do you have Italian beer
  Comment ; -- this pizza is very good

  Item ; -- three pizzas
  Number ; -- three
  Kind ;  -- pizza

  Dish ; -- this pizza
  Quality ; -- very good

fun
  order : Order -> Phrase ;
  question : Question -> Phrase ;
  comment : Comment -> Phrase ;

  numberKind : Number -> Kind -> Item ;
  qualityKind : Quality -> Kind -> Kind ;

  itemOrder : Item -> Order ;
  andOrder : Item -> Order -> Order ;

  this : Kind -> Dish ;
  that : Kind -> Dish ;

  very : Quality -> Quality ;

  doYouHave : Kind -> Question ;

  isComment : Dish -> Quality -> Comment ;
  isNotComment : Dish -> Quality -> Comment ;

  iLikeComment : Dish -> Comment ;
  iDontLikeComment : Dish -> Comment ;
 
  orderDish : Order -> Dish ;

  one, two, three : Number ;

  pizza, beer, taco, pasta : Kind ;

  italian, good, delicious, horrible : Quality ;


}