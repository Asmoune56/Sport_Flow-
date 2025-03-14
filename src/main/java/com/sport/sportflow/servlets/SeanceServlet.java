package com.sport.sportflow.servlets;



import com.sport.sportflow.daos.SeanceDao;
import com.sport.sportflow.models.Seance;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/seances")
public class SeanceServlet extends HttpServlet {
    private SeanceDao seanceDao = new SeanceDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Seance> seances = seanceDao.getSeances();
        request.setAttribute("seances", seances);
        request.getRequestDispatcher("seances.jsp").forward(request, response);
    }
}


