# Descope's Flutter Sample App

Welcome to Descope's Flutter Sample App, a demonstration of how to integrate Descope for user authentication within a Flutter application. By exploring this project, you can understand how Descope works with Flutter to manage different authentication flows.


## Features
This sample app includes:

- **App Client**: An example of how the client communicates with Descope.
- **Flows**: Demonstrations of various authentication flows supported by Descope.


## Getting Started
Follow these steps to run the sample app and explore Descope's capabilities with Flutter:

### Prerequisites
Make sure you have the following installed:

- A code editor such as Visual Studio Code, IntelliJ, or others.


###  Run the app
1. **Clone the Repository**: Clone this repository to your local machine.


2. **Open the Project**: Open the project within VS Code or your IDE of choice.
3. **Define and Host Your Flow**: Your authentication flow needs to be set up externally per the instructions [here](https://github.com/descope/descope-flutter/tree/main#running-flows). You'll use the url where you hosted the flow in the next step

6. **Add Environment Variables**: Within the `lib` folder in the root directory, create a `.env` file.
```
DESCOPE_PROJECT_ID=<your_descope_project_id>
DESCOPE_FLOW_URL=<your_descope_flow_url>
```
_For the `DESCOPE_PROJECT_ID`, you can look in your [Descope Console](https://app.descope.com/settings/project)._

_For the `DESCOPE_FLOW_URL`, you'll need the url where you hosted your authentication flow as described above in Step #3._

7. **_(Android Only)_ Add deep link and host urls:** Follow the steps [here](https://github.com/descope/descope-flutter/tree/main#android-only-setup-2-enable-app-links) to get your deep link and host urls. Then, add the former to the `.env` and latter to the `AndroidManifest.xml`:
```
// lib/.env

DESCOPE_DEEP_LINK_URL=<your_descope_deep_link_url>
```
```
// android/app/src/main/AndroidManifest.xml

<data android:scheme="https" android:host="<YOUR_HOST_HERE>" android:path="/auth" />
```
4. **Navigate to Project Directory**: Change your current directory to the project's root directory.
```
cd flutter-sample-app/
```
5. **Install Dependencies and Run the Application**: Retrieve all the required packages and start the application using the following commands:
```
flutter pub get
flutter run
```

## Learn More
To learn more please see the [Descope Documentation and API reference page](https://docs.descope.com/).

## Contact Us
If you need help you can [contact us](https://docs.descope.com/support/)

## License
The Flutter Sample App is licensed for use under the terms and conditions of the MIT license Agreement.
