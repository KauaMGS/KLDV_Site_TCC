<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%
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
}

%>
 
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Kldv - HomeWp</title>
  <link rel="stylesheet" href="../home/css/reset.min.css">
<link rel='stylesheet' href='../home/css/bootstrap.css'><link rel="stylesheet" href="../home/css/style.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../fonts/font-awesome.min.css">
<link rel="icon" href="../img/fav.ico" type="image/x-icon" />
<link rel="stylesheet" href="../css/table/table.css">
</head>
<body>
<div class="main-container">
      
      <div class="bg-white">
        <h1 class="text-center" id="title_name">Lista de Emails</h1>
        <input type="hidden" id="inComment" name="inComment"/>
        <div class="table-responsive">
        <table id="myTable"  class="table text-nowrap">
        <thead class="thead-dark" align="center">
          <tr>
            <th scope="col">name</th>
            <th scope="col">Comentario</th>
            <th scope="col">EmailWp</th>
            <th scope="col">Resposta</th>
          </tr>
        </thead>
        <tbody>
         <%
         String EmailWp = (String) session.getAttribute("email");
         int typeCli = (int)session.getAttribute("type");

         ResultSet resEmail = UserDao.resAllMessg(1,EmailWp,0); 
         if(typeCli == 0){
             resEmail = UserDao.resAllMessg(4,EmailWp,0); 
             
         }
         else{
             resEmail = UserDao.resAllMessg(1,EmailWp,0); 
         }
         %>
         <%
          if(resEmail != null){
          while(resEmail.next()){
           int id = resEmail.getInt(1);
         %>
        <tr id="<%out.println(id);%>">
        <td> 
        <div align="center" class="style3"><a></a>
        <%
        String name = resEmail.getString(2);
         out.println(name);
        %>
        </div>
        </td>
        
        <td> 
        <div align="center" class="style3"><a></a>
        <%
        String comment = (String) resEmail.getString("commentTable");
        out.println(comment+"...");
        %>
        </div>
        </td>
        
        <td> 
        <div align="center" class="style3"><a></a>
        <%
        String commentd = (String) resEmail.getString(6);
        out.println(commentd);
        %>
        </div>
        </td>
        
        <td> 
        <div align="center" class="style3"><a></a>
        <%
        String commentda = (String) resEmail.getString("commentTableWp");
        out.println(commentda+"...");
        %>
        </div>
        </td>
        
    	</tr>
        <%   
         }   
          }
         %> 
        </tbody>
      </table>
      </div>
      </div>
</div>
<script src="../js/table/jquery.js"></script>
  <script src="../js/table/changetable.js"></script>
<script type="text/javascript" src="../js/table/table.js"></script>
<script type="text/javascript" src="../js/table/bootstrap.js"></script>  
  <script type="text/javascript">
   function exit(){
	   window.location.href="../home/signOut.jsp";
   }
    var bid, trid;
	$('#myTable tr').click(function() {
	        trid = $(this).attr('id'); // table row ID
	        if(trid != null){
	        window.location.href="../home/viewMessage.jsp?idMsg="+trid;
	        }
	 });
   
   
$(document).ready(function(){
    $('#myTable').dataTable();
    
    
});
<%
if(typeCli == 0){
%>
$('#myTable').DataTable({
	"oLanguage": {
		"sSearch":"Pesquisar:",
		"sEmptyTable": "Nenhum E-mail respondido ainda",
		"oPaginate": {
			"sPrevious": "Voltar",
			"sNext": "Proximo",
			}

	}

	});
<%}else{%>
$('#myTable').DataTable({
	"oLanguage": {
		"sSearch":"Pesquisar:",
		"sEmptyTable": "Não há E-Mails respondidos por você",
		"oPaginate": {
			"sPrevious": "Voltar",
			"sNext": "Proximo",
			}

	}

	});
<%}%>
</script>
</body>
</html>
