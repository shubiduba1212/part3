package idol.common;

public class HitSongDTO {
  private int hitCode;
  private int groupCode;
  private String hitName;
  private String hitYear;
  private String albumName;
  private String titleYn;

  public HitSongDTO(){}

  public HitSongDTO(int hitCode, int groupCode, String hitName, String hitYear, String albumName, String titleYn) {
    this.hitCode = hitCode;
    this.groupCode = groupCode;
    this.hitName = hitName;
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

  public int getGroupCode() {
    return groupCode;
  }

  public void setGroupCode(int groupCode) {
    this.groupCode = groupCode;
  }

  public String getHitName() {
    return hitName;
  }

  public void setHitName(String hitName) {
    this.hitName = hitName;
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
            "| 히트연도 : '" + hitYear + '\'' +
            "| 앨범명 : '" + albumName + '\'' +
            "| 타이틀곡 여부 : '" + titleYn + '\'';
  }
}
