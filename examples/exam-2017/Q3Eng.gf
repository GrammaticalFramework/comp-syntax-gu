concrete Q3Eng of Q3 = {

param
  Agr = Sg1 | Sg2 | Sg3 | Pl ; -- or Number * Person
oper
  copula : Agr => Str = table {
    Sg1 => "am" ;
    Sg3 => "is" ;
    _ => "are" 
    } ;
  indef : Agr => Str = table {
    Pl => "" ;
    _ => "a"
    } ;

lincat
  S = Str ;
  NP = {s : Str ; a : Agr} ;
  N = Agr => Str ;
  A = Str ; -- new
lin
  PredN np n = np.s ++ copula ! np.a ++ indef ! np.a ++ n ! np.a ;
  
  I = {s = "I" ; a = Sg1} ;
  YouSingular = {s = "you" ; a = Sg2} ;
  He = {s = "he" ; a = Sg3} ;
  She = {s = "she" ; a = Sg3} ;
  We = {s = "we" ; a = Pl} ;
  YouPlural = {s = "you" ; a = Pl} ;
  They = {s = "they" ; a = Pl} ;
  
  Linguist = table {
    Pl => "linguists" ;
    _ => "linguist"
    } ;

  ModN ad n = table {a => ad ++ n ! a} ; -- new
  Happy = "happy" ; -- new
}
