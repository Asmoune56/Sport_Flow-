package com.sport.sportflow.daos;

import com.sport.sportflow.Connection.DatabaseConnection;
import com.sport.sportflow.models.Seance;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SeanceDao {
    public void ajouterSeance(int membreId, int entraineurId, String dateHeure) {
        String sql = "INSERT INTO seance (membreId, entraineurId, dateHeure) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, membreId);
            stmt.setInt(2, entraineurId);
            stmt.setString(3, dateHeure);
            stmt.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    public List<Seance> getSeances() {
        List<Seance> seances = new ArrayList<>();
        String sql = "SELECT * FROM seance";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                seances.add(new Seance(rs.getInt("id"), rs.getInt("membreId"), rs.getInt("entraineurId"), rs.getString("dateHeure")));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return seances;
    }
}


