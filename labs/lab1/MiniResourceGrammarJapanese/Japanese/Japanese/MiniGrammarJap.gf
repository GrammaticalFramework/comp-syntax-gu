concrete MiniGrammarJap of MiniGrammar = open MiniResJap, Prelude in {


  lincat
    Utt = {s : Str} ;
    Adv = Adverb ;
    Pol = {s : Str ; b : VPol} ;

    S  = {s : Str} ;
    Cl = {s : VPol => Str} ;
    VP = {verb : Verb ; compl : VPol => Str ; adv : Adverb} ;
    AP = Adjective ;
    CN = {s : VPol => Str } ;
    NP = {s : VPol => Case => Str ; a : Agreement} ;
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
    UttNP np = {s = np.s ! VPos ! Acc} ;

    UsePresCl pol cl = {
      s = pol.s ++ cl.s ! pol.b
      } ;
    PredVP np vp = {
      s = \\b => (case vp.adv.pos of { Top => vp.adv.s ! b ; _ => ""}) ++ np.s ! b ! Nom ++ "ga" ++ (case vp.adv.pos of { Init | Prepos => vp.adv.s ! b ; _ => ""}) ++ vp.compl ! b ++ vp.verb.s ! b ;
      } ;

    UseV v = {
      verb = v ;
      compl = \\_ => [] ;
      adv = emptyAdv
      } ;
    ComplV2 v2 np = {
      verb = v2 ;
      compl = \\b => np.s ! b ! Acc ++ "o" ;
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
      s = \\b => table {c => det.s ++ cn.s ! b} ;
      a = Agr det.n Per3
      } ;
    UseCN cn = {
      s = \\b,_ => cn.s ! b ;
      a = Agr Sg Per3
      } ;
    UsePN pn = {
      s = \\_,_ => pn.s ;
      a = Agr Sg Per3
      } ;
    UsePron p = {s = \\_ => p.s ; a = p.a} ;
    MassNP cn = {
      s = \\b,_ => cn.s ! b ;
      a = Agr Sg Per3
      } ;

    a_Det = mkDeterminer "" Sg ;
    aPl_Det = mkDeterminer "" Pl ;
    the_Det = mkDeterminer "" Sg ;
    thePl_Det = mkDeterminer "" Pl ;

    UseN n = {s = \\_ => n.s} ;
    AdjCN ap cn = {
      s = \\b => ap.s ! b ++ cn.s ! b
      } ;

    PositA a = a ;

    PrepNP prep np = {s = \\b => np.s ! b ! Acc ++ prep.s ; pos = Prepos} ;

    CoordS conj a b = {s = a.s ++ conj.s ++ b.s} ;

    PPos  = {s = [] ; b = VPos} ;
    PNeg  = {s = [] ; b = VNeg} ;

    and_Conj = {s = ""} ; -- This conjunction is empty because Japanese sentences are not conjoined with the particle "to" which means "and". They would be joined by converting the verb of the first sentence to te-form (taberu -> tabete), followed by the second sentence. I did not have time to solve this, as I would have needed to contact Aarne about it and the deadline was getting close.
    or_Conj = {s = "mata wa"} ;

    every_Det = {s = "subete no" ; n = Sg} ;

    in_Prep = {s = "no naka de"} ; -- This means "in" only in the sense of "inside", "to be in something". Cannot be used for "in school" and similar.
    on_Prep = {s = "no ue ni"} ; -- This means "on" only in the sense of "on top of" +  also "over" and "above".
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
