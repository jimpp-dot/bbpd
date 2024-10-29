// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/*
 * Copyright (C) 2007-2008 OpenIntents.org
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * This file was modified by the Flutter authors from the following original file:
 * https://raw.githubusercontent.com/iPaulPro/aFileChooser/master/aFileChooser/src/com/ipaulpro/afilechooser/utils/FileUtils.java
 */

package io.flutter.plugins.imagepicker;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.MediaStore;
import android.util.Log;
import android.webkit.MimeTypeMap;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

class FileUtils {

  String getPathFromUri(final Context context, final Uri uri) {
    try (InputStream inputStream = context.getContentResolver().openInputStream(uri)) {
      File targetDirectory = getExternalCacheDir(context, "temp");
      delDir(targetDirectory); // 先清空temp目录
      targetDirectory.mkdir();

      String fileName = getImageName(context, uri);
      String extension = getImageExtension(context, uri);

      if (fileName == null) {
        Log.w("FileUtils", "Cannot get file name for " + uri);
        if (extension == null) extension = ".jpg";
        fileName = "image_picker" + extension;
      } else if (extension != null) {
        fileName = getBaseName(fileName) + extension;
      }
      File file = new File(targetDirectory, fileName);
      try (OutputStream outputStream = new FileOutputStream(file)) {
        copy(inputStream, outputStream);
        return file.getPath();
      }
    } catch (IOException e) {
      // If closing the output stream fails, we cannot be sure that the
      // target file was written in full. Flushing the stream merely moves
      // the bytes into the OS, not necessarily to the file.
      return null;
    } catch (SecurityException e) {
      // Calling `ContentResolver#openInputStream()` has been reported to throw a
      // `SecurityException` on some devices in certain circumstances. Instead of crashing, we
      // return `null`.
      //
      // See https://github.com/flutter/flutter/issues/100025 for more details.
      return null;
    }
  }

  public static File getExternalCacheDir(final Context context, final String type) {
    File file = context.getExternalCacheDir();
    if (file == null) {
      file = context.getCacheDir();
    }
    return new File(file, type);
  }

  private static void copy(InputStream in, OutputStream out) throws IOException {
    final byte[] buffer = new byte[4 * 1024];
    int bytesRead;
    while ((bytesRead = in.read(buffer)) != -1) {
      out.write(buffer, 0, bytesRead);
    }
    out.flush();
  }

  /**
   * @return extension of image with dot, or default .jpg if it none.
   */
  private static String getImageExtension(Context context, Uri uriImage) {
    String extension = null;

    try {
      if (uriImage.getScheme().equals(ContentResolver.SCHEME_CONTENT)) {
        final MimeTypeMap mime = MimeTypeMap.getSingleton();
        extension = mime.getExtensionFromMimeType(context.getContentResolver().getType(uriImage));
      } else {
        extension = MimeTypeMap.getFileExtensionFromUrl(
                Uri.fromFile(new File(uriImage.getPath())).toString());
      }
    } catch (Exception e) {
      extension = null;
    }

    if (extension == null || extension.isEmpty()) {
      //default extension for matches the previous behavior of the plugin
      extension = "jpg";
    }

    return "." + extension;
  }

  private static String getBaseName(String fileName) {
    int lastDotIndex = fileName.lastIndexOf('.');
    if (lastDotIndex < 0) {
      return fileName;
    }
    // Basename is everything before the last '.'.
    return fileName.substring(0, lastDotIndex);
  }

  /** @return name of the image provided by ContentResolver; this may be null. */
  private static String getImageName(Context context, Uri uriImage) {
    try (Cursor cursor = queryImageName(context, uriImage)) {
      if (cursor == null || !cursor.moveToFirst() || cursor.getColumnCount() < 1) return null;
      return cursor.getString(0);
    }
  }

  private static Cursor queryImageName(Context context, Uri uriImage) {
    return context
            .getContentResolver()
            .query(uriImage, new String[] {MediaStore.MediaColumns.DISPLAY_NAME}, null, null, null);
  }

  public static boolean delDir(File dir) {
    if (dir == null || !dir.exists()) {
      return false;
    }
    if (dir.isDirectory()) {
      String[] files = dir.list();
      for (int i = 0; i < files.length; i++) {
        boolean success = delDir(new File(dir, files[i]));
        if (!success) {
          return false;
        }
      }
    }
    // 目录此时为空，可以删除
    return dir.delete();
  }
}
