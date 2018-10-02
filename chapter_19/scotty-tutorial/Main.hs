{-# LANGUAGE OverloadedStrings #-}

import Control.Monad (join)
import Data.Maybe (fromMaybe)
import System.Environment (lookupEnv)
import Text.Read (readMaybe)
import Web.Scotty

main :: IO ()
main = do
  port <- getPort
  scotty port $ do
    get "/:word" $ do
      beam <- param "word"
      -- Question:
      -- I want to look up info for the types that `html` accepts, how?
      --
      -- > *Main> :i html
      -- > html :: text-1.2.3.0:Data.Text.Internal.Lazy.Text -> ActionM ()
      -- >         -- Defined in ‘Web.Scotty’
      -- > *Main> :i text-1.2.3.0:Data.Text.Internal.Lazy.Text
      -- <interactive>:1:5: error: parse error on input ‘-’

      html $ mconcat ["<h1>Scotty, ", beam, " me up!</h1>"]

getPort :: IO Int

--                                                   IO (Maybe String)
getPort = fromMaybe 5678 . join . fmap readMaybe <$> lookupEnv "PORT"
  --                                            lookupEnv "PORT" ::                    IO        (Maybe String)
  --                         fmap readMaybe <$> lookupEnv "PORT" :: Read a          => IO (Maybe (Maybe a)      )
  --                  join . fmap readMaybe <$> lookupEnv "PORT" :: Read a          => IO        (Maybe a)
  -- fromMaybe 5678 . join . fmap readMaybe <$> lookupEnv "PORT" :: (Read a, Num a) => IO               a

-- getPortDo :: IO Int
-- getPortDo = do
--   port <- lookupEnv "PORT"
--   return $ readMaybe port
