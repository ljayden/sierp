package com.sierp.web.util;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;

public class CookieUtils {

    /** The Constant COOKIE_DEFAULT_PATH. */
    public static final String COOKIE_DEFAULT_PATH = "/";
    
    /** The Constant COOKIE_DEFAULT_MAX_AGE. */
    public static final int COOKIE_DEFAULT_MAX_AGE = -1;
    
    /** The Constant COOKIE_DEFAULT_MIN_AGE. */
    public static final int COOKIE_DEFAULT_MIN_AGE = 0;

    public static Cookie createCookie(String name, String value, int maxAge, String domain, String path) {
        Cookie cookie = new Cookie(name, value);
        
        if (domain != null) {
            cookie.setDomain(domain);
        }
        
        cookie.setMaxAge(maxAge);
        cookie.setPath(path);
        return cookie;
    }

    public static Cookie createCookie(String name, String value, int maxAge, String domain) {
        return createCookie(name, value, maxAge, domain, COOKIE_DEFAULT_PATH);
    }

    
    public static Cookie setCookie(HttpServletResponse response, String name, String value, int maxAge, String domain, String path) {
        Cookie cookie = createCookie(name, value, maxAge, domain, path);
        response.addCookie(cookie);
        return cookie;
    }

    public static Cookie setCookie(HttpServletResponse response, String name, String value, int maxAge, String domain) {
        return setCookie(response, name, value, maxAge, domain, COOKIE_DEFAULT_PATH);
    }

    public static Cookie setCookie(HttpServletResponse response, Cookie cookie) {
        response.addCookie(cookie);
        return cookie;
    }

    public static Cookie getCookie(HttpServletRequest request, String name) {
        if (StringUtils.isEmpty(name)) {
            return null;
        }
        
        Cookie cookies[] = request.getCookies();
        
        if (cookies == null) {
            return null;
        }
        
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(name)) {
                return cookie;
            }
        }
        
        return null;
    }

    public static String getCookieValue(HttpServletRequest request, String name) {
        Cookie cookie = getCookie(request, name);
        
        if (cookie != null) {
            return cookie.getValue();
        }
        
        return null;
    }

    public static String[] getCookieNames(HttpServletRequest request) {
        ArrayList<String> cookieNames = new ArrayList<String>();

        Cookie[] cookies = request.getCookies();
        
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookieNames.add(cookie.getName());
            }
        }

        return cookieNames.toArray(new String[cookieNames.size()]);
    }

    public static String[] getCookieNames(HttpServletRequest request, String filter) {
        ArrayList<String> cookieNames = new ArrayList<String>();

        Cookie[] cookies = request.getCookies();
        
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                String cookieName = cookie.getName();

                if (cookieName.indexOf(filter) != -1) {
                    cookieNames.add(cookieName);
                }
            }
        }

        return cookieNames.toArray(new String[cookieNames.size()]);
    }

    public static boolean isExistCookie(HttpServletRequest request, String cookieName) {
        boolean isExist = false;

        Cookie[] cookies = request.getCookies();
        
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(cookieName)) {
                    isExist = true;
                    break;
                }
            }
        }

        return isExist;
    }


    public static void invalidateCookie(HttpServletResponse response, String cookieName, String domain, String path) {
        setCookie(response, cookieName, null, COOKIE_DEFAULT_MIN_AGE, domain, path);
    }


    public static void invalidateCookie(HttpServletResponse response, String cookieName, String domain) {
        invalidateCookie(response, cookieName, domain, COOKIE_DEFAULT_PATH);
    }


    public static void invalidateCookie(HttpServletResponse response, String cookieName) {
        invalidateCookie(response, cookieName, null, COOKIE_DEFAULT_PATH);
    }


    public static void invalidateCookies(HttpServletResponse response, String... cookieNames) {
        if (ArrayUtils.isEmpty(cookieNames)) {
            return;
        }

        for (String cookieName : cookieNames) {
            invalidateCookie(response, cookieName);
        }
    }

    public static void invalidateAllCookies(HttpServletRequest request, HttpServletResponse response,
            String cookieDomain) {
        Cookie[] cookies = request.getCookies();

        if (cookies != null && cookies.length > 0) {
            for (Cookie cooky : cookies) {
                invalidateCookie(response, cooky.getName(), cookieDomain);
            }
        }
    }
}
