{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NumericUnderscores #-}
{-# LANGUAGE BlockArguments #-}
module Main where

import Text.Printf (printf)
import Control.Monad (forM_)
import Data.List (genericIndex)
import GHC.Num.Natural (Natural)
import Data.FileEmbed
import Prelude hiding (words)
import Control.Concurrent (threadDelay)
import Data.List.Split

words :: [String]
words = splitOn "\n" $(embedStringFile "../2222.txt")

getWord :: Natural -> String
getWord = genericIndex words

main :: IO ()
main = do
  forM_ [(0 :: Natural)..2222] \i -> do
    printf $ getWord i
    printf "\n"
    threadDelay 603_960
