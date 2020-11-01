<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="servlets.Dbcon" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.time.*" %>
<%-- <%@page import="java.time.format.DateTimeFormatter" %> --%>
<%@page import="servlets.Poststore" %>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="ISO-8859-1"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <body> -->

<!-- </body> -->
<!-- </html> -->

<%
	
	Dbcon model = new Dbcon();
	List<Poststore> postlist = new ArrayList<>();
	try {
		ResultSet resultSet = model.Fetchponders();
			
		while(resultSet.next())
		{
			String username = resultSet.getString("username");
			String posttbd = resultSet.getString("post");
			String topictbd = resultSet.getString("topic");
			String datetime = resultSet.getString("dt");
		
			Poststore p = new Poststore(username,posttbd,topictbd,datetime);
			postlist.add(p);
			//System.out.println(username+" "+ posttbd+" "+topictbd+" "+datetime);
		}
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	for(Poststore p: postlist){


%>

<div class="container cards">

<div class="postholder">
          <b>@<%=p.getUsername() %></b> is pondering over<span class="topichighlight"> <%=p.getTopic() %></span>
        </div>
        <div class="card-body">
          <!-- <h5 class="card-title">Special title treatment</h5>  -->
          <!-- <p class="card-text">With supporting text below as a natural lead-in to additional content.</p> -->
          <h5><%=p.getPost() %></h5>
        </div>
        <hr>
        <div class="postholder">
          <%=p.getDatetime() %> UTC
        </div>
</div>
<!-- <div class="col-md-6 mt-2"> -->
	
<!-- 	<div class="card"> -->
	
<!-- 		<div class="card-body"> -->
<%-- 			<b><%= p.getUsername() %></b> --%>
<!-- 			<p>is pondering over</p> -->
<%-- 			<b> <%= p.getTopic() %> --%>
<!-- 			</b> -->
			
<%-- 			<h3><%= p.getPost() %></h3> --%>
<%-- 			<%=	p.getDatetime() %> --%>
<!-- 		</div> -->
	
<!-- 	</div> -->

<!-- </div> -->


<%
	}
%>



