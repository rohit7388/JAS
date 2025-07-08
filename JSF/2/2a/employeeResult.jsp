<%@ page contentType="text/html;charset=UTF-8" language="java"
%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
 <title>Employee Information</title>
</head>
<body>
 <h2>Employee Information Result</h2>
 <%
 // Retrieve form data
 String employeeId = request.getParameter("employeeId");
 String name = request.getParameter("name");
 String ageStr = request.getParameter("age");
 String department = request.getParameter("department");
 String email = request.getParameter("email");
 // Process data
 int age = Integer.parseInt(ageStr);
 Calendar calendar = Calendar.getInstance();
 int currentYear = calendar.get(Calendar.YEAR);
 int birthYear = currentYear - age;
 String nameAndDepartment = name + " (" + department +
")";
 // Format email
 String formattedEmail = email.toLowerCase();
 %>
 <table border="1">
 <tr>
 <th>Employee ID</th>
 <td><%= employeeId %></td>
 </tr>
 <tr>
 <th>Name and Department</th>
 <td><%= nameAndDepartment %></td>
 </tr>
 <tr>
 <th>Birth Year</th>
 <td><%= birthYear %></td>
 </tr>
 <tr>
 <th>Formatted Email</th>
 <td><%= formattedEmail %></td>
 </tr>
 </table>
</body>
</html>