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
    int msgId = Integer.parseInt(request.getParameter("idValue"));
	   final String email = request.getParameter("email");
	   final String messg = new String (request.getParameter("subject").getBytes ("iso-8859-1"), "UTF-8");
	   final String to = (String) session.getAttribute("mailEmail");
	   final String subject = (String) session.getAttribute("mailName");
	   final String from = "kldvgibought@gmail.com";
	   final String pass = "giboughtkldv1234";
	   
	   boolean updMessage = UserDao.updateMessage(msgId,email,messg);
	   if(updMessage){
		   out.println("<script type=\"text/javascript\">");
		   out.println("window.location.href='emailnotRep.jsp';");
		   out.println("</script>");
	   }
	   // Email Host - Gmail
	   String host = "smtp.gmail.com";
	   // Configuração de envio ao Host
	   Properties props = new Properties();
	   props.put("mail.smtp.host", host);
	   props.put("mail.transport.protocol", "smtp");
	   props.put("mail.smtp.auth", "true");
	   props.put("mail.smtp.starttls.enable", "true");
	   
	   props.put("mail.smtp.starttls.required", "true");
	   props.put("mail.smtp.ssl.protocols", "TLSv1.2");
	   props.put("mail.user", from);
	   props.put("mail.password", pass);
	   props.put("mail.port", "443");
	  //Autorizar Email
	   Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
	       @Override
	       protected PasswordAuthentication getPasswordAuthentication() {
	           return new PasswordAuthentication(from, pass);
	       }
	   });
	   try {
	       MimeMessage message = new MimeMessage(mailSession);
	       message.setFrom(new InternetAddress(from));
	       
	       message.addRecipient(Message.RecipientType.TO,
	               new InternetAddress(to));
	       message.setSubject(subject);
	       String fiMsg = messg + "\nNão responda essa mensagem.";
	       
	       message.setText(fiMsg);
	       Transport.send(message);
	   } catch (MessagingException mex) {
	       mex.printStackTrace();
	   }
	}

out.println("<script type=\"text/javascript\">");
out.println("document.getElementById('myTable_length').style.display = 'hidden';");
out.println("if(performance.navigation.type == 2){");
out.println("location.reload(true);");
out.println("}");
out.println("</script>");


String User = (String) session.getAttribute("user");
if(User == null){
	response.sendRedirect("signOut.jsp");
}else{
	 String EmailWp = (String) session.getAttribute("email");
	 int messageId = Integer.parseInt(request.getParameter("idValue"));
	 ResultSet resEmail = UserDao.resAllMessg(2,EmailWp,messageId);
    if(resEmail != null){
    	session.setAttribute("mailSitu", 1);
    	while(resEmail.next()){
    	session.setAttribute("mailName", resEmail.getString(2));
		session.setAttribute("mailEmail", resEmail.getString(3));
		session.setAttribute("mailMessage", resEmail.getString(4));
    	}
    }
    else{
    	session.setAttribute("mailSitu", 0);
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
.swal-button{
display: none;
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
         <form onsubmit="return do_something()" method="post">
            <input type="text" id="contName" name="contName" placeholder="Digite seu Nome" required="required" readonly style="cursor:default" value="<%out.println(session.getAttribute("mailName"));%>"/>
            <input id="contemailAddress" type="email" name="contemailAddress" placeholder="Digite seu Email" required="required" readonly style="cursor:default" value="<%out.println(session.getAttribute("mailEmail"));%>"/>
            <textarea id="contsubject" name="contsubject" placeholder="Digite seu Comentario ou Mensagem" rows="7" required="required" readonly style="cursor:default;resize:none">
            <%
            String message = (String) session.getAttribute("mailMessage");
            out.println(message);
            %>
            </textarea>
            
            <h1 id="ctt">Responder</h1>
            <input id="emailAddress" type="email" name="email" placeholder="Digite seu Email" required="required" readonly style="cursor:default;" value="<%out.println(session.getAttribute("email"));%>"/>
            <textarea id="subject" name="subject" placeholder="Digite seu Comentario ou Mensagem" rows="15" required="required" style="resize:none"></textarea>

            <input type="submit" value="Responder" id="sumbtd" onclick="respMsg()"/>
         </form>
      </div>
   </section>
   <!-- Fim Contato -->
   <script>
   function do_something(){
	   var emailCont  = document.getElementById("contemailAddress").value;
	   var messg1 = "Reposta computada com sucesso" ;
	   var messg2 = "Enviada para "+emailCont; 
	   swal(messg1,messg2);
	   return true;

	}
   function backEmail(){
	   window.location.href="emailnotRep.jsp";
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
   <script src="../../js/sweetalert.min.js"></script>
   <script> AOS.init();</script>
   <!-- Fim Js -->
</body>

</html>