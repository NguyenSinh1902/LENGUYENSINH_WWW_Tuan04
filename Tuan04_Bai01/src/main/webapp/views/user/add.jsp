<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>User Registration Form</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f8f9fa; }
        .container { width: 400px; margin: 40px auto; background: #fff; padding: 20px;
            border-radius: 6px; box-shadow: 0 0 10px rgba(0,0,0,.1); }
        h2 { text-align: center; }
        input, select { width: 100%; padding: 8px; margin: 5px 0; }
        .row { display: flex; gap: 10px; }
        .row input { flex: 1; }
        .gender { display: flex; gap: 10px; margin-top: 5px; }
        button { width: 100%; padding: 10px; background: #007bff; color: white;
            border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background: #0056b3; }
    </style>
</head>
<body>
<div class="container">
    <h2>User Registration Form</h2>
    <form action="${pageContext.request.contextPath}/users" method="post">
        <div class="row">
            <input type="text" name="firstName" placeholder="First Name" required>
            <input type="text" name="lastName" placeholder="Last Name" required>
        </div>
        <input type="email" name="email" placeholder="Your Email" required>
        <input type="email" name="confirmEmail" placeholder="Re-enter Email" required>
        <input type="password" name="password" placeholder="New Password" required>

        <label>Birthday</label>
        <div class="row">
            <select name="month"><option>Month</option><% for (int i=1;i<=12;i++){ %><option><%=i%></option><% } %></select>
            <select name="day"><option>Day</option><% for (int i=1;i<=31;i++){ %><option><%=i%></option><% } %></select>
            <select name="year"><option>Year</option><% for (int i=1950;i<=2025;i++){ %><option><%=i%></option><% } %></select>
        </div>

        <div class="gender">
            <label><input type="radio" name="gender" value="Female" required> Female</label>
            <label><input type="radio" name="gender" value="Male" required> Male</label>
        </div>

        <button type="submit">Sign Up</button>
    </form>
</div>
</body>
</html>
