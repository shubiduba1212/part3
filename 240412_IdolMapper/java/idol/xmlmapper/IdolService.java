package idol.xmlmapper;

import idol.common.IdolDTO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

import static idol.common.Template.getSqlSession;

public class IdolService {
  IdolControlInfo idolControlInfo = new IdolControlInfo();

  public void selectAllIdol() {
    SqlSession sqlSession = getSqlSession();

    IdolMapper idolMapper = sqlSession.getMapper(IdolMapper.class);

    List<IdolDTO> idolList = idolMapper.selectAllIdol();

    if (idolList != null && !idolList.isEmpty()) {
      System.out.println("🎊IDOL ARCHIVE 전체 조회에 성공했습니다 : ");
      System.out.println("-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
      for (IdolDTO idol : idolList) {
        System.out.println(idol);
        System.out.println("-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
      }
    } else {
      System.out.println("IDOL ARCHIVE 전체 조회에 실패했습니다🤷‍♀️🤷‍♂️");
    }

    sqlSession.close();
  }

  public void selectIdolByInfo(Map<String, Object> searchInfo) {
    SqlSession sqlSession = getSqlSession();

    IdolMapper idolMapper = sqlSession.getMapper(IdolMapper.class);
    List<IdolDTO> idolList = idolMapper.selectIdolByInfo(searchInfo);

    if (idolList != null && idolList.size() > 0) {
      System.out.println("🎊IDOL ARCHIVE 상세 조회에 성공했습니다 : ");
      System.out.println("-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
      for (IdolDTO idol : idolList) {
        System.out.println(idol);
        System.out.println("-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
      }
    } else {
      System.out.println("IDOL ARCHIVE 상세 조회에 실패했습니다🤷‍♀️🤷‍♂️");
      selectIdolByInfo(idolControlInfo.inputSearchInfo());
    }
    sqlSession.close();
  }

  public void InsertNewIdol(Map<String, Object> newIdolInfo) {
    SqlSession sqlSession = getSqlSession();

    IdolMapper idolMapper = sqlSession.getMapper(IdolMapper.class);

    int result = idolMapper.insertNewIdol(newIdolInfo);

    if (result > 0) {
      System.out.println("🎊IDOL ARCHIVE 신규 추가에 성공했습니다");
      sqlSession.commit();
    } else {
      System.out.println("IDOL ARCHIVE 신규 추가에 실패했습니다🤷‍♀️🤷‍♂️");
      sqlSession.rollback();
    }
    sqlSession.close();
  }

  public void modifyIdol(Map<String, Object> modifyInfo) {
    SqlSession sqlSession = getSqlSession();

    IdolMapper idolMapper = sqlSession.getMapper(IdolMapper.class);

    int result = idolMapper.modifyIdol(modifyInfo);

    if (result > 0) {
      System.out.println("🎊IDOL ARCHIVE 정보 업데이트에 성공했습니다");
      sqlSession.commit();
    } else {
      System.out.println("IDOL ARCHIVE 정보 업데이트에 실패했습니다🤷‍♀️🤷‍♂️");
      sqlSession.rollback();
    }
    sqlSession.close();
  }

  public void deleteIdol(Map<String, Object> deleteInfo) {
    SqlSession sqlSession = getSqlSession();

    IdolMapper idolMapper = sqlSession.getMapper(IdolMapper.class);

    int result = idolMapper.deleteIdol(deleteInfo);

    if (result > 0) {
      System.out.println("🎊IDOL ARCHIVE 정보 삭제에 성공했습니다");
      sqlSession.commit();
    } else {
      System.out.println("IDOL ARCHIVE 정보 삭제에 실패했습니다🤷‍♀️🤷‍♂️");
      sqlSession.rollback();
    }
    sqlSession.close();
  }
}
