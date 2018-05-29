concrete MiniGrammarJap of MiniGrammar = open MiniResJap, Prelude in {


  lincat
    Utt = {s : Str} ;
    Adv = Adverb ;
    Pol = {s : Str ; b : VPol} ;

    S  = {s : Str} ;
    Cl = {s : VPol => Str} ;
    VP = {verb : Verb ; compl : Str ; adv : Adverb} ;
    AP = Adjective ;
    CN = Noun ;
    NP = {s : Case => Str ; a : Agreement} ;
    Pron = {s : Case => Str ; a : Agreement} ;
    Det = Determiner ;
    Conj = {s : Str} ;
    Prep = {s : Str} ;
    V = Verb ;
    V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;
    PN = ProperName ;

  lin
    UttS s = s ;
    UttNP np = {s = np.s ! Acc} ;

    UsePresCl pol cl = {
      s = pol.s ++ cl.s ! pol.b
      } ;
    PredVP np vp = {
      s = \\b => (case vp.adv.pos of { Top => vp.adv.s ; _ => ""}) ++ np.s ! Nom ++ "ga" ++ (case vp.adv.pos of { Init | Prepos => vp.adv.s ; _ => ""}) ++ vp.compl ++ vp.verb.s ! b ;
      } ;

    UseV v = {
      verb = v ;
      compl = [] ;
      adv = emptyAdv
      } ;
    ComplV2 v2 np = {
      verb = v2 ;
      compl = np.s ! Acc ++ "o" ;
      adv = emptyAdv
      } ;
    UseAP ap = {
      verb = copula ;
      compl = ap.s ;
      adv = emptyAdv
      } ;
    AdvVP vp adv =
      vp ** {compl = vp.compl ; adv = adv} ;

    DetCN det cn = {
      s = table {c => det.s ++ cn.s} ;
      a = Agr det.n Per3
      } ;
    UseCN cn = {
      s = \\_ => cn.s ;
      a = Agr Sg Per3
      } ;
    UsePN pn = {
      s = \\_ => pn.s ;
      a = Agr Sg Per3
      } ;
    UsePron p =
      p ;
    MassNP cn = {
      s = \\_ => cn.s ;
      a = Agr Sg Per3
      } ;

    a_Det = mkDeterminer "" Sg ;
    aPl_Det = mkDeterminer "" Pl ;
    the_Det = mkDeterminer "" Sg ;
    thePl_Det = mkDeterminer "" Pl ;

    UseN n =
      n ;
    AdjCN ap cn = {
      s = ap.s ++ "no" ++ cn.s
      } ;

    PositA a = a ;

    PrepNP prep np = {s = np.s ! Acc ++ prep.s ; pos = Prepos} ;

    CoordS conj a b = {s = a.s ++ conj.s ++ b.s} ;

    PPos  = {s = [] ; b = VPos} ;
    PNeg  = {s = [] ; b = VNeg} ;

    and_Conj = {s = ""} ;
    or_Conj = {s = "ya"} ;

    every_Det = {s = "subete no" ; n = Sg} ;

    in_Prep = {s = "no naka de"} ;
    on_Prep = {s = "no ue ni"} ;
    with_Prep = {s = "to"} ;

    i_Pron = {
      s = \\_ => "watashi" ;
      a = Agr Sg Per1
      } ;
    youSg_Pron = {
      s = \\_ => "anata" ;
      a = Agr Sg Per2
      } ;
    he_Pron = {
      s = \\_ => "kare" ;
      a = Agr Sg Per3
      } ;
    she_Pron = {
      s = \\_ => "kanojo" ;
      a = Agr Sg Per3
      } ;
    we_Pron = {
      s = \\_ => "watashitachi" ;
      a = Agr Pl Per1
      } ;
    youPl_Pron = {
      s = \\_ => "anatatachi" ;
      a = Agr Pl Per2
      } ;
    they_Pron = {
      s = \\_ => "anohitotachi" ;
      a = Agr Pl Per3
      } ;

}
