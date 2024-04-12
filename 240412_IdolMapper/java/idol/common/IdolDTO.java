package idol.common;

public class IdolDTO {
  private int groupCode;
  private String groupName;
  private int groupCount;
  private String entName;
  private String hitSong;
  private String fandumName;
  private String debYear;
  private String disYear;
  private char disYN;

  public IdolDTO(){}

  public IdolDTO(int groupCode, String groupName, int groupCount, String entName, String hitSong, String fandumName, String debYear, String disYear, char disYN) {
    this.groupCode = groupCode;
    this.groupName = groupName;
    this.groupCount = groupCount;
    this.entName = entName;
    this.hitSong = hitSong;
    this.fandumName = fandumName;
    this.debYear = debYear;
    this.disYear = disYear;
    this.disYN = disYN;
  }

  public int getGroupCode() {
    return groupCode;
  }

  public void setGroupCode(int groupCode) {
    this.groupCode = groupCode;
  }

  public String getGroupName() {
    return groupName;
  }

  public void setGroupName(String groupName) {
    this.groupName = groupName;
  }

  public int getGroupCount() {
    return groupCount;
  }

  public void setGroupCount(int groupCount) {
    this.groupCount = groupCount;
  }

  public String getEntName() {
    return entName;
  }

  public void setEntName(String entName) {
    this.entName = entName;
  }

  public String getHitSong() {
    return hitSong;
  }

  public void setHitSong(String hitSong) {
    this.hitSong = hitSong;
  }

  public String getFandumName() {
    return fandumName;
  }

  public void setFandumName(String fandumName) {
    this.fandumName = fandumName;
  }

  public String getDevYear() {
    return debYear;
  }

  public void setDevYear(String devYear) {
    this.debYear = devYear;
  }

  public String getDisYear() {
    return disYear;
  }

  public void setDisYear(String disYear) {
    this.disYear = disYear;
  }

  public char getDisYN() {
    return disYN;
  }

  public void setDisYN(char disYN) {
    this.disYN = disYN;
  }

  @Override
  public String toString() {
    return "🎤[" +
            "No. " + groupCode +
            ", 그룹명:'" + groupName + '\'' +
            ", 인원: " + groupCount + "명" +
            ", 소속사:'" + entName + '\'' +
            ", 히트곡:'" + hitSong + '\'' +
            ", 팬덤명:'" + fandumName + '\'' +
            ", 데뷔연도:'" + debYear + "년" + '\'' +
            ", 해체연도:'" + disYear + "년" + '\'' +
            ", 해체여부: " + disYN +
            ']';
  }
}
