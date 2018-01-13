<cfif isDefined("url.rotate") >
    <cfset sessionRotate()/>
    <cfset session.isLoggedIn = "yes">
</cfif>


