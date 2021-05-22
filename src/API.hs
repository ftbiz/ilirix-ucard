{-# LANGUAGE DataKinds #-}
{-# LANGUAGE RankNTypes #-}

module API
   ( API,
     apiType,
   )
 where

-- import qualified Config as C

-- import Data.Proxy (Proxy (..))
-- import qualified Data.Text as T
import Servant 
import API.PlaidToken ( PlaidTokenAPI )
import API.Token
  
-- import qualified Ext.HTTP.Response as Web
-- data TestResponse = TestResponse
--    { responseStatus :: Bool,
--      responseText :: T.Text
--    }
import API.User ( UserAPI )


type API = 
  PlaidTokenAPI :<|> UserAPI :<|> TokenAPI
  --  "test-endpoint-with" :> Capture "echotext" T.Text :> Get '[JSON] T.Text 
  --   :<|> "get-user-by-id" :> Capture "userId" Int :> Get '[JSON] (Maybe UserSerializer)
  --   :<|> "send" :> Capture "userId" Int :> Capture "userId" T.Text :>  Get '[JSON] (Web.WebApiHttpResponse ())

apiType :: Proxy API
apiType = Proxy