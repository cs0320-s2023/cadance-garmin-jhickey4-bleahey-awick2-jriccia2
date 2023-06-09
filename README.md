# CaDance for Garmin

## Project Details:

**Contributors:**

Brendan Leahey (bleahey)

Justin Hickey (jhickey4)

Alex Wick (awick2)

Joey Ricciarduli (jriccia2)

**Git Repo Link:**
https://github.com/cs0320-s2023/cadance-garmin-jhickey4-bleahey-awick2-jriccia2

**Description:**
CaDance for Garmin is a Garmin Connect IQ application that uses the sensor data
from a Garmin Forerunner 245 Music to generate the fields required for the
[CaDance web application](https://github.com/cs0320-s2023/final-project-jhickey4-bleahey-awick2-jriccia2). 
This includes the user's Spotify energy input and running cadence. It allows these fields to be estimated
more accurately and in real time, as opposed to the current method of manual entry by the user on the
web app based on their own estimations.

**Privacy/Use of Data:**
This application requires access to the user's heart rate data, running/biking
cadence, height, and gender. This data is used to calculate the user's
estimated energy expended during an activity. This data is not stored or
transmitted anywhere outside of the device/simulator, nor is it used for any other
purpose.

The application is currently in development and is not yet released
beyond the ciq simulator.

## Getting Started

### Prerequisites

This application is currently unreleased and only in development for the
Garmin Forerunner 245 Music.

To run the device simulator (which is the only guarunteed way to run the
application at the moment), you will need to install the Garmin Connect IQ SDK.
It is also recommended that you install the VSCode extension for MonkeyC.
They can both be found here:
https://developer.garmin.com/connect-iq/sdk/

For the simplest solution, cloning this repository into VSCode will import many
of the necessary settings and extensions. You will still need to provide a
developer key through the command palette. This can be found as the command
"Monkey C: Generate a Developer Key" and placing this key in the root directory
of the project.

For further manual configurations, refer to the following link:
https://developer.garmin.com/connect-iq/connect-iq-basics/

### Running the application

Once configured, you must first build the project from the command palette
("Monkey C: Build Current Project"). You will know if this has been completed
successfully if there is a bin folder in the root directory of the project. Once
this bin directory exists, you will not have to build the project again unless
you make changes to the code.

Next, run the simulator by selecting "Run without debugging"
from the "Run" menu in VSCode. This will open the simulator and run the
application.

The simulator will open in "Glance Mode", which is the default mode for the
application. To move past this screen, press the "Start" button on the simulator
or the enter button on the keyboard. This will bring you to the main screen of
the application.

In this application, you will notice the fields such as "Heart Rate", are
not populated. While there are several ways of simulating these fields, we
believe the most accurate is importing a .fit file.

To import a .fit file, navigate to Simulation > Activity Data. From here, we
reccomend selecting the "Workout Fit File" from the dropdown, and loading one of
the files from the "fit_data" directory. This will populate the fields with
data from an actual run by the authors and their university teammates.

If desired, the developer may also download their own fit file from Garmin
Connect and load it into the simulator.

Further, if one wishes to manipulate height and gender information during
simulation, they may do so by navigating to Settings > Set User Profile and
changing the values there as desired.

## Testing

### Unit Tests

Unit tests are provided in the 'test' directory of the project. To run tests,
navigate the root directory of the project then use the command pallete to run
the command "Monkey C: Run Tests". This will run all tests in the project and
display the results in the debug console.

For more information on unit testing in MonkeyC, visit this link:
https://developer.garmin.com/connect-iq/core-topics/unit-testing/

## Learn More

For a general overview of MonkeyC and Garmin Connect IQ, visit this link:

https://developer.garmin.com/connect-iq/connect-iq-basics/

Further links will be provided for more specific topics as they are covered.

## Improvements

We encourage anyone who would like to contribute to and improve our project to
do so. Here we list some potential areas for improvement. One major improvement
would be to queue songs live from the device. This would require a refactoring
of the application as an audio content provider or more powerful widget, which
was our initial intention. For inspiration, we have carried this out in a web
application, which can be found here:
https://github.com/cs0320-s2023/final-project-jhickey4-bleahey-awick2-jriccia2

### Known Bugs

Currently, the application is not fully functional. The following is a list of
known bugs:

- The application is not currently capable of handling key presses. This means
  that the user cannot navigate the application using the buttons on the device
  after exiting glance mode.
  This error may be a consequence of the simulator, as there are generally no
  issues with anything but the back button, and the simulator does not have a
  base application to return to.
- The application is not capable of handling fast forwarding in the fit file.
  This appears to overload the sensor data and cause the application to crash
  due to an overload of requests. This will obviously not happen in a real
  world scenario, but may be helpful to safeguard against in the future.

### Future Features

At the moment, there are several inefficiencies due to the fact that the device
is only run on the simulator. The following is a list of features that would be
implemented if the device were to be released:

- Accurate cadence metrics: Due to the nature of the simulator, we were unable
  to properly support the running cadence metric, and calculate our best
  estimate based on the biking cadence. Our simulator does not provide access
  to an ANT+ sensor, which would be used to calculate the proper cadence. We hope
  that our current implementation will actually carry this out properly once
  tested on a real device, but we have yet to confirm this.
- Refreshing of User Profile: Once again due to the simulator, we must update
  the user profile at each sensor tick to ensure that fields have not changed.
  On a real device, this would be done once at the beginning of the activity.
- Watch UI using bitmaps: I (Brendan) am by no means a graphic designer, so the
  UI of the application is simple. A small logo .png to put into the
  bitmap or symbols next to each field could make things a bit more fun to look
  at, but may take some outsourcing.
