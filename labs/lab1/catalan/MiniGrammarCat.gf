concrete MiniGrammarCat of MiniGrammar = open MiniResCat, Prelude in {


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
    
    UttNP np = {
      s = np.s ! Nom
	} ;

    UsePresCl pol cl = {
      s = pol.s ++ cl.s ! pol.p ;
    } ;
      
    PredVP np vp = {
      s = \\p => np.s ! (Nom|ENom) ++ negation p ++ vp.v.s ! np.a.n ! np.a.p ++ vp.c ! np.a ;
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
      c = \\a => ap.s ! a.g ! a.n ;
    } ;
      
    AdvVP vp adv = vp ** {
      c = \\a => vp.c ! a ++ adv.s
    } ;
      
    DetCN det cn = {
      s = \\_ => det.s ! cn.g ++ cn.s ! det.n ;
      a = {g = cn.g ; n = det.n ; p = P3} ;
    } ;
      
	  UsePN pn = {
      s = \\_ => pn.s ;
      a = {g = pn.g ; n = Sg ; p = P3}
    } ;
    
    UsePron p = p ;
    
    MassNP cn = {
      s = \\_ => the_Det.s ! cn.g ++ cn.s ! Sg ;
      a = {g = cn.g ; n = Sg ; p = P3}
    } ;
    
    UseN n = n ;
    
    AdjCN ap cn = {
      s = \\n => cn.s ! n ++ ap.s ! cn.g ! n ;
      g = cn.g ;
    } ;

    PositA a = a ;

    PrepNP prep np = {
      s = prep.s ++ np.s ! prep.c
	} ;

    CoordS conj a b = {
      s = a.s ++ conj.s ++ b.s
	} ;
    
    PPos = {
   	  s = "" ;
      p = Pos
    } ;
    
    PNeg = {
	  s = "" ;
	  p = Neg
	} ;

    and_Conj = {s = "i"} ;
    or_Conj = {s = "o"} ;

    a_Det = mkDeterminer "un" "una" Sg ;
    aPl_Det = mkDeterminer "uns" "unes" Pl ;
    the_Det = mkDeterminer "el" "la" Sg ;
    thePl_Det = mkDeterminer "els" "les" Pl ;
    every_Det = mkDeterminer "cada" "cada" Sg ;

    in_Prep = {s = "en" ; c = Acc} ;
    on_Prep = {s = "sobre" ; c = Acc} ;
    with_Prep = {s = "amb" ; c = Acc} ;

    i_Pron = mkPronoun "jo" "" "mi" Masc Sg P1 ;
    youSg_Pron = mkPronoun "tú" "" "tú" Fem Sg P2  ;
    he_Pron = mkPronoun "ell" "" "ell" Masc Sg P3  ;
    she_Pron = mkPronoun "ella" "" "ella" Fem Sg P3  ;
    we_Pron = mkPronoun "nosaltres" "" "nosaltres" Masc Pl P1  ;
    youPl_Pron = mkPronoun "vosaltres" "" "vosaltres" Fem Pl P2 ;
    they_Pron = mkPronoun "ells" "" "ells" Masc Pl P3 | mkPronoun "elles" "" "elles" Fem Pl P3 ;
    
}
