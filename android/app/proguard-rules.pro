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

# Application classes — must match the real applicationId/namespace.
# `com.example.islami` was the package before the app-id rename in b9b8f80;
# a keep rule for the old package keeps nothing and R8 strips app classes.
-keep class com.islami.app.** { *; }
-keepnames class com.islami.app.** { *; }

# Preserve enum values
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# Play Core — Flutter's engine references these for deferred-component support
# that this app never ships. R8 treats the absent classes as errors and fails
# :app:minifyReleaseWithR8 without this suppression. Collapsing the wildcard
# keeps the rule stable across SDK bumps.
-dontwarn com.google.android.play.core.**
