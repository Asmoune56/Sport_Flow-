<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Connexion | SportFlow</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background-color: #f8f9fa;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }
    .login-container {
      max-width: 400px;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }
    .form-control {
      border-radius: 5px;
    }
    .btn-primary {
      width: 100%;
      border-radius: 5px;
    }
    .alert {
      font-size: 0.9rem;
    }
  </style>
</head>
<body>

<div class="login-container">
  <h3 class="text-center mb-4">SportFlow - Connexion</h3>

  <% String error = (String) request.getAttribute("error"); %>
  <% if (error != null) { %>
  <div class="alert alert-danger text-center">
    <%= error %>
  </div>
  <% } %>

  <form action="login" method="post">
    <div class="mb-3">
      <label for="username" class="form-label">Nom d'utilisateur :</label>
      <input type="text" class="form-control" id="username" name="username" required autofocus>
    </div>

    <div class="mb-3">
      <label for="password" class="form-label">Mot de passe :</label>
      <input type="password" class="form-control" id="password" name="password" required>
    </div>

    <button type="submit" class="btn btn-primary">Se connecter</button>
  </form>

  <div class="text-center mt-3">
    <small>Vous n'avez pas de compte ? <a href="register.jsp">Inscrivez-vous ici</a></small>
  </div>
</div>

<!-- Bootstrap JS (Optionnel si besoin) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
