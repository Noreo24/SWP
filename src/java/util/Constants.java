/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

/**
 *
 * @author Admin
 */
public class Constants {

    public static String GOOGLE_CLIENT_ID = "101425332251-q5etcuuteqhjvd19fg392nnprnqrnjla.apps.googleusercontent.com";

    public static String GOOGLE_CLIENT_SECRET = "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";

    public static String GOOGLE_REDIRECT_URI = "http://localhost:9999/PhoneShop/logingooglecontroller";

    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public static String GOOGLE_GRANT_TYPE = "authorization_code";

    public static String FACEBOOK_APP_ID = "958502502400844";
    public static String FACEBOOK_APP_SECRET = "74b608966b9fd1d9ba4ebb441196c083";
    public static String FACEBOOK_REDIRECT_URL = "http://localhost:9999/PhoneShop/loginwithfb";
    public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";
}
