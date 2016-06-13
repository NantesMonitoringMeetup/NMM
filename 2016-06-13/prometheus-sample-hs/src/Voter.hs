{-# LANGUAGE ScopedTypeVariables #-}
-- | A random voter process
module Main where

import           Control.Concurrent
import           Control.Concurrent.Async
import           Control.Monad
import           Network.Browser
import           Network.HTTP
import           System.Environment
import           System.Random

data Color = Red | Blue | Green
             deriving (Enum)

instance Show Color where
  show Red = "red"
  show Blue = "blue"
  show Green = "green"

main :: IO ()
main = do
  [ numThreads ] <- map read <$> getArgs
  void $ mapConcurrently runVoter [ 1 :: Int .. numThreads ]

    where
      runVoter _ = forever $ do
        w <- randomRIO (1000, 1000000 :: Int)
        r <- randomRIO (0, 3 :: Int)
        c :: Color <- toEnum <$> randomRIO (0,2)
        threadDelay w
        let uri = "http://127.0.0.1:300" ++ show r  ++ "/"  ++ show c
        void $ browse $ setCookies [] >> (request (getRequest uri))


