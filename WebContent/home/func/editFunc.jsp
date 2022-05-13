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
      <link rel="stylesheet" href="../../bootstrap/bootstrap.min.css"/>
      <link rel="stylesheet" href="../../bootstrap/style.css"/>
      <link rel="stylesheet" href="../../bootstrap/lib/bootstrap.min.css"/>
      <link rel="stylesheet" href="../../bootstrap/lib/ionicons.min.css"/>
      <link rel="stylesheet" href="../../bootstrap/lib/font-awesome.min.css"/>
      <link rel="stylesheet" href="../../css/aos.css"/>
      <link rel="stylesheet" href="../../css/style.css"/>
      <link rel="stylesheet" href="../../fonts/font-awesome.min.css"/>
      <link rel="stylesheet" href="../../fonts/ionicons.min.css"/>
      <link rel="stylesheet" href="../../fonts/roboto.css"/>
      <link rel="icon" href="../../img/fav.ico" type="image/x-icon" />
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
            <%
            int messageId = Integer.parseInt(request.getParameter("idFunc"));
            if( messageId == 0){
            %>
            <div id="addFunc">
               <h1 id="titleFunc">Adicionar Funcionario</h1>
               <form action="" method="post">
                  <div class="row">
                     <div class="col-md-6 col-xs-6">
                        <input type="text" id="wpName" name="wpName" placeholder="Digite o Nome do funcionario" required="required"/>
                     </div>
                     <div class="col-md-6 col-xs-6">
                        <input id="wpemailAddress" type="email" name="wpemailAddress" placeholder="Digite um Email" required="required"/>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6 col-xs-6">
                        <div class="input-group">
                           <input type="password" name="password" id="password" placeholder="Digite uma Senha" class="form-control" data-toggle="password"/>
                           <div class="input-group-append">
                              <span class="input-group-text" onclick="togglePassword()" style="cursor: pointer">
                              <i id="eyeToggle" class="fa fa-eye"></i>
                              </span>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6 col-xs-6">
                        <div class="input-group">
                           <input type="password" name="conpassword" id="conpassword" placeholder="confirme a Senha digitada" class="form-control" data-toggle="password"/>
                           <div class="input-group-append">
                              <span class="input-group-text" onclick="contogglePassword()" style="cursor: pointer">
                              <i id="coneyeToggle" class="fa fa-eye"></i>
                              </span>
                           </div>
                        </div>
                     </div>
                  </div>
                  <br/>
                  <input type="submit" value="Inserir" id="sumbtd"/>
                  <input type="hidden" value="0" id="edtValue"/>
               </form>
            </div>
            <%
            }
            else{ %>
            <div id="edtFunc">
               <h1 id="titleFunc">Editar Funcionario</h1>
               <form action="" method="post">
                  <div class="row">
                     <div class="col-md-6 col-xs-6">
                        <input type="text" id="wpName" name="wpName" placeholder="Digite o Nome do funcionario" required="required"/>
                     </div>
                     <div class="col-md-6 col-xs-6">
                        <input id="wpemailAddress" type="email" name="wpemailAddress" placeholder="Digite um Email" required="required"/>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6 col-xs-6">
                        <div class="input-group">
                           <input type="password" name="password" id="password" placeholder="Digite uma Senha" class="form-control" data-toggle="password"/>
                           <div class="input-group-append">
                              <span class="input-group-text" onclick="togglePassword()" style="cursor: pointer">
                              <i id="eyeToggle" class="fa fa-eye"></i>
                              </span>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6 col-xs-6">
                        <div class="input-group">
                           <input type="password" name="conpassword" id="conpassword" placeholder="confirme a Senha digitada" class="form-control" data-toggle="password"/>
                           <div class="input-group-append">
                              <span class="input-group-text" onclick="contogglePassword()" style="cursor: pointer">
                              <i id="coneyeToggle" class="fa fa-eye"></i>
                              </span>
                           </div>
                        </div>
                     </div>
                  </div>
                  <br/>
                  <input type="submit" value="Editar" id="sumbtd"/>
                  <input type="hidden" value="1" id="edtValue"/>
               </form>
            </div>
            <%}%>
         </div>
      </section>
      <!-- Fim Contato -->
      <script>
         function backEmail(){
          window.location.href="emailnotRep.jsp";
         }
         
         function contogglePassword(){
          var pass = document.getElementById("conpassword");
          if (pass.type === "password") {
            pass.type = "";
            document.getElementById("coneyeToggle").className = "fa fa-eye-slash";
          } else {
            pass.type = "password";
            document.getElementById("coneyeToggle").className = "fa fa-eye";
          }
         }
         
         function togglePassword(){
          var pass = document.getElementById("password");
          if (pass.type === "password") {
            pass.type = "";
            document.getElementById("eyeToggle").className = "fa fa-eye-slash";
          } else {
            pass.type = "password";
            document.getElementById("eyeToggle").className = "fa fa-eye";
          }
         }
         
      </script>
      <script src="../../bootstrap/script.js"></script>
      <script src="../../js/script.min.js"></script>
      <script src="../../js/sendEmail.js"></script>
      <script src="../../js/lib/jquery.min.js"></script>
      <script src="../../js/back-top-top.js"></script>
      <script src="../../js/lib/bootstrap.min.js"></script>
      <script src="../../js/lib/aos.js"></script>
      <script src="../../js/change-lang.js"></script>
      <script> AOS.init();</script>
      <!-- Fim Js -->
   </body>
</html>