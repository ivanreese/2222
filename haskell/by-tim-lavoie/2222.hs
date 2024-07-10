module Main (main) where

import Control.Concurrent

doThing :: [String] -> IO ()

doThing [] =
  putStrLn "--==** Complete! **==--"

doThing [str] = do
  putStrLn str
  doThing []

doThing (str:strs) = do
  putStrLn str
  threadDelay 603960  -- this takes integer values of microseconds.
  doThing strs

main :: IO ()
main = do
  foo <- readFile "2222.txt"
  let wordList = lines foo
  doThing wordList
