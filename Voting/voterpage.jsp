<%@ page import="java.sql.*"%>
<html lang="en">
<head>
  <title>Vote here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body >

<div class="container">
           <div class="row">
           <div class="col-md-6">
               <label>User Login</label>
               </div>
           </div>
		   </div>
       <div class="column">
        <div class="col-md-6">
           <form method="post" action="">
        <div class="form-group">
          <label for="text">Enter your voter ID.:</label>
          <input type="text"  name="t5" class="form-control" id="email">
        </div>
        <div class="form-group">
          <label for="pwd">Enter your password:</label>
          <input type="password" name="t6" class="form-control" id="pwd">
        </div>
<div class="container">
  <center><font size="5" color="Blue"<p class="bg-primary text-white">Choose your Party/Cadidate as your wish</p></font>
      <table width="100%">
	  <tr width="100%">
    <div class="radio">
     <th width="25%"><label>BJP&nbsp<input type="radio" name="t7" value="BJP" ></label></th>
    </div>
    <div class="radio">
      <th width="25%"><label>NCI&nbsp<input type="radio" name="t7" value="NCI"></label></th>
    </div>
    <div class="radio">
      <th width="25%"><label>SP&nbsp<input type="radio" name="t7" value="SP"></label></th>
    </div>
	<div class="radio">
      <th width="25%"><label>BSP&nbsp<input type="radio" name="t7" value="BSP"></label></th>
    </div>
	</tr>
	</table>
	<table border="0" width="100%">
<tr width="100%"><th width="7%"><img src="bjplogo.jpg" width="50%"></th>
<th  width="7%"><img src="ncilogo.jpg" width="50%"></th>&nbsp
<th width="7%"><img src="splogo.jpg" width="50%"></th>
<th width="7%"><img src="bsplogo.jpg" width="50%"></th>
</tr>
 </table><br/>
	<label><input type="submit" name="b3" style="background-color:green;color:white;"></label>
  </form>
  </center>
<%
if(request.getParameter("b3")!=null)
{
	Connection con;
   Statement st;
   ResultSet rs;
	int voteid = Integer.parseInt(request.getParameter("t5"));
	String pwd = request.getParameter("t6");
  try{
  	 Class.forName("oracle.jdbc.driver.OracleDriver");
  	 String url="jdbc:oracle:thin:@localhost:1521:";
     	con=DriverManager.getConnection(url,"system","oracle@1234");
		st=con.createStatement();
        String sql="select * from voterpage where voter_id = "+voteid+"";
		rs=st.executeQuery(sql);
       if(rs.next())
	   {
		   String tpwd = rs.getString(2);
			if(tpwd.equals(pwd))
			{
				String partyName = request.getParameter("t7");
				if(rs.getString(3)==null)
				{
					sql = "update voterpage set selectedparty = '"+partyName+"' where voter_id = "+voteid+"";
					int res = st.executeUpdate(sql);
					if(res!=0)
						out.println("<center><label>Thank you for voting here</label></center>");
				}
				else
					out.println("<center><label>You have already voted</center></label>");
			}
			else	
			{
				out.println("<center><label>Wrong password</center></label>");
			}
	   }  
		else
		{
			out.println("<center><label>voter id doesn't exist</center></label>");
		}
       con.close();
    }catch(Exception e)
   {
	 out.println(e.toString());
   }
}

%>
</body>
</html>
