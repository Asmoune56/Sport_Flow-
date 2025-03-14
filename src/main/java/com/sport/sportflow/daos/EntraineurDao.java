package com.sport.sportflow.daos;

import com.sport.sportflow.Connection.DatabaseConnection;
import com.sport.sportflow.models.Entraineur;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EntraineurDao {
    public void ajouterEntraineur(String nom, String specialite) {
        String sql = "INSERT INTO entraineur (nom, specialite) VALUES (?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, nom);
            stmt.setString(2, specialite);
            stmt.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    public List<Entraineur> getEntraineurs() {
        List<Entraineur> entraineurs = new ArrayList<>();
        String sql = "SELECT * FROM entraineur";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                entraineurs.add(new Entraineur(rs.getInt("id"), rs.getString("nom"), rs.getString("specialite")));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return entraineurs;
    }
}
