package com.p1.Controller;

import java.io.IOException;
import java.util.List;

/*

import java.io.IOException;
import java.util.List;

import com.p1.DAO.QuestionDAO;
import com.p1.Model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/startQuiz")
public class StartQuizServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Load questions from DB
        QuestionDAO questionDAO = new QuestionDAO();
        List<Question> questions = questionDAO.getAllQuestions();

        // Save in session
        HttpSession session = request.getSession();
        session.setAttribute("questions", questions);
        session.setAttribute("currentQuestionIndex", 0);
        session.setAttribute("score", 0);

        // Redirect to quiz page to show first question
        response.sendRedirect("quiz.jsp");
    }
}
*/

import com.p1.DAO.QuestionDAO;
import com.p1.Model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/startQuiz")
public class StartQuizServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Load questions from DB
        QuestionDAO questionDAO = new QuestionDAO();
        List<Question> questions = questionDAO.getAllQuestions();

        // Save in session
        HttpSession session = request.getSession();
        session.setAttribute("questions", questions);
        session.setAttribute("currentQuestionIndex", 0);
        session.setAttribute("score", 0);
        session.setAttribute("fiftyFiftyUsed", false);
        session.setAttribute("audiencePollUsed", false);

        // Redirect to quiz page to show first question
        response.sendRedirect("quiz.jsp");
    }
}

