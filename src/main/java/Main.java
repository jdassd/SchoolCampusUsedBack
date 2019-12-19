import com.dao.UserDao;
import com.domain.User;
import com.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;
import java.util.List;

public class Main {
    public static void main(String[] args) throws Exception{
        SqlSession session = MybatisUtils.getSession();
        UserDao userDao = session.getMapper(UserDao.class);
        List<User> users = userDao.findAll();
        for (User user : users){
            System.out.println(user);
        }
        System.out.println(userDao.findOneById("qwezasd"));
        MybatisUtils.closeSession();
    }
}
