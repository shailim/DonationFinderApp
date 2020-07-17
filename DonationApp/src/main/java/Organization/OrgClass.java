package Organization;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class OrgClass {
	private String name; 
	private String address;
	private String phone; 
	private String email; 
	
	public OrgClass(String id) throws FileNotFoundException {
		File details = new File("details.txt"); 
		Scanner sc = new Scanner(details); 
		while (sc.hasNextLine()) {
			String str = sc.nextLine(); 
			Scanner reader = new Scanner(str); 
			reader.useDelimiter("//"); 
			if (reader.next().equals(id)) {
				name = reader.next();
				address = reader.next(); 
				phone = reader.next(); 
				email = reader.next();
				break; 
			}
			reader.close(); 
		}
		sc.close(); 
	}
	
	public String getName() {
		return name; 
	}
	
	public String getAddress() {
		return address; 
	}
	
	public String getPhone() {
		return phone; 
	}
	
	public String getEmail() {
		return email; 
	}
}
