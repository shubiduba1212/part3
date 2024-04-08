package practice.xml;

import org.apache.ibatis.session.SqlSession;
import practice.common.EmployeeDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static practice.common.Template.getSqlSession;


public class MenuService {

  public void selectAllEmployee() {

    SqlSession sqlSession = getSqlSession();

    EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);

    List<EmployeeDTO> empList = employeeMapper.selectAllEmployee();

    if (empList != null && empList.size() > 0) {
      for (EmployeeDTO emp : empList) {
        System.out.println(emp);
      }
    } else {
      System.out.println("직원 전체 조회에 실패했습니다.");
    }

    sqlSession.close();
  }

  public void selectEmployeeByCode(int empId) {
    SqlSession sqlSession = getSqlSession();

    EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);

    Map<String, Integer> map = new HashMap<>();
    map.put("id", empId);

    EmployeeDTO emp = employeeMapper.selectEmployeeByCode(map);

    if (emp != null) {
      System.out.println(emp);
    } else {
      System.out.println("검색하신 직원 정보가 존재하지 않습니다.");
    }

    sqlSession.close();
  }

  public boolean registEmployee(Map<String, Object> employee) {

    String name = (String)employee.get("name");
    System.out.println("name = " + name);
//    String empCode = (String)employee.get("empCode");
//    String email = (String)employee.get("email");
//    int phone = (int)employee.get("phone");

    SqlSession sqlSession = getSqlSession();

    EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);

    EmployeeDTO emp = new EmployeeDTO();
    emp.setName(name);

    System.out.println("emp.name : " + emp.getName());
//    emp.setEmpCode(empCode);
//    emp.setEmail(email);
//    emp.setPhone(phone);

   int result = employeeMapper.registEmployee(emp);

    if (result > 0) {
      System.out.println("직원 추가에 성공했습니다.");
      sqlSession.commit();
    } else {
      sqlSession.rollback();
      System.out.println("직원 추가에 실패했습니다.");
    }
    sqlSession.close();
    return result > 0 ? true : false;
  }

  public boolean modifyEmployee(Map<String, Object> employee) {
    String name = (String)employee.get("name");
    System.out.println("name = " + name);
    int id = (int)employee.get("id");
//    String email = (String)employee.get("email");
//    int phone = (int)employee.get("phone");

    SqlSession sqlSession = getSqlSession();

    EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);

    EmployeeDTO emp = new EmployeeDTO();
    emp.setId(id);
    emp.setName(name);

    System.out.println("emp.name : " + emp.getName());

    int result = employeeMapper.modifyEmployee(emp);

    if (result > 0) {
      System.out.println("직원 정보 수정에 성공했습니다.");
      sqlSession.commit();
    } else {
      sqlSession.rollback();
      System.out.println("직원 정보 수정에 실패했습니다.");
    }
    sqlSession.close();
    return result > 0 ? true : false;
  }

  public boolean deleteEmployee(int empid) {
    SqlSession sqlSession = getSqlSession();
    EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);

    int result = employeeMapper.deleteEmployee(empid);

    if (result > 0) {
      System.out.println("직원 정보 삭제에 성공했습니다.");
      sqlSession.commit();
    } else {
      sqlSession.rollback();
      System.out.println("직원 정보 삭제에 실패했습니다.");
    }
    sqlSession.close();
    return result > 0 ? true : false;
  }
}
