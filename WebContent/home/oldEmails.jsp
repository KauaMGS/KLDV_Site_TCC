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
<style>
.right-gap {
  margin-right: auto;
}
</style>
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
            <th scope="col">email</th>
            <th scope="col">Mensagem</th>
          </tr>
        </thead>
        <tbody>
         <%
         if(User != null){
         String EmailWp = (String) session.getAttribute("email");
         int typeCli = (int)session.getAttribute("type");
         ResultSet resEmail = UserDao.resAllMessg(6,EmailWp,0);
         %>
         <%
          if(resEmail != null ){
        	   	  
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
        String email = resEmail.getString(3);
        out.println(email);
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
        
    	</tr>
        <%   
         }   
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
<script src="../js/sweetalert.min.js"></script>
<script src="../js/customdialogbox.js"></script>
  <script type="text/javascript">
   function exit(){
	   window.location.href="../home/signOut.jsp";
   }
    var bid, trid;
	$('#myTable tr').click(function() {
	        trid = $(this).attr('id'); // table row ID
	        if(trid != null){
	        	Swal.fire({
	        		  title: 'Deseja excluir essa mensagem?',
	        		  showDenyButton: true,
	        		  confirmButtonText: 'Sim',
	        		  denyButtonText: 'Não',
	        		  customClass: {
	        			    actions: 'my-actions',
	        			    denyButton: 'right-gap',
	        			  }
	        		}).then((result) => {
	        		  /* Read more about isConfirmed, isDenied below */
	        		  if (result.isConfirmed) {
	        		    Swal.fire('Excluida com Sucesso!', '', 'success').then(function() {
	        		        window.location = "oldEmails.jsp";
	        		    });
	        		    trid = trid.replaceAll("[^\\d.]", "");
	        		    var number = trid.replace(/\s/g, '');
	        		    $.post("deletedMessg.jsp", {
	        		    	idMsg: number
	        		    });
	        		  } else if (result.isDenied) {
	        		    Swal.fire('Mensagem não excluida', '', 'info')
	        		  }
	        		})
	        }
	 });
   
   
$(document).ready(function(){
    $('#myTable').dataTable();
    
    
});
$('#myTable').DataTable({
	"oLanguage": {
		"sSearch":"Pesquisar:",
		"sEmptyTable": "Não há E-Mails para excluir",
		"oPaginate": {
			"sPrevious": "Voltar",
			"sNext": "Proximo",
			}

	}

	});
</script>
</body>
</html>
