--# -path=.:../abstract
concrete MiniGrammarSwe of MiniGrammar = open MiniResSwe, Prelude in {


  lincat
    Utt = {s : Str} ;
    Pol  = {s : Str ; isTrue : Bool} ; -- the s field is empty, but needed for parsing
    Temp = {s : Str ; isPres : Bool} ;
    
    S  = {s : Str} ;
    QS = {s : Str} ;
    Cl, QCl = {   -- word order is fixed in S and QS
      subj  : Str ;                      -- subject
      verb  : Bool => {fin,inf : Str} ;  -- dep. Temp, e.g. "har","sovit"
      compl : Str           -- after verb: complement, adverbs, adjective
      } ;
    Imp = {s : Bool => Str} ;
    VP = {verb : Verb ; compl : AForm => Str} ;
    AP = Adjective ;
    CN = Noun ;
    NP = {s : Case => Str ; a : AForm} ;
    Pron = {s : Case => Str ; a : AForm} ;
    Det = {s : Gender => Str ; n : Number} ;
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
      let clt = cl.verb ! temp.isPres
      in {
        s = pol.s ++ temp.s ++    --- needed for parsing: a hack
	    cl.subj ++               -- hon
	    clt.fin ++               -- har
	    negation pol.isTrue ++   -- inte
	    clt.inf ++               -- druckit
	    cl.compl                 -- öl
      } ;
      
    UseQCl temp pol cl =
      let clt = cl.verb ! temp.isPres
      in {
        s = pol.s ++ temp.s ++
	    clt.fin ++               -- har
	    cl.subj ++               -- hon
	    negation pol.isTrue ++   -- inte
	    clt.inf ++               -- druckit
	    cl.compl                 -- öl
      } ;

    QuestCl cl = cl ; -- since the parts are the same, we don't need to change anything
{-
    PredVP np vp = {
      subj = np.s ! Nom ;
      compl = vp.compl ;
      verb = \\plain,isPres => case <vp.verb.isAux, plain, isPres, np.a> of {

        -- non-auxiliary verbs, negative/question present: "does (not) drink" 
        <False,False,True,Agr Sg Per3> => {fin = "does" ; inf = vp.verb.s ! VF Inf} ;
        <False,False,True,_          > => {fin = "do"   ; inf = vp.verb.s ! VF Inf} ;
	
        -- non-auxiliary, plain present ; auxiliary, all present: "drinks", "is (not)"
        <_,_, True, Agr Sg Per1> => {fin = vp.verb.s ! PresSg1    ; inf = []} ;
        <_,_, True, Agr Sg Per3> => {fin = vp.verb.s ! VF PresSg3 ; inf = []} ;
        <_,_, True, _>           => {fin = vp.verb.s ! PresPl     ; inf = []} ;

        -- all verbs, past: "has (not) drunk", "has (not) been"
        <_,_, False,Agr Sg Per3> => {fin = "has"  ; inf = vp.verb.s ! VF PastPart} ;
        <_,_, False,_          > => {fin = "have" ; inf = vp.verb.s ! VF PastPart} 

        -- the negation word "not" is put in place in UseCl, UseQCl
      }
    } ;
-}

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
{-      
    DetCN det cn = {
      s = table {c => det.s ++ cn.s ! det.n} ;
      a = Agr det.n Per3   -- this kind of NP is always third person
      } ;
-}      
    UsePN pn = {
      s = \\_ => pn.s ;
      a = ASg pn.g
      } ;
      
    UsePron p = p ;  -- Pron is worst-case NP  
      
    MassNP cn = {
      s = \\_ => cn.s ! Sg ! Indef ;
      a = ASg cn.g
      } ;

{-
    a_Det = {s = pre {"a"|"e"|"i"|"o" => "an" ; _ => "a"} ; n = Sg} ; --- a/an can get wrong
    aPl_Det = {s = "" ; n = Pl} ;
    the_Det = {s = "the" ; n = Sg} ;
    thePl_Det = {s = "the" ; n = Pl} ;

    UseN n = n ;
    
    AdjCN ap cn = {
      s = table {n => ap.s ++ cn.s ! n}
      } ;
-}
    PositA a = a ;

    PrepNP prep np = {s = prep.s ++ np.s ! Acc} ;

    CoordS conj a b = {s = a.s ++ conj.s ++ b.s} ;
    
    PPos  = {s = [] ; isTrue = True} ;
    PNeg  = {s = [] ; isTrue = False} ;

    TSim  = {s = []    ; isPres = True} ;
    TAnt  = {s = []    ; isPres = False} ;

    and_Conj = {s = "och"} ;
    or_Conj = {s = "eller"} ;

    every_Det = {s = \\_ => "varje" ; n = Sg} ;

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

    have_V2 = mkVerb "ha" "har" "hade" "haft" "ha" ** {c = []} ;
}
