<html>
<head>
<title>Welcome to admin page</title>
</head>
<body>

        <%
		
        String uname,password;
        uname=request.getParameter("t1");
        password=request.getParameter("t2");
       if(uname.equals("united@gmail.com") && password.equals("united"))
       {
       response.sendRedirect("admin4.jsp");
       }
       else
        {
        out.println("Your Username or possward is wrong");
        }

        %>
   </body>
   </html>




