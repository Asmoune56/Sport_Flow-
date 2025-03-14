package com.sport.sportflow.servlets;



import com.sport.sportflow.daos.MembreDao;
import com.sport.sportflow.models.Membre;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/membres")
public class MembreServlet extends HttpServlet {
    private MembreDao membreDao = new MembreDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Membre> membres = membreDao.getMembres();
        request.setAttribute("membres", membres);
        request.getRequestDispatcher("membres.jsp").forward(request, response);
    }
}



