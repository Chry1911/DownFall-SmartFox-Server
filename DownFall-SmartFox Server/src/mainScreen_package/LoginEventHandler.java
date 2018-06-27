package mainScreen_package;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.smartfoxserver.bitswarm.sessions.ISession;

import com.smartfoxserver.v2.core.ISFSEvent;
import com.smartfoxserver.v2.core.SFSConstants;
import com.smartfoxserver.v2.core.SFSEventParam;
import com.smartfoxserver.v2.db.IDBManager;

//import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;

import com.smartfoxserver.v2.exceptions.SFSErrorCode;
import com.smartfoxserver.v2.exceptions.SFSErrorData;
import com.smartfoxserver.v2.exceptions.SFSException;
import com.smartfoxserver.v2.exceptions.SFSLoginException;
import com.smartfoxserver.v2.extensions.BaseServerEventHandler;




public class LoginEventHandler extends BaseServerEventHandler {
	@Override
	public void handleServerEvent(ISFSEvent event) throws SFSException {
		
		trace("I'm asking to the server to signup a user");
		// Grab parameters from client request
		String userName = (String) event.getParameter(SFSEventParam.LOGIN_NAME);
	    String cryptedPass = (String) event.getParameter(SFSEventParam.LOGIN_PASSWORD);
		ISession session = (ISession) event.getParameter(SFSEventParam.SESSION);
		trace("Username----------" + userName);
		trace("Password----------" + cryptedPass);
		trace("Session----------" + session);
		
		ISFSObject outData = (ISFSObject) event.getParameter(SFSEventParam.LOGIN_OUT_DATA);
		
		
		// Get password from DB
		IDBManager dbManager = getParentExtension().getParentZone().getDBManager();
		Connection connection = null;
	

		
		Statement stmt = null; 

		// Grab a connection from the DBManager connection pool
        try {
			connection = dbManager.getConnection();

			/*
			 * We create a string that contains our query
			 */
	    
			 String SQL = "SELECT ID_User, Username," 
			 + "Password, Email, mkoin, profile_img " 
					 + "FROM [dbo].[Downfall_users] "
			 + "where Username = '" + userName + "' or Email = '" + userName + "'";  
			 
			 /*
			  * than we create a statement from connection
			  */
	         stmt = connection.createStatement();  
	         
	         /*
	          * This call need to solve forward-only, because if you not set it, the resultset cannot scroll down
	          */
	         stmt = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
	        		    ResultSet.CONCUR_READ_ONLY);
	         
	         
		    // Execute query
		    ResultSet res = stmt.executeQuery(SQL);
		    
		    while(res.next())
			{
		    	
		    	int id_user = res.getInt("id_user");
		    	trace(id_user);

				String username = res.getString("username");
				trace(username);
				
				String email = res.getString("Email");
				trace(email);

				int mkoin = res.getInt("mkoin");
				trace(mkoin);
				
				String profile_img = res.getString("profile_img");
				
				if(profile_img == null){
					profile_img = "";
				}
				trace(profile_img);
				
				
				
				outData.putInt("id_user", id_user);
				outData.putUtfString("nome_utente", username);
				outData.putUtfString("email", email);
				outData.putInt("mkoin", mkoin);
				outData.putUtfString("profile_img", profile_img);
				outData.putUtfString(SFSConstants.NEW_LOGIN_NAME, username);

		    }
        
		   // Verify that one record was found
 			if (!res.first())
 			{
 				// This is the part that goes to the client
 				SFSErrorData errData = new SFSErrorData(SFSErrorCode.LOGIN_BAD_USERNAME);
 				errData.addParameter(userName);
                trace("username not correct error");
 				// Sends response if user gave incorrect user name
 				throw new SFSLoginException("Bad user name: " + userName, errData);
 				
 			}
 			
 			

 			String dbPword = res.getString("password");

			// Verify the secure password
			if (!getApi().checkSecurePassword(session, dbPword, cryptedPass))
			{
				trace("password not correct error");
				SFSErrorData data = new SFSErrorData(SFSErrorCode.LOGIN_BAD_PASSWORD);
				data.addParameter(userName);
				// Sends response if user gave incorrect password
				throw new SFSLoginException("Login failed for user: "  + userName, data);
			}

        }

        // User name was not found
        catch (SQLException e)
        {
        	SFSErrorData errData = new SFSErrorData(SFSErrorCode.GENERIC_ERROR);
        	errData.addParameter("SQL Error: " + e.getMessage());
        	trace("Sql server error response, print stacktrace");
        	// Sends response about mysql errors
        	throw new SFSLoginException("A SQL Error occurred: " + e.getMessage(), errData);
        }
        finally {
        	try{
        		connection.close();
        	}catch (SQLException e){
        		throw new SFSLoginException("A SQL Error occurred: " + e.getMessage());
        	}
        }

    }
	
	
}