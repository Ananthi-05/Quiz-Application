package com.p1.Controller;


import java.io.IOException;
import java.util.List;
/*
import com.p1.Model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/quiz")
public class QuizServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        List<Question> questions = (List<Question>) session.getAttribute("questions");
        Integer currentIndex = (Integer) session.getAttribute("currentQuestionIndex");
        Integer score = (Integer) session.getAttribute("score");

        String selectedOption = request.getParameter("option");

        if (questions == null || currentIndex == null || score == null) {
            response.sendRedirect("welcome.jsp");
            return;
        }

        Question currentQuestion = questions.get(currentIndex);

        // Check if selected option is correct
        if (currentQuestion.getCorrectAnswer().equals(selectedOption)) {
            score += 1000;  // increment score by 1000 for correct answer
        } else {
            // Incorrect answer: go to end game
            session.setAttribute("score", score);
            session.setAttribute("currentQuestionIndex", currentIndex);
            response.sendRedirect("endQuiz");
            return;
        }

        currentIndex++;

        if (currentIndex < questions.size()) {
            // Continue quiz
            session.setAttribute("currentQuestionIndex", currentIndex);
            session.setAttribute("score", score);
            response.sendRedirect("quiz.jsp");
        } else {
            // Quiz complete
            session.setAttribute("score", score);
            session.setAttribute("currentQuestionIndex", currentIndex);
            response.sendRedirect("endQuiz");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Just redirect to quiz page to show current question
        response.sendRedirect("quiz.jsp");
    }
}
*/

import com.p1.Model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/quiz")
public class QuizServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        List<Question> questions = (List<Question>) session.getAttribute("questions");
        Integer currentIndex = (Integer) session.getAttribute("currentQuestionIndex");
        Integer score = (Integer) session.getAttribute("score");

        String selectedOption = request.getParameter("option");

        if (questions == null || currentIndex == null || score == null) {
            response.sendRedirect("welcome.jsp");
            return;
        }

        Question currentQuestion = questions.get(currentIndex);

        // Check if selected option is correct
        if (currentQuestion.getCorrectAnswer().equals(selectedOption)) {
            score += 1000;  // increment score by 1000 for correct answer
        } else {
            // Incorrect answer: go to end game
            session.setAttribute("score", score);
            session.setAttribute("currentQuestionIndex", currentIndex);
            response.sendRedirect("endQuiz");
            return;
        }

        currentIndex++;

        if (currentIndex < questions.size()) {
            // Continue quiz
            session.setAttribute("currentQuestionIndex", currentIndex);
            session.setAttribute("score", score);
            response.sendRedirect("quiz.jsp");
        } else {
            // Quiz complete
            session.setAttribute("score", score);
            session.setAttribute("currentQuestionIndex", currentIndex);
            response.sendRedirect("endQuiz");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("quiz.jsp");
    }
}
