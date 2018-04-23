concrete MiniGrammarPidgin of MiniGrammar = open MiniResPidgin, Prelude in {


  lincat
    Utt = {s : Str} ;
    Adv = Adverb ;
    Pol = {s : Str} ;
    S  = {s : Str} ;
    Cl = {s : Str} ;
    VP = {s : Str} ;
    AP = Adjective ;
    CN = Noun ;
    NP = {s : Str} ;
    Pron = {s : Str} ;
    Det = {s : Str} ; 
    Conj = {s : Str} ;
    Prep = {s : Str} ;
    V = Verb ;
    V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;
    PN = ProperName ;

  lin
    UttS s = s ;
    UttNP np = np ;

    UsePresCl pol cl = {
      s = pol.s ++ cl.s ;
      } ;
    PredVP np vp = {
      s = np.s ++ vp.s
      } ;
      
    UseV v = v ;
    
    ComplV2 v2 np = {
      s = v2.s ++ np.s
      } ;
    UseAP ap = {
      s = "be" ++ ap.s
      } ;
    AdvVP vp adv = {
      s = vp.s ++ adv.s
      } ;
      
    DetCN det cn = {
      s = det.s ++ cn.s
      } ;
      
    UsePN pn = pn ;
    
    UsePron p = p ;
    
    MassNP cn = cn ;
    
    a_Det = {s = "a"} ;
    
    aPl_Det = {s = "many"} ;
    
    the_Det = {s = "the"} ;
    
    thePl_Det = {s = "them"} ;
    
    UseN n = n ;
    AdjCN ap cn = {
      s = ap.s ++ cn.s ;
      } ;

    PositA a = a ;

    PrepNP prep np = {s = prep.s ++ np.s} ;

    CoordS conj a b = {s = a.s ++ conj.s ++ b.s} ;
    
    PPos  = {s = ""} ;
    PNeg  = {s = "not"} ;

    and_Conj = {s = "and"} ;
    or_Conj = {s = "or"} ;

    every_Det = {s = "every"} ;

    in_Prep = {s = "in"} ;
    on_Prep = {s = "on"} ;
    with_Prep = {s = "with"} ;

    i_Pron = {
      s = "I"
      } ;
    youSg_Pron = {
      s = "you"
      } ;
    he_Pron = {
      s = "he" ;
      } ;
    she_Pron = {
      s = "she" ;
      } ;
    we_Pron = {
      s = "we" ;
      } ;
    youPl_Pron = {
      s = "ye"
      } ;
    they_Pron = {
      s = "they" ;
      } ;

}
