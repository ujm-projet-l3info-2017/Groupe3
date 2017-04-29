<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf8">
		<link rel="stylesheet" href="css/style.css" />
		<style>
			.button {
				padding: 15px 25px;
				margin: 10px;
				font-size: 24px;
				text-align: center;
				cursor: pointer;
				outline: none;
				color: #fff;
				background-color: #FC8830;
				border: none;
				border-radius: 15px;
				box-shadow: 0 9px #999;
				height: 200px;
				width : 200px;
			}
			
			.button:hover {
				background-color: #FF0000;
			}
			
			.button:active {
				background-color: #3e8e41;
				box-shadow: 0 5px #666;
				transform: translateY(4px);
			}
			
			#inscription {
				text-align: center;
				color: black;
				margin: auto;
				font-size: 80px;

			}
			
			#bloc_inscription {
				margin: auto;
				margin: 30px auto auto auto;
				text-align: center;
			}
		</style>
		<script type="text/javascript">
		    function redirect_aventurier()
		    {
		    var url = "inscription_aventurier";
		    window.location.assign(url);
		    }
		    function redirect_maitre()
		    {
		    var url = "inscription_maitre";
		    window.location.assign(url);
		    }
		</script>
		<title>Inscription</title>
	</head>
	
	<header>
			<div id="logo">
				<h1>KOLEGIA</h1>
			</div>
		
			<nav> <a href="inscription" class="bouton_menu"
				id="bouton_ins">Inscription</a> <a href="connexion" id="bouton_connex"
				class="bouton_menu">Connexion</a> 
			</nav> 
		</header>
		
	<body>
		<h1 id="inscription">Inscription</h1>
		<div id="bloc_inscription">
			<button id="button1" class="button" onClick="redirect_aventurier()">Aventurier</button>
	
			<button id="button2" class="button" onClick="redirect_maitre()">Maître</button>
		</div>
	
	
	
	<jsp:include page="partials/footer.jsp"></jsp:include>