package com.tut.beans;

public class Maitre extends Utilisateur {
	private String matiere;
	
	public Maitre() {
		this.setTypeUser("Maitres");
	}

	public String getMatiere() {
		return matiere;
	}

	public void setMatiere(String matiere) {
		this.matiere = matiere;
	}
	
}
