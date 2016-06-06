{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module Servant.Bazaar.Server where

import           Data.Proxy
import           Servant.API
import           Servant.Server
import           Servant.Server.Internal

import           Servant.Bazaar

instance (HasServer api context) =>
  HasServer (Bazaar :> api) context where

  type ServerT (Bazaar :> api) m =
    Bazaar -> ServerT api m

  route Proxy context subServer =
    route subProxy context (passToServer subServer (const Bazaar))
    where
      subProxy :: Proxy api
      subProxy = Proxy
