/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author tranphuc
 */
public class CookieUtils {

    // Method to get a cookie value by name
    public String getCookieValue(HttpServletRequest request, String cookieName) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(cookieName)) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    // Method to set a cookie with a specific name, value, and expiration time
    public void setCookie(HttpServletResponse response, String cookieName, String cookieValue) {
        Cookie cookie = new Cookie(cookieName, cookieValue);
        cookie.setMaxAge(Integer.MAX_VALUE); // Set the cookie's expiration time in seconds
        cookie.setPath("/"); // Set the cookie's path
        response.addCookie(cookie); // Add the cookie to the response
    }

    // Method to delete a cookie by setting its max age to 0
    public void deleteCookie(HttpServletResponse response, String cookieName) {
        Cookie cookie = new Cookie(cookieName, null);
        cookie.setMaxAge(0); // Set the cookie's max age to 0 to delete it
        cookie.setPath("/"); // Set the cookie's path
        response.addCookie(cookie); // Add the cookie to the response
    }

}