concrete MiniGrammarMyeng of MiniGrammar = open MiniResMyeng, Prelude in {


  lincat
    Utt = {s : Str} ;
    Adv = Adverb ;
    Pol = {s : Str ; p : Polarity} ;
    S  = {s : Str} ;
    Cl = {s : Polarity => Str} ;
    VP = {v : Verb ; c : Agr => Str ; isAux : Bool} ;
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
      s = \\p =>
         np.s ! Nom ++
         case p of {
	   Pos => vp.v.s ! np.a.n ! np.a.p ;
	   Neg => case vp.isAux of {
	     True  => vp.v.s ! np.a.n ! np.a.p ++ "not" ;
	     False => (do_V.s ! np.a.n ! np.a.p ++ "not" ++ vp.v.s ! Pl ! P3)
	            | (dont_V.s ! np.a.n ! np.a.p ++ vp.v.s ! Pl ! P3)
	     }
	   } ++
	 vp.c ! np.a ;
      } ;
      
    UseV v = {
      v = v ;
      c = \\_ => [] ;
      isAux = False ;
      } ;
    
    ComplV2 v2 np = {
      v = v2 ;
      c = \\_ => v2.c.prep ++ np.s ! v2.c.c ;
      isAux = False ;
      } ;
      
    UseAP ap = {
      v = copula ;
      c = \\a => ap.s ;
      isAux = True ;
      } ;
      
    AdvVP vp adv = vp ** {
      c = \\a => vp.c ! a ++ adv.s
      } ;
      
    DetCN det cn = {
      s = \\c => det.s ++ cn.s ! det.n ;
      a = {g = cn.g ; n = det.n ; p = P3} ;
      } ;
      
    UsePN pn = {s = \\c => pn.s ; a = {g = pn.g ; n = Sg ; p = P3}} ;
    
    UsePron p = p ;
    
    MassNP cn = {
      s = \\c => cn.s ! Sg ;
      a = {g = cn.g ; n = Sg ; p = P3} ;
      } ;
    
    a_Det = mkDeterminer (pre {("a"|"e"|"i"|"o") => "an"  ; _ => "a"}) Sg ; ---
    
    aPl_Det = mkDeterminer "" Pl ;
    
    the_Det = mkDeterminer "the" Sg ;
    
    thePl_Det = mkDeterminer "the" Pl ;
    
    UseN n = n ;
    
    AdjCN ap cn = {
      s = \\n => ap.s ++ cn.s ! n ;
      g = cn.g ;
      } ;

    PositA a = a ;

    PrepNP prep np = {s = prep.s ++ np.s ! prep.c} ;

    CoordS conj a b = {s = a.s ++ conj.s ++ b.s} ;
    
    PPos  = {s = "" ; p = Pos} ;
    PNeg  = {s = "" ; p = Neg} ;

    and_Conj = {s = "and"} ;
    or_Conj = {s = "or"} ;

    every_Det = mkDeterminer "every" Sg ;

    in_Prep = {s = "in" ; c = Acc} ;
    on_Prep = {s = "on" ; c = Acc} ;
    with_Prep = {s = "with" ; c = Acc} ;

    i_Pron = mkPronoun "I" "me" Masc Sg P1 ;
    youSg_Pron = mkPronoun "you" "you" Fem Sg P2  ;
    he_Pron = mkPronoun "he" "him" Masc Sg P3  ;
    she_Pron = mkPronoun "she" "her" Fem Sg P3  ;
    we_Pron = mkPronoun "we" "us" Masc Pl P1  ;
    youPl_Pron = mkPronoun "you" "you" Fem Pl P2 ;
    they_Pron = mkPronoun "they" "them" Masc Pl P3 ;
    
}
