<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sport.sportflow.models.User" %>
<%@ page import="com.sport.sportflow.models.Membre" %>
<%@ page import="com.sport.sportflow.daos.MembreDao" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !user.getRole().equals("entraineur")) {
        response.sendRedirect("login.jsp");
        return;
    }

    MembreDao membreDao = new MembreDao();
    List<Membre> membres = membreDao.getMembres();
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mes Membres - SportFlow</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .table th {
            background-color: #343a40;
            color: white;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="mb-4 text-center">👤 Mes Membres</h2>

    <% if (membres.isEmpty()) { %>
    <div class="alert alert-warning text-center">Aucun membre sous votre responsabilité.</div>
    <% } else { %>
    <div class="card p-4">
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Date de Naissance</th>
                <th>Sport Pratiqué</th>
            </tr>
            </thead>
            <tbody>
            <% for (Membre membre : membres) { %>
            <tr>
                <td><%= membre.getId() %></td>
                <td><%= membre.getNom() %></td>
                <td><%= membre.getDateNaissance() %></td>
                <td><%= membre.getSport() %></td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <% } %>

    <div class="text-center mt-4">
        <a href="dashboard.jsp" class="btn btn-primary">⬅ Retour au Dashboard</a>
    </div>
</div>

</body>
</html>

