package com.sport.sportflow.Filtres;


import com.sport.sportflow.models.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        String path = req.getRequestURI().substring(req.getContextPath().length());

        if (user == null && !path.equals("/login.jsp") && !path.equals("/login")) {
            res.sendRedirect("login.jsp");
            return;
        }
        chain.doFilter(request, response);
    }
}

