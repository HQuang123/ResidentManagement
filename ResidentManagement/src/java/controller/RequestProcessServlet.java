/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.*;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import model.Household;
import model.HouseholdMember;
import model.Log;
import model.Registration;
import model.User;

/**
 *
 * @author huyng
 */
public class RequestProcessServlet extends HttpServlet {

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
            out.println("<title>Servlet RequestProcessServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RequestProcessServlet at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        String regisId = request.getParameter("registrationId");
        RegistrationDAO rdb = new RegistrationDAO();
        UserDAO udb = new UserDAO();
        HouseholdDAO hhdb = new HouseholdDAO();
        HouseholdMemberDAO hhmdb = new HouseholdMemberDAO();
        Registration regis = rdb.getRegistrationById(Integer.parseInt(regisId));
        LogDAO logdb = new LogDAO();
        int uid = regis.getUserId();
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String formattedDate = today.format(formatter);
        HttpSession session = request.getSession();

        
        //separate account
        if (regis.getRequestType().equals("separateAddress")) {
            //get permanent householdmem
            HouseholdMember householdMember = hhmdb.getPermanentHouseholdMemberbyUserId(uid);
            //old household info
            Household oldHousehold = hhdb.getHouseholdById(householdMember.getHouseholdId());

            hhmdb.deletePermanentHouseholdMemberByID(uid);
            hhdb.insertHousehold(uid, oldHousehold.getAddressId(), formattedDate);

            Household newHousehold = hhdb.getHouseholdByHeadId(uid);
            hhmdb.insertHouseholdMember(newHousehold.getHouseholdId(), uid, "Chủ hộ", "permanent");            
            rdb.updateRegistrationStatus(Integer.parseInt(regisId), "Approved", ((User) session.getAttribute("account")).getUserId());
            Log log = new Log(((User) session.getAttribute("account")).getUserId(), "Duyệt đơn tách hộ khẩu", formattedDate);
            logdb.insertNewLog(log);
            request.setAttribute("registration", regis);
            request.setAttribute("message", "Duyệt đơn thành công");            
            RequestDispatcher rs = request.getRequestDispatcher("view/viewListDetail.jsp");
            rs.forward(request, response);
            return;
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
