concrete Q2Eng of Q2 = {

param
  Agr = Sg1 | Sg2 | Sg3 | Pl ; -- or Number * Person
oper
  copula : Agr => Str = table {
    Sg1 => "am" ;
    Sg3 => "is" ;
    _ => "are" 
    } ;

lincat
  S = Str ;
  NP = {s : Str ; a : Agr} ;
  N = Agr => Str ;
lin
  PredN np n = np.s ++ copula ! np.a ++ n ! np.a ;
  
  I = {s = "I" ; a = Sg1} ;
  YouSingular = {s = "you" ; a = Sg2} ;
  He = {s = "he" ; a = Sg3} ;
  She = {s = "she" ; a = Sg3} ;
  We = {s = "we" ; a = Pl} ;
  YouPlural = {s = "you" ; a = Pl} ;
  They = {s = "they" ; a = Pl} ;
  
  Linguist = table {
    Pl => "linguists" ;
    _ => "a linguist"
    } ;
}
