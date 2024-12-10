package co.kh.dev.login.model;

public class LoginVO {
    private int no;
	private String name;
	private String id;
	private String password;
	private String phone;
	private String address;
	
	public LoginVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public LoginVO(int no, String name, String id, String password, String phone, String address) {
		super();
		this.no = no;
		this.name = name;
		this.id = id;
		this.password = password;
		this.phone = phone;
		this.address = address;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		return "loginVO [no=" + no + ", name=" + name + ", id=" + id + ", password=" + password + ", phone=" + phone
				+ ", address=" + address + "]";
	}
}
