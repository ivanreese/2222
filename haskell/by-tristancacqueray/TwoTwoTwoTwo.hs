module TwoTwoTwoTwo where
foreign import ccall "usleep" threadDelay :: Int -> IO ()
play w = putStrLn w >> threadDelay 603960
main = mapM_ play =<< lines <$> readFile "../../2222.txt"
