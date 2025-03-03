module Interpret where
import Val
import Eval

evalF :: ([Val], String) -> Val -> ([Val], String)
evalF state@(stack, out) (Id op)
    | op == "." || op == "EMIT" || op == "CR" 
      || op == "+" || op == "-" || op == "*" 
      || op == "/" || op == "^" 
      || op == "CONCAT2" || op == "CONCAT3"
      || op == "DUP"
        = evalOut op state
evalF (stack, out) val = (val : stack, out)

interpret :: String -> ([Val], String)
interpret text =
    foldl evalF ([], "") (map strToVal (words text))
