package com.tut.beans;

public class Maitre extends Utilisateur {
	private String enseignement;
	private Integer lvl;
	
	public Maitre() {
		this.setTypeUser("Maitres");
	}

	public String getEnseignement() {
		return enseignement;
	}

	public void setEnseignement(String enseignement) {
		this.enseignement = enseignement;
	}

	public Integer getLvl() {
		return lvl;
	}

	public void setLvl(Integer lvl) {
		this.lvl = lvl;
	}

	
}
