package security;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import share.ColorExample;

@Configuration
@EnableWebSecurity
@ComponentScan(basePackages = {"security", "service", "dao"})
public class SecurityConfig implements WebMvcConfigurer{
	
	private final Logger log = Logger.getLogger(SecurityConfig.class.getName());
	private final CustomUserDetailsService customUserDetailsService;
	
	@Autowired
	public SecurityConfig(CustomUserDetailsService customUserDetailsService) {
		this.customUserDetailsService = customUserDetailsService;
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		log.info(ColorExample.CYAN+"security filter chain"+ColorExample.RESET);
		http
		.csrf().disable() //Chỉnh lại chỗ này
		.authorizeHttpRequests(auth -> auth
//				.requestMatchers("").authenticated()
				.anyRequest().permitAll()
			)
        .formLogin(form -> form
                .loginPage("/login")
                .loginProcessingUrl("/verify-login") // URL mà form sẽ submit
                .usernameParameter("email")
                .passwordParameter("password")
                .defaultSuccessUrl("/", true)    //Mac định khi login thành công
                .failureUrl("/login?error=true")     //Tham số khi login thất bại
                .permitAll()
            )
		.logout(logout -> logout.permitAll());
		return http.build();
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
//	@Bean
//	public UserDetailsService userDetailsService(UserService userService) {
//	    return new CustomUserDetailsService(userService);
//	}
    @Autowired
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(customUserDetailsService).passwordEncoder(passwordEncoder());
    }

}
