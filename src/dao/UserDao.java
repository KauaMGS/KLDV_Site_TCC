package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;

public class UserDao {

	//Mensagem
    public static void insertMessage(String Name, String Email, String Message) {

        int r;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=GBAPP", "sa", "1234567");

			String wpRp = UserDao.sortWp();
			
            PreparedStatement ps = con.prepareStatement("insert into MessageCli(nameCli,emailCli,msgCli,statusMsg,wpResp,dateMsg) values (?,?,?,?,?,GETDATE())");
            ps.setString(1, Name);
            ps.setString(2, Email);
            ps.setString(3, Message);
            ps.setInt(4, 0);
            ps.setString(5, wpRp);

            r = ps.executeUpdate();
            if (r >= 1) {
                System.out.println("Stored in database successfully");
            } else {
                System.out.println("Failed to store in database");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public static boolean updateMessage(int idMsg, String Email, String Message) {
        boolean verif = false;
        int r;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=GBAPP", "sa", "1234567");

            PreparedStatement ps = con.prepareStatement(
            		"UPDATE MessageCli set wpResp ='"+Email+"'"+
                            ","+"msgWp='"+Message+"'"+","+"statusMsg='"+"1"+"'"+
                            "WHERE idMessageCli = '"+ idMsg + "'"
            		
            		);
            r = ps.executeUpdate();
            if (r >= 1) {
            	verif = true;
                System.out.println("Stored in database successfully");
            } else {
                System.out.println("Failed to store in database");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return verif;
    }

    public static ResultSet resAllMessg(int type,String emailWP,int idMes) {
   	 ResultSet result = null;
   	 try{
   		    int year = Calendar.getInstance().get(Calendar.YEAR);
   		    int yearOld = year + 5;
   		    
   			Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=GBAPP", "sa", "1234567");
   			PreparedStatement pst = con.prepareStatement("select idMessageCli,nameCli,emailCli,msgCli,SUBSTRING(msgCli, 0, 15) AS commentTable from MessageCli Where statusMsg = 0");
   			if(type == 0) {
   				pst = con.prepareStatement("select idMessageCli,nameCli,emailCli,msgCli,SUBSTRING(msgCli, 0, 15) AS commentTable from MessageCli Where statusMsg = 0 and wpResp = "+"'"+emailWP+"'");
   			}
   			else if(type == 1) { 
			pst = con.prepareStatement("select idMessageCli,nameCli,emailCli,msgCli,SUBSTRING(msgCli, 0, 15) AS commentTable,wpResp,SUBSTRING(msgWp, 0, 15) AS commentTableWp from MessageCli Where statusMsg = 1 and wpResp = "+"'"+emailWP+"'");
   			}
   			else if(type == 2) {
   				pst = con.prepareStatement("select idMessageCli,nameCli,emailCli,msgCli,SUBSTRING(msgCli, 0, 15) AS commentTable,msgCli from MessageCli Where idMessageCli =" +idMes+ " and statusMsg = 0");
   			}
   			else if(type == 3) {
   				pst = con.prepareStatement("select idMessageCli,nameCli,emailCli,msgCli,SUBSTRING(msgCli, 0, 15) AS commentTable,msgWp,wpResp from MessageCli Where idMessageCli =" +idMes+ " and statusMsg = 1");
   			}
   			else if(type == 4) {
   				pst = con.prepareStatement("select idMessageCli,nameCli,emailCli,msgCli,SUBSTRING(msgCli, 0, 15) AS commentTable,wpResp,SUBSTRING(msgWp, 0, 15) AS commentTableWp from MessageCli Where statusMsg = 1");
   			}
   			else if(type == 5) {
   				pst = con.prepareStatement("select idMessageCli,nameCli,emailCli,msgCli,SUBSTRING(msgCli, 0, 15) AS commentTable,wpResp,SUBSTRING(msgWp, 0, 15) AS commentTableWp from MessageCli Where statusMsg = 1");
   			}
   			else if(type == 6) {
   				pst = con.prepareStatement("select idMessageCli,nameCli,emailCli,msgCli,SUBSTRING(msgCli, 0, 15) AS commentTable,wpResp,SUBSTRING(msgWp, 0, 15) AS commentTableWp from MessageCli Where dateMsg > "+"'"+yearOld+"'");
   			}
   			
   			//isAlreadyExist = res.next(); 
   	        result = pst.executeQuery();
   	    }catch (Exception e) {
               System.out.println(e.getMessage());
           }
		return result;
   }
    
    public static void deletedMessg(String idMesg) {
      	 try{
      			Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=GBAPP", "sa", "1234567");
      			PreparedStatement pst = con.prepareStatement("delete from MessageCli where idMessageCli = ?");
      			pst.setString(1, idMesg);
      			//isAlreadyExist = res.next(); 
      	        ResultSet result = pst.executeQuery();
      	        if(result.next()) {
      	        	System.out.println("deletado");
      	        }
      	    }catch (Exception e) {
                  System.out.println(e.getMessage());
              }
      } 
    
    public static String sortWp() {
     	 String result = null; 
     	 try{
     			Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=GBAPP", "sa", "1234567");
     			PreparedStatement pst = con.prepareStatement(
     					"select TOP 1 emailWp from UserWp "+
     			        "where typeWp = 1 "+ 
     					"ORDER BY NEWID()"
     					);
     			//isAlreadyExist = res.next(); 
     	        ResultSet res = pst.executeQuery();
     	        while(res.next()) {
     	        		result = res.getString(1);
     	        }
     	    }catch (Exception e) {
                 System.out.println(e.getMessage());
             }
  		return result;
     } 
 
    //Usuario
    public static boolean searchWp(String emailWp, String passWp) {
        boolean isAlreadyExist = false;
        try {
        	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
             Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=GBAPP", "sa", "1234567");
            PreparedStatement pst = con.prepareStatement("select nameWp,emailWp,typeWp from UserWp WHERE emailWp = ? and passWp = ? and (typeWp = 0 OR typeWp=1)");
            pst.setString(1, emailWp);
            pst.setString(2, passWp);
            ResultSet res = pst.executeQuery();
            isAlreadyExist = res.next();
            if(isAlreadyExist) {
            	
            }
           
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return isAlreadyExist;
    }
    
    public static ResultSet resSearchWp(String EmailWp) {
    	 ResultSet result = null;
    	 try{
    			Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=GBAPP", "sa", "1234567");
    	        PreparedStatement pst = con.prepareStatement("select nameWp,emailWp,typeWp from UserWp WHERE emailWp = ?");
    	        pst.setString(1, EmailWp);
    	        //isAlreadyExist = res.next(); 
    	        result = pst.executeQuery();
    	    }catch (Exception e) {
                System.out.println(e.getMessage());
            }
		return result;
    }
    

}
   