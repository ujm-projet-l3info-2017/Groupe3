package com.tut.forms;

import javax.servlet.http.HttpServletRequest;

import com.tut.beans.Utilisateur;

public class FormMaitre extends FormInscription {
	private static final String CHAMP_MATIERE = "matiere";
	
	public Utilisateur inscrireUtilisateur(HttpServletRequest request) {
		String matiere = getValeurChamp(request, CHAMP_MATIERE);
		
		Utilisateur utilisateur = super.inscrireUtilisateur(request);
		
		utilisateur.setMatiere(matiere);
		
		return utilisateur;
	}
}
