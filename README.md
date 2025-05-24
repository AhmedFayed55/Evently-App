📱 Evently App
Evently is a modern Flutter application designed for creating and managing events with a smooth, intuitive, and responsive user experience. It supports both light and dark themes, multilingual content, and advanced integrations like Firebase, Google Sign-In, and maps.
This app marks my first experience implementing clean code principles and the MVVM architecture, combining practical functionality with a well-structured codebase.

🚀 Features
✅ Native Splash Screen
Implemented a native splash screen using platform-specific code to provide a fast, smooth, and branded launch experience.

✅ Light & Dark Theme Support
Integrated theme switching (light/dark) using the animated_toggle_switch package.

User theme preferences are stored using SharedPreferences for persistence across sessions.

✅ Multilingual Support
Used easy_localization to enable multilingual content.

Supports smooth language switching at runtime.

Language preferences are also saved using SharedPreferences.

✅ Introduction Screens
Designed interactive onboarding screens using PageView to guide users through the app's key features.

✅ State Management with Provider
Implemented state management using the Provider package for simplicity, scalability, and reactivity across the app.

✅ Clean Code & MVVM Architecture
This is my first project applying clean code and MVVM architecture.

Some parts of the app follow a two-layer MVVM pattern (Model + ViewModel).

Other parts also include the Repository Pattern for better separation of concerns and scalability.

While the architecture isn't fully standardized yet, it was a key learning step in my development journey.

✅ Firebase Integration
Used several Firebase services to power backend functionalities:

🔐 Authentication – including email/password and Google Sign-In using the google_sign_in package.

🔥 Firestore – implemented real-time event storage, retrieval, and updates using most of the available Firestore methods.

✅ Internet Connectivity Handling
Integrated connectivity_plus to detect and respond to internet connection status.

Used dartz for functional-style handling of network responses (e.g., Either for success/failure).

✅ Responsive UI
Built with responsiveness in mind using the flutter_screenutil package to support all screen sizes and orientations.

✅ Maps & Advanced Location Integration
Integrated maps and location-based features for enhanced event interaction and discovery.

Location services enable dynamic map displays and event relevance.

✅ Date & Time Formatting
Used the intl package to format date and time consistently and according to locale settings.

✅ Toast Notifications
Implemented user feedback via stylish success and failure messages using the fluttertoast package.

✅ Global Events & Personalized Favorites
All users can view public events.

Each user can mark specific events as favorites, which are stored and shown in a dedicated Favorites tab, visible only to that user.

🛠️ Technical Highlights
Modular file structure for clean organization and scalability.

Applied best practices for code readability and maintainability.

Seamlessly blended Firebase services with local storage (SharedPreferences) for a smooth online/offline experience.

Clean UI built with user experience as a top priority.

Use Single Responsibility Principle to a large extent, ensuring modular and maintainable code.



https://github.com/user-attachments/assets/4ca4de85-a13a-4332-a1d3-5b06a8e33bf4

