resource MorphologyEng = {

-- write, writes, wrote, written, writing
param VForm = Inf | Pres | Past | PastPart | PresPart ;

oper V : Type = {s : VForm => Str} ;

oper
  worstV : (inf,pres,past,pastpart,prespart : Str) -> V ;
  worstV  inf pres past pastpart prespart = {
    s = table {
      Inf => inf ;
      Pres => pres ;
      Past => past ;
      PastPart => pastpart ;
      PresPart => prespart 
      } ;
    } ;

  regV : (inf : Str) -> V ;
  regV inf = worstV inf (inf + "s") (inf + "ed") (inf + "ed") (inf + "ing") ;

  smartV : (inf : Str) -> V ;
  smartV inf = case inf of {
     pl  +  ("a"|"e"|"i"|"o"|"u") + "y" => regV inf ;
     cr  +  "y" => worstV inf (cr + "ies")  (cr + "ied") (cr + "ied") (inf + "ing") ;
     lov + "e" => worstV inf (inf + "s")  (lov + "ed") (lov + "ed") (lov + "ing") ;
     kis + ("s"|"sh"|"x") => worstV inf (inf + "es") (inf + "ed") (inf + "ed") (inf + "ing") ;
     _ => regV inf
     } ;

  irregV : (write,wrote,written : Str) -> V ;
  irregV write wrote written =
    let writed = smartV write
    in worstV (writed.s ! Inf) (writed.s ! Pres) wrote written (writed.s ! PresPart) ;
    













}