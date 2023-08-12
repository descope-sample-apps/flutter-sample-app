# Descope's Flutter Sample App [![CI](https://github.com/descope-sample-apps/flutter-sample-app/actions/workflows/main.yml/badge.svg)](https://github.com/descope-sample-apps/flutter-sample-app/actions/workflows/main.yml)

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
3. **Add your Descope Project ID**: Within the root directory of the project, create a `.env` file. Add your Descope Project ID, which can be found in your [Descope Console](https://app.descope.com/settings/project).
```
DESCOPE_PROJECT_ID=<your_descope_project_id>
```
4. **(Optional) Self-Host Your Flow**: Your Descope authentication flow is automatically hosted by Descope at https://auth.descope.io/<your_descope_project_id> but you can use your own domain as host per the instructions [in our docs](https://github.com/descope/descope-flutter/tree/main#running-flows). You can use your self-hosted flow url by setting this environment variable in the `.env`:
```
DESCOPE_FLOW_URL=<your_descope_flow_url>
```

5. **_(Android Only)_ Add deep link and host urls:** Follow the steps [here](https://github.com/descope/descope-flutter/tree/main#android-only-setup-2-enable-app-links) to get your deep link and host urls. Then, add the former to the `.env` and latter to the `AndroidManifest.xml`:
```
// .env

DESCOPE_DEEP_LINK_URL=<your_descope_deep_link_url>
```
```xml
// android/app/src/main/AndroidManifest.xml

<data android:scheme="https" android:host="<YOUR_HOST_HERE>" android:path="/auth" />
```
6. **Navigate to Project Directory**: Change your current directory to the project's root directory.
```
cd flutter-sample-app/
```
7. **Install Dependencies and Run the Application**: Retrieve all the required packages and start the application using the following commands:
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
