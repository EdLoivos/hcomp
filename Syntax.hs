-- Syntax.hs
module Syntax where

import qualified Data.Map as Map
import qualified Data.Vector as V

type E = Map.Map String EnvVal
type S = [Value]
type M = V.Vector Value
type C = [Control]

data EnvVal = EnvLoc Loc | EnvValue Value
    deriving (Show,Eq)

data Value = ValueEnv EnvVal | ValueCom Com | ValueInt Int
    deriving (Show,Eq)

data Control = CtrlBlock Block | CtrlC Com | CtrlExp Exp | CtrlExp Exp

data Loc = Loc Int
    deriving (Show,Eq)

newtype PIdent =
  PIdent ((Int,Int),String)
  deriving(Eq,Ord,Show)

data Decl =
  Dec Type PIdent
  deriving(Eq,Ord,Show)

data Block =
    BlockC Com
  | BlockB [Com]
  deriving(Eq,Ord,Show)

data Com =
    CDec Decl
  | While Exp Block
  | If Exp Block
  | IfElse Exp Block Block
  | Return Exp
  deriving(Eq,Ord,Show)

data Exp =
   Num Int
 | Atr PIdent Exp
 | Or Exp Exp
 | And Exp Exp
 | Eq Exp Exp
 | Neq Exp Exp
 | Lt Exp Exp
 | Gt Exp Exp
 | Add Exp Exp
 | Sub Exp Exp
 | Mul Exp Exp
 | Div Exp Exp
 | Neg Exp
 | NegInt Exp
 | Int Integer
 | Bool BoolT
  deriving (Eq,Ord,Show)

data BoolT =
    ETrue
  | EFalse
  deriving(Eq,Ord,Show)

data Type =
    TInt
  | TBool
  deriving(Eq,Ord,Show)
