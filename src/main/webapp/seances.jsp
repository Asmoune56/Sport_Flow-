<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${empty sessionScope.user or sessionScope.user.role ne 'Admin'}">
    <c:redirect url="login.jsp"/>
</c:if>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Membres - SportFlow</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .container { margin-top: 30px; }
        .card { border-radius: 10px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); }
        .table th { background-color: #343a40; color: white; }
        .btn-danger, .btn-warning { font-size: 0.9rem; }
    </style>
</head>
<body>

<!-- Barre de navigation -->
<nav class="navbar navbar-dark bg-dark navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="dashboard.jsp">🏆 SportFlow</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Accueil</a></li>
                <li class="nav-item"><a class="nav-link active" href="membres.jsp">Membres</a></li>
                <li class="nav-item"><a class="nav-link" href="logout.jsp">Déconnexion</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h2 class="mb-4 text-center">👥 Gestion des Membres</h2>

    <!-- Ajout d'un membre -->
    <div class="card p-4 mb-4">
        <h4>➕ Ajouter un Membre</h4>
        <form action="ajouterMembreServlet" method="post">
            <div class="mb-3">
                <label for="nom" class="form-label">Nom :</label>
                <input type="text" id="nom" name="nom" class="form-control" required maxlength="100">
            </div>
            <div class="mb-3">
                <label for="dateNaissance" class="form-label">Date de Naissance :</label>
                <input type="date" id="dateNaissance" name="dateNaissance" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="sport" class="form-label">Sport :</label>
                <input type="text" id="sport" name="sport" class="form-control" required maxlength="50">
            </div>
            <button type="submit" class="btn btn-primary">Ajouter</button>
        </form>
    </div>

    <!-- Affichage des membres -->
    <h3>📋 Liste des Membres</h3>
    <c:choose>
        <c:when test="${empty membres}">
            <div class="alert alert-warning text-center">Aucun membre trouvé.</div>
        </c:when>
        <c:otherwise>
            <div class="card p-4">
                <table class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Date de Naissance</th>
                        <th>Sport</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="membre" items="${membres}">
                        <tr>
                            <td>${membre.id}</td>
                            <td>${membre.nom}</td>
                            <td>${membre.dateNaissance}</td>
                            <td>${membre.sport}</td>
                            <td>
                                <a href="editMembre.jsp?id=${membre.id}" class="btn btn-warning btn-sm">Modifier</a>
                                <a href="supprimerMembreServlet?id=${membre.id}" class="btn btn-danger btn-sm" onclick="return confirm('Voulez-vous vraiment supprimer ce membre ?');">Supprimer</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:otherwise>
    </c:choose>

    <div class="text-center mt-4">
        <a href="dashboard.jsp" class="btn btn-secondary">⬅ Retour au Dashboard</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
