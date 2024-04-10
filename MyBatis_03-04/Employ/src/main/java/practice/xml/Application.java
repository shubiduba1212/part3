package practice.xml;

import practice.common.EmployeeDTO;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Application {

  public static void main(String[] args) {

    MenuService menuService = new MenuService();

    Scanner sc = new Scanner(System.in);
    do {
      System.out.println("=========== Employee Management System ===========");
      System.out.println("           직원 관리 시스템에 접속하셨습니다.           ");
      System.out.println("==================================================");
      System.out.println("1. 직원 전체 조회");
      System.out.println("2. 직원 상세 조회");
      System.out.println("3. 직원 신규 추가");
      System.out.println("4. 직원 정보 수정");
      System.out.println("5. 직원 정보 삭제");
      System.out.println("==================================================");
      System.out.print("메뉴를 선택해주세요 : ");
      int menuNum = sc.nextInt();

      switch (menuNum) {
        case 1 : menuService.selectAllEmployee(); break;
        case 2 : menuService.selectEmployeeByCode(inputEmpCode()); break;
        case 3 : menuService.registEmployee(inputEmpInfo()); break;
        case 4 : menuService.modifyEmployee(inputModifyCode()); break;
        case 5 : menuService.deleteEmployee(inputEmpCode()); break;
        default :
          System.out.println("메뉴를 잘못 선택하셨습니다.\n다시 선택해주세요.");
      }
    } while (true);
  }



  private static int inputEmpCode() {
    Scanner sc = new Scanner(System.in);
    System.out.print("조회하실 직원 ID를 입력하세요 : ");
    int empId = sc.nextInt();

    return empId;
  }
  private static Map<String, Object> inputEmpInfo() {
    Scanner sc = new Scanner(System.in);
    System.out.print("추가하실 직원의 이름을 입력하세요 : ");
    String name = sc.nextLine();
    System.out.print("추가하실 직원의 직원 코드를 입력하세요(6자리-7자리) : ");
    String empCode = sc.nextLine();
    System.out.print("추가하실 직원의 JOB 코드를 입력하세요(J1-7) : ");
    String jobCode = sc.nextLine();
    System.out.print("추가하실 직원의 연봉 레벨을 입력하세요(S1-6) : ");
    String salLevel = sc.nextLine();

    Map<String, Object> parameter = new HashMap<>();

    parameter.put("name", name);
    parameter.put("empCode", empCode);
    parameter.put("jobCode", jobCode);
    parameter.put("salLevel", salLevel);

    return parameter;
  }
  private static Map<String, Object> inputModifyCode() {
    Scanner sc = new Scanner(System.in);
    System.out.print("정보를 수정하실 직원의 ID를 입력하세요(200 ~ 223): ");
    int id = sc.nextInt();
    sc.nextLine();
    System.out.print("변경하실 내용을 입력하세요(이름): ");
    String name = sc.nextLine();

    Map<String, Object> parameter = new HashMap<>();

    parameter.put("id", id);
    parameter.put("name", name);

    return parameter;
  }
}
