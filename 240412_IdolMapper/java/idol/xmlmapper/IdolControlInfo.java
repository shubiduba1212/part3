package idol.xmlmapper;

import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.InputMismatchException;
import java.util.Map;
import java.util.Scanner;

import static idol.common.Template.getSqlSession;

public class IdolControlInfo {

  // 아이돌 상세 조건 검색 입력
  public Map<String, Object> inputSearchInfo() {
    Scanner scanner = new Scanner(System.in);
    // 그룹코드 / 그룹명 / 히트곡 / 팬덤명 /
    Map<String, Object> searchInfo = new HashMap<>();

    System.out.println("================= IDOL 상세 조회 ================");
    System.out.println("              검색 조건을 선택해주세요             ");
    System.out.println("=============== IDOL 상세 검색 조건 ==============");
    System.out.println("1. 그룹코드");
    System.out.println("2. 그룹명");
    System.out.println("3. 히트곡");
    System.out.println("4. 팬덤명");
    System.out.println("------------------------------------------------");
    System.out.print("🔎 검색 조건을 선택하세요 : ");
    int searchCondition = scanner.nextInt();
    scanner.nextLine();
    System.out.print("🔎 검색 내용을 입력하세요 : ");
    String condition = scanner.nextLine();
    searchInfo.put("searchItem", condition);
    switch (searchCondition) {
      case 1 : searchInfo.put("searchCondition", "groupCode"); break;
      case 2 : searchInfo.put("searchCondition", "groupName"); break;
      case 3 : searchInfo.put("searchCondition", "hitSong"); break;
      case 4 : searchInfo.put("searchCondition", "fandumName"); break;
      default:
        System.out.println("검색 조건을 잘못 선택하셨습니다. 다시 선택해주세요");
    }

    return searchInfo;
  }

  //아이돌 신규 추가
  public Map<String, Object> inputIdolInfo() {
    Scanner scanner = new Scanner(System.in);
    SqlSession sqlSession = getSqlSession();
    IdolMapper idolMapper = sqlSession.getMapper(IdolMapper.class);

    // 1. 이미 등록되어 있는 IDOL의 경우 등록할 수 없다.
    // 2. 이미 사용중인 그룹코드는 사용할 수 없다.
    Map<String, Object> newIdolInfo = new HashMap<>();
    System.out.println("================= IDOL 신규 추가 ================");
    System.out.println("     IDOL ARCHIVE에 새로운 IDOL을 추가해주세요     ");
    System.out.println("===============================================");
    System.out.print("신규 추가할 IDOL 그룹명을 입력하세요 : ");
    String groupName = scanner.nextLine();
    System.out.print("신규 추가할 IDOL 그룹 인원 수를 입력하세요 : ");
    String groupCount = scanner.nextLine();
    System.out.print("신규 추가할 IDOL 그룹의 히트곡을 입력하세요 : ");
    String hitSong = scanner.nextLine();

    newIdolInfo.put("groupName", groupName);
    newIdolInfo.put("groupCount", groupCount);
    newIdolInfo.put("hitSong", hitSong);

    return newIdolInfo;
  }

  public Map<String, Object> inputModifyInfo() {

    // 그룹코드 변경시, 해당 그룹의 히트곡 테이블에 등록된 그룹코드도 모두 변경되어야한다.
    Scanner scanner = new Scanner(System.in);
    Map<String, Object> modifyInfo = new HashMap<>();
    System.out.println("================= IDOL 정보 업데이트 ================");
    System.out.println("    IDOL ARCHIVE에 등록된 IDOL 정보를 업데이트하세요    ");
    System.out.println("===============================================");
    System.out.print("업데이트할 IDOL 그룹명 또는 그룹코드를 입력하세요 : ");

    try{
      String updateStandard = scanner.nextLine();
      System.out.println("입력한 내용은 문자열");
      modifyInfo.put("updateStandardName", updateStandard);
    }catch (InputMismatchException ime){
      System.out.println("입력한 내용은 숫자");
      int updateStandard = scanner.nextInt();
      modifyInfo.put("updateStandardCode", updateStandard);
      scanner.nextLine();
    }
    System.out.print("업데이트할 IDOL 소속사를 입력하세요 : ");
    String entName = scanner.nextLine();

    modifyInfo.put("entName", entName);

    return modifyInfo;
  }

  public Map<String, Object> inputDeleteInfo() {
    Scanner scanner = new Scanner(System.in);
    Map<String, Object> deleteInfo = new HashMap<>();
    System.out.println("================= IDOL 정보 삭제 ================");
    System.out.println("    IDOL ARCHIVE에 등록된 IDOL 정보를 삭제합니다.   ");
    System.out.println("===============================================");
    System.out.print("삭제할 IDOL 그룹명 또는 그룹코드를 입력하세요 : ");

    try{
      String updateStandard = scanner.nextLine();
      System.out.println("입력한 내용은 문자열");
      deleteInfo.put("updateStandardName", updateStandard);
    }catch (InputMismatchException ime){
      System.out.println("입력한 내용은 숫자");
      int updateStandard = scanner.nextInt();
      deleteInfo.put("updateStandardCode", updateStandard);
      scanner.nextLine();
    }

    return deleteInfo;
  }

  public Map<String, Object> inputHitInfo() {
    Scanner scanner = new Scanner(System.in);
    // 그룹코드 / 그룹명 / 히트곡 /
    Map<String, Object> searchInfo = new HashMap<>();

    System.out.println("================= IDOL 히트콕 상세 조회 ================");
    System.out.println("                 검색 조건을 선택해주세요                ");
    System.out.println("================= IDOL 히트콕 검색 조건 ================");
    System.out.println("1. 그룹코드");
    System.out.println("2. 그룹명");
    System.out.println("3. 히트곡");
    System.out.println("-----------------------------------------------------");
    System.out.print("🔎 검색 조건을 선택하세요 : ");
    int searchCondition = scanner.nextInt();
    scanner.nextLine();
    System.out.print("🔎 검색 내용을 입력하세요 : ");
    String condition = scanner.nextLine();
    searchInfo.put("searchItem", condition);
    switch (searchCondition) {
      case 1 : searchInfo.put("searchCondition", "groupCode"); break;
      case 2 : searchInfo.put("searchCondition", "groupName"); break;
      case 3 : searchInfo.put("searchCondition", "hitSong"); break;
      default:
        System.out.println("검색 조건을 잘못 선택하셨습니다. 다시 선택해주세요");
    }

    return searchInfo;
  }

  //히트곡 신규 추가
  public Map<String, Object> inputNewHitSong() {
    Scanner scanner = new Scanner(System.in);
    //SqlSession sqlSession = getSqlSession();
    //IdolMapper idolMapper = sqlSession.getMapper(IdolMapper.class);

    // 1. 이미 등록되어 있는 히트곡의 경우 등록할 수 없다.
    Map<String, Object> newIdolInfo = new HashMap<>();
    System.out.println("================= IDOL 히트곡 신규 추가 ================");
    System.out.println("        IDOL ARCHIVE에 새로운 히트곡을 추가해주세요     ");
    System.out.println("=====================================================");
    System.out.print("히트곡을 신규 추가할 IDOL 그룹명을 입력하세요 : ");
    String groupName = scanner.nextLine();
    System.out.print("히트곡명을 입력하세요 : ");
    String hitSong = scanner.nextLine();
    System.out.print("앨범명을 입력하세요 : ");
    String albumName = scanner.nextLine();
    System.out.print("히트연도를 입력하세요 : ");
    String hitYear = scanner.nextLine();
    System.out.print("타이틀곡 여부를 입력하세요(Y/N) : ");
    String titleYn = scanner.nextLine();

    newIdolInfo.put("groupName", groupName);
    newIdolInfo.put("hitSong", hitSong);
    newIdolInfo.put("albumName", albumName);
    newIdolInfo.put("hitYear", hitYear);
    newIdolInfo.put("titleYn", titleYn);

    return newIdolInfo;
  }


}
