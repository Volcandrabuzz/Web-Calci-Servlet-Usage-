<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Web_Calci</title>
	<style type="text/css">
	body {
		font-size: 30px;
		text-align: center;
		background: linear-gradient(to right, #2b40ff, #07121a);
		overflow: hidden;
		position: relative;
		height: 100vh;
	}
	
	h1, h3, h2, h4 {
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

	/* Style for the image */
	img {
		width: 15%;
		height: 15%;
		margin-top: 20px;
		border-radius: 50%;
		transition: transform 0.3s ease;
		box-shadow: 0 0 20px white, 0 0 40px cyan, 0 0 60px blue;
	}

	/* Image hover effect */
	img:hover {
		transform: scale(1.2);
		box-shadow: 0 0 30px cyan, 0 0 50px blue, 0 0 70px red, 0 0 90px white;
	}

	/* Styling the footer buttons */
	.footer {
		position: absolute;
		bottom: 20px;
		left: 50%;
		transform: translateX(-50%);
	}

	.footer button {
		font-size: 25px;
		background-color: black;
		color: white;
		border: 2px solid white;
		padding: 10px 20px;
		margin: 10px;
		border-radius: 5px;
		cursor: pointer;
		box-shadow: 0 0 10px white, 0 0 20px cyan, 0 0 30px blue, 0 0 40px red;
		transition: all 0.5s ease;
	}

	.footer button:hover {
		box-shadow: 0 0 15px cyan, 0 0 25px blue, 0 0 35px red, 0 0 50px white;
		transform: scale(1.1);
	}
	</style>

	<script>
		// Save answer to localStorage for History
		function saveAnswerHistory() {
			let answer = "<%= request.getParameter("ans") != null ? request.getParameter("ans") : "" %>";
			if (answer !== "") {
				let history = JSON.parse(localStorage.getItem('calcHistory')) || [];
				history.push(answer);
				localStorage.setItem('calcHistory', JSON.stringify(history));
				window.location.href = "history.jsp"; // Redirect to history page
			} else {
				alert("No answer to save!");
			}
		}
	</script>
</head>
<body>

	<img alt="" src="images/laugh.gif">
	<h3>Joke of the Day!</h3>
	<h4>🤣<%= request.getParameter("joke") != null ? request.getParameter("joke") : "My Jokes Are Finished For Today" %></h4>
	
	<form action="MyServlet">
		<input name="num1" placeholder="First Number">
		<input name="num2" placeholder="Second Number">
		<button name="bt1" value="1">+</button>
		<button name="bt1" value="2">-</button>
		<button name="bt1" value="3">*</button>
		<button name="bt1" value="4">/</button>
	</form>
	
	<h3>Answer = <%= request.getParameter("ans") != null ? request.getParameter("ans") : "" %>👌</h3>

	<!-- Footer buttons -->
	<div class="footer">
		<button onclick="window.location.href='index.html'">Home</button>
		<button onclick="saveAnswerHistory()">History</button>
	</div>

</body>
</html>
