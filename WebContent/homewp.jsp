<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
out.println("<script type=\"text/javascript\">");
out.println("document.getElementById('myTable_length').style.display = 'hidden';");
out.println("if(performance.navigation.type == 2){");
out.println("location.reload(true);");
out.println("}");
out.println("</script>");

String User = (String) session.getAttribute("user");
if(User == null){
	System.out.println(User);
	response.sendRedirect("home/signOut.jsp");
}else{
	System.out.println(User);
	String Email = (String) session.getAttribute("email");
	ResultSet res = UserDao.resSearchWp(Email);
	if(res == null){
		
	}
	else{
	while(res.next()){
		 String name = (String) res.getString(1);
		session.setAttribute("name", name);
		session.setAttribute("email", Email);
		session.setAttribute("type", res.getInt(3));
	}
	}
}

%>

<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Kldv - HomeWp</title>
  

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="home/css/reset.min.css">
<link rel='stylesheet' href='home/css/bootstrap.css'><link rel="stylesheet" href="home/css/style.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="fonts/font-awesome.min.css">
<link rel="icon" href="img/fav.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/table/table.css">
</head>
<body>

<!-- partial:index.partial.html -->
<div class="contenedor">
  
  <div class="sidebar ancho">
    <div class="user">
      <img src="img/logo.png" alt="">
      <span class='user-nombre'><%
      String name = (String) session.getAttribute("name");
      out.println(name);
      %></span>
      <br/>
      <span class='user-nombre'><%
      String emailwp = (String) session.getAttribute("email");
      out.println(emailwp);
      %></span>
    </div>

    <nav class="menu-nav">
      <ul>
       
        <li class="menu-titles" style="cursor: default">Emails</li>
        <li class="menu-items" id="nrespEm" onclick="notResp();"><a><i class="fa fa-envelope-o menu-nav--icon fa-fw" aria-hidden="true"></i> Emails Não Respondidos</a></li>
        <li class="menu-items" id="respEm" onclick="resp();"><a><i class="fa fa-envelope menu-nav--icon fa-fw" aria-hidden="true"></i> Emails Respondidos</a></li>
        <li class="menu-items" id="oldEm" onclick="oldEm();"><a><i class="fa fa-envelope menu-nav--icon fa-fw" aria-hidden="true"></i> Emails Antigos</a></li>
         <% 
        if(User != null){
        int typeCli = (int)session.getAttribute("type");
        if(typeCli == 0){
        %>
         <script type="text/javascript"> document.getElementById("nrespEm").style.display = "none";
         document.getElementById("oldEm").style.display = "block";</script>        
        <% 
        }}
         
        if(User != null){
        int typeCli = (int)session.getAttribute("type");
        if(typeCli == 0){
        	out.println("<div id='funcio'>");
        }else{
        	out.println("<div id='funcio' style='display:none'>");
        }
        }
        %>
        <li class="menu-titles">Funcionarios</li>
        <li class="menu-items" id="addFunc" onclick="addFunc();"><a><i class='fa fa-inbox  menu-nav--icon fa-fw'></i>Ativados</a></li>
        <li class="menu-items" id="exFunc" onclick="exFunc();" style="display:none"></li>
        <li class="menu-items" id="edtFunc" onclick="edtFunc();"><a><i class='fa fa-pencil  menu-nav--icon fa-fw'></i> Desativados</a></li>
        </div>
      </ul>
    </nav>
    <li class="menu-items" id="exit" onclick="exit();"><a><i class='fa fa-sign-out  menu-nav--icon fa-fw'></i> Exit</a></li>
  </div>
  <div class="main bg-light">
   <% 
      if(User != null){
      int typeCli = (int)session.getAttribute("type");
      if(typeCli == 0){
      %>
     <iframe src="home/emailRep.jsp" style="height:100%;width:100%;" id="backSitu"></iframe>
    
	  <%}
      else{%>
     <iframe src="home/emailnotRep.jsp" style="height:100%;width:100%;" id="backSitu"></iframe>
    
      <%
      }
      }
      %>
    </div>
    <script src="js/table/jquery.js"></script>
  <script src="js/table/changetable.js"></script>
<script type="text/javascript" src="js/table/table.js"></script>
<script type="text/javascript" src="js/table/bootstrap.js"></script>  
  <script type="text/javascript">
  window.onload = function(e){ 
	  <% 
      if(User != null){
      int typeCli = (int)session.getAttribute("type");
      if(typeCli == 0){
      %>
      document.getElementById("respEm").style.color = "#23D17F";
	  <%}
      else{%>
      document.getElementById("nrespEm").style.color = "#23D17F";

      <%
      }
      }
      %>
	 
	} 
  function visnotEm(){
	  alert("oi");
  }
  
  function exit(){
	   window.location.href="home/signOut.jsp";
   }
   $(document).ready(function(){
    $('#myTable').dataTable();
    
    
   });
   $('#myTable').DataTable({

	"oLanguage": {
		"sSearch":"Pesquisar:",
		"oPaginate": {
			"sPrevious": "Voltar",
			"sNext": "Proximo",
			}

	}

	});
</script>
</body>
</html> 
