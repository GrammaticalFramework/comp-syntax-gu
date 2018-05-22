concrete Q5Chi of Q5 = {
lincat
  S = Str ;
  Cl = {s,v,c : Str} ;
  NP = Str ;
  VP = {v,c : Str} ;
  V2 = Str ;

lin

  QuestCl cl = cl.s ++ cl.v ++ "bu" ++ cl.v ++ cl.c ;
  DeclCl  cl = cl.s ++ cl.v ++ cl.c ;

  PredVP np vp = {s = np ; v = vp.v ; c = vp.c} ;
  ComplV2 v2 np = {v = v2 ; c = np} ;
  love_V2 = "ai" ;
  i_NP = "wo" ;
  you_NP = "ni" ;
}