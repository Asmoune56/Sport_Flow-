package com.sport.sportflow.servlets;



import com.sport.sportflow.daos.EntraineurDao;
import com.sport.sportflow.models.Entraineur;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.List;

@WebServlet("/entraineurs")
public class EntraineurServlet extends HttpServlet {
    private EntraineurDao entraineurDao = new EntraineurDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Entraineur> entraineurs = entraineurDao.getEntraineurs();
        request.setAttribute("entraineurs", entraineurs);
        request.getRequestDispatcher("entraineurs.jsp").forward(request, response);
    }
}

