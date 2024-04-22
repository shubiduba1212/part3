package crud.config;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "crud")
@MapperScan(basePackages = "crud",annotationClass = Mapper.class)
public class Chap08CrudLectureSourceApplication {

  public static void main(String[] args) {
    SpringApplication.run(Chap08CrudLectureSourceApplication.class, args);
  }

}
