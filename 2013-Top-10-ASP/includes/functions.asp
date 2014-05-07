<%

function SQLStr(strTemp)

	'##################################################
	'##### prevents sql injection and some sql errors #####
	'##################################################

	if isnull(strTemp) then
		SQLStr=""
	else
		SQLStr=replace(strTemp,"'","''")
	end if

end function

function SQLNum(intTemp)

	'##################################################
	'##### prevents sql injection and some sql errors #####
	'##################################################

	if isnull(intTemp) then
		SQLNum="null"
	else
		intTemp=trim(intTemp)
		if isNumeric(intTemp) then
			SQLNum=cstr(intTemp)
		else
			SQLNum="0"
		end if
	end if

end function

function SQLBit(intTemp)

	'##################################################
	'##### prevents sql injection and some sql errors #####
	'##################################################

	if isnull(intTemp) then intTemp=""
	if not cstr(trim(intTemp))="0" and not lcase(cstr(trim(intTemp)))="false" and not trim(intTemp)="" then
		SQLBit=1
	else
		SQLBit=0
	end if

end function

function GetConnectionString()

	'##################################################
	'##### read the web.config file to get the connection string #####
	'##################################################

	dim xmlDoc,xmlappSettings,xmladd

	set xmlDoc=server.CreateObject("Microsoft.XMLDOM")
	set xmlConfig=server.CreateObject("Microsoft.XMLDOM")
	set xmlConStrings=server.CreateObject("Microsoft.XMLDOM")
	set xmladd=server.CreateObject("Microsoft.XMLDOM")

	GetConnectionString=""

	xmlDoc.async="false"
	xmlDoc.load(server.MapPath("web.config"))

	set xmlConfig = xmldoc.GetElementsByTagName("connectionStrings").Item(0)
	set xmladd = xmlConfig.GetElementsByTagName("add")

	for each x in xmladd

		'Check for the Atrribute Value
		if x.getAttribute("name") ="DefaultConnection" then
			GetConnectionString = x.getAttribute("connectionString")
			exit for
		end if

	next

	set xmladd=nothing
	set xmlappSettings=nothing
	set xmlDoc=nothing


end function

function GetMode()

	'##################################################
	'##### return if the site is in security mode or not #####
	'##################################################

	''if we have a security mode cookie
	if not request.cookies("securitymode") is nothing then

		''and the security mode is valid, then return the current mode
		if request.cookies("securitymode")="normal" or request.cookies("securitymode")="" then

			getmode="normal"

		else

			getmode="secure"

		end if

	else

		getmode="normal"

	end if

end function

function GetSessionKey()

	'##################################################
	'##### return the session key (if there is one) #####
	'##################################################

	''if we have a sessionkey cookie
	if not request.cookies("sessionkey") is nothing then

		''and the sessionkey is valid, then display an account link instead of login link
		if request.cookies("sessionkey")<>"SESSIONKEYINVALID" and request.cookies("sessionkey")<>"" then

			GetSessionKey=request.cookies("sessionkey")

		else

			GetSessionKey=""

		end if

	else

		GetSessionKey=""

	end if

end function

sub clearSessionCookie()

	'##################################################
	'##### clear session cookie (e.g. logout) #####
	'##################################################

	response.cookies("sessionkey")=""

end sub

function GenerateToken()

	'##################################################
	'##### generate a 20 char random token (for authenticating forms) #####
	'##################################################

	Randomize

	dim token, i, usablechars

	''create a list of usable chars, as A-Z and a-z and 0-9 arent grouped together in ASCII
	usablechars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

	token=""

	''create a string of 20 random chars
	for i=0 to 20

		token = token & mid(usablechars,Int((Rnd * 62) + 1),1)

	next

	GenerateToken=token

end function

%>