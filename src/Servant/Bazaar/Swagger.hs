{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}

-- | Implements an instance @'HasSwagger' ('Bazaar' :> api)@. It doesn't --
-- alter the generated 'Data.Swagger.Swagger' value and is solely provided to
-- allow to use the 'Bazaar' combinator in combination with @servant-swagger@.

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
