package ly.plugins.shared_app_plugin.utils;


import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Writer;
import java.util.zip.GZIPOutputStream;

public final class IOUtils {

    public static boolean copyStream(final InputStream in, final OutputStream out) {
        return copyStream(in, out, 1024 * 8);
    }

    public static boolean copyStream(final InputStream in, final OutputStream out, final int bufferSize) {
        byte[] buffer = new byte[bufferSize];
        try {
            int byteread = 0;
            while ((byteread = in.read(buffer)) != -1) {
                out.write(buffer, 0, byteread);
            }
            out.flush();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            buffer = null;
        }
        return false;
    }

    public static boolean copyAndCompressStream(final InputStream in, final OutputStream out, final  int bufferSize){
        byte[] buffer = new byte[bufferSize];

        try{
            int byteread = 0;
            GZIPOutputStream zipOut = new GZIPOutputStream(out);

            while ((byteread = in.read(buffer)) != -1) {
                zipOut.write(buffer, 0, byteread);
            }
            zipOut.flush();
            zipOut.close();

            return true;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            buffer = null;
        }

        return  false;
    }

    public static byte[] getBytesFromInputStream(final InputStream in) {
        final byte[] buffer = new byte[1024 * 2];
        ByteArrayOutputStream baos = null;
        int length = 0;
        try {
            baos = new ByteArrayOutputStream();
            while ((length = in.read(buffer)) != -1) {
                baos.write(buffer, 0, length);
            }
            return baos.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void closeStream(final InputStream in) {
        if (in != null) {
            try {
                in.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void closeStream(final OutputStream out) {
        if (out != null) {
            try {
                out.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void closeStream(final InputStream in, final OutputStream out) {
        closeStream(in);
        closeStream(out);
    }

    public static void closeStream(final Writer out) {
        if (out != null) {
            try {
                out.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private IOUtils() {
    }
}
