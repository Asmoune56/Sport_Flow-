package com.sport.sportflow.daos;

import com.sport.sportflow.Connection.DatabaseConnection;
import com.sport.sportflow.models.Membre;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MembreDao {
    public void ajouterMembre(String nom, String dateNaissance, String sport) {
        String sql = "INSERT INTO membre (nom, dateNaissance, sport) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, nom);
            stmt.setString(2, dateNaissance);
            stmt.setString(3, sport);
            stmt.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    public List<Membre> getMembres() {
        List<Membre> membres = new ArrayList<>();
        String sql = "SELECT * FROM membre";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                membres.add(new Membre(rs.getInt("id"), rs.getString("nom"),
                        rs.getString("dateNaissance"), rs.getString("sport")));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return membres;
    }

    public void supprimerMembre(int id) {
        String sql = "DELETE FROM membre WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }
}
