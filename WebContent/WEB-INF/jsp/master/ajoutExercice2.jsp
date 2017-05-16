	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="../partials/header.jsp">
		<jsp:param value="Correction Exercices" name="nom"/>
		<jsp:param value="navigation_maitre.jsp" name="nav"/>
		<jsp:param value="css/home.css" name="style"/>
	</jsp:include>



	
	<script  type="text/javascript">
	function commande(nom, argument) {
		  if (typeof argument === 'undefined') {
		    argument = '';
		  }
		  // Exécuter la commande
		  document.execCommand(nom, false, argument);
		}
	</script>
			<div class="content">
			<c:choose>
				<c:when test="${ sessionScope.sessionUtilisateur.typeUser == 'Maitres' }">
						
						<jsp:include page="../partials/structmaster.jsp"></jsp:include>
				
						 <!-- <div id="contentE">
								<div class="header">
							    <h2 style="margin:5px">Ajout d'exercice</h2>
							    </div>
							    <input  type="button" value="G" style="font-weight: bold;" onclick="commande('bold');" />
								<input type="button" value="I" style="font-style: italic;" onclick="commande('italic');" />
								<input type="button" value="S" style="text-decoration: underline;" onclick="commande('underline');" />
								<input type="text" value="titre de l'exercice..." style=" border: 2px solid black; width: 100%; padding: 10px; float: left;font-size: 16px;"/>
								<div id="editeur"  contentEditable="true"></div>
								<button class="button" type = "submit">Ajouter</button>
						</div> -->
						
						
<form id="postform" method="post" action="" enctype="">

	<div class="panel" id="postingbox" style="background-color: #ffcc66";">
		<div class="inner">
		
		<h3 style="margin:0">Ajouter un exercice</h3>

		<fieldset class="fields1">
		
			<dl style="clear: left;">
				<dt><label for="subject">Sujet :</label></dt>
				<dd><input type="text" name="subject" id="subject" size="45" maxlength="124" tabindex="2" value="" class="inputbox autowidth" /></dd>
			</dl>
			<script type="text/javascript" src="js/core.js"></script>
			<script type="text/javascript" src="js/editor.js"></script>
			<script type="text/javascript" src="js/editor.js"></script>
			<script type="text/javascript" src="js/jquery.min.js"></script>
			<script type="text/javascript" src="js/ajax.js"></script>
			<script type="text/javascript" src="js/plupload.full.min.js"></script>
			<script type="text/javascript" src="js/plupload.js"></script>
			
			<script type="text/javascript">
						// <![CDATA[
							var form_name = 'postform';
							var text_name = 'message';
							var load_draft = false;
							var upload = false;

							// Define the bbCode tags
							var bbcode = new Array();
							var bbtags = new Array('[b]','[/b]','[i]','[/i]','[u]','[/u]','[quote]','[/quote]','[code]','[/code]','[list]','[/list]','[list=]','[/list]','[img]','[/img]','[url]','[/url]','[flash=]', '[/flash]','[size=]','[/size]', '[alinea]', '[/alinea]', '[center]', '[/center]', '[justifier]', '[/justifier]', '[s]', '[/s]', '[spoiler]', '[/spoiler]');
							var imageTag = false;

							// Helpline messages
							var help_line = {
								b: 'Texte gras : [b]texte[/b]',
								i: 'Texte italique : [i]texte[/i]',
								u: 'Texte souligné : [u]texte[/u]',
								q: 'Citation : [quote]texte[/quote]',
								c: 'Code : [code]code[/code]',
								l: 'Liste : [list][*]texte[/list]',
								o: 'Liste numérotée : par exemple [list=1][*]Point 1[/list] ou [list=a][*]Point a[/list]',
								p: 'Insérer une image : [img]http://image_url[/img]',
								w: 'Insérer un lien : [url]http://url[/url] ou [url=http://url]texte descriptif[/url]',
								a: 'Insérer un fichier joint dans ce message : [attachment=]nom_du_fichier.ext[/attachment]',
								s: 'Couleur de la police : [color=red]texte[/color] ou [color=#FF0000]texte[/color]',
								f: 'Taille de la police : [size=85]petit texte[/size]',
								y: 'Liste : Ajouter une liste d’éléments',
								d: 'Flash : [flash=largeur,hauteur]http://url[/flash]'
											,cb_22: 'Marque un alinéa (retrait de première ligne ; vous pouvez changer la valeur qui est de 25 pixels par défaut)'
											,cb_24: 'Texte aligné au centre : [center]texte[center]'
											,cb_26: 'Justifier un texte : [justifier]texte[/justifier]'
											,cb_28: 'Texte barré: [s]texte[/s]'
											,cb_30: '[spoiler]Mettez le texte à cacher ici[/spoiler]'
									}
						// ]]>
						</script>


			<div id="format-buttons">
				<input type="button" class="button2 bbcode-b" accesskey="b" name="addbbcode0" value=" B " style="font-weight:bold; width: 30px" onclick="bbstyle(0)" title="Texte gras : [b]texte[/b]" />
				<input type="button" class="button2 bbcode-i" accesskey="i" name="addbbcode2" value=" i " style="font-style:italic; width: 30px" onclick="bbstyle(2)" title="Texte italique : [i]texte[/i]" />
				<input type="button" class="button2 bbcode-u" accesskey="u" name="addbbcode4" value=" u " style="text-decoration: underline; width: 30px" onclick="bbstyle(4)" title="Texte souligné : [u]texte[/u]" />
						<input type="button" class="button2 bbcode-quote" accesskey="q" name="addbbcode6" value="Quote" style="width: 50px" onclick="bbstyle(6)" title="Citation : [quote]texte[/quote]" />
					<input type="button" class="button2 bbcode-code" accesskey="c" name="addbbcode8" value="Code" style="width: 40px" onclick="bbstyle(8)" title="Code : [code]code[/code]" />
				<input type="button" class="button2 bbcode-list" accesskey="l" name="addbbcode10" value="List" style="width: 40px" onclick="bbstyle(10)" title="Liste : [list][*]texte[/list]" />
				<input type="button" class="button2 bbcode-list-" accesskey="o" name="addbbcode12" value="List=" style="width: 40px" onclick="bbstyle(12)" title="Liste numérotée : par exemple [list=1][*]Point 1[/list] ou [list=a][*]Point a[/list]" />
				<input type="button" class="button2 bbcode-asterisk" accesskey="y" name="addlistitem" value="[*]" style="width: 40px" onclick="bbstyle(-1)" title="Élément de liste : [*]texte" />
						<input type="button" class="button2 bbcode-img" accesskey="p" name="addbbcode14" value="Img" style="width: 40px" onclick="bbstyle(14)" title="Insérer une image : [img]http://image_url[/img]" />
							<input type="button" class="button2 bbcode-url" accesskey="w" name="addbbcode16" value="URL" style="text-decoration: underline; width: 40px" onclick="bbstyle(16)" title="Insérer un lien : [url]http://url[/url] ou [url=http://url]texte descriptif[/url]" />
						<select name="addbbcode20" class="bbcode-size" onchange="bbfontstyle('[size=' + this.form.addbbcode20.options[this.form.addbbcode20.selectedIndex].value + ']', '[/size]');this.form.addbbcode20.selectedIndex = 2;" title="Taille de la police : [size=85]petit texte[/size]">
					<option value="50">Très petite</option>
					<option value="85">Petite</option>
					<option value="100" selected="selected">Normale</option>
								<option value="150">Grande</option>
										<option value="200">Très grande</option>
									</select>
				<input type="button" class="button2 bbcode-color" name="bbpalette" id="bbpalette" value="Couleur de la police" onclick="change_palette();" title="Couleur de la police : [color=red]texte[/color] ou [color=#FF0000]texte[/color]" />

				
						<input type="button" class="button2 bbcode-alinea" name="addbbcode22" value="alinea" onclick="bbstyle(22)" title="Marque un alinéa (retrait de première ligne ; vous pouvez changer la valeur qui est de 25 pixels par défaut)" />
						<input type="button" class="button2 bbcode-center" name="addbbcode24" value="center" onclick="bbstyle(24)" title="Texte aligné au centre : [center]texte[center]" />
						<input type="button" class="button2 bbcode-justifier" name="addbbcode26" value="justifier" onclick="bbstyle(26)" title="Justifier un texte : [justifier]texte[/justifier]" />
						<input type="button" class="button2 bbcode-s" name="addbbcode28" value="s" onclick="bbstyle(28)" title="Texte barré: [s]texte[/s]" />
						<input type="button" class="button2 bbcode-spoiler" name="addbbcode30" value="spoiler" onclick="bbstyle(30)" title="[spoiler]Mettez le texte à cacher ici[/spoiler]" />
			</div>

			
			<div id="message-box">
					<textarea name="message" id="message" rows="15" cols="76" tabindex="4" onselect="storeCaret(this);" onclick="storeCaret(this);" onkeyup="storeCaret(this);" onfocus="initInsertions();"class="inputbox">Votre énoncé ici...</textarea>
			</div>
		</fieldset>


		</div>
	</div>
		
	<div class="panel bg2">
		<div class="inner">
			<fieldset class="submit-buttons">
				<input type="hidden" name="topic_cur_post_id" value="70352" /><input type="hidden" name="lastclick" value="1494845561" />
				<input type="submit" accesskey="k" tabindex="7" name="save" value="Sauvegarder le brouillon" class="button2" />&nbsp;
				<input type="submit" tabindex="5" name="preview" value="Aperçu" class="button1" onclick="document.getElementById('postform').action += '#preview';" />&nbsp;
				<input type="submit" accesskey="s" tabindex="6" name="post" value="Envoyer" class="button1 default-submit-action" />&nbsp;
			</fieldset>
		</div>
	</div>
		

</form>

						
				</c:when>
				<c:otherwise>
					<%@include file="../question.jsp" %>
				</c:otherwise>
			</c:choose>
		</div>
	
	
<jsp:include page="../partials/footer.jsp"></jsp:include>