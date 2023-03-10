package fr.formation.inti.config;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
//@EnableWebSecurity = @EnableWebMVCSecurity + Extra features
@EnableWebSecurity
//@EnableGlobalMethodSecurity
//@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	private static final Logger log = LogManager.getLogger(WebSecurityConfig.class);
	@Autowired
	MyDBAuthenticationService myDBAauthenticationService;

	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		// For User in database.
		auth.userDetailsService(myDBAauthenticationService).passwordEncoder(getPasswordEncoder());

	}

	@Bean
	public BCryptPasswordEncoder getPasswordEncoder() {
		System.out.println("BCryptPasswordEncoder");
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		log.info("initialisation confi WebSecurity");
		http.csrf().disable(); 

		// The pages does not require login
		http.authorizeRequests().antMatchers("/", "/welcome", "/login", "/logout").permitAll();

		// /userInfo page requires login as USER or ADMIN.
		// If no login, it will redirect to /login page.
		http.authorizeRequests().antMatchers("/listemployee").access("hasRole('ROLE_USER')");

		// For ADMIN & SUPERADMIN
		http.authorizeRequests().antMatchers("/admin","/saveEmp","/deleteEmp","/updateEmp").access("hasAnyRole('ROLE_ADMIN', 'ROLE_SUPERADMIN')");
		
		// For  SUPERADMIN
		http.authorizeRequests().antMatchers("/userInfo").access("hasRole('ROLE_SUPERADMIN')");

		// When the user has logged in as XX.
		// But access a page that requires role YY,
		// AccessDeniedException will throw.
		http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");

		// Config for Login Form
		http.authorizeRequests().and().formLogin()//
				// Submit URL of login page.
				.loginProcessingUrl("/yahya") // Submit URL
				.loginPage("/login")//
				.defaultSuccessUrl("/welcome")//
				.failureUrl("/login?error=true")//
				.usernameParameter("email")//
				.passwordParameter("password")
				// Config for Logout Page
				.and().logout().logoutUrl("/logout").logoutSuccessUrl("/logoutSuccessful");
	}
}
