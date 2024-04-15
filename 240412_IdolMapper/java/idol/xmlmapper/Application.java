package idol.xmlmapper;

import java.util.Scanner;

public class Application {
  public static void main(String[] args) {
    IdolService idolService = new IdolService();
    IdolControlInfo idolControlInfo = new IdolControlInfo();
    Scanner scanner = new Scanner(System.in);
    do {
      System.out.println("=========== 🎤 IDOL ARCHIVE 🎵 ===========");
      System.out.println("   IDOL 기록 보관소에 오신것을 환영합니다🎶   ");
      System.out.println("=========== 🎹 ARCHIVE MENU 🎸 ===========");
      System.out.println("1. IDOL 전체 검색");
      System.out.println("2. IDOL 상세 검색");
      System.out.println("3. IDOL 신규 추가");
      System.out.println("4. IDOL 정보 수정");
      System.out.println("5. IDOL 정보 삭제");
      System.out.println("6. IDOL 히트곡 검색");
      System.out.println("7. IDOL 히트곡 추가");
      System.out.println("------------------------------------------");
      System.out.print("원하는 메뉴를 선택해주세요 : ");
      int no = scanner.nextInt();

      switch (no) {
        case 1 : idolService.selectAllIdol(); break;
        case 2 : idolService.selectIdolByInfo(idolControlInfo.inputSearchInfo()); break;
        case 3 : idolService.InsertNewIdol(idolControlInfo.inputIdolInfo()); break;
        case 4 : idolService.modifyIdol(idolControlInfo.inputModifyInfo()); break;
        case 5 : idolService.deleteIdol(idolControlInfo.inputDeleteInfo()); break;
        case 6 : idolService.selectAllHitSong(idolControlInfo.inputHitInfo()); break;
        case 7 : idolService.insertNewHitSong(idolControlInfo.inputNewHitSong()); break;
        default : return;
      }
    } while (true);


  }

}
