/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.util.*;
import javax.mail.*;
import javax.mail.PasswordAuthentication;
import javax.mail.*;
import java.io.IOException;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.internet.*;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.catalina.Session;
import javax.mail.internet.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
@WebServlet(name = "email", urlPatterns = {"/email"})
public class email extends HttpServlet {

    String email_admin;

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
            out.println("<title>Servlet email</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet email at " + request.getContextPath() + "</h1>");
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
        try {

            Connection con = MyConnection.getMyConnection();
            HttpSession sessionn = request.getSession();
            String sql = "select * from admin where id_user=1";
            PreparedStatement prst = con.prepareStatement(sql);
            ResultSet rst = prst.executeQuery();
            while (rst.next()) {
                email_admin = rst.getString(4);
            }
            //il faut metre un session dans le servlet d'apres lauthentification de parent comme ...
            //session.setAttribute("email_parent")=mettes la valeur de id_user pour récuperer dans ce page par methode getAttribute 
            String des=request.getParameter("description");
            String heur=request.getParameter("heur");
            String email_parent = String.valueOf(sessionn.getAttribute("email_parent") + "");
            String email_admins = email_admin;
            String password_parent=String.valueOf(sessionn.getAttribute("password_parent")) ;
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            Session session;
            session = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(email_parent, password_parent);
                }
            });
            try {
                Message message = new MimeMessage((MimeMessage) session);
                message.setFrom(new InternetAddress(email_parent));
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(email_admins));
                message.setSubject("Demande d\'un rendez-vous");
                message.setText(des +"\n dans l\'heur :"+heur+"\n Cordialement");
                Transport.send(message);
                System.out.println("Done");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(email.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
