{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

-- | Implements an instance @'HasClient' ('Bazaar' :> api)@ with
--
-- > type Client (Bazaar :> api) = Bazaar -> Client api

module Servant.Bazaar.Client where

import           Data.Proxy
import           Servant.API
import           Servant.Client

import           Servant.Bazaar

instance (HasClient api) =>
  HasClient (Bazaar :> api) where

  type Client (Bazaar :> api) = Bazaar -> Client api
  clientWithRoute Proxy req Bazaar =
    clientWithRoute subProxy req
    where
      subProxy :: Proxy api
      subProxy = Proxy
