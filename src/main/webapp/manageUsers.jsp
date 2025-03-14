
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sport.sportflow.models.User" %>
<%@ page import="com.sport.sportflow.daos.UserDao" %>

<%
  // Vérifier si l'utilisateur est connecté et a le rôle Admin
  User user = (User) session.getAttribute("user");
  if (user == null || !"Admin".equals(user.getRole())) {
    response.sendRedirect("login.jsp");
    return;
  }

  // Récupération de la liste des utilisateurs
  UserDao userDao = new UserDao();
  List<User> users = userDao.getAllUsers();
%>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gestion des Utilisateurs - SportFlow</title>
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
  <h2 class="mb-4 text-center">👥 Gestion des Utilisateurs</h2>

  <% if (users.isEmpty()) { %>
  <div class="alert alert-warning text-center">Aucun utilisateur trouvé.</div>
  <% } else { %>
  <div class="card p-4">
    <table class="table table-striped table-bordered">
      <thead>
      <tr>
        <th>ID</th>
        <th>Nom d'utilisateur</th>
        <th>Email</th>
        <th>Rôle</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <% for (User u : users) { %>
      <tr>
        <td><%= u.getId() %></td>
        <td><%= u.getUsername() %></td>
        <td><%= u.getRole() %></td>
        <td>
          <a href="editUser.jsp?id=<%= u.getId() %>" class="btn btn-warning btn-sm">Modifier</a>
          <a href="deleteUser?id=<%= u.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Voulez-vous vraiment supprimer cet utilisateur ?');">Supprimer</a>
        </td>
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
