<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Calculation History</title>
	<style>
		body {
			background: linear-gradient(to right, #2b40ff, #07121a);
			font-size: 25px;
			color: white;
			text-align: center;
			overflow: hidden;
		}
		h1, h2 {
			margin: 20px;
		}
		.history-list {
			list-style: none;
			padding: 0;
			max-height: 300px; /* Restrict the height to make it scrollable */
			overflow-y: auto;  /* Add vertical scroll */
			margin: 0 auto;
			width: 60%; /* Adjust width to keep list centered */
			background-color: rgba(0, 0, 0, 0.7);
			border-radius: 5px;
			border: 2px solid white;
			box-shadow: 0 0 10px white, 0 0 20px cyan;
		}
		.history-list li {
			background-color: black;
			margin: 10px;
			padding: 10px;
			border: 2px solid white;
			border-radius: 5px;
			box-shadow: 0 0 10px white, 0 0 20px cyan;
		}
		/* Custom scrollbar styling */
		.history-list::-webkit-scrollbar {
			width: 10px;
		}
		.history-list::-webkit-scrollbar-track {
			background: black;
		}
		.history-list::-webkit-scrollbar-thumb {
			background-color: cyan;
			border-radius: 5px;
			border: 2px solid white;
		}
		button {
			font-size: 20px;
			margin-top: 20px;
			padding: 10px;
			border: 2px solid white;
			background-color: black;
			color: white;
			border-radius: 5px;
			cursor: pointer;
			box-shadow: 0 0 10px white, 0 0 20px cyan;
			transition: all 0.3s ease;
		}
		button:hover {
			box-shadow: 0 0 15px cyan, 0 0 25px blue, 0 0 35px red, 0 0 50px white;
			transform: scale(1.1);
		}
	</style>
	<script>
		// Fetch the calculation history from localStorage
		window.onload = function() {
			let history = JSON.parse(localStorage.getItem('calcHistory')) || [];
			let historyList = document.getElementById('historyList');
			if (history.length === 0) {
				historyList.innerHTML = "<li>No history available</li>";
			} else {
				history.forEach(function(answer) {
					let li = document.createElement('li');
					li.textContent = answer;
					historyList.appendChild(li);
				});
			}
		}
	</script>
</head>
<body>
	<h1>Calculation History</h1>
	<!-- Scrollable window for the history -->
	<ul id="historyList" class="history-list"></ul>
	
	<button onclick="window.location.href='index.html'">Go Home</button>
</body>
</html>
