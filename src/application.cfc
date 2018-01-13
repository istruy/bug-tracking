component{
    this.datasource='intererror';
    this.applicationTimeout = CreateTimeSpan(10, 0, 0, 0);
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0);

    function onApplicationStart(){
        application.datasource = "intererror";
        return true;
    }

    function onRequestStart(string targetPage){
        if(structKeyExists(url,'reload')){
        }
    }

    public function onSessionStart() {
        Session.started = now();
        return true;
    }

    public function onSessionEnd() {
        return false;
    }


}
