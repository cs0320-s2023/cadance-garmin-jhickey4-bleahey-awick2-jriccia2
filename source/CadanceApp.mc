import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class CadanceApp extends Application.AppBase {

    hidden var view;

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        //create a delegate to handle functions
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    //creates a smaller view for the glance, which is updated when 
    // the user opens the actual app
    (:glance) function getGlanceView() {
        //create a delegate to handle functions
        return [new CadanceGlanceView() ] as Array<GlanceView>;
    }

    function onGlanceEvent(options){
        getGlanceView().onGlanceEvent(options);
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new CadanceView()] as Array<Views or InputDelegates>;
    }

}

function getApp() as CadanceApp {
    return Application.getApp() as CadanceApp;
}