<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Web Calci</title>
	<style type="text/css">
	body {
		font-size: 30px;
		text-align: center;
		background: linear-gradient(to right, #2b40ff, #07121a);
		overflow: hidden;
	}
	
	h1, h3, h2 {
		color: white;
		margin: 15px;
	}
	
	input, button {
		font-size: 25px;
		color: white;
		border-radius: 5%;
		background-color: black;
		border: 2px solid white;
		margin: 10px;
		padding: 10px;
		transition: all 0.5s ease-in-out;
		box-shadow: 0 0 10px white, 0 0 20px cyan, 0 0 30px blue, 0 0 40px red;
	}

	/* Glowing effect on hover */
	input:hover, button:hover {
		box-shadow: 0 0 15px cyan, 0 0 25px blue, 0 0 35px red, 0 0 50px white;
		border-color: cyan;
		transform: scale(1.1);
	}

	/* Glowing light animation around the input and buttons */
	@keyframes glowing {
		0% {
			box-shadow: 0 0 10px cyan, 0 0 20px blue, 0 0 30px red, 0 0 40px white;
		}
		50% {
			box-shadow: 0 0 20px blue, 0 0 30px red, 0 0 40px white, 0 0 50px cyan;
		}
		100% {
			box-shadow: 0 0 10px cyan, 0 0 20px blue, 0 0 30px red, 0 0 40px white;
		}
	}

	input, button {
		animation: glowing 2s infinite ease-in-out;
	}

	/* Style for the image */
	img {
		width: 20%;
		height: 20%;
		margin-top: 20px;
		border-radius: 50%;
		transition: transform 0.3s ease;
		box-shadow: 0 0 20px white, 0 0 40px cyan, 0 0 60px blue;
	}

	/* Image hover effect */
	img:hover {
		-ms-transform: scale(1.2); /* IE 9 */
		-webkit-transform: scale(1.2); /* Safari 3-8 */
		transform: scale(1.2);
		box-shadow: 0 0 30px cyan, 0 0 50px blue, 0 0 70px red, 0 0 90px white;
	}
	</style>
</head>
<body>

	<img alt="" src="images/laugh.gif">
	<h2>Joke of the Day!</h2>
	<h3>🤣<%= request.getParameter("joke") != null ? request.getParameter("joke") : "My Jokes Are Finished For Today" %></h3>
	

	<form action="MyServlet">
		<input name="num1" placeholder="First Number">
		<input name="num2" placeholder="Second Number">
		<button name="bt1" value="1">+</button>
		<button name="bt1" value="2">-</button>
		<button name="bt1" value="3">*</button>
		<button name="bt1" value="4">/</button>
	</form>
	
	<h2>Answer = <%= request.getParameter("ans") != null ? request.getParameter("ans") : "" %>👌</h2>

</body>
</html>
