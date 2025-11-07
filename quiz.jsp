<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.p1.Model.Question"%>

<%
    if (session == null || session.getAttribute("questions") == null) {
        response.sendRedirect("welcome.jsp");
        return;
    }

    List<Question> questions = (List<Question>) session.getAttribute("questions");
    int currentIndex = (Integer) session.getAttribute("currentQuestionIndex");

    if (currentIndex >= questions.size()) {
        response.sendRedirect("endQuiz");
        return;
    }

    Question currentQuestion = questions.get(currentIndex);
    
    boolean fiftyFiftyUsed = (Boolean) session.getAttribute("fiftyFiftyUsed");
    boolean audiencePollUsed = (Boolean) session.getAttribute("audiencePollUsed");
    boolean fiftyFiftyActive = session.getAttribute("fiftyFiftyActive") != null ? (Boolean) session.getAttribute("fiftyFiftyActive") : false;
    boolean audiencePollActive = session.getAttribute("audiencePollActive") != null ? (Boolean) session.getAttribute("audiencePollActive") : false;
    
    // Reset active flags after checking
    session.setAttribute("fiftyFiftyActive", false);
    session.setAttribute("audiencePollActive", false);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Question</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #74b9ff 0%, #0984e3 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
            color: #333;
        }
        
        .quiz-container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }
        
        .header {
            background: linear-gradient(45deg, #6c5ce7, #a29bfe);
            color: white;
            padding: 20px;
            text-align: center;
        }
        
        .progress-bar {
            background: rgba(255, 255, 255, 0.3);
            height: 8px;
            border-radius: 4px;
            margin-top: 10px;
            overflow: hidden;
        }
        
        .progress-fill {
            background: #00b894;
            height: 100%;
            width: <%= ((float)(currentIndex + 1) / questions.size()) * 100 %>%;
            transition: width 0.3s ease;
        }
        
        .lifelines {
            display: flex;
            gap: 10px;
            margin-top: 15px;
            justify-content: center;
        }
        
        .lifeline-btn {
            background: white;
            color: #6c5ce7;
            border: 2px solid white;
            padding: 8px 15px;
            border-radius: 20px;
            cursor: pointer;
            font-weight: bold;
            font-size: 0.9em;
            transition: all 0.3s ease;
        }
        
        .lifeline-btn:hover:not(:disabled) {
            background: #f8f9fa;
            transform: scale(1.05);
        }
        
        .lifeline-btn:disabled {
            opacity: 0.5;
            cursor: not-allowed;
            background: #ccc;
            color: #666;
        }
        
        .question-content {
            padding: 40px;
        }
        
        .question-text {
            font-size: 1.3em;
            font-weight: bold;
            margin-bottom: 30px;
            color: #2d3436;
            line-height: 1.6;
        }
        
        .option {
            background: #f8f9fa;
            margin: 15px 0;
            padding: 15px 20px;
            border-radius: 10px;
            border: 2px solid transparent;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
        }
        
        .option:hover {
            background: #e3f2fd;
            border-color: #2196f3;
            transform: translateX(5px);
        }
        
        .option.hidden {
            display: none;
        }
        
        .option.poll-highlight {
            background: #fff9e6;
        }
        
        .option input[type="radio"] {
            margin-right: 15px;
            transform: scale(1.2);
        }
        
        .option label {
            cursor: pointer;
            font-size: 1.1em;
            display: block;
            padding-left: 10px;
        }
        
        .poll-percentage {
            float: right;
            color: #ff6b6b;
            font-weight: bold;
        }
        
        .submit-btn {
            background: linear-gradient(45deg, #00b894, #00cec9);
            color: white;
            border: none;
            padding: 15px 40px;
            font-size: 1.1em;
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 30px;
            width: 100%;
            text-transform: uppercase;
            font-weight: bold;
            letter-spacing: 1px;
        }
        
        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 184, 148, 0.4);
        }
        
        .question-number {
            font-size: 1.5em;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="quiz-container">
        <div class="header">
            <div class="question-number">
                Question <%= currentIndex + 1 %> of <%= questions.size() %>
            </div>
            <div class="progress-bar">
                <div class="progress-fill"></div>
            </div>
            <div class="lifelines">
                <form method="post" action="lifeline" style="display:inline;">
                    <input type="hidden" name="lifelineType" value="fiftyFifty">
                    <button type="submit" class="lifeline-btn" <%= fiftyFiftyUsed ? "disabled" : "" %>>
                        50:50
                    </button>
                </form>
                <form method="post" action="lifeline" style="display:inline;">
                    <input type="hidden" name="lifelineType" value="audiencePoll">
                    <button type="submit" class="lifeline-btn" <%= audiencePollUsed ? "disabled" : "" %>>
                        Audience Poll
                    </button>
                </form>
            </div>
        </div>
        
        <div class="question-content">
            <form action="quiz" method="post">
                <div class="question-text">
                    <%= currentQuestion.getQuestionText() %>
                </div>
                
                <% 
                    String[] options = {
                        currentQuestion.getOption1(),
                        currentQuestion.getOption2(),
                        currentQuestion.getOption3(),
                        currentQuestion.getOption4()
                    };
                    
                    java.util.Random rand = new java.util.Random();
                    int hiddenCount = 0;
                    java.util.List<Integer> hiddenIndices = new java.util.ArrayList<>();
                    
                    if (fiftyFiftyActive) {
                        // Hide 2 wrong answers
                        for (int i = 0; i < 4; i++) {
                            if (!options[i].equals(currentQuestion.getCorrectAnswer()) && hiddenCount < 2) {
                                hiddenIndices.add(i);
                                hiddenCount++;
                            }
                        }
                    }
                    
                    for (int i = 0; i < 4; i++) {
                        boolean isHidden = hiddenIndices.contains(i);
                        String pollPercentage = audiencePollActive ? 
                            (options[i].equals(currentQuestion.getCorrectAnswer()) ? "60%" : (int)(rand.nextInt(30)) + "%") : "";
                %>
                    <div class="option <%= isHidden ? "hidden" : "" %> <%= audiencePollActive ? "poll-highlight" : "" %>">
                        <input type="radio" name="option" value="<%= options[i] %>" id="opt<%= i %>" required>
                        <label for="opt<%= i %>">
                            <%= options[i] %>
                            <% if (audiencePollActive) { %>
                                <span class="poll-percentage">(<%= pollPercentage %>)</span>
                            <% } %>
                        </label>
                    </div>
                <% } %>

                <input type="submit" value="Submit Answer" class="submit-btn">
            </form>
        </div>
    </div>
</body>
</html>
