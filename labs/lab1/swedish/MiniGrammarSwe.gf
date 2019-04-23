--# -path=.:../abstract

concrete MiniGrammarSwe of MiniGrammar = open MiniResSwe, Prelude in {

  lincat
    Utt = {s : Str} ;
    Pol  = {s : Str ; isTrue : Bool} ; -- the s field is empty, but needed for parsing
    Temp = {s : Str ; isPres : Bool} ;
    
    S  = {s : Str} ;
    QS = {s : Str} ;
    Cl, QCl = {   -- word order is fixed in S and QS
      subj  : Str ;       -- subject
      verb  : Verb ;
      compl : Str         -- after verb: complement, adverbs, adjective
      } ;
    Imp = {s : Bool => Str} ;
    VP = {
      verb : Verb ;
      compl : AForm => Str
      } ;
    AP = Adjective ;
    CN = Noun ** {isSimple : Bool} ;  --- isSimple = no adjectival modifier
    NP = {s : Case => Str ; a : AForm} ;
    Pron = {s : Case => Str ; a : AForm} ;
    Det = {s : Bool => Gender => Str ; n : Number ; d : Species} ; --- Bool: ifSimple
    Conj = {s : Str} ;
    Prep = {s : Str} ;
    V = Verb ;
    V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;
    PN = {s : Str ; g : Gender} ;
    Adv = {s : Str} ;

  lin
    UttS s = s ;
    UttQS s = s ;
    UttNP np = {s = np.s ! Nom} ; 
    UttAdv adv = adv ;
    UttImpSg pol imp = {s = imp.s ! pol.isTrue} ;

    UseCl temp pol cl =
      let clt = vpForm temp.isPres cl.verb
      in {
        s = pol.s ++ temp.s ++    --- needed for parsing: a hack
	    cl.subj ++               -- hon
	    clt.fin ++               -- har
	    negation pol.isTrue ++   -- inte
	    clt.inf ++               -- druckit
	    cl.compl                 -- öl
      } ;
      
    UseQCl temp pol cl =
      let clt = vpForm temp.isPres cl.verb
      in {
        s = pol.s ++ temp.s ++
	    clt.fin ++               -- har
	    cl.subj ++               -- hon
	    negation pol.isTrue ++   -- inte
	    clt.inf ++               -- druckit
	    cl.compl                 -- öl
      } ;

    QuestCl cl = cl ; -- since the parts are the same, we don't need to change anything

    PredVP np vp = {
      subj  = np.s ! Nom ;
      compl = vp.compl ! np.a ;
      verb  = vp.verb 
      } ;

    ImpVP vp = {
      s = \\b => vp.verb.s ! Imper ++ negation b ++ vp.compl ! ASg Utr --- could be Pl
      } ;

    UseV v = {
      verb = v ;
      compl = \\_ => []
      } ;

    ComplV2 v2 np = {
      verb = v2 ;
      compl = \\_ => v2.c ++ np.s ! Acc  -- NP object in the accusative, preposition first
      } ;
      
    UseAP ap = {
      verb = copulaVerb ;
      compl = ap.s
      } ;
      
    UseNP np = {
      verb = copulaVerb ;
      compl = \\_ => np.s ! Nom    -- NP complement is in the nominative
      } ;
      
    UseAdv adv = {
      verb = copulaVerb ;
      compl = \\_ => adv.s
      } ;

    AdvVP vp adv =
      vp ** {compl = \\a => vp.compl ! a ++ adv.s} ;

    DetCN det cn = {
      s = table {c => det.s ! cn.isSimple ! cn.g ++ cn.s ! det.n ! det.d} ;
      a = case det.n of {Sg => ASg cn.g ; Pl => APl} ;
      } ;
      
    UsePN pn = {
      s = \\_ => pn.s ;
      a = ASg pn.g
      } ;
      
    UsePron p = p ;  -- Pron is worst-case NP  
      
    MassNP cn = {
      s = \\_ => cn.s ! Sg ! Indef ;
      a = ASg cn.g
      } ;

    a_Det = {
      s = \\_ => table {Utr => "en" ; Neutr => "ett"} ;
      n = Sg ;
      d = Indef ;
      } ;
      
    aPl_Det = {
      s = \\_,_ => [] ;
      n = Pl ;
      d = Indef ;
      } ;
    
    the_Det = {
      s = table {True => \\_ => [] ; _ => table {Utr => "den" ; Neutr => "det"}} ;
      n = Sg ;
      d = Def ;
      } ;

    thePl_Det = {
      s = table {True => \\_ => [] ; _ => \\_ => "de"} ;
      n = Pl ; d = Def ;
      } ;

    UseN n = n ** {isSimple = True} ;
    
    AdjCN ap cn = {
      s = \\n,d =>
        ap.s ! (case d of {Def => APl ; _ => case n of {Pl => APl ; _ => ASg cn.g}}) ++
        cn.s ! n ! d ;
      g = cn.g ;
      isSimple = False ;
      } ;
      
    PositA a = a ;

    PrepNP prep np = {s = prep.s ++ np.s ! Acc} ;

    CoordS conj a b = {s = a.s ++ conj.s ++ b.s} ;
    
    PPos  = {s = [] ; isTrue = True} ;
    PNeg  = {s = [] ; isTrue = False} ;

    TSim  = {s = []    ; isPres = True} ;
    TAnt  = {s = []    ; isPres = False} ;

    and_Conj = {s = "och"} ;
    or_Conj = {s = "eller"} ;

    every_Det = {s = \\_,_ => "varje" ; n = Sg ; d = Indef} ;

    in_Prep = {s = "i"} ;
    on_Prep = {s = "på"} ;
    with_Prep = {s = "med"} ;

    i_Pron = {
      s = table {Nom => "jag" ; Acc => "mig"} ;
      a = ASg Utr
      } ;
    youSg_Pron = {
      s = table {Nom => "du" ; Acc => "dig"} ;
      a = ASg Utr
      } ;
    he_Pron = {
      s = table {Nom => "han" ; Acc => "honom"} ;
      a = ASg Utr
      } ;
    she_Pron = {
      s = table {Nom => "hon" ; Acc => "henne"} ;
      a = ASg Utr
      } ;
    we_Pron = {
      s = table {Nom => "vi" ; Acc => "oss"} ;
      a = APl
      } ;
    youPl_Pron = {
      s = table {Nom => "ni" ; Acc => "er"} ;
      a = APl
      } ;
    they_Pron = {
      s = table {Nom => "de" ; Acc => "dem"} ;
      a = APl
      } ;

    have_V2 = fullVerb "ha" "har" "hade" "haft" "ha" ** {c = []} ;
}
