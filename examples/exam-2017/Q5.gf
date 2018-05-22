abstract Q5 = {
cat
S ; Cl ; NP ; VP ; V2 ;

fun

QuestCl  : Cl -> S ;          -- do you love me ; ni ai bu ai wo
DeclCl   : Cl -> S ;         -- you love me ;    ni ai wo
PredVP   : NP -> VP -> Cl ;  -- you love me ;    ni ai wo
ComplV2  : V2 -> NP -> VP ;  -- love me ;        ai wo
love_V2  : V2 ;               -- love ;           ai
i_NP, you_NP : NP ;          -- I, you ;         wo, ni
}