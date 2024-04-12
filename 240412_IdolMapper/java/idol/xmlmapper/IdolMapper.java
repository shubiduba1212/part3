package idol.xmlmapper;

import idol.common.IdolDTO;

import java.util.List;
import java.util.Map;

public interface IdolMapper {
  List<IdolDTO> selectAllIdol();

  List<IdolDTO> selectIdolByInfo(Map<String, Object> searchInfo);

  int insertNewIdol(Map<String, Object> newIdolInfo);

  int modifyIdol(Map<String, Object> modifyInfo);

  int deleteIdol(Map<String, Object> deleteInfo);
}
