<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz Result</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #fd79a8 0%, #fdcb6e 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .result-container {
            background: white;
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 500px;
            width: 100%;
        }
        
        .trophy {
            font-size: 5em;
            margin-bottom: 20px;
        }
        
        h2 {
            color: #2d3436;
            font-size: 2.5em;
            margin-bottom: 30px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .result-item {
            background: #f8f9fa;
            padding: 15px;
            margin: 15px 0;
            border-radius: 10px;
            border-left: 5px solid #6c5ce7;
        }
        
        .result-item strong {
            color: #2d3436;
            font-size: 1.1em;
        }
        
        .prize {
            color: #00b894;
            font-size: 1.5em;
            font-weight: bold;
        }
        
        .play-again-btn {
            background: linear-gradient(45deg, #6c5ce7, #a29bfe);
            color: white;
            border: none;
            padding: 15px 40px;
            font-size: 1.1em;
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 30px;
            text-transform: uppercase;
            font-weight: bold;
            letter-spacing: 1px;
        }
        
        .play-again-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(108, 92, 231, 0.4);
        }
    </style>
</head>
<body>
    <div class="result-container">
        <div class="trophy">🏆</div>
        <h2>Quiz Completed!</h2>
        <!--  
        <div class="result-item">
            <strong>Player Name:</strong> <%= request.getAttribute("playerName") %>
        </div>
        -->
        <div class="result-item">
            <strong>Your Score:</strong> <%= request.getAttribute("score") %>
        </div>
        
        <div class="result-item">
            <strong>Your Prize:</strong> <span class="prize">Rs. <%= request.getAttribute("prize") %></span>
        </div>

        <form action="startQuiz" method="get">
            <input type="submit" value="Play Again" class="play-again-btn">
        </form>
    </div>
</body>
</html>
