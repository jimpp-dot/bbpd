package ly.plugins.shared_app_plugin.utils;


import android.content.Context;
import android.os.Environment;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

public final class FileUtils {

    public static File getExternalFilesDir(final Context context, final String type) {
        File file = context.getExternalFilesDir(type);
        if (file == null) {
            file = new File(context.getFilesDir(), type);
        }
        return file;
    }

    public static String getTextFromFile(final File file) {
        if (file != null && file.isFile()) {
            FileInputStream in = null;
            try {
                in = new FileInputStream(file);
                final byte[] bytes = IOUtils.getBytesFromInputStream(in);
                if (bytes != null) {
                    return new String(bytes, "UTF-8");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                IOUtils.closeStream(in);
            }
        }
        return null;
    }

    public static String getFileMD5(final File file) {
        final byte[] buffer = new byte[8 * 1024];
        int byteread = 0;
        InputStream in = null;
        try {
            final MessageDigest md5Digest = MessageDigest.getInstance("MD5");
            in = new FileInputStream(file);
            while ((byteread = in.read(buffer)) != -1) {
                md5Digest.update(buffer, 0, byteread);
            }
            return bytesToHexString(md5Digest.digest());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeStream(in);
        }
        return null;
    }

    public static String bytesToHexString(byte[] src){
        StringBuilder stringBuilder = new StringBuilder("");
        if (src == null || src.length <= 0) {
            return null;
        }
        for (int i = 0; i < src.length; i++) {
            int v = src[i] & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
        }
        return stringBuilder.toString();
    }

    public static boolean unzipFiles(File file, File desDir) {
        if (!desDir.exists()) {
            desDir.mkdirs();
        }

        ZipFile zipFile = null;
        InputStream in = null;
        try {
            zipFile = new ZipFile(file);

            for (Enumeration<?> entries = zipFile.entries(); entries.hasMoreElements();) {
                ZipEntry zipEntry = (ZipEntry) entries.nextElement();
                in = zipFile.getInputStream(zipEntry);

                String str = desDir.getAbsolutePath() + File.separator + zipEntry.getName();
                str = new String(str.getBytes("8859_1"), "GB2312");

                if (zipEntry.isDirectory()) {
                    File desFile = new File(str);
                    if (!desFile.exists()) {
                        desFile.mkdirs();
                    }
                } else {
                    File desFile = new File(str);
                    if (!desFile.exists()) {
                        File fileParentDir = desFile.getParentFile();
                        if (!fileParentDir.exists()) {
                            fileParentDir.mkdirs();
                        }
                        desFile.createNewFile();
                    }

                    OutputStream out = new FileOutputStream(desFile);
                    byte buffer[] = new byte[1024];
                    int realLength;
                    try {
                        while ((realLength = in.read(buffer)) > 0) {
                            out.write(buffer, 0, realLength);
                        }
                    } finally {
                        out.flush();
                        out.close();
                    }
                }
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeStream(in);
            closeZipFile(zipFile);
        }
        return false;
    }

    public static boolean unzipDrawableFiles(final File zipFile, final File destDir) {
        if (!destDir.exists()) {
            destDir.mkdirs();
        }

        final String destPath = destDir.getAbsolutePath();
        ZipEntry zipEntry = null;
        InputStream in = null;
        ZipFile zf = null;
        String zipEntryName = null;
        String newZipEntryName = null;
        File desFile = null;
        int realLength = -1;
        final byte[] buffer = new byte[1024];
        OutputStream out = null;
        try {
            zf = new ZipFile(zipFile);
            for (Enumeration<?> entries = zf.entries(); entries
                    .hasMoreElements();) {
                zipEntry = (ZipEntry) entries.nextElement();
                in = zf.getInputStream(zipEntry);

                zipEntryName = zipEntry.getName();
                System.out.println("zipEntryName : " + zipEntryName);

                if (!zipEntryName.startsWith("res/drawable")) {
                    continue;
                }

//                if (zipEntryName.endsWith(".png")
//                        || zipEntryName.endsWith(".jpg")
//                        || zipEntryName.endsWith(".gif")
//                        || zipEntryName.endsWith(".webp")
//                        || zipEntryName.endsWith(".html")
//                        || zipEntryName.endsWith(".htm")) {
                    newZipEntryName = zipEntryName.replaceFirst("res\\/", "")
                            .replaceFirst("\\-v4", "");
                    String str = destPath + File.separator + newZipEntryName;
                    System.out.println("newZipEntryName: " + newZipEntryName);

                    str = new String(str.getBytes("8859_1"), "UTF-8");

                    desFile = new File(str);
                    if (zipEntry.isDirectory()) {
                        if (!desFile.exists()) {
                            desFile.mkdirs();
                        }
                    } else {
                        if (!desFile.exists()) {
                            final File fileParentDir = desFile.getParentFile();
                            if (!fileParentDir.exists()) {
                                fileParentDir.mkdirs();
                            }
                            desFile.createNewFile();
                        }

                        try {
                            out = new FileOutputStream(desFile);
                            while ((realLength = in.read(buffer)) > 0) {
                                out.write(buffer, 0, realLength);
                            }
                            out.flush();
                        } catch (Exception e) {
                            e.printStackTrace();
                            return false;
                        } finally {
                            if (out != null) {
                                out.close();
                            }
                        }
                    }
//                }
            }
            if (in != null) {
                in.close();
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (zf != null) {
                try {
                    zf.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (in != null) {
                try {
                    in.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return false;
    }

    public static void closeZipFile(final ZipFile zipFile) {
        if (zipFile != null) {
            try {
                zipFile.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void deleteOnExits(final File[] files) {
        for (File file : files) {
            deleteOnExits(file);
        }
    }

    public static void deleteOnExits(final File file) {
        if (file.exists()) {
            if (file.isFile()) {
                deleteFile(file);
            } else if (file.isDirectory()) {
                deleteDirectory(file);
            }
        }
    }

    public static void deleteFile(final File file) {
        file.delete();
    }

    public static void deleteFileOnExists(final File file) {
        if (file.exists()) {
            file.delete();
        }
    }

    public static void deleteDirectory(File dir) {
        cleanDirectory(dir);
        dir.delete();
    }

    public static void deleteDirectoryOnExists(File dir) {
        if (dir.exists() && dir.isDirectory()) {
            deleteDirectory(dir);
        }
    }

    public static void cleanDirectory(final File dir) {
        final File[] files = dir.listFiles();
        if (files == null) {
            return;
        }

        for (File file : files) {
            deleteOnExits(file);
        }
    }

    public static void cleanDirectoryOnExists(final File dir) {
        if (dir.exists()) {
            cleanDirectory(dir);
        }
    }

    public static boolean copyDirectory(final File srcDir, final File destDir) {
        if (!destDir.exists() || !destDir.isDirectory()) {
            destDir.mkdirs();
        }

        boolean copySuccess = true;
        final File[] files = srcDir.listFiles();
        for (File file : files) {
            if (file.isFile()) {
                copySuccess = copyFile(file, new File(destDir, file.getName()));
            } else if (file.isDirectory()) {
                copySuccess = copyDirectory(file, new File(destDir, file.getName()));
            }
            if (!copySuccess) { // 有一个文件copy失败就算失败
                return false;
            }
        }
        return true;
    }

    public static boolean copyFile(final File srcFile, final File destFile) {
        InputStream in = null;
        OutputStream out = null;
        try {
            in = new FileInputStream(srcFile);
            out = new FileOutputStream(destFile);
            return IOUtils.copyStream(in, out);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeStream(in, out);
        }
        return false;
    }

    private FileUtils() {
    }
}
