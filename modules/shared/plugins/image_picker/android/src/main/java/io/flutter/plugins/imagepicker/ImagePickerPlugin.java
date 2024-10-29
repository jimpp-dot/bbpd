// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package io.flutter.plugins.imagepicker;

import android.app.Activity;
import android.os.Environment;

import androidx.annotation.NonNull;

import java.io.File;
import java.io.IOException;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class ImagePickerPlugin implements MethodChannel.MethodCallHandler, FlutterPlugin, ActivityAware {
    private static final String CHANNEL = "plugins.flutter.io/image_picker";

    private static final int SOURCE_CAMERA = 0;
    private static final int SOURCE_GALLERY = 1;

    private ImagePickerDelegate delegate;
    private Activity activity;
    private MethodChannel channel;
    private ActivityPluginBinding binding;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        channel = new MethodChannel(binding.getBinaryMessenger(), CHANNEL);
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        channel = null;
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        activity = binding.getActivity();
        this.binding = binding;

        final File externalFilesDirectory = binding.getActivity().getExternalFilesDir(Environment.DIRECTORY_PICTURES);
        final ImageResizer imageResizer = new ImageResizer(externalFilesDirectory, new ExifDataCopier());
        delegate = new ImagePickerDelegate(binding.getActivity(), externalFilesDirectory, imageResizer);
        binding.addActivityResultListener(delegate);
        binding.addRequestPermissionsResultListener(delegate);
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {

    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

    }

    @Override
    public void onDetachedFromActivity() {
        binding.removeActivityResultListener(delegate);
        binding.removeRequestPermissionsResultListener(delegate);
        binding = null;
        activity = null;
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        if (activity == null) {
            result.error("no_activity", "image_picker plugin requires a foreground activity.", null);
            return;
        }

        if (call.method.equals("pickImage")) {
            int imageSource = call.argument("source");
            int onlyGif = call.argument("onlyGif");
            switch (imageSource) {
                case SOURCE_GALLERY:
                    if (onlyGif == 1) {
                        delegate.chooseImageFromGalleryByOnlyGif(call, result);
                    } else {
                        delegate.chooseImageFromGallery(call, result);
                    }
                    break;
                case SOURCE_CAMERA:
                    delegate.takeImageWithCamera(call, result);
                    break;
                default:
                    throw new IllegalArgumentException("Invalid image source: " + imageSource);
            }
        } else if (call.method.equals("pickVideo")) {
            int imageSource = call.argument("source");
            switch (imageSource) {
                case SOURCE_GALLERY:
                    delegate.chooseVideoFromGallery(call, result);
                    break;
                case SOURCE_CAMERA:
                    delegate.takeVideoWithCamera(call, result);
                    break;
                default:
                    throw new IllegalArgumentException("Invalid video source: " + imageSource);
            }
        } else if (call.method.equals("saveToCameraRoll")) {
            try {
                delegate.saveImageToGallery(call, result);
            } catch (IOException e) {
                e.printStackTrace();
                throw new IllegalArgumentException(e);
            }

        } else if ("saveByteDataImageToGallery".equals(call.method)) {
            byte[] data = call.argument("uint8List");
            try {
                delegate.saveByteDataImageToGallery(data, call, result);
            } catch (IOException e) {
                e.printStackTrace();
                throw new IllegalArgumentException(e);
            }
        } else {
            throw new IllegalArgumentException("Unknown method " + call.method);
        }
    }






}
