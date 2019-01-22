package mainScreen_package;

import java.sql.Connection;
import java.sql.SQLException;

import com.smartfoxserver.v2.db.IDBManager;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.extensions.BaseClientRequestHandler;

public class CustomizationEventHandler extends BaseClientRequestHandler {

	Object obj = null;
	private Connection connection;
	
	@Override
	public void handleClientRequest(User user, ISFSObject params) {
		trace("I'm asking to the server to return my Customization PNG");
		
		IDBManager dbmanager = getParentExtension().getParentZone().getDBManager();
		connection = null;
		/*
		 * qua andranno inizializzate le variabili che il client manda per tornare poi il result set
		 */
		
		try {
			trace("I'm entered in the first try catch of my code to retruns my invenctory");
			/*
			 * Prendiamo la classica connessione da db per poter eseguire le query
			 */
			connection = dbmanager.getConnection();
			
			
		}catch (SQLException e) {
			
			ISFSObject error = new SFSObject();
			error.putUtfString("error", "SQL Server Error ");
			send("errorData" , error, user);
			e.printStackTrace();
			trace(e.toString());
			
			
		} finally {
			try{
				connection.close();
			}catch (SQLException e){
	    		trace("A SQL Error occurred: " + e.getMessage());
			}
		}
	

	}
}
