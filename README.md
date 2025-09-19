# CR - Flutter Project

A new Flutter project designed as a starting point for building a scalable and maintainable application.

## Getting Started

This project serves as a foundation for a Flutter application. Follow the steps below to set it up and understand its structure.

### Environment Configuration

To configure the environment variables, create a `.env` file in the root directory of the project and define the following variables:

- `CLIENT_ID`: Your client ID for the application.
- `API_KEY`: Your API key for accessing the required services.
- `BASE_URL`: The base URL for API requests.
- `URL_RATE`: The URL for rate-related API requests.

Example `.env` file:
CLIENT_ID=your_client_id
API_KEY=your_api_key
BASE_URL=https://api.example.com
URL_RATE=https://api.example.com/rates


### Makefile Commands

The `Makefile` in the project root contains commands to execute various tasks. Refer to the `Makefile` for available commands and their usage.

### Project Architecture

The project follows a modular and organized structure to ensure scalability, maintainability, and code reusability. Below is the architecture breakdown:

### src
The src directory contains the core codebase of the project, organized into the following subdirectories:

`global_api`: Defines API endpoints used throughout the application, including configurations and utilities for global API calls.
`i18n`: Manages internationalization and translations to support multiple languages.
`routing`: Handles navigation and routing logic, defining routes and screen transitions.
`service`: Manages API communication, including error handling and session management for robust backend interactions.
`theme`: Controls the application's visual styling, including colors, fonts, and sizes, ensuring a consistent look and feel.

### feature

The `feature` directory organizes the application's views and logic, split into the following subdirectories:

`ui`: Contains the screens or user interface components, defining the visual layout and structure of each view.
`logic`: Manages the functional logic for each feature, including: Feature-specific API communication.
Data `models` for structuring feature data.
`Cubit` (or other state management solutions) for handling state and business logic.

### shared
The shared directory contains reusable widgets and components designed for use across multiple views and features, promoting code reuse and UI consistency.


### Resources

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.