package Model.bean;

public class Role {
	String role;
	int level;
	
	public Role(String role, int level) {
		this.role = role;
		this.level = level;
	}
	
	public String getRole() {
		return role;
	}
	
	public int getLevel() {
		return level;
	}
}
