--# -path=.:..

concrete MiniLangFunctorEng of MiniLang =
  MiniLangFunctor with
    (Grammar = GrammarEng),
    (Lexicon = LexiconEng)
  ;