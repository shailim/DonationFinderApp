package Organization;

import java.io.File; 
import java.io.FileWriter; 
import java.io.PrintWriter;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.UUID; 

public class OrgFile {
	
	private ArrayList<OrgClass> matches = new ArrayList<OrgClass>(); 
	private String currentOrgId; 
	private ArrayList<String> currentOrgDetails = new ArrayList<String>(); 
	private ArrayList<String> currentOrgItems = new ArrayList<String>(); 
	
	public void addOrg(String name, String username, String password, String address, String phone, String email, String[] items) 
			throws FileNotFoundException, IOException {
		UUID id = UUID.randomUUID(); 
		FileWriter forUsers = new FileWriter("users.txt", true);
		FileWriter forDetails = new FileWriter("details.txt", true); 
		FileWriter forItems = new FileWriter("items.txt", true); 
		PrintWriter pw = new PrintWriter(forUsers); 
		pw.println(id + "," + username + "," + password);
		pw = new PrintWriter(forDetails); 
		pw.println(id + "//" + name + "//" + address + "//" + phone + "//" + email);
		pw = new PrintWriter(forItems); 
		pw.println(id + "," + items);

		forUsers.close(); 
		forDetails.close();
		forItems.close(); 
	}
	
	public void updateOrg(String id, String name, String address, String phone, String email, String[] items) 
			throws FileNotFoundException, IOException {
		File file = new File("details.txt");
		Scanner sc = new Scanner(file); 
		String oldContent = ""; 
		String oldLine = ""; 
		String newLine = id + "//" + name + "//" + address + "//" + phone + "//" + email; 
		while (sc.hasNextLine()) {
			String str = sc.nextLine();
			oldContent += str + System.lineSeparator(); 
			Scanner reader = new Scanner(str); 
			reader.useDelimiter("//"); 
			if (reader.next().equals(id)) {
				oldLine = str; 
			}
			reader.close(); 
		}
		String newContent = oldContent.replaceAll(oldLine, newLine); 
		FileWriter fw = new FileWriter("details.txt", false); 
		fw.write(newContent); 
		fw.close(); 
		sc.close(); 
		
		file = new File("items.txt");
		sc = new Scanner(file); 
		oldContent = ""; 
		oldLine = ""; 
		newLine = id + "," + items[0]; 
		while (sc.hasNextLine()) {
			String str = sc.nextLine();
			oldContent += str + System.lineSeparator(); 
			Scanner reader = new Scanner(str); 
			reader.useDelimiter(","); 
			if (reader.next().equals(id)) {
				oldLine = str; 
			}
			reader.close(); 
		}
		newContent = oldContent.replaceAll(oldLine, newLine); 
		fw = new FileWriter("items.txt", false); 
		fw.write(newContent);
		fw.close(); 
		sc.close(); 
	}
	
	public boolean verifyOrg(String username, String password) throws FileNotFoundException {
		File file = new File("users.txt"); 
		Scanner sc = new Scanner(file);
		while (sc.hasNextLine()) {
			String str = sc.nextLine(); 
			Scanner reader = new Scanner(str); 
			reader.useDelimiter(",");  
			currentOrgId = reader.next(); 
			if (reader.next().equals(username) && reader.next().equals(password)) {
				reader.close();
				return true; 
			}
			reader.close(); 
		}
		sc.close(); 
		return false; 
	}
	
	public String getId() {
		return currentOrgId; 
	}
	
	public ArrayList<String> getCurrentOrgDetails() throws FileNotFoundException, IOException {
		File getDetails = new File("details.txt"); 
		Scanner sc = new Scanner(getDetails); 
		while (sc.hasNextLine()) {
			String str = sc.nextLine(); 
			Scanner reader = new Scanner(str); 
			reader.useDelimiter("//"); 
			if (reader.next().equals(currentOrgId)) {
				while (reader.hasNext()) {
					currentOrgDetails.add(reader.next()) ;
				}
				break; 
				
			}
			reader.close(); 
		}
		sc.close(); 
		return currentOrgDetails; 
	}
	
	public ArrayList<String> getCurrentOrgItems() throws FileNotFoundException {
		File getItems = new File("items.txt"); 
		Scanner sc = new Scanner(getItems); 
		while (sc.hasNextLine()) {
			String str = sc.nextLine(); 
			Scanner reader = new Scanner(str); 
			reader.useDelimiter(","); 
			if (reader.next().equals(currentOrgId)) {
				while (reader.hasNext()) {
					currentOrgItems.add(reader.next()) ;
				}
				break; 
				
			}
			reader.close(); 
		}
		sc.close();
		return currentOrgItems;
	}
	
	public ArrayList<OrgClass> searchOrg(String query) throws FileNotFoundException, IOException {
		File items = new File("items.txt"); 
		Scanner sc = new Scanner(items);
		while (sc.hasNextLine()) {
			String str = sc.nextLine(); 
			Scanner reader = new Scanner(str); 
			reader.useDelimiter(","); 
			currentOrgId = reader.next(); 
			if (reader.nextLine().contains(query)) {
				matches.add(new OrgClass(currentOrgId)); 
			}
			reader.close(); 
		}
		
		sc.close(); 
		return matches; 
	}

}
