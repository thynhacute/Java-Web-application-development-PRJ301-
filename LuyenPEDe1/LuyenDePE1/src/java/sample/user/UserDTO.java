package sample.user;

public class UserDTO {

    private String userID;
    private String fullName;
    private int roleID;
    private String password;
    private String address;
    private String birthday;
    private String phone;
    private String email;

    public UserDTO() {
        this.userID = "";
        this.fullName = "";
        this.roleID = 0;
        this.password = "";
        this.address = "";
        this.birthday = "";
        this.phone = "";
        this.email = "";
    }

    public UserDTO(String userID, String fullName, int roleID, String password, String address, String birthday, String phone, String email) {
        this.userID = userID;
        this.fullName = fullName;
        this.roleID = roleID;
        this.password = password;
        this.address = address;
        this.birthday = birthday;
        this.phone = phone;
        this.email = email;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

   
}
