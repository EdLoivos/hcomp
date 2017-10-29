module ESMC where

import qualified Data.Map as Map
import Data.Char

import Syntax
import Expressions
import BooleanExpressions
import Commands

eval :: (E, S, M, C) -> (E, S, M, C)
eval (e,s,m,c)
   | null c = (e,s,m,c)
   | x == "v" = evalExp (e,s,m,c)
   | x == "+" = evalExp (e,s,m,c)
   | x == "-" = evalExp (e,s,m,c)
   | x == "*" = evalExp (e,s,m,c)
   | x == "nil" = evalCMD (e,s,m,c)
   | x == ":=" = evalCMD (e,s,m,c)
   | x == "if" = evalCMD (e,s,m,c)
   | x == "tt" = evalBoolean (e,s,m,c)
   | x == "ff" = evalBoolean (e,s,m,c)
   | x == "=" = evalBoolean (e,s,m,c)
   | x == "or" = evalBoolean (e,s,m,c)
   | x == "~" = evalBoolean (e,s,m,c)
   | otherwise = eval (e,x:s,m,tail c)
    where x = head c