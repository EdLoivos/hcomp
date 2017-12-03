module HelperTools where
import Syntax


filterE :: (a,b,c,d,o) -> (a)
filterE (e,_,_,_,_) = (e)

filterS :: (a,b,c,d,o) -> (b)
filterS (_,s,_,_,_) = (s)

filterM :: (a,b,c,d,o) -> (c)
filterM (_,_,m,_,_) = (m)

convertLoc :: Loc -> Int
convertLoc (Loc a) = a

convStr :: Str -> Value
convStr (ValueI a) = ValI a
convStr (ValueB b) = ValB b

convValStr :: Value -> Str
convValStr (ValI a) = ValueI a
convValStr (ValB a) = ValueB a

convValBnd :: Value -> Bnd
convValBnd (ValI a) = BndVal (ValueI a)
convValBnd (ValB a) = BndVal (ValueB a)

convBnd :: Bnd -> Value
convBnd (BndVal b) = convStr(b)

isLoc :: Bnd -> Bool
isLoc (BndLoc _) = True
isLoc _ = False

isStr :: Bnd -> Bool
isStr (BndVal _) = True
isStr _ = False

getVar :: Contr -> [Char]
getVar (Cexp (Evar a)) = a

getVal :: Contr -> Value
getVal (Cexp (EBool a)) = ValB a

rBnd :: Bnd -> Int
rBnd (BndLoc (Loc a)) = a

rAbs :: Bnd -> (F,[Contr])
rAbs (BndAbs (a,b)) = (a,b)

rIVal :: Value -> Int
rIVal (ValI a) = a

rBVal :: Value -> Bool
rBVal (ValB a) = a

isTrue :: Value -> Bool
isTrue (ValB True) = True
isTrue _ = False

isFalse :: Value -> Bool
isFalse (ValB False) = True
isFalse _ = False

ctr :: [Exp] -> [Contr]
ctr (a:exps) = (Cexp a):(ctr (exps))

rev1 :: [a] -> [a]
rev1 [] = []
rev1 (x:xs) = reverse xs ++ [x]
