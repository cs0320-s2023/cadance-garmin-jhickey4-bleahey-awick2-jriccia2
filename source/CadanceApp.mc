import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

// This is the main application class. It is the entry point for the
// application. It is responsible for creating the initial view and
// handling application lifecycle events.
class CadanceApp extends Application.AppBase {
  hidden var view;

  function initialize() {
    AppBase.initialize();
  }

  // onStart() is called on application start up
  function onStart(state as Dictionary?) as Void {}

  // onStop() is called when your application is exiting
  function onStop(state as Dictionary?) as Void {}

  //creates a smaller view for the glance, which is updated when
  // the user opens the actual app
  (:glance)
  function getGlanceView() {
    //create a delegate to handle functions
    return [new CadanceGlanceView()] as Array<GlanceView>;
  }

  function onGlanceEvent(options) {
    //If I want to display something other than the app name, add a
    // delegate or event here.
  }

  // Returns the initial view of the application
  function getInitialView() as Array<Views or InputDelegates>? {
    return [new CadanceView()] as Array<Views or InputDelegates>;
  }
}

// This is the main entry point for the application. It is responsible
// for creating the application object and starting it.
function getApp() as CadanceApp {
  return Application.getApp() as CadanceApp;
}
