concrete Q3Fin of Q3 = {

param
  Number = Sg | Pl ;
  Person = Pr1 | Pr2 | Pr3 ;
oper
  Agr    = Number * Person ; -- = {p1 : Number ; p2 : Person}
oper
  copula : Agr => Str = table {
    <Sg,Pr1> => "olen" ; -- {p1 = Sg ; p2 = Pr1} 
    <Sg,Pr2> => "olet" ;
    <Sg,Pr3> => "on" ;
    <Pl,Pr1> => "olemme" ;
    <Pl,Pr2> => "olette" ;
    <Pl,Pr3> => "ovat"
    } ;
    
lincat
  S = Str ;
  NP = {s : Str ; a : Agr} ;
  N = Agr => Str ;
  A = Agr => Str ;
lin
  PredN np n = np.s ++ copula ! np.a ++ n ! np.a ;
  
  I = {s = "minä" ; a = <Sg,Pr1>} ;
  YouSingular = {s = "sinä" ; a = <Sg,Pr2>} ;
  He = {s = "hän" ; a = <Sg,Pr3>} ;
  She = {s = "hän" ; a = <Sg,Pr3>} ;
  We = {s = "me" ; a = <Pl,Pr1>} ;
  YouPlural = {s = "te" ; a = <Pl,Pr2>} ;
  They = {s = "he" ; a = <Pl,Pr3>} ;
  
  Linguist = table {
    <Pl,_> => "kielitieteilijöitä" ;
    <Sg,_> => "kielitieteilijä"
    } ;

  ModN ad n = table {a => ad ! a ++ n ! a} ; -- new
  Happy = table {
    <Pl,_> => "onnellisia" ;
    <Sg,_> => "onnellinen"
    } ;
}
