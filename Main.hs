module Main where

import Interpret
import System.Environment

main :: IO ()
main = do
    (fileName:_) <- getArgs  -- Correct: safely handles file argument
    contents <- readFile fileName
    let (stack, output) = interpret contents
        finalOutput = output ++ if null stack 
            then "" 
            else "\nStack not empty: " ++ show stack  -- Needs Val Show instance
    putStrLn finalOutput
