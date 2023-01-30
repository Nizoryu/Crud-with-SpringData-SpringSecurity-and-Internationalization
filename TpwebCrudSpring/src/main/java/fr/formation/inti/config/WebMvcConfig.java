package fr.formation.inti.config;

import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Configuration
@EnableWebMvc
public class WebMvcConfig implements WebMvcConfigurer {

	private static final Charset UTF8 = Charset.forName("UTF-8");

	// Config UTF-8 Encoding.
	@Override
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		StringHttpMessageConverter stringConverter = new StringHttpMessageConverter();
		stringConverter.setSupportedMediaTypes(Arrays.asList(new MediaType("text", "plain", UTF8)));
		converters.add(stringConverter);

		// Add other converters ...
	}

	// Static Resource Config
	// equivalents for <mvc:resources/> tags
	@Override
	   public void addResourceHandlers(ResourceHandlerRegistry registry) {
	       registry
	               .addResourceHandler("/XxKarimdu59xX/**","/IopMineur100/**","/Paul_emploi/**")
	               .addResourceLocations("/resources/css/","/resources/image/","/resources/js/");
	}

	// Equivalent for <mvc:default-servlet-handler/> tag
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	@Bean
	public SessionLocaleResolver localeResolver() {
		SessionLocaleResolver resolver = new SessionLocaleResolver();
		resolver.setDefaultLocale(new Locale("en","US"));
		return resolver;

	}
	@Bean
	public LocaleChangeInterceptor changeInterceptor() {
		LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
		interceptor.setParamName("lang");
		return interceptor;
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(changeInterceptor());
	}
}