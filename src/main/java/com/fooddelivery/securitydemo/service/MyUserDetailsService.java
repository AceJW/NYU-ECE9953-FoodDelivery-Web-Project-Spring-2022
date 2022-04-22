package com.fooddelivery.securitydemo.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fooddelivery.securitydemo.connection.ApplicationDB;
import com.fooddelivery.securitydemo.entity.Users;
import com.fooddelivery.securitydemo.mapper.UsersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

@Service("userDetailsService")
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    private UsersMapper usersMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        // selectList()方法，传入条件构造器（queryWrapper）作为参数，null表示无条件
//        List<Users> userList = usersMapper.selectList(null);
//        for (Users user : userList) {
//            System.out.println(user);
//        }

        //调用usersMapper方法，根据用户名查数据库
//        QueryWrapper<Users> wrapper = new QueryWrapper<>();
//        wrapper.eq("username", username);
//        Users users = usersMapper.selectOne(wrapper);
        Users users = searchInDB(username);
        //判断
        if(users == null) {//数据库中没有此用户名，认证失败
            throw new UsernameNotFoundException("Username Does Not Exist!");
        }
        List<GrantedAuthority> auths =
                AuthorityUtils.commaSeparatedStringToAuthorityList("admins");
        //从查询数据库返回user对象，得到用户名和密码，返回;
        return new User(users.getUsername(),
                new BCryptPasswordEncoder().encode(users.getPassword()), auths);
    }

    public Users searchInDB(String username) {
        Users user = null;
        try {

            //Get the database connection
            ApplicationDB db = new ApplicationDB();
            Connection con = db.getConnection();

            //Create a SQL statement
            Statement stmt = con.createStatement();



            //Make an insert statement for the login in blanks:
            String query = "SELECT * FROM users WHERE username = ?";
            //Create a Prepared SQL statement allowing you to introduce the parameters of the query
            PreparedStatement ps = con.prepareStatement(query);

            //Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
            ps.setString(1, username);
//            ps.setString(2, password);
            //Run the query against the DB
            ResultSet rs = ps.executeQuery();

            boolean loggedIn = false;
            while(rs.next()) {
                if(!rs.wasNull()) {
                    user = new Users(rs.getInt("id"), rs.getString("username"), rs.getString("password"));
                }
                loggedIn = !rs.wasNull();
            }

            if (loggedIn) {

                con.close();

            } else {
                return null;
            }

            //Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
            con.close();

        } catch (Exception ex) {
            return null;
        }
        return user;
    }
}
