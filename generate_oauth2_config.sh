echo '############################################################################'
echo 'This script will help you set up OAuth2-Proxy for use with Azure Active Directory.'
echo 'If you plan on using a different provider, please exit this script and edit the oauth2-proxy.cfg file manually.'
echo '############################################################################'
read -p "Will you be using Azure Active Directory for your provider? (y/n)?" CONT
if [ "$CONT" = "y" ]; then

echo '############################################################################'
echo 'This is the actual provider of the 2FA authentication process.'
echo 'In this use case this is set to azure but if you are using a different provider, please exit this script and edit the oauth2-proxy.cfg file manually.'
echo '############################################################################'
read -p "Enter Provider: " -e -i 'azure' PROVIDER

echo '############################################################################'
echo 'This is the client_id value you get after creating the application in Azure Active Directory.'
echo '############################################################################'
read -p "Enter Client ID: " -e -i '' CLIENT_ID

echo '############################################################################'
echo 'This is the client_secret value. You need to manually create this in the application in Azure Active Directory.'
echo '############################################################################'
read -p "Enter Client Secret: " -e -i '' CLIENT_SECRET

echo '############################################################################'
echo 'This is the Tenant ID value. Please enter the Tenant ID of your Azure Active Directory.'
echo '############################################################################'
read -p "Enter Tenant ID: " -e -i '' TENANT_ID

echo '############################################################################'
echo 'This is the Cookie Name value. As the name says, this is just the name of the cookie that will be created on the clients browser.'
echo 'You can give it any name you like but I recommend you keep it as is in case you need to troubleshoot, it will be easier to see if the cookie is being generated properly'
echo '############################################################################'
read -p "Enter Cookie Name: " -e -i '_oauth2_proxy' COOKIE_NAME

echo '############################################################################'
echo 'This is the Cookie Secret value. This is the key that is used to encrypt the cookie. You will have to generate this yourself. It is recommended you use 128-bit encryption or higher.'
echo 'You can generate your cookie secret here: https://www.allkeysgenerator.com/Random/Security-Encryption-Key-Generator.aspx'
echo '############################################################################'
read -p "Enter Cookie Secret: " -e -i '' COOKIE_SECRET

echo '############################################################################'
echo 'This is were you will put the domain or hostname of the main server that your services will run on.'
echo 'For example, if you have services named "service1" & "service2", hosted on a server with a FQDN of "srv.example.com, you will put here "example.com" as the value.'
echo '############################################################################'
read -p "Enter Cookie Domain: " -e -i '' COOKIE_DOMAIN

echo '############################################################################'
echo 'This is the time the cookie will be active. I have put this to 168 hours, which is 7 days.'
echo 'You can change this to suit your use case but I think one week is enough.'
echo '############################################################################'
read -p "Enter Cookie expiration time: " -e -i '168h' COOKIE_EXPIRE

echo '############################################################################'
echo 'This is the time one seassion will be kept open.'
echo 'Default is 1 hour, which I think is enough, but again, you are free to change this to suit your needs.'
echo '############################################################################'
read -p "Enter Cookie refresh time: " -e -i '1h' COOKIE_REFRESH

cat << EOF > oauth2-proxy.cfg
## OAuth2 Proxy Config File

## <addr>:<port> to listen on for HTTP/HTTPS clients
http_address = "0.0.0.0:4180"

## the http url(s) of the upstream endpoint. If multiple, routing is based on path
upstreams = [
     "http://127.0.0.1:4180/oauth2/login"
]

## Log requests to stdout
request_logging = true

## The OAuth Client ID, Secret
provider = "${PROVIDER}"
client_id = "${CLIENT_ID}"
client_secret = "${CLIENT_SECRET}"
oidc_issuer_url = "https://sts.windows.net/${TENANT_ID}/"
email_domains = "*"

## Templates
## optional directory with custom sign_in.html and error.html
# custom_templates_dir = "/etc/oauth2/templates/"

## Cookie Settings
## Name     - the cookie name
## Secret   - the seed string for secure cookies; should be 16, 24, or 32 bytes
##            for use with an AES cipher when cookie_refresh or pass_access_token
##            is set
## Domain   - (optional) cookie domain to force cookies to (ie: .yourcompany.com)
## Expire   - (duration) expire timeframe for cookie
## Refresh  - (duration) refresh the cookie when duration has elapsed after cookie was initially set.
##            Should be less than cookie_expire; set to 0 to disable.
##            On refresh, OAuth token is re-validated. 
##            (ie: 1h means tokens are refreshed on request 1hr+ after it was set)
## Secure   - secure cookies are only sent by the browser of a HTTPS connection (recommended)
## HttpOnly - httponly cookies are not readable by javascript (recommended)
cookie_name = "${COOKIE_NAME}"
cookie_secret = "${COOKIE_SECRET}"
cookie_domains = "${COOKIE_DOMAIN}"
cookie_expire = "${COOKIE_EXPIRE}"
cookie_refresh = "${COOKIE_REFRESH}"
cookie_secure = true
cookie_httponly = true

EOF

else
  exit;
fi
