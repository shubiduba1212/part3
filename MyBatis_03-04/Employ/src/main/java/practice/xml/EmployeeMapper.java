package practice.xml;

import practice.common.EmployeeDTO;

import java.util.List;
import java.util.Map;

public interface EmployeeMapper {
  List<EmployeeDTO> selectAllEmployee();

  EmployeeDTO selectEmployeeByCode(Map<String, Integer> map);


  //int registEmployee(EmployeeDTO emp);

  int modifyEmployee(EmployeeDTO emp);

  int deleteEmployee(int empid);

  int registEmployee(Map<String, Object> employee);
}
