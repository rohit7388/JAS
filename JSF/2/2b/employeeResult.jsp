<%@ page contentType="text/html;charset=UTF-8" language="java"
%>
<%@ page import="java.util.regex.*" %>
<!DOCTYPE html>
<html>
<head>
 <title>Employee Information</title>
</head>
<body>
 <h2>Employee Information Result</h2>
 <%
 String employeeId = request.getParameter("employeeId");
 String name = request.getParameter("name");
 String ageStr = request.getParameter("age");
 String department = request.getParameter("department");
 String email = request.getParameter("email");
 String employeeIdError = "";
 String nameError = "";
 String ageError = "";
 String departmentError = "";
 String emailError = "";
 boolean isValid = true;
 if (employeeId == null || employeeId.trim().isEmpty())
{
 employeeIdError = "Employee ID is required.";
 isValid = false;
 }
 if (name == null || !name.matches("^[a-zA-Z\\s]+$")) {
nameError = "Name must contain only letters and spaces."; 
isValid = false;
 }
 int age = 0;
 try {
 age = Integer.parseInt(ageStr);
 if (age < 18 || age > 65) {
 ageError = "Age must be between 18 and 65.";
 isValid = false;
 }
 } catch (NumberFormatException e) {
 ageError = "Age must be a valid numeric value.";
 isValid = false;
 }
 if (department == null || department.trim().isEmpty())
{
 departmentError = "Department is required.";
 isValid = false;
 } else if (!department.matches("HR|Finance|IT|Sales"))
{
 departmentError = "Invalid department selected.";
 isValid = false;
 }
 if (email == null || !email.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$")) {
emailError = "Email must be in a valid format (e.g., name@example.com).";
 isValid = false;
 }
 if (isValid) {
 int currentYear =
java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
 int birthYear = currentYear - age;
 String nameAndDepartment = name + " (" + department + ")";
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
 <%
 } else {
 %>
 <h3>Validation Errors</h3>
 <ul>
 <% if (!employeeIdError.isEmpty()) { %>
 <li><b>Employee ID:</b> <%= employeeIdError
%></li>
 <% } %>
 <% if (!nameError.isEmpty()) { %>
 <li><b>Name:</b> <%= nameError %></li>
 <% } %>
 <% if (!ageError.isEmpty()) { %>
 <li><b>Age:</b> <%= ageError %></li>
 <% } %>
 <% if (!departmentError.isEmpty()) { %>
 <li><b>Department:</b> <%= departmentError
%></li>
 <% } %>
 <% if (!emailError.isEmpty()) { %>
 <li><b>Email:</b> <%= emailError %></li>
 <% } %>
 </ul>
 <a href="index.html">Go back to the form</a>
 <%
 }
 %>
</body>
</html>