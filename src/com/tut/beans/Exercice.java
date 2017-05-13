package com.tut.beans;

public class Exercice {
	
	private Integer idExo;
	private Integer creator_id;
	private String titreExo;
	private String content;
	private String matiere;
	
	public Integer getIdExo() {
		return idExo;
	}
	public void setIdExo(Integer idExo) {
		this.idExo = idExo;
	}
	public Integer getCreator_id() {
		return creator_id;
	}
	public void setCreator_id(Integer creator_id) {
		this.creator_id = creator_id;
	}
	public String getTitreExo() {
		return titreExo;
	}
	public void setTitreExo(String titreExo) {
		this.titreExo = titreExo;
	}
	public String getMatiere() {
		return matiere;
	}
	public void setMatiere(String matiere) {
		this.matiere = matiere;
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	

}
