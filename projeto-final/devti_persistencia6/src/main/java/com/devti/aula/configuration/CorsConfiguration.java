package com.devti.aula.configuration;




import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;



@Configuration
@EnableWebMvc
public class CorsConfiguration implements WebMvcConfigurer {
	
	
	public void addCorsMapping(CorsRegistry registry) {
		registry.addMapping("/**").
		allowedOrigins("*").
		allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS", "HEAD", "TRACE", "CONNECT");
	}
}
