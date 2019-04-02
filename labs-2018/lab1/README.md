MiniResourceGrammar for Computational Syntax course

Aarne Ranta 2018

This mini resource is a proper fragment of the full RGL.
Some of the functions are shortcuts, as defined in functor/MiniLangFunctor.gf.

Abstract syntax files:
```
  MiniGrammar  -- categories, syntactic functions, structural words
  MiniLexicon  -- content word lexicon
  MiniLang     -- top module putting these together
```
Concrete syntax directories:
```
  english    -- English reference implementation
  functor    -- functor implementation using RGL; usable as reference, too
  myenglish  -- example English modified from parameters/ during a lecture
  parameters -- baseline implementation using standard parameters and pseudo Latin
  pidgin     -- baseline implementation using only strings and pseudo English
```

To start a project for a new language, e.g. from parameters/ to Arabic, you can use the CloneProject script:
```
  runghc CloneProject.hs parameters arabic Param Ara
  ```
This assumes that you have the Haskell compiler GHC installed. If you don't, you can clone manually:
```
  mkdir arabic
  cp parameters/*.gf arabic
```
Then
- change the file names in arabic/ from *Param.gf to *Ara.gf
- change the module name suffixes in the headers of these files from Param to Ara


To compare your grammar with the standard RGL, you can create a functor instantiation similar to functor/MiniGrammarFunctorEng.gf for that language, and import it in GF together with your own grammar.




