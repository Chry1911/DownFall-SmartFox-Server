package mainScreen_package;

import com.smartfoxserver.v2.extensions.SFSExtension;
import com.smartfoxserver.v2.core.SFSEventType;

public class LoginExtension extends SFSExtension{

	@Override
	public void init() {
		trace("Hello everybody... this is the first extension of DownFall - The Lost City");
		trace("This Extension work to do Login Procedure from DB(SQL Server)");
		addEventHandler(SFSEventType.USER_LOGIN, LoginEventHandler.class);
	}
	
	public void onDestroy() {
		super.destroy();
	}
}
