<%@ page import="java.sql.*" %>
<html>
<head>
</head>
<body BACKGROUND="a7.jpg" >
<%
   Connection con;
   Statement st;
   ResultSet rs;
  try{
  	 Class.forName("oracle.jdbc.driver.OracleDriver");
  	 String url="jdbc:oracle:thin:@localhost:1521:";
     	con=DriverManager.getConnection(url,"system","oracle@1234");
	
        st=con.createStatement();
        String sql="select selectedparty,count(*)from voterpage group by selectedparty";
        rs=st.executeQuery(sql);
		
	%>

</br></br></br></br></br></br><table height="350" width="500px" cellpadding="10" cellspacing='4'border="4">
      <tr>
          <td><CENTER><b><font color="red">SELECTED PARTY</font></b></CENTER></td> <td><CENTER><b>
		  <font color="red">VOTE  &nbsp&nbspCOUNT</font></b><CENTER></td>
      </tr>

	<%
        while(rs.next())
       {
	%>
         <tr>	
          <td><CENTER><b><font color="green"><% out.print(rs.getString(1)+" ");%></font></CENTER></td> 
		   <td>&nbsp&nbsp<b><font color="blue"><% out.print(rs.getInt(2)+" ");%></font></b></td> 
		  </tr> 
		  
	<%
       }
       con.close();
    }catch(Exception e)
   {
	 System.out.println(e.toString());
   }
  	%>
	
	</table>
 </body>
 </html>
