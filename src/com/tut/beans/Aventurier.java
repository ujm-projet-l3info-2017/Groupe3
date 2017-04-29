package com.tut.beans;

public class Aventurier extends Utilisateur {
	private Long idAventurier;
	private int lvl;
	private int expTotale;
	private int gold;
	private int rubis;
	private int saphir;
	private String classe;
	
	
	public Aventurier() {
		this.setTypeUser("Aventuriers");
	}


	public Long getIdAventurier() {
		return idAventurier;
	}


	public void setIdAventurier(Long idAventurier) {
		this.idAventurier = idAventurier;
	}


	public int getLvl() {
		return lvl;
	}


	public void setLvl(int lvl) {
		this.lvl = lvl;
	}


	public int getExpTotale() {
		return expTotale;
	}


	public void setExpTotale(int expTotale) {
		this.expTotale = expTotale;
	}


	public int getRubis() {
		return rubis;
	}


	public void setRubis(int rubis) {
		this.rubis = rubis;
	}


	public int getGold() {
		return gold;
	}


	public void setGold(int gold) {
		this.gold = gold;
	}


	public String getClasse() {
		return classe;
	}


	public void setClasse(String classe) {
		this.classe = classe;
	}


	public int getSaphir() {
		return saphir;
	}


	public void setSaphir(int saphir) {
		this.saphir = saphir;
	}
	
}
