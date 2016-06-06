{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}

module Servant.Bazaar.Swagger where

import           Data.Proxy
import           Servant.API
import           Servant.Swagger

import           Servant.Bazaar

instance (HasSwagger api) =>
  HasSwagger (Bazaar :> api) where

  toSwagger Proxy =
    toSwagger subProxy
    where
      subProxy :: Proxy api
      subProxy = Proxy
