package user;

import java.util.UUID;

public class RandomCode {
	public static String getRandomCode(){
		 return UUID.randomUUID().toString().replace("-","");
	}

}
