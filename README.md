# :pencil: Scriby App

Scriby is a mobile application for creating and managing notes efficiently. It offers a user-friendly interface and robust features to help you stay organized and productive. The app is built using the Flutter framework, ensuring cross-platform compatibility and smooth performance.

## Screenshots

![Scriby app](/screenshots/scriby_app_screenshot_1.jpg "Home screen, search and settings")
![Scriby app](/screenshots/scriby_app_screenshot_2.jpg "Note editing screen")

## Features

- Create, edit, and delete notes easily
- Organize notes with tags and categories
- Search and filter notes
- Pin important notes to access them quickly

## Architecture

The project follows a modular architecture to ensure scalability and maintainability:

- **Presentation Layer**: Contains UI components, such as screens and widgets.
- **Domain Layer**: Manages business logic with the help of BLoC (Business Logic Component) patterns. Streams within repositories are used to facilitate communication between specific groups of BLoCs.
- **Data Layer**: Handles data fetching and storage, integrating with local storage solutions like SharedPreferences and Realm.

## State Management

BLoC pattern (via `flutter_bloc` package) is used for state management, leveraging streams within repositories to handle complex state interactions between different BLoC groups.

## Navigation

The app uses the `auto_route` package for seamless and scalable navigation.

## Logging

The `talker_flutter` package is employed for logging, providing efficient tracking and debugging of the app’s operations. Navigation logging is also implemented to track navigation events.

## Data Storage

Two packages for data storage are utilized in the application:

- `shared_preferences`: for storing regular data;
- `realm`: for handling complex data structures and relationships.
