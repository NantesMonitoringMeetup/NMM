module Main where

import           System.Environment
import           System.ProcessControl

sampleExe :: String
sampleExe = "./sample"

colors :: [ String ]
colors = [ "\x1b[31m"
         , "\x1b[32m"
         , "\x1b[33m"
         , "\x1b[34m"
         , "\x1b[35m"
         , "\x1b[36m"
         , "\x1b[37m"
         , "\x1b[91m"
         , "\x1b[92m"
         , "\x1b[93m"
         , "\x1b[94m"
         , "\x1b[95m"
         , "\x1b[96m"
         , "\x1b[97m"
         ]

numberOfColors :: Int
numberOfColors = length colors

main :: IO ()
main = do
  -- list all ports on which to run sampl
  ports <- getArgs
  let procs = map (uncurry trackSampleProcess) $ zip ports [0 .. ]
  trackProcesses procs
    where
      trackSampleProcess port idx =
        TrackedProcess ("sample-" ++ port) (colors !! (idx `mod` numberOfColors)) sampleExe [ port ]


