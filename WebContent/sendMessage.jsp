<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%


if (request.getMethod().equals("POST")) {   

   final String name = request.getParameter("FtName");
   final String email = request.getParameter("FtEmail");
   final String messg = request.getParameter("FtMsg");
   
   
   UserDao.insertMessage(name,email,messg);
}
  %>