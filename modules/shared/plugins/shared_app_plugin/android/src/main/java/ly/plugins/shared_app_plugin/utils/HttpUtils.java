package ly.plugins.shared_app_plugin.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.UnknownHostException;

public final class HttpUtils {
    private static final String TAG = HttpUtils.class.getSimpleName();
    private static final String CONTENT_TYPE = "Content-Type";
    private static final int CONNECTION_TIMEOUT = 15000;
    private static final String CHARSET = "UTF-8";
    private static final int DEFAULT_BUFFER_SIZE = 1024;

    public static byte[] requestPost(final String url) {
        return request(url, "POST");
    }

    public static byte[] requestGet(final String url) {
        return request(url, "GET");
    }

    public static byte[] requestUpgrade(final String mainUrl, final String backUrl){
        InputStream in = null;
        try {
            final HttpURLConnection conn = (HttpURLConnection) new URL(mainUrl).openConnection();
            conn.setConnectTimeout(CONNECTION_TIMEOUT);
            conn.setRequestMethod("GET");
            if (conn.getResponseCode() == 200) {
                in = conn.getInputStream();
                return IOUtils.getBytesFromInputStream(in);
            }else if (conn.getResponseCode() == 403 && backUrl != null){
                IOUtils.closeStream(in);
                return requestUpgrade(backUrl, null);
            }
        }catch (UnknownHostException e){
            if(backUrl != null) return requestUpgrade(backUrl, null);
        }
        catch (Exception e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeStream(in);
        }
        return null;
    }

    public static boolean requestGetSaveToFile(final String url, final File file) {
        return requestSaveToFile(url, "GET", file);
    }

    public static boolean requestSaveToFile(final String url, final String method, final File file) {
        InputStream in = null;
        OutputStream out = null;
        try {
            final HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setConnectTimeout(CONNECTION_TIMEOUT);
            conn.setRequestMethod(method);
            if (conn.getResponseCode() == 200) {
                in = conn.getInputStream();
                out = new FileOutputStream(file);
                IOUtils.copyStream(in, out, DEFAULT_BUFFER_SIZE * 8);
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeStream(in, out);
        }
        return false;
    }

    public static byte[] request(final String url, final String method) {
        InputStream in = null;
        try {
            final HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setConnectTimeout(CONNECTION_TIMEOUT);
            conn.setRequestMethod(method);
            if (conn.getResponseCode() == 200) {
                in = conn.getInputStream();
                return IOUtils.getBytesFromInputStream(in);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeStream(in);
        }
        return null;
    }

    public static byte[] uploadFile(final String url, final File file, final  boolean zip)  {
	    String end = "\r\n";
	    String Hyphens = "--";
		String boundary = "*****";

		final String fileName = file.getName();

		InputStream httpInput = null;
		OutputStream httpOutput = null;
		FileInputStream fileInput = null;
		try {
			final HttpURLConnection conn = (HttpURLConnection) new URL(url)
					.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setUseCaches(false);
			conn.setReadTimeout(CONNECTION_TIMEOUT);
			conn.setConnectTimeout(CONNECTION_TIMEOUT);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Charset", CHARSET);
			conn.setRequestProperty("connection", "keep-alive");
			conn.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + boundary);

			httpOutput = conn.getOutputStream();
			httpOutput.write(Hyphens.getBytes(CHARSET));
			httpOutput.write(boundary.getBytes(CHARSET));
			httpOutput.write(end.getBytes(CHARSET));

			final String disposition = String.format("Content-Disposition:form-data;name=\"file\";filename=\"%s\"", fileName);
			System.out.println(disposition);
			httpOutput.write(disposition.getBytes(CHARSET));
			httpOutput.write(end.getBytes(CHARSET));
			httpOutput.write(end.getBytes(CHARSET));

			fileInput = new FileInputStream(file);

            if (zip) {
                IOUtils.copyAndCompressStream(fileInput, httpOutput, DEFAULT_BUFFER_SIZE);
            }else{
                IOUtils.copyStream(fileInput, httpOutput, DEFAULT_BUFFER_SIZE);
            }

			httpOutput.write(end.getBytes(CHARSET));
			httpOutput.write(Hyphens.getBytes(CHARSET));
			httpOutput.write(boundary.getBytes(CHARSET));
			httpOutput.write(Hyphens.getBytes(CHARSET));
			httpOutput.write(end.getBytes(CHARSET));

			httpOutput.flush();

			if (conn.getResponseCode() == 200) {
				httpInput = conn.getInputStream();
				return IOUtils.getBytesFromInputStream(httpInput);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			IOUtils.closeStream(fileInput);
			IOUtils.closeStream(httpInput, httpOutput);
		}
		return null;
	}


    public static String getMD5(String string) {
        String s = null;
        try {
            byte[] source = string.getBytes();
            java.security.MessageDigest md = java.security.MessageDigest
                    .getInstance("MD5");
            md.update(source);
            return toHexString(md.digest());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    /**
     * 将字节数组转换成一个16进制字符串
     *
     * @param bytes
     */
    public static String toHexString(byte[] bytes) {
        if (bytes == null || bytes.length == 0) {
            return null;
        }

        int j = bytes.length;
        char str[] = new char[j * 2];
        int k = 0;
        for (int i = 0; i < j; i++) {
            byte byte0 = bytes[i];
            str[k++] = hexDigits[byte0 >>> 4 & 0xf];
            str[k++] = hexDigits[byte0 & 0xf];
        }
        return new String(str);
    }

    // 用来将字节转换成 16 进制表示的字符
    private static char[] hexDigits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
}
