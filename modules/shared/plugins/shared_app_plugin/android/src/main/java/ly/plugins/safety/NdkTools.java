package com.im.safety;

public class NdkTools {
  static {
    System.loadLibrary("yyshared");
  }

  public static native String stringFromJNI();
  public static native String hFunc(String input);
  public static native String aFunc(String input);
  public static native String decrypt(String input);
}
