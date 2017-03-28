<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<style>
		.button {
			padding: 15px 25px;
			margin: 10px;
			font-size: 24px;
			text-align: center;
			cursor: pointer;
			outline: none;
			color: #fff;
			background-color: #4CAF50;
			border: none;
			border-radius: 15px;
			box-shadow: 0 9px #999;
			height: 200px;
		}
		
		.button:hover {
			background-color: #3e8e41
		}
		
		.button:active {
			background-color: #3e8e41;
			box-shadow: 0 5px #666;
			transform: translateY(4px);
		}
		
		h1 {
			text-align: center;
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
	    var url = "Inscription_aventurier.jsp";
	    window.location.assign(url);
	    }
	    function redirect_maitre()
	    {
	    var url = "Inscription_maitre.jsp";
	    window.location.assign(url);
	    }
	</script>
	<title>Inscription</title>
	</head>
	<body>
		<h1>Inscription</h1>
		<div id="bloc_inscription">
			<button id="button1" class="button" onClick="redirect_aventurier()">Aventurier
				(eleve)</button>
	
			<button id="button2" class="button" onClick="redirect_maitre()">Maitre
				(Guide)</button>
		</div>
	
	</body>
</html>