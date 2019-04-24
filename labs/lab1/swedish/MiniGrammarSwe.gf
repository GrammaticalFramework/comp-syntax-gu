--# -path=.:../abstract

concrete MiniGrammarSwe of MiniGrammar = open MiniResSwe, Prelude in {

  lincat
    Utt = {s : Str} ;
    
    Pol  = {s : Str ; isTrue : Bool} ; --- the s field is empty, but needed for parsing
    Temp = {s : Str ; isPres : Bool} ;
    
    S  = {s : Str} ;
    QS = {s : Str} ;
    
    Cl, QCl = {   -- word order is fixed in S and QS
      subj  : Str ;       -- subject
      verb  : Verb ;      -- verb form is fixed in S and QS
      compl : Str         -- the part after verb: complement, adverbs, adjective
      } ;
      
    Imp = {s : Bool => Str} ;  -- the Bool is polarity
    
    VP = {
      verb : Verb ;
      compl : AForm => Str
      } ;
      
    AP = Adjective ;
    
    CN = Noun ** {isSimple : Bool} ;       -- isSimple = no adjectival modifier
    
    NP = {s : Case => Str ; a : AForm} ;   -- the only agreement needed in Mini is adjective form
    Pron = {s : Case => Str ; a : AForm} ; -- Pron is the worst-case NP, the only one with cases
    
    Det = {
      s : Bool => Gender => Str ;   -- Bool : if applied to a simple CN (relevant for den/det/de)
      n : Number ;  -- passed to the CN
      d : Species ; -- passed to the CN
      } ;
    
    Conj = {s : Str} ;
    Prep = {s : Str} ;
    
    V = Verb ;  -- word categories are defined in MiniResSwe
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
      let clt : {fin,inf : Str} = vpForm temp.isPres cl.verb
      in {
        s = pol.s ++ temp.s ++    --- needed for parsing: a hack
	    cl.subj ++               -- hon
	    clt.fin ++               -- har
	    negation pol.isTrue ++   -- inte
	    clt.inf ++               -- druckit
	    cl.compl                 -- öl
      } ;
      
    UseQCl temp pol cl =
      let clt : {fin,inf : Str} = vpForm temp.isPres cl.verb
      in {
        s = pol.s ++ temp.s ++    -- the only difference from UseCl is "har hon" vs. "hon har"
	    clt.fin ++               -- har
	    cl.subj ++               -- hon
	    negation pol.isTrue ++   -- inte
	    clt.inf ++               -- druckit
	    cl.compl                 -- öl
      } ;

    QuestCl cl = cl ; -- since the parts are the same, we don't need to change anything

    PredVP np vp = {
      subj  = np.s ! Nom ;
      compl = vp.compl ! np.a ;   -- adjective in compl agrees to subject 
      verb  = vp.verb             -- verb needs no agreement to subject in Swe
      } ;

    ImpVP vp = {
      s = \\b => vp.verb.s ! Imper ++ negation b ++ vp.compl ! ASg Utr -- negation between verb and complement
      } ;

    UseV v = {
      verb = v ;
      compl = \\_ => []  -- empty complement
      } ;

    ComplV2 v2 np = {
      verb = v2 ;
      compl = \\_ => v2.c ++ np.s ! Acc  -- NP object in the accusative, preposition first
      } ;
      
    UseAP ap = {
      verb = copulaVerb ;
      compl = ap.s   -- ap.s is already a table of the required type
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
      s = \\_ => det.s ! cn.isSimple ! cn.g ++ cn.s ! det.n ! det.d ;
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
      s = table {
            True  => \\_ => [] ;                            -- bilen
	    False => table {Utr => "den" ; Neutr => "det"}  -- den stora bilen
	    } ;
      n = Sg ;
      d = Def ;
      } ;

    thePl_Det = {
      s = table {
            True => \\_ => [] ;
	    _ => \\_ => "de"
	    } ;
      n = Pl ;
      d = Def ;
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

    TSim  = {s = [] ; isPres = True} ;
    TAnt  = {s = [] ; isPres = False} ;

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
