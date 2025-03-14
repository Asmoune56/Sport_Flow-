<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.sport.sportflow.models.User" %>
<%
  User user = (User) session.getAttribute("user");
  if (user == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard - SportFlow</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    body {
      display: flex;
      min-height: 100vh;
      background-color: #f8f9fa;
    }
    .sidebar {
      width: 250px;
      height: 100vh;
      background: #343a40;
      color: white;
      padding: 20px;
      position: fixed;
    }
    .sidebar a {
      color: white;
      text-decoration: none;
      display: block;
      padding: 10px;
      border-radius: 5px;
      margin: 5px 0;
    }
    .sidebar a:hover {
      background: #495057;
    }
    .content {
      margin-left: 260px;
      padding: 20px;
      flex-grow: 1;
    }
    .card {
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    .logout {
      margin-top: 20px;
      text-align: center;
    }
  </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
  <h3>SportFlow</h3>
  <p>Bienvenue, <%= user.getUsername() %>!</p>
  <p><strong>Rôle :</strong> <%= user.getRole() %></p>
  <hr>

  <% if (user.getRole().equals("admin")) { %>
  <a href="manageUsers.jsp">👥 Gérer Utilisateurs</a>
  <a href="entraineurs.jsp">🏋️‍♂️ Gérer Entraîneurs</a>
  <a href="seances.jsp">📅 Gérer Séances</a>
  <% } else if (user.getRole().equals("entraineur")) { %>
  <a href="seances.jsp">📅 Mes Séances</a>
  <a href="membres.jsp">👤 Mes Membres</a>
  <% } else if (user.getRole().equals("membre")) { %>
  <a href="membres.jsp">📅 Mes Entraînements</a>
  <% } %>

  <div class="logout">
    <a href="logout" class="btn btn-danger">Déconnexion</a>
  </div>
</div>

<div class="content">
  <h2 class="mb-4">Tableau de Bord</h2>

  <div class="row">
    <% if (user.getRole().equals("admin")) { %>
    <div class="col-md-4">
      <div class="card p-3 text-center">
        <h4>👥 Membres</h4>
        <p>Gérez tous les membres inscrits.</p>
        <a href="membres.jsp" class="btn btn-primary">Voir</a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card p-3 text-center">
        <h4>🏋️‍♂️ Entraîneurs</h4>
        <p>Gérez les entraîneurs du club.</p>
        <a href="entraineurs.jsp" class="btn btn-primary">Voir</a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card p-3 text-center">
        <h4>📅 Séances</h4>
        <p>Gérez les séances d'entraînement.</p>
        <a href="seances.jsp" class="btn btn-primary">Voir</a>
      </div>
    </div>
    <% } else if (user.getRole().equals("entraineur")) { %>
    <div class="col-md-6">
      <div class="card p-3 text-center">
        <h4>📅 Mes Séances</h4>
        <p>Consultez et planifiez vos entraînements.</p>
        <a href="mySessions.jsp" class="btn btn-primary">Voir</a>
      </div>
    </div>
    <div class="col-md-6">
      <div class="card p-3 text-center">
        <h4>👤 Mes Membres</h4>
        <p>Consultez vos membres.</p>
        <a href="membres.jsp" class="btn btn-primary">Voir</a>
      </div>
    </div>
    <% } else if (user.getRole().equals("membre")) { %>
    <div class="col-md-12">
      <div class="card p-3 text-center">
        <h4>📅 Mes Entraînements</h4>
        <p>Consultez votre planning.</p>
        <a href="myTrainings.jsp" class="btn btn-primary">Voir</a>
      </div>
    </div>
    <% } %>
  </div>
</div>

</body>
</html>

