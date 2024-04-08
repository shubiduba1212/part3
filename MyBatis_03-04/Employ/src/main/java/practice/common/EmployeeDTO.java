package practice.common;

public class EmployeeDTO {
  private int id;
  private String name;
  private String empCode;
  private String email;
  private int phone;
  private String depCode;
  private String  jobCode;
  private String  salLevel;
  private int salary;
  private String bonus;
  private int managerId;
  private String hireDate;
  private String entDate;
  private char entYear;

  public EmployeeDTO(){}

  public EmployeeDTO(int id, String name, String empCode, String email, int phone, String depCode, String jobCode, String salLevel, int salary, String bonus, int managerId, String hireDate, String entDate, char entYear) {
    this.id = id;
    this.name = name;
    this.empCode = empCode;
    this.email = email;
    this.phone = phone;
    this.depCode = depCode;
    this.jobCode = jobCode;
    this.salLevel = salLevel;
    this.salary = salary;
    this.bonus = bonus;
    this.managerId = managerId;
    this.hireDate = hireDate;
    this.entDate = entDate;
    this.entYear = entYear;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getEmpCode() {
    return empCode;
  }

  public void setEmpCode(String empCode) {
    this.empCode = empCode;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public int getPhone() {
    return phone;
  }

  public void setPhone(int phone) {
    this.phone = phone;
  }

  public String getDepCode() {
    return depCode;
  }

  public void setDepCode(String depCode) {
    this.depCode = depCode;
  }

  public String getJobCode() {
    return jobCode;
  }

  public void setJobCode(String jobCode) {
    this.jobCode = jobCode;
  }

  public String getSalLevel() {
    return salLevel;
  }

  public void setSalLevel(String salLevel) {
    this.salLevel = salLevel;
  }

  public int getSalary() {
    return salary;
  }

  public void setSalary(int salary) {
    this.salary = salary;
  }

  public String getBonus() {
    return bonus;
  }

  public void setBonus(String bonus) {
    this.bonus = bonus;
  }

  public int getManagerId() {
    return managerId;
  }

  public void setManagerId(int managerId) {
    this.managerId = managerId;
  }

  public String getHireDate() {
    return hireDate;
  }

  public void setHireDate(String hireDate) {
    this.hireDate = hireDate;
  }

  public String getEntDate() {
    return entDate;
  }

  public void setEntDate(String entDate) {
    this.entDate = entDate;
  }

  public char getEntYear() {
    return entYear;
  }

  public void setEntYear(char entYear) {
    this.entYear = entYear;
  }

  @Override
  public String toString() {
    return "EmployDTO{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", empCode='" + empCode + '\'' +
            ", email='" + email + '\'' +
            ", phone=" + phone +
            ", depCode='" + depCode + '\'' +
            ", jobCode='" + jobCode + '\'' +
            ", salLevel='" + salLevel + '\'' +
            ", salary=" + salary +
            ", bonus=" + bonus +
            ", managerId=" + managerId +
            ", hireDate='" + hireDate + '\'' +
            ", entDate='" + entDate + '\'' +
            ", entYear=" + entYear +
            '}';
  }
}
