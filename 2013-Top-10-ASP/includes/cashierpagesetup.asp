<!-- #include virtual="/handlers/securitymode.asp" -->
<!-- #include file="functions.asp" -->
<!-- #include file="databasesetup.asp" -->
<!-- #include file="cashierusersession.asp" -->
<!-- #include file="cashierlinks.asp" -->
<!-- #include file="errormessages.asp" -->
<%

dim ousersession, globalsalt

'##################################################
'##### global password salt - use by login and register #####
'##################################################
globalsalt = "lIcqreAN2ESpWUtVMrZfp"

'##################################################
'##### if we have a session cookie, then validate the user #####
'##################################################

if request.querystring("session")<>"" then

	set ousersession = validateSession()

else

	set ousersession = nothing

end if

%>