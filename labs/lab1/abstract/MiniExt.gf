abstract MiniExt = MiniLang ** {

-- implementing this on top of MiniLang(Eng|Swe) is an alternative assignment

cat
  IP ;   -- interrogative pronoun,    e.g. "who"
  IAdv ; -- interrogative adverbial,  e.g. "where"
  RS ;   -- relative clause with fixed tense and polarity, e.g. "that I have not seen"
  RCl ;  -- relative clause,          e.g. "that I see"
  RP ;   -- relative pronoun,         e.g. "that"
  Subj ; -- subjunction,              e.g. "because"
  VS ;   -- sentence-complement verb, e.g. "know"
  VQ ;   -- question-complement verb, e.g. "wonder"
  VV ;   -- VP-complement verb,       e.g. "want"
  VA ;   -- AP-complement verb,       e.g. "become"

fun
  QuestVP   : IP -> VP -> QCl ;   -- who sees me
  QuestV2   : IP -> V2 -> QCl ;   -- whom do I see
  QuestIAdv : IAdv -> Cl -> QCl ; -- where does she see me

  UseRCl    : Temp -> Pol -> RCl -> RS ;
  RelVP     : RP -> VP -> RCl ;  -- that sees me
  RelV2     : RP -> V2 -> RCl ;  -- that I see
  
  ComplVS   : VS -> S  -> VP ;  -- know that she sees me
  ComplVQ   : VS -> S  -> VP ;  -- wonder whom I see
  ComplVV   : VV -> VP -> VP ;  -- want to sleep
  ComplVA   : VA -> AP -> VP ;  -- become red
  ReflV2    : V2 -> VP ;        -- see himself

  RelCN     : CN -> RS -> CN ; -- car that I see

  PossSgDet : Pron -> Det ; -- my (car)
  PossPlDet : Pron -> Det ; -- my (cars)

  SubjS     : Subj -> S -> Adv ;  -- because she sees me

-- more tenses
  TPastSim : Temp ; -- (slept)
  TPastAnt : Temp ; -- had (slept)
  TCondSim : Temp ; -- would (sleep)
  TCondAnt : Temp ; -- would have (slept)

-- Structural words
  who_IP  : IP ;
  what_IP : IP ;

  where_IAdv : IAdv ;
  why_IAdv   : IAdv ;

  that_RP : RP ;

  if_Subj       : Subj ;
  because_Subj  : Subj ;
  although_Subj : Subj ;


-- content words to test with
  know_VS   : VS ;  -- know (that she sleeps)
  wonder_VQ : VQ ;  -- wonder (who sleeps)
  want_VV   : VV ;  -- want (to sleep)
  must_VV   : VV ;  -- must (sleep)
  try_VV    : VV ;  -- try (to sleep)
  become_VA : VA ;  -- become (red)
  
}