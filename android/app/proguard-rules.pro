# Keep Stripe pushProvisioning classes which may be referenced by plugins
-keep class com.stripe.android.pushProvisioning.** { *; }
-dontwarn com.stripe.android.pushProvisioning.**

# Keep any pushProvisioning proxy classes from react-native / other wrappers
-keep class com.reactnativestripesdk.pushprovisioning.** { *; }
-dontwarn com.reactnativestripesdk.pushprovisioning.**

# Keep Stripe SDK core classes used via reflection
-keep class com.stripe.** { *; }
-dontwarn com.stripe.**

# If the build produced a missing_rules.txt, copy its contents here as well.
# See: build/app/outputs/mapping/release/missing_rules.txt
