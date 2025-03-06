/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;


import dal.UserDAO;
import jakarta.servlet.RequestDispatcher;

import dal.RegistrationDAO;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

import java.util.List;
import model.Registration;
import model.User;

/**
 *
 * @author huyng
 */
public class NavigationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NavigationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NavigationServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        User user = (User) session.getAttribute("account");
        UserDAO udb = new UserDAO();
        RegistrationDAO rdb = new RegistrationDAO();
        if(user == null){

            response.sendRedirect("login");
            return;
        }
        if (action.equalsIgnoreCase("citizenMain")) {
            request.getRequestDispatcher("view/citizenMain.jsp").forward(request, response);
        } else if (action.equalsIgnoreCase("submitRequest")) {
            request.getRequestDispatcher("view/submitRequest.jsp").forward(request, response);
        } else if (action.equalsIgnoreCase("citizenAccount")) {
            request.getRequestDispatcher("view/citizenAccount.jsp").forward(request, response);

        }else if(action.equalsIgnoreCase("viewRequest")){
            System.out.println(user.getUserId());
            List<Registration> list = rdb.getRegistrationByUserId(user);
            request.setAttribute("registrations", list);
            request.getRequestDispatcher("view/viewRequest.jsp").forward(request, response);
        } else if (action.equalsIgnoreCase("accountList")) {
            ArrayList<User> users = udb.getAll();
            ArrayList<User> list = udb.getUserByStartAndEnd(users, 0, 6);
            request.setAttribute("list", list);
            int page = (users.size() % 6 == 0)? users.size() / 6 : users.size() / 6 + 1; //Get number of page
            request.setAttribute("page", page);            
            request.getRequestDispatcher("view/accountList.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
