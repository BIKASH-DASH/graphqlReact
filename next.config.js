require("dotenv").config();

const {
    DATABASE_URL,
    Auth0_Client_ID,
    Auth0_Client_Domain,
    Auth0_Client_Secret,
    Auth0_Client_Scope,
    Auth0_Client_Cookie,
    BackEndAddress
} = process.env;

module.exports = {
    publicRunTimeConfig : {
        BackEndUrl : `${BackEndAddress}/api/graphql`
    },
    
    serverRunTimeConfig : {
        auth:{
            domain: Auth0_Client_Domain,
            clientId:Auth0_Client_ID,
            clientSecret:Auth0_Client_Secret,
            scope:Auth0_Client_Scope,
            redirectUri:`${BackEndAddress}/api/calback`,
            postLogoutRedirectUri:`${BackEndAddress}/`

        },
        cookieSecret:Auth0_Client_Cookie
    },
}