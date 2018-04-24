incomplete concrete MiniLangFunctor of MiniLang =
  open
    Grammar,
    Lexicon
  in {

-- MiniGrammar

lincat
  A = Grammar.A ;
  AP = Grammar.AP ;
  Adv = Grammar.Adv ;
  CN = Grammar.CN ;
  Cl = Grammar.Cl ;
  Conj = Grammar.Conj ;
  Det = Grammar.Det ;
  N = Grammar.N ;
  NP = Grammar.NP ;
  PN = Grammar.PN ;
  Pol = Grammar.Pol ;
  Prep = Grammar.Prep ;
  Pron = Grammar.Pron ;
  S = Grammar.S ;
  Utt = Grammar.Utt ;
  V = Grammar.V ;
  V2 = Grammar.V2 ;
  VP = Grammar.VP ;
lin
  AdjCN = Grammar.AdjCN ;
  AdvVP = Grammar.AdvVP ;
  ComplV2 v2 = ComplSlash (SlashV2a v2) ;
  CoordS conj a b = ConjS conj (BaseS a b) ;
  DetCN = Grammar.DetCN ;
  MassNP = Grammar.MassNP ;
  PNeg = Grammar.PNeg ;
  PPos = Grammar.PPos ;
  PositA = Grammar.PositA ;
  PredVP = Grammar.PredVP ;
  PrepNP = Grammar.PrepNP ;
  UseAP ap = UseComp (CompAP ap) ;
  UseN = Grammar.UseN ;
  UsePN = Grammar.UsePN ;
  UsePresCl = UseCl (TTAnt TPres ASimul) ;
  UsePron = Grammar.UsePron ;
  UseV = Grammar.UseV ;
  UttNP = Grammar.UttNP ;
  UttS = Grammar.UttS ;
  aPl_Det = DetQuant IndefArt NumPl ;
  a_Det = DetQuant IndefArt NumSg ;
  and_Conj = Grammar.and_Conj ;
  every_Det = Grammar.every_Det ;
  he_Pron = Grammar.he_Pron ;
  i_Pron = Grammar.i_Pron ;
  in_Prep = Grammar.in_Prep ;
  on_Prep = Grammar.on_Prep ;
  or_Conj = Grammar.or_Conj ;
  she_Pron = Grammar.she_Pron ;
  thePl_Det = DetQuant DefArt NumPl ;
  the_Det = DetQuant DefArt NumSg ;
  they_Pron = Grammar.they_Pron ;
  we_Pron = Grammar.we_Pron ;
  with_Prep = Grammar.with_Prep ;
  youPl_Pron = Grammar.youPl_Pron ;
  youSg_Pron = Grammar.youSg_Pron ;

-- MiniLexicon

lin
  already_Adv = Lexicon.already_Adv ;
  animal_N = Lexicon.animal_N ;
  apple_N = Lexicon.apple_N ;
  baby_N = Lexicon.baby_N ;
  bad_A = Lexicon.bad_A ;
  beer_N = Lexicon.beer_N ;
  big_A = Lexicon.big_A ;
  bike_N = Lexicon.bike_N ;
  bird_N = Lexicon.bird_N ;
  black_A = Lexicon.black_A ;
  blood_N = Lexicon.blood_N ;
  blue_A = Lexicon.blue_A ;
  boat_N = Lexicon.boat_N ;
  book_N = Lexicon.book_N ;
  boy_N = Lexicon.boy_N ;
  bread_N = Lexicon.bread_N ;
  break_V2 = Lexicon.break_V2 ;
  buy_V2 = Lexicon.buy_V2 ;
  car_N = Lexicon.car_N ;
  cat_N = Lexicon.cat_N ;
  child_N = Lexicon.child_N ;
  city_N = Lexicon.city_N ;
  clean_A = Lexicon.clean_A ;
  clever_A = Lexicon.clever_A ;
  cloud_N = Lexicon.cloud_N ;
  cold_A = Lexicon.cold_A ;
  come_V = Lexicon.come_V ;
  computer_N = Lexicon.computer_N ;
  cow_N = Lexicon.cow_N ;
  dirty_A = Lexicon.dirty_A ;
  dog_N = Lexicon.dog_N ;
  drink_V2 = Lexicon.drink_V2 ;
  eat_V2 = Lexicon.eat_V2 ;
  find_V2 = Lexicon.find_V2 ;
  fire_N = Lexicon.fire_N ;
  fish_N = Lexicon.fish_N ;
  flower_N = Lexicon.flower_N ;
  friend_N = Lexicon.friend_N ;
  girl_N = Lexicon.girl_N ;
  go_V = Lexicon.go_V ;
  good_A = Lexicon.good_A ;
  grammar_N = Lexicon.grammar_N ;
  green_A = Lexicon.green_A ;
  heavy_A = Lexicon.heavy_A ;
  horse_N = Lexicon.horse_N ;
  hot_A = Lexicon.hot_A ;
  house_N = Lexicon.house_N ;
  john_PN = Lexicon.john_PN ;
  jump_V = Lexicon.jump_V ;
  kill_V2 = Lexicon.kill_V2 ;
  language_N = Lexicon.language_N ;
  live_V = Lexicon.live_V ;
  love_V2 = Lexicon.love_V2 ;
  man_N = Lexicon.man_N ;
  milk_N = Lexicon.milk_N ;
  music_N = Lexicon.music_N ;
  new_A = Lexicon.new_A ;
  now_Adv = Lexicon.now_Adv ;
  old_A = Lexicon.old_A ;
  paris_PN = Lexicon.paris_PN ;
  play_V = Lexicon.play_V ;
  read_V2 = Lexicon.read_V2 ;
  ready_A = Lexicon.ready_A ;
  red_A = Lexicon.red_A ;
  river_N = Lexicon.river_N ;
  run_V = Lexicon.run_V ;
  sea_N = Lexicon.sea_N ;
  see_V2 = Lexicon.see_V2 ;
  ship_N = Lexicon.ship_N ;
  sleep_V = Lexicon.sleep_V ;
  small_A = Lexicon.small_A ;
  star_N = Lexicon.star_N ;
  swim_V = Lexicon.swim_V ;
  teach_V2 = Lexicon.teach_V2 ;
  train_N = Lexicon.train_N ;
  travel_V = Lexicon.travel_V ;
  tree_N = Lexicon.tree_N ;
  understand_V2 = Lexicon.understand_V2 ;
  wait_V2 = Lexicon.wait_V2 ;
  walk_V = Lexicon.walk_V ;
  warm_A = Lexicon.warm_A ;
  water_N = Lexicon.water_N ;
  white_A = Lexicon.white_A ;
  wine_N = Lexicon.wine_N ;
  woman_N = Lexicon.woman_N ;
  yellow_A = Lexicon.yellow_A ;
  young_A = Lexicon.young_A ;

}