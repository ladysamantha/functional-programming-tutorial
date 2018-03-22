{-# LANGUAGE OverloadedStrings #-}

import Data.Char
import Data.List
import Control.Arrow ((&&&))
import Control.Monad (forM_)

-- the (.) function is function composition
-- i.e. (f . g) x == f . g $ x == f(g(x))

getWords :: String -> [String]
getWords = map (filter isLetter) . words

isEmptyString :: String -> Bool
isEmptyString "" = True
isEmptyString _  = False

-- adapted from https://stackoverflow.com/questions/7803449/simple-word-count-in-haskell#7803538

-- (head &&& length) in this context has the signature
-- ([String] -> String) -> ([String] -> Int) -> ([String] -> (String,Int))
wordCount :: String -> [(String, Int)]
wordCount = map (head &&& length) . group . sort . filter (not . isEmptyString) . getWords . map toLower

-- using a function as an `infix` operator
sortWordCount = sortBy $ \a b -> snd b `compare` snd a

sortByWordCount = sortWordCount . wordCount

main = do
  let printCount (w, c) = do
      putStrLn $ w ++ ": " ++ (show c)
  top10 <- take 10 . sortByWordCount <$> readFile "leaves.txt"
  putStrLn "Word: Count"
  putStrLn "++++++++++++++++++"
  forM_ top10 printCount
    
