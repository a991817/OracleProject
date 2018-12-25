package test;

import com.dgut.Util.StringUtil;
import com.dgut.mapper.StudentMapper;
import com.dgut.po.Course;
import com.dgut.po.CourseExtend;
import com.dgut.po.Student;
import com.dgut.service.Impl.StudentService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class mytest {
    ResultSet rs = null;

    String url="jdbc:oracle:thin:@localhost:1521:orcl"; //URL地址
    String username="system";
    String password="123456";
    @Test
    public void test1(){

        String resource = "/config/Mybatis/sqlMapConfig.xml";//mybatis配置文件
        InputStream is = mytest.class.getClassLoader().getResourceAsStream(resource);//加载mybatis配置文件
        //创建sqlSession工厂
         SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(is);
        //创建sqlSession
        SqlSession session = sessionFactory.openSession();

        Student student = new Student();
        Date time= new java.sql.Date(new java.util.Date().getTime());
        student.setSname("潘晓波");
        student.setSno("5");
        student.setSpeciality("软工");
        student.setSclass("1");
        student.setSsex("男");
       // student.setSbirthday(time);
        student.setTc("6");
        session.insert("com.dgut.mapper.StudentMapper.insertStudent",student);

    }
    @Test
    public void test2(){
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");//找到oracle驱动器所在的类
            Connection connection=DriverManager.getConnection(url, username, password);
            Student student = new Student();
            Date time= new java.sql.Date(new java.util.Date().getTime());
            student.setSname("潘晓波");
            student.setSno("5");
            student.setSpeciality("软工");
            student.setSclass("1");
            student.setSsex("男");
           // student.setSbirthday(time);
            student.setTc("6");
            String sql = "insert into STUDENT (SNO,SNAME,SSEX,SBIRTHDAY,SPECIALITY,SCLASS,TC) values(?,?,?,to_date(?,'yyyy-MM-dd'),?,?,?)";
            PreparedStatement pstmt;
            pstmt = (PreparedStatement) connection.prepareStatement(sql);
            pstmt.setString(1, student.getSno());
            pstmt.setString(2, student.getSname());
            pstmt.setString(3, student.getSsex());
            pstmt.setString(4, student.getSbirthday().toString());
            pstmt.setString(5, student.getSpeciality());
            pstmt.setString(6, student.getSclass());
            pstmt.setString(7, student.getTc());
            pstmt.executeUpdate();
            pstmt.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Test
    public void deleteTest(){
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");//找到oracle驱动器所在的类
            Connection connection=DriverManager.getConnection(url, username, password);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    @Test
    public void cloneTest(){
        Course c1 = new Course();
        CourseExtend ce = new CourseExtend();
        c1.setCname("nn");
        c1.setTno("tt");
        c1.setCno("cc");
        c1.setCredit("ccc");
        ce = (CourseExtend) c1;
        System.out.println("ce");
    }
    @Test
    public void StringTest(){
        List<String> cnos = new ArrayList<String>();
        cnos.add("c2");
        cnos.add("c3");
        cnos.add("c5");
        cnos.add("c8");
        cnos.add("c9");
        cnos.add("c10");
        cnos.add("c20");
        System.out.println(StringUtil.getMaxCon(cnos));
    }
}
