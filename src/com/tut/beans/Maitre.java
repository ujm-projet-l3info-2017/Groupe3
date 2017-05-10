package com.tut.beans;

public class Maitre extends Utilisateur {
	private String enseignement;
	private String lvl;
	
	public Maitre() {
		this.setTypeUser("Maitres");
	}

	public String getEnseignement() {
		return enseignement;
	}

	public void setEnseignement(String enseignement) {
		this.enseignement = enseignement;
	}

	public String getLvl() {
		return lvl;
	}

	public void setLvl(String lvl) {
		this.lvl = lvl;
	}

	
}
