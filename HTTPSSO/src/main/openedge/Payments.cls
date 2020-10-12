 
/*------------------------------------------------------------------------
   File        : Identity
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : isyed
   Created     : Tue Mar 10 13:50:00 EDT 2020
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Json.ObjectModel.JsonObject FROM PROPATH.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Payments:
    
       
    // Return the Client Principal Object as JSON
    method public JsonObject userInfo():
        
        def var CPInfo as JsonObject no-undo.
        def var hCP  as handle     no-undo.
        def var lok  as longchar   no-undo.
        
        hCP = session:current-request-info:GETCLIENTPRINCIPAL().
        
        CPInfo = new JsonObject().
        
        CPInfo:Add("userName", hCP:QUALIFIED-USER-ID).
        CPInfo:Add("state", hCP:login-state).
        CPInfo:Add("ROLES", hCP:ROLES).
        
      return CPInfo.
        
        
    end method. 

END CLASS.