# Flutter ProGuard rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-keep class androidx.** { *; }

# just_audio
-keep class com.ryanheise.audioservice.** { *; }
-keep class com.ryanheise.audio_client.** { *; }

# Adhan / geolocator
-keep class com.baseflow.geolocator.** { *; }
-keep class com.baseflow.locationapi.** { *; }

# Application classes
-keep class com.example.islami.** { *; }
-keepnames class com.example.islami.** { *; }

# Preserve enum values
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
