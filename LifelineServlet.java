package com.p1.Controller;



import java.io.IOException;
import java.util.List;

import com.p1.Model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/lifeline")
public class LifelineServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String lifelineType = request.getParameter("lifelineType");

        List<Question> questions = (List<Question>) session.getAttribute("questions");
        Integer currentIndex = (Integer) session.getAttribute("currentQuestionIndex");

        if (questions == null || currentIndex == null) {
            response.sendRedirect("welcome.jsp");
            return;
        }

        Question currentQuestion = questions.get(currentIndex);

        if ("fiftyFifty".equals(lifelineType)) {
            session.setAttribute("fiftyFiftyUsed", true);
            session.setAttribute("fiftyFiftyActive", true);
        } else if ("audiencePoll".equals(lifelineType)) {
            session.setAttribute("audiencePollUsed", true);
            session.setAttribute("audiencePollActive", true);
        }

        response.sendRedirect("quiz.jsp");
    }
}
