# Google Services (Firebase) config

1. **Download** `google-services.json` from the [Firebase Console](https://console.firebase.google.com):
   - Open your project → Project settings → Your apps.
   - Select the Android app (or add one) with package name: `com.example.module03_capstone`.
   - Download the config file.

2. **Place the file** in this directory (the app-level root):
   ```
   android/app/google-services.json
   ```
   So the file path is: `android/app/google-services.json`.

3. Sync/build the project in Android Studio or run:
   ```bash
   flutter pub get
   flutter run
   ```

The Google Services Gradle plugin is already applied in `build.gradle.kts`; it will pick up `google-services.json` from this folder automatically.
