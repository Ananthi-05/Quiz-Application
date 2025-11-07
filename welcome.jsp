<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Quiz</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }
        
        .container {
            text-align: center;
            background: rgba(255, 255, 255, 0.1);
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        h2 {
            font-size: 2.5em;
            margin-bottom: 30px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }
        
        .start-btn {
            background: linear-gradient(45deg, #ff6b6b, #ee5a24);
            color: white;
            border: none;
            padding: 15px 40px;
            font-size: 1.2em;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(238, 90, 36, 0.4);
            text-transform: uppercase;
            font-weight: bold;
            letter-spacing: 1px;
        }
        
        .start-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(238, 90, 36, 0.6);
            background: linear-gradient(45deg, #ee5a24, #ff6b6b);
        }
        
        .quiz-icon {
            font-size: 4em;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!--  <div class="quiz-icon">🧠</div>-->
        <h2>Welcome to the Quiz Contest</h2>
        
        <p style="font-size: 1.1em; margin-bottom: 30px; opacity: 0.9;">
            Test your knowledge and challenge yourself!
        </p>
        <form action="startQuiz" method="get">
            <input type="submit" value="Start Quiz" class="start-btn">
        </form>
    </div>
</body>
</html>

