-dontwarn com.google.mlkit.vision.text.chinese.**
-dontwarn com.google.mlkit.vision.text.devanagari.**
-dontwarn com.google.mlkit.vision.text.japanese.**
-dontwarn com.google.mlkit.vision.text.korean.**

# TensorFlow Lite rules
-keep class org.tensorflow.lite.** { *; }
-keep class com.google.android.gms.tflite.** { *; }
-dontwarn org.tensorflow.lite.**
-dontwarn com.google.android.gms.tflite.**


