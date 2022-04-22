package com.fooddelivery.securitydemo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    //注入数据源
    @Autowired
    private DataSource dataSource;

    //配置对象
    @Bean
    public PersistentTokenRepository persistentTokenRepository() {
        JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
        // 设置数据源
        jdbcTokenRepository.setDataSource(dataSource);
        return jdbcTokenRepository;
    }

    @Autowired
    private UserDetailsService userDetailsService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws  Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(password());
    }

    @Bean
    PasswordEncoder password() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //logout
        http.logout().logoutUrl("/logout").
                logoutSuccessUrl("/login.html").permitAll();
        //配置没有权限访问的界面
        http.exceptionHandling().accessDeniedPage("/unauth.html");
        http.authorizeRequests().antMatchers("/resources/**").permitAll();
        http.authorizeRequests().antMatchers("/css/**", "/js/**", "/images/**").permitAll();

        http.formLogin()//自定义自己的登录页面
                .loginPage("/login.html")//login page
                .loginProcessingUrl("/user/login") //login process URL
                .defaultSuccessUrl("/homepage.html", true).permitAll() //登录成功之后，跳转路径
                .and().authorizeRequests()
                .antMatchers("/test/hello","/user/login","/createAccount","/createNewAccount").permitAll()//设置哪些路径可以直接访问，不用认证就访问
                .antMatchers("/test/index").hasAuthority("admins") // 哪些页面只有admins才能访问
                .anyRequest().authenticated()// 其他地址的访问均需验证权限
                .and().rememberMe().tokenRepository(persistentTokenRepository())
                .tokenValiditySeconds(10)
                .userDetailsService(userDetailsService)
                .and().csrf().disable() //关闭csrf防护
                .sessionManagement()
                // 设置同一个用户只能有一个登陆session
                .maximumSessions(1)
                .expiredUrl("/login.html");

        http.logout();


    }
    @Override
    public void configure(WebSecurity web) throws Exception {
        web
                .ignoring()
                .antMatchers("/resources/**", "/static/**", "/css/**", "/js/**", "/images/**","/vendor/**","/fonts/**");
    }
}
