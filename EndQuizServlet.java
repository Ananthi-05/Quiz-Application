package com.p1.Controller;


import java.io.IOException;

import com.p1.DAO.PlayerDAO;
import com.p1.Model.Player;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/endQuiz")
public class EndQuizServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer score = (Integer) session.getAttribute("score");

        if (score == null) {
            response.sendRedirect("welcome.jsp");
            return;
        }

        String playerName = request.getParameter("playerName");
        if (playerName == null || playerName.trim().isEmpty()) {
            playerName = "Anonymous";
        }

        // Calculate prize based on score (customize logic as needed)
        int prize;
        if (score < 5000) {
            prize = (score / 1000) * 1000;
        } else if (score < 7000) {
            prize = 5000;
        } else {
            prize = 7000;
        }

        Player player = new Player(playerName, score, prize);
        PlayerDAO playerDAO = new PlayerDAO();
        playerDAO.savePlayer(player);

        // Forward to result page with player info
        request.setAttribute("playerName", playerName);
        request.setAttribute("score", score);
        request.setAttribute("prize", prize);

        session.invalidate();  // clear session

        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
