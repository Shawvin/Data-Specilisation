library(httr)

#Find Oauth settings for github:
#http://developer.github.com/v3/oauth/
oauth_endpoints("github")

myapp<-oauth_app("github",
	key="aad781b218b91a7427c0",
	secret="5875064d1c23990e01f31ced43de0821eaeb18ae")

#Get Oauth credentials
github_token<-oauth2.0_token(oauth_endpoints("github"),myapp)

#Use API
gtoken<-config(token=github_token)
req<-GET("https://api.github.com/users/jtleek/repos",gtoken)
stop_for_status(req)
con_req<-content(req)

myurl="https://github.com/jtleek/datasharing"

f<-function(x){if(x$html_url==myurl) x$created_at}
lapply(con_req,f)