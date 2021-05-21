module Database
  ( module Exports,
    runAllMigrations,
  )
where

import Database.Connection as Exports
import Database.Setup as Exports
import Database.Tables.User as Exports
import qualified Config as C
import Control.Monad.IO.Class (MonadIO, liftIO)
import Database.Persist.Postgresql
import  Database.Tables.Transaction  as Exports

allMigrations :: [Migration]
allMigrations =
  [ migrateUser,
    migrateTransaction
  ]


migrateAll :: (MonadIO m) => SqlPersistT m ()
migrateAll = mapM_ runMigration allMigrations

runAllMigrations :: IO ()
runAllMigrations = do
  conf <- C.retrieveConfig
  withDbPoolDebug conf $ \pool -> liftIO $ runSqlPersistMPool migrateAll pool