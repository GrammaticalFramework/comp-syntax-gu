module Main where

import Control.Monad
import Data.Maybe
import Data.Char
import Data.List
import System.Process
import System.Directory
import System.Environment (getArgs)
import System.Exit


-- To clone a project from one language to another:
--   Clone fromdir todir fromlang tolang (--comment)
--
-- 1. for each Module in 'fromdir', copy Module(fromlang) to todir/Module(tolang) ; create todir if it doesn't exist
-- 2. in each Module(tolang), replace substrings fromlang by tolang, if proper suffixes of identifiers
--
-- Example: runghc Clone english danish Eng Dan

main = do
  args <- getArgs
  if length args < 4
    then putStrLn "usage: Clone fromdir todir fromlang tolang"
    else do
      let (options,[fromdir,todir,fromlang,tolang]) = span ((=='-') . head) args
      allfromfiles   <- getDirectoryContents fromdir
      let fromfiles = filter (isSuffixOf (fromlang ++ ".gf")) allfromfiles
      let modules = map (getAbstractName fromlang) fromfiles
      createDirectoryIfMissing True todir
      mapM_ (clone options fromdir todir fromlang tolang) modules

clone options fromdir todir from to absname = do
  s <- readFile (fromdir ++ "/" ++ absname ++ from ++ ".gf")
  writeAndReportFile (todir ++ "/" ++ absname ++ to ++ ".gf") (replaceLang from to s)

getAbstractName from file =
  if isSuffixOf (from ++ ".gf") file
  then take (length file - (length from + 3)) file
  else error ("Need suffix " ++ (from ++ ".gf") ++ " therefore cannot clone file name " ++ file)

replaceLang s1 s2 = repl where
  repl s = case s of
    c:cs -> case splitAt lgs s of
      (pre,c:rest) | pre == s1 && elem c " \n\t,:=(){}.-[];" -> s2 ++ [c] ++ repl rest
      _                      -> c : repl cs
    _ -> s
  lgs = length s1

writeAndReportFile file s = do
  writeFile file s
  putStrLn $ "wrote " ++ file

