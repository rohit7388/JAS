package com.example;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/ServletDemo/SessionServlet")
public class SessionServlet extends HttpServlet {
protected void processRequest(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
response.setContentType("text/html;charset=UTF-8");
try (PrintWriter out = response.getWriter()) {
out.println("<!DOCTYPE html>");
out.println("<html>");
out.println("<head>");
out.println("<title>ServletSessionServlet</title>");
out.println("</head>");
out.println("<body>");
out.println("<h1>Servlet SessionServlet at " +request.getContextPath() + "</h1>");
out.println("</body>");
out.println("</html>");
}
}
protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
response.setContentType("text/html");
PrintWriter out = response.getWriter();
String action = request.getParameter("action");
if ("logout".equals(action)) {
HttpSession session = request.getSession(false);
if (session != null) {
session.invalidate();
}
response.sendRedirect("SessionServlet");
return;
}
HttpSession session = request.getSession(false);
if (session != null && session.getAttribute("username")
!= null) {
out.println("<html><head><title>Welcome</title></head><body>");
out.println("<h2>Welcome, " +session.getAttribute("username") + "!</h2>");
out.println("<p><ahref='SessionServlet?action=logout'>Logout</a></p>");
out.println("<h3>Session Information:</h3>");
out.println("<p>Session ID: " + session.getId() +"</p>");
out.println("<p>Creation Time: " + new java.util.Date(session.getCreationTime()) + "</p>");
out.println("<p>Last Accessed Time: " + new java.util.Date(session.getLastAccessedTime()) + "</p>");
out.println("</body></html>");
} else {
out.println("<html><head><title>Login</title></head><body>");
out.println("<h2>Login</h2>");
out.println("<form method='post'action='SessionServlet'>");
out.println("Username: <input type='text'name='username'><br><br>");
out.println("Password: <input type='password'name='password'><br><br>");
out.println("<input type='submit' value='Login'>");
out.println("</form>");
out.println("</body></html>");
}
}
protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
 
String username = request.getParameter("username");
String password = request.getParameter("password");
if (username != null && username.equals("admin") &&
password != null && password.equals("password")) {
HttpSession session = request.getSession(true); 
session.setAttribute("username", username);
response.sendRedirect("SessionServlet");
} else {
response.sendRedirect("SessionServlet");
}
}
protected void doDelete(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {
HttpSession session = request.getSession(false);
if (session != null) {
session.invalidate();
}
response.sendRedirect("SessionServlet");
}
}