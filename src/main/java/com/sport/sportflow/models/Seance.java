package com.sport.sportflow.models;

public class Seance {
    private int id;
    private int membreId;
    private int entraineurId;
    private String dateHeure;

    public Seance(int id, int membreId, int entraineurId, String dateHeure) {
        this.id = id;
        this.membreId = membreId;
        this.entraineurId = entraineurId;
        this.dateHeure = dateHeure;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMembreId() {
        return membreId;
    }

    public void setMembreId(int membreId) {
        this.membreId = membreId;
    }

    public int getEntraineurId() {
        return entraineurId;
    }

    public void setEntraineurId(int entraineurId) {
        this.entraineurId = entraineurId;
    }

    public String getDateHeure() {
        return dateHeure;
    }

    public void setDateHeure(String dateHeure) {
        this.dateHeure = dateHeure;
    }
}
