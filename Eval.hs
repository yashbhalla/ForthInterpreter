module Eval where

import Val
import Data.Char (chr)

eval :: String -> [Val] -> [Val]
eval "*" (Integer x : Integer y : tl) = Integer (x * y) : tl
eval "*" (x : y : tl) = Real (toFloat x * toFloat y) : tl 
eval "*" _ = error "Stack underflow"

eval "+" (Integer x : Integer y : tl) = Integer (x + y) : tl
eval "+" (x : y : tl) = Real (toFloat x + toFloat y) : tl

eval "-" (Integer y : Integer x : tl) = Integer (x - y) : tl
eval "-" (y : x : tl) = Real (toFloat x - toFloat y) : tl

eval "/" (Integer y : Integer x : tl)
    | y == 0 = error "Division by zero"
    | otherwise = Integer (x `div` y) : tl
eval "/" (y : x : tl)
    | toFloat y == 0 = error "Division by zero"
    | otherwise = Real (toFloat x / toFloat y) : tl

eval "^" (Integer y : Integer x : tl) = Integer (x ^ y) : tl
eval "^" _ = error "Stack underflow"

eval "DUP" (x : tl) = x:x:tl
eval "DUP" [] = error "DUP requires at least one element on the stack"

eval "CONCAT2" ((Id s1):(Id s2):tl) = Id (s1 ++ s2) : tl
eval "CONCAT2" _ = error "CONCAT2 requires two strings"

eval "CONCAT3" ((Id s1):(Id s2):(Id s3):tl) = Id (s1 ++ s2 ++ s3) : tl
eval "CONCAT3" _ = error "CONCAT3 requires three strings"

eval "STR" ((Integer i):tl) = Id (show i) : tl
eval "STR" ((Real f):tl) = Id (show f) : tl
eval "STR" ((Id s):tl) = Id s : tl 
eval "STR" _ = error "STR requires one value"

evalOut :: String -> ([Val], String) -> ([Val], String)
evalOut "." ((Id x):tl, out) = (tl, out ++ x) 
evalOut "." ((Integer i):tl, out) = (tl, out ++ show i ++ "\n")
evalOut "." ((Real x):tl, out) = (tl, out ++ show x ++ "\n")
evalOut "." (_, _) = error "Stack underflow"

evalOut "EMIT" ((Integer i):tl, out) = (tl, out ++ [chr i])
evalOut "EMIT" _ = error "EMIT requires an integer argument"

evalOut "CR" (stack, out) = (stack, out ++ "\n")

evalOut op (stack, out) = (eval op stack, out)
