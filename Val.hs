module Val where

import Data.Maybe (isJust)
import Text.Read (readMaybe)

data Val = Integer Int 
         | Real Float
         | Id String
         deriving (Eq)

-- Custom Show instance to display values without constructors
instance Show Val where
    show (Integer i) = show i
    show (Real f) = show f
    show (Id s) = s

strToVal :: String -> Val
strToVal s = case readMaybe s :: Maybe Int of
    Just i -> Integer i
    Nothing -> case readMaybe s :: Maybe Float of
        Just f -> Real f 
        Nothing -> Id s

toFloat :: Val -> Float
toFloat (Real x) = x
toFloat (Integer i) = fromIntegral i     
toFloat _ = error "Not convertible to float"
