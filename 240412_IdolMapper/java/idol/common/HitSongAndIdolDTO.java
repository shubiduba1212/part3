package idol.common;

public class HitSongAndIdolDTO {
  private int hitCode;
  private String hitName;
  private int groupCode;
  private String groupName;
  private String hitYear;
  private String albumName;
  private String titleYn;

  public HitSongAndIdolDTO(){}

  public HitSongAndIdolDTO(int hitCode, String hitName, int groupCode, String groupName, String hitYear, String albumName, String titleYn) {
    this.hitCode = hitCode;
    this.hitName = hitName;
    this.groupCode = groupCode;
    this.groupName = groupName;
    this.hitYear = hitYear;
    this.albumName = albumName;
    this.titleYn = titleYn;
  }

  public int getHitCode() {
    return hitCode;
  }

  public void setHitCode(int hitCode) {
    this.hitCode = hitCode;
  }

  public String getHitName() {
    return hitName;
  }

  public void setHitName(String hitName) {
    this.hitName = hitName;
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

  public String getHitYear() {
    return hitYear;
  }

  public void setHitYear(String hitYear) {
    this.hitYear = hitYear;
  }

  public String getAlbumName() {
    return albumName;
  }

  public void setAlbumName(String albumName) {
    this.albumName = albumName;
  }

  public String getTitleYn() {
    return titleYn;
  }

  public void setTitleYn(String titleYn) {
    this.titleYn = titleYn;
  }

  @Override
  public String toString() {
    return "🎵 히트곡 검색 결과 : " +
            "히트코드 : " + hitCode +
            "| 히트곡명 : '" + hitName + '\'' +
            "| 그룹명 : " + groupName +
            "| 히트연도 : '" + hitYear + '\'' +
            "| 앨범명 : '" + albumName + '\'' +
            "| 타이틀곡 여부 : '" + titleYn + '\'';
  }
}
