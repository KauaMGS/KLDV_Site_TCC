<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%


if (request.getMethod().equals("POST")) {   

   String idMsg = request.getParameter("idMsg");
   
   
   UserDao.deletedMessg(idMsg);
}
  %>