package com.sierp.web.config;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.google.common.collect.Lists;
import com.sierp.web.component.AuthInterceptor;
import com.sierp.web.component.GlobalInterceptor;

/**
 * Spring MVC Configuration
 */
@Configuration
@EnableWebMvc
@EnableAspectJAutoProxy
@ComponentScan(basePackages = {"com.sierp.web.controller"}, 
	includeFilters = @Filter(value = {Controller.class, ControllerAdvice.class, Service.class}), useDefaultFilters = false)
@EnableTransactionManagement
public class WebServletConfig extends WebMvcConfigurerAdapter {

	
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/share/**").addResourceLocations("/share/").resourceChain(true);
    }
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addRedirectViewController("/", "/login.do");
	}
	
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Override
	public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
		configurer.favorPathExtension(true);
		configurer.useJaf(false);
		configurer.mediaType("json", MediaType.APPLICATION_JSON);
		configurer.mediaType("do", MediaType.TEXT_HTML);
		configurer.defaultContentType(MediaType.TEXT_HTML);
	    configurer.ignoreAcceptHeader(true);
	
	}

	@Autowired
    private GlobalInterceptor globalInterceptor;

	@Autowired
	private AuthInterceptor authInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(globalInterceptor).excludePathPatterns("/**/*.err", "/login.do");
		registry.addInterceptor(authInterceptor).excludePathPatterns("/**/*.err", "/loginProc.json");
	}

	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
		
	}
	
	
	@Bean
	public LocalValidatorFactoryBean validator(MessageSource messageSource) {
		LocalValidatorFactoryBean factory = new LocalValidatorFactoryBean();
		factory.setValidationMessageSource(messageSource);
		return factory;
	}
	

	@Bean
	public LocaleChangeInterceptor localeChangeInterceptor() {
		LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
		localeChangeInterceptor.setParamName("lang");
		return localeChangeInterceptor;
	}

	@Bean(name = "localeResolver")
	public LocaleResolver cookieLocaleResolver() {
		CookieLocaleResolver localeResolver = new CookieLocaleResolver();
		localeResolver.setDefaultLocale(new Locale("ko"));
		return localeResolver;
	}

	@Bean
    public ViewResolver contentNegotiatingViewResolver(ContentNegotiationManager manager) {
		
	    
		List<ViewResolver> viewResolvers = Lists.newArrayList();
		
		// json view 
		viewResolvers.add((String viewName, Locale locale) -> {
			return mappingJackson2JsonView();
		});
				
		// jtsl defualt view
		InternalResourceViewResolver defaultViewResolver = new InternalResourceViewResolver();
		defaultViewResolver.setPrefix("/WEB-INF/view/");
		defaultViewResolver.setSuffix(".jsp");
		defaultViewResolver.setViewClass(JstlView.class);
		viewResolvers.add(defaultViewResolver);
		
        ContentNegotiatingViewResolver contentViewResolver = new ContentNegotiatingViewResolver();
        contentViewResolver.setViewResolvers(viewResolvers);
        contentViewResolver.setContentNegotiationManager(manager);
        contentViewResolver.setOrder(0);
        return contentViewResolver;
	}

	
	@Bean 
	public MappingJackson2JsonView mappingJackson2JsonView() {
		MappingJackson2JsonView view = new MappingJackson2JsonView();
		view.setPrettyPrint(false); 
		view.setContentType(MediaType.APPLICATION_JSON_VALUE);
		return view;
	}

	
	@Bean
	public MultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver();
	}
}