package com.emp;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SendOTP")
public class SendOTP extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        // Generate OTP
        Random r = new Random();

        int otp = 100000 + r.nextInt(900000);

        // Store in session
        HttpSession session = request.getSession();

        session.setAttribute("otp", otp);
        session.setAttribute("email", email);

        // Gmail credentials
        final String fromEmail = "harshac8002@gmail.com";

        final String password = "jbtp kxlf cfye jnuc";

        // SMTP Properties
        Properties props = new Properties();

        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session mailSession = Session.getInstance(props,

            new Authenticator() {

                protected PasswordAuthentication
                getPasswordAuthentication() {

                    return new PasswordAuthentication(
                            fromEmail,
                            password
                    );
                }
            });

        try {

            Message message =
                    new MimeMessage(mailSession);

            message.setFrom(
                    new InternetAddress(fromEmail));

            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email));

            message.setSubject("Password Reset OTP");

            message.setText(
                    "Just be chill and share this OTP BROOOOOOOOOOOOO: "
                    + otp);

            Transport.send(message);

            response.sendRedirect(
                    "forgotPassword.jsp?step=otp");

        } catch (Exception e) {

        	e.printStackTrace();

        	response.getWriter().println(e);
        }
    }
}