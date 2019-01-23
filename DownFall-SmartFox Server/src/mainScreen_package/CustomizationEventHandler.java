package mainScreen_package;

import java.sql.Connection;
import java.sql.SQLException;

import com.smartfoxserver.v2.db.IDBManager;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSArray;
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
		String username = params.getUtfString("username");
		int avatar_id = params.getInt("id_avatar");
		
		
		try {
			trace("I'm entered in the first try catch of my code to retruns my invenctory");
			/*
			 * Prendiamo la classica connessione da db per poter eseguire le query
			 */
			connection = dbmanager.getConnection();
			/*
			 * pattern per chiamare una query restituendo l'array di oggetto al client
			 */
			ISFSArray arr = dbmanager.executeQuery("SELECT QUALCOSA FROM QUALCOSA where username = ? "
					+ "and id_avatar = ? ", new Object[] {username, avatar_id});
			
			if(arr.size() > 0) {
				  SFSObject result = new SFSObject();
				  result.putSFSArray("success", arr);
				  send("Inventory", result, user);
			}
			else{
			      SFSObject result2 = new SFSObject();
				  result2.putUtfString("nosuccess", "The users doesn't have no items in his Inventory");
				  send("Inventory", result2, user);
			}
			
			
			
			
			
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
