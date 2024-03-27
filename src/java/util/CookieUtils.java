package Uils;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author tranphuc
 */
public class CookieUtils {

    // Method to get a session attribute value by name
    public static String getSession(HttpServletRequest request, String sessionName) {
        HttpSession session = request.getSession(false); // Do not create a new session if it doesn't exist
        if (session != null) {
            return (String) session.getAttribute(sessionName);
        }
        return null;
    }

    // Method to set a session attribute with a specific name and value
    public static void setSession(HttpServletRequest request, String sessionName, String sessionValue) {
        HttpSession session = request.getSession(true); // Create a new session if it doesn't exist
        session.setAttribute(sessionName, sessionValue);
    }

    // Method to delete a session attribute by name
    public static void deleteSession(HttpServletRequest request, String sessionName) {
        HttpSession session = request.getSession(false); // Do not create a new session if it doesn't exist
        if (session != null) {
            session.removeAttribute(sessionName);
        }
    }

}