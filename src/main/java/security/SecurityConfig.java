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

import enums.RoleUser;
import share.ColorExample;

@Configuration
@EnableWebSecurity
@ComponentScan(basePackages = {"security", "service", "dao", "cloudinary", "emailVerify"})
public class SecurityConfig implements WebMvcConfigurer{
	
	private final Logger log = Logger.getLogger(SecurityConfig.class.getName());
	private final CustomUserDetailsService customUserDetailsService;
	private final MyLogoutSuccessHandler myLogoutSuccessHandler;
	private final MyLoginSuccessHandler myLoginSuccessHandler;
	private final MyLoginFailureHandler myLoginFailureHandler;
	private final PasswordEncoder passwordEncoder;
	
	@Autowired
	public SecurityConfig(CustomUserDetailsService customUserDetailsService,
						  MyLogoutSuccessHandler myLogoutSuccessHandler, 
						  MyLoginSuccessHandler myLoginSuccessHandler,
						  MyLoginFailureHandler myLoginFailureHandler,
						  PasswordEncoder passwordEncoder) {
		this.customUserDetailsService = customUserDetailsService;
		this.myLogoutSuccessHandler = myLogoutSuccessHandler;
		this.myLoginSuccessHandler = myLoginSuccessHandler;
		this.myLoginFailureHandler = myLoginFailureHandler;
		this.passwordEncoder = passwordEncoder;
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		log.info(ColorExample.CYAN+"security filter chain"+ColorExample.RESET);
		http
		.csrf(csrf -> csrf.disable()) //Chỉnh lại chỗ này
		.authorizeHttpRequests(auth -> auth
				.antMatchers("/user/**").hasAuthority(RoleUser.APPLICANT.name())
				.antMatchers("/recruiter/**").hasAuthority(RoleUser.RECRUITER.name())
				.antMatchers("/admin/**").hasAuthority(RoleUser.ADMIN.name())
				.antMatchers("/re-pending").hasAuthority(RoleUser.RECRUITER_PENDING.name())
				.antMatchers("/auth/**").hasAnyAuthority(RoleUser.ADMIN.name(),RoleUser.APPLICANT.name(),RoleUser.RECRUITER.name())
//				.antMatchers("/auth/**").authenticated()
				.anyRequest().permitAll()
			)
        .formLogin(form -> form
                .loginPage("/login")
                .loginProcessingUrl("/verify-login")
                .usernameParameter("email")
                .passwordParameter("password")
                .successHandler(myLoginSuccessHandler)
//                .failureUrl("/login?error=true")
                .failureHandler(myLoginFailureHandler)
                .permitAll()
            )
		.logout(logout -> logout
				.logoutSuccessHandler(myLogoutSuccessHandler)
				.permitAll());
		return http.build();
	}
	
    @Autowired
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(customUserDetailsService).passwordEncoder(passwordEncoder);
    }

}
