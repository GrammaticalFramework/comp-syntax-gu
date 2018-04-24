concrete MiniGrammarParam of MiniGrammar = open MiniResParam, Prelude in {


  lincat
    Utt = {s : Str} ;
    Adv = Adverb ;
    Pol = {s : Str ; p : Polarity} ;
    S  = {s : Str} ;
    Cl = {s : Polarity => Str} ;
    VP = {v : Verb ; c : Agr => Str} ;
    AP = Adjective ;
    CN = Noun ;
    NP = Pronoun ;
    Pron = Pronoun ;
    Det  = Determiner ;
    Conj = {s : Str} ;
    Prep = {s : Str ; c : Case} ;
    V = Verb ;
    V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;
    PN = ProperName ;

  lin
    UttS s = s ;
    
    UttNP np = {s = np.s ! Nom} ;

    UsePresCl pol cl = {
      s = pol.s ++ cl.s ! pol.p ;
      } ;
      
    PredVP np vp = {
      s = \\p => np.s ! Nom ++ negation p ++ vp.v.s ! np.a.n ! np.a.p ++ vp.c ! np.a ;
      } ;
      
    UseV v = {
      v = v ;
      c = \\_ => [] ;
      } ;
    
    ComplV2 v2 np = {
      v = v2 ;
      c = \\_ => v2.c.prep ++ np.s ! v2.c.c ;
      } ;
      
    UseAP ap = {
      v = copula ;
      c = \\a => ap.s ! a.g ! a.n ! Nom ;
      } ;
      
    AdvVP vp adv = vp ** {
      c = \\a => vp.c ! a ++ adv.s
      } ;
      
    DetCN det cn = {
      s = \\c => det.s ! cn.g ! c ++ cn.s ! det.n ! c ;
      a = {g = cn.g ; n = det.n ; p = P3} ;
      } ;
      
    UsePN pn = pn ** {a = {g = pn.g ; n = Sg ; p = P3}} ;
    
    UsePron p = p ;
    
    MassNP cn = {
      s = cn.s ! Sg ;
      a = {g = cn.g ; n = Sg ; p = P3} ;
      } ;
    
    a_Det = mkDeterminer "unus" "unum" "una" "unam" Sg ;
    
    aPl_Det = mkDeterminer "uni" "unos" "unae" "unas" Pl ;
    
    the_Det = mkDeterminer "ille" "illem" "illa" "illam" Sg ;
    
    thePl_Det = mkDeterminer "illi" "illos" "illae" "illas" Pl ;
    
    UseN n = n ;
    
    AdjCN ap cn = {
      s = \\n,c => ap.s ! cn.g ! n ! c ++ cn.s ! n ! c ;
      g = cn.g ;
      } ;

    PositA a = a ;

    PrepNP prep np = {s = prep.s ++ np.s ! prep.c} ;

    CoordS conj a b = {s = a.s ++ conj.s ++ b.s} ;
    
    PPos  = {s = "" ; p = Pos} ;
    PNeg  = {s = "" ; p = Neg} ;

    and_Conj = {s = "et"} ;
    or_Conj = {s = "vel"} ;

    every_Det = mkDeterminer "omnis" "omnem" "omnis" "omnem" Pl ;

    in_Prep = {s = "in" ; c = Acc} ;
    on_Prep = {s = "super" ; c = Acc} ;
    with_Prep = {s = "cum" ; c = Acc} ;

    i_Pron = mkPronoun "ego" "me" Masc Sg P1 ;
    youSg_Pron = mkPronoun "tu" "te" Fem Sg P2  ;
    he_Pron = mkPronoun "is" "eum" Masc Sg P3  ;
    she_Pron = mkPronoun "ea" "eam" Fem Sg P3  ;
    we_Pron = mkPronoun "nos" "nos" Masc Pl P1  ;
    youPl_Pron = mkPronoun "vos" "vos" Fem Pl P2 ;
    they_Pron = mkPronoun "ei" "eos" Masc Pl P3 ;
    
}
