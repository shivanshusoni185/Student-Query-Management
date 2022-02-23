/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dbutil.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
/**
 *
 * @author sameer
 */
@WebServlet(urlPatterns = {"/LoginCheck"})
public class LoginCheck extends HttpServlet {

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
           
            
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            String cpass = request.getParameter("cpass");
            String uname = request.getParameter("uname");
            String mobile = request.getParameter("mobile");
            String utype= request.getParameter("utype");
            String depart= request.getParameter("depart");
            
            if(pass.equals(cpass))
            {
                Reg obj = new Reg();
               boolean ans =
                       obj.insertReg(
                  email, pass, uname, mobile, utype,depart);
               if(ans==true)
               {
                   HttpSession session = request.getSession();
                   session.setAttribute("email", email);
                   session.setAttribute("name", uname);
                    session.setAttribute("dept", obj.getDepartment());
                
                   if(utype.equals("Student"))
                   {
                  response.sendRedirect("studentHome.jsp");
                               
                   }
                   if(utype.equals("Faculty"))
                   {
                 response.sendRedirect("teacherHome.jsp");
                   }
               }
            }            
            else
            {
                out.println("password not match");
                RequestDispatcher rd =
                    request.getRequestDispatcher("reg.jsp");
rd.include(request,response);
            }
            
            
        }
        catch(Exception ex)
        {
            System.out.println(ex);
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
        processRequest(request, response);
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
