# Flutter Project Task with GetX and Dio

This project follows the **MVC (Model-View-Controller)** architecture and leverages **GetX** for state management and **Dio** for networking. Below, I'll explain the folder structure and the purpose of each directory.

## Folder Structure

1. **controllers**: Contains GetX controllers responsible for managing UI changes.
2. **core**:
    - **extensions**: Useful extensions for widgets, integers, doubles, and context.
    - **helper**: Configuration for global dependencies.
    - **routes**: Stores app pages and string paths for each route.
    - **values**: Stores app colors, text, and images.
3. **database**:
    - **local_data**: Handles shared preferences for local data storage.
    - **network**: Manages remote data and HTTP requests using Dio, including response handling.
    - **models**: Defines model classes for each request, including `toJson` functions.
    - **repositories**: Responsible for calling APIs and performing JSON modeling.
4. **models**: Contains classes to model the API JSON responses.
5. **view**:
    - **binding**: Handles dependency injection for each controller.
    - **screens**: Holds UI screens.
    - **widgets**: Contains reusable UI components.
