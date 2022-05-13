<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%
if (request.getMethod().equals("POST")) {
	response.sendRedirect("emailRep.jsp");
}

String User = (String) session.getAttribute("user");
if(User == null){
	response.sendRedirect("signOut.jsp");
}else{
	int msgId = Integer.parseInt(request.getParameter("idMsg"));
	String email = request.getParameter("email");
	ResultSet msgWp = UserDao.resAllMessg(3, email, msgId);
	if(msgWp != null){
		while(msgWp.next()){
			session.setAttribute("mailName", msgWp.getString(2));
			session.setAttribute("mailEmail", msgWp.getString(3));
			session.setAttribute("mailEmailWp", msgWp.getString(7));
			session.setAttribute("mailMessage", msgWp.getString(4));
			session.setAttribute("mailMessageWp", msgWp.getString(6));
		}	
	}
	
}

%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en" 
xmlns="http://www.w3.org/1999/xhtml"
xmlns:ui="http://java.sun.com/jsf/facelets"
xmlns:h="http://java.sun.com/jsf/html"
xmlns:f="http://java.sun.com/jsf/core"
>
<head>
   <meta charset="UTF-8"/>
   <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
   <title>Gibought</title>
   <link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
   <link rel="stylesheet" href="../bootstrap/style.css"/>
   <link rel="stylesheet" href="../bootstrap/lib/bootstrap.min.css"/>
   <link rel="stylesheet" href="../bootstrap/lib/ionicons.min.css"/>
   <link rel="stylesheet" href="../bootstrap/lib/font-awesome.min.css"/>
   <link rel="stylesheet" href="../css/aos.css"/>
   <link rel="stylesheet" href="../css/style.css"/>
   <link rel="stylesheet" href="../fonts/font-awesome.min.css"/>
   <link rel="stylesheet" href="../fonts/ionicons.min.css"/>
   <link rel="stylesheet" href="../fonts/roboto.css"/>
   <link rel="icon" href="../img/fav.ico" type="image/x-icon" />
   <style>
   body{
   background: #dfe6f5 !important;
   }
   .container-contact2 {
    box-sizing: border-box;
    border-radius: 5px;
    background: #fff;
    padding: 30px;
    width: 100%;
    margin: 0 auto;
}
#backButtonMsg{
color: #fff;
    background-color: #084d41 !important;
    border-color: #084d41 !important;
}
   </style>
</head>

<body>
   <!-- Contato -->
   <section id="contato">
      <div class="container-contact2">
       <div class="col-lg-12">
       <div class="col-lg-12" style="text-align: right;">
       <button onclick="backEmail();" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" style="text-align: right;" id="backButtonMsg">
        X
       </button>
       
       </div>
         <h1 id="ctt">Contato</h1>
       </div>
         <form action="" method="post">
            <input type="text" id="contName" name="contName" placeholder="Digite seu Nome" required="required" readonly style="cursor:default" value="<%out.println(session.getAttribute("mailName"));%>"/>
            <input id="contemailAddress" type="email" name="contemailAddress" placeholder="Digite seu Email" required="required" readonly style="cursor:default" value="<%out.println(session.getAttribute("mailEmail"));%>"/>
            <textarea id="contsubject" name="contsubject" placeholder="Digite seu Comentario ou Mensagem" rows="7" required="required" readonly style="cursor:default;resize:none">
            <%
            String message = (String) session.getAttribute("mailMessage");
            out.println(message);
            %>
            </textarea>
            
            <h1 id="ctt">Respostas</h1>
            <input id="emailAddress" type="email" name="email" placeholder="Digite seu Email" required="required" readonly style="cursor:default;" value="<%out.println(session.getAttribute("mailEmailWp"));%>"/>
            <textarea id="subject" name="subject" placeholder="Digite seu Comentario ou Mensagem" rows="15" required="required" readonly style="resize:none">
             <%
            String messageWp = (String) session.getAttribute("mailMessageWp");
            out.println(messageWp);
            %>
            </textarea>
            <input type="submit" value="Fechar" id="sumbtd"/>
         </form>
      </div>
   </section>
   <!-- Fim Contato -->
   <script>
   function backEmail(){
	   window.location.href="emailRep.jsp";
   }
   function valuesView(){
	   alert("oi");
   }
   </script>
   <script src="../bootstrap/script.js"></script>
   <script src="../js/script.min.js"></script>
   <script src="../js/sendEmail.js"></script>
   <script src="../js/lib/jquery.min.js"></script>
   <script src="../js/back-top-top.js"></script>
   <script src="../js/lib/bootstrap.min.js"></script>
   <script src="../js/lib/aos.js"></script>
   <script src="../js/change-lang.js"></script>
   <script> AOS.init();</script>
   <!-- Fim Js -->
</body>

</html>
