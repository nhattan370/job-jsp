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
@ComponentScan(basePackages = {"security", "service", "dao", "cloudinary"})
public class SecurityConfig implements WebMvcConfigurer{
	
	private final Logger log = Logger.getLogger(SecurityConfig.class.getName());
	private final CustomUserDetailsService customUserDetailsService;
	private final MyLogoutSuccessHandler myLogoutSuccessHandler;
	private final MyLoginSuccessHandler myLoginSuccessHandler;
	
	@Autowired
	public SecurityConfig(CustomUserDetailsService customUserDetailsService,
						  MyLogoutSuccessHandler myLogoutSuccessHandler, 
						  MyLoginSuccessHandler myLoginSuccessHandler) {
		this.customUserDetailsService = customUserDetailsService;
		this.myLogoutSuccessHandler = myLogoutSuccessHandler;
		this.myLoginSuccessHandler = myLoginSuccessHandler;
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		log.info(ColorExample.CYAN+"security filter chain"+ColorExample.RESET);
		http
		.csrf(csrf -> csrf.disable()) //Chỉnh lại chỗ này
		.authorizeHttpRequests(auth -> auth
				.antMatchers("/user/**").hasAuthority("USER")
				.antMatchers("/recruiter/**").hasAuthority("RECRUITER")
				.antMatchers("/admin/**").hasAuthority("ADMIN")
				.antMatchers("/auth/**").authenticated()
				.anyRequest().permitAll()
			)
        .formLogin(form -> form
                .loginPage("/login")
                .loginProcessingUrl("/verify-login") // URL mà form sẽ submit
                .usernameParameter("email")
                .passwordParameter("password")
                .successHandler(myLoginSuccessHandler)
                .failureUrl("/login?error=true")     //Tham số khi login thất bại
                .permitAll()
            )
		.logout(logout -> logout
				.logoutSuccessHandler(myLogoutSuccessHandler)
				.permitAll());
		return http.build();
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
    @Autowired
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(customUserDetailsService).passwordEncoder(passwordEncoder());
    }

}
