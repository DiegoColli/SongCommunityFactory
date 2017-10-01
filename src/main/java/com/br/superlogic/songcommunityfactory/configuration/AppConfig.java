package com.br.superlogic.songcommunityfactory.configuration;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.util.Properties;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.exception.VelocityException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.ui.velocity.VelocityEngineFactory;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 *
 * @author Diego
 *
 * MVC Configuration class
 */
@EnableWebMvc
@Configuration
@ComponentScan(basePackages = {"com.br.superlogic.songcommunityfactory"})
@PropertySource(value = {"classpath:application.properties"})
public class AppConfig extends WebMvcConfigurerAdapter {

    private static Environment environment;

    @Autowired
    public AppConfig(Environment _environment) {
        super();
        environment = _environment;
    }

    public static String getPropertiy(String foo) {
        return AppConfig.environment.getProperty(foo);
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/uploads/**").addResourceLocations("file:" + environment.getRequiredProperty("path.uploads"));
    }

    @Bean
    public ViewResolver internalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setViewClass(JstlView.class);
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    @Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasename("messages");
        return messageSource;
    }

    @Bean(name = "gsonWithNulls")
    public Gson getGsonNulls() {
        Gson gson = new GsonBuilder().serializeNulls().create();
        return gson;
    }

    @Primary
    @Bean(name = "gsonWithoutNulls")
    public Gson getGson() {
        Gson gson = new Gson();
        return gson;
    }

    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver createMultipartResolver() {
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
        resolver.setMaxUploadSize((100 * 1024 * 1024));//100 mega
        resolver.setDefaultEncoding("utf-8");
        return resolver;
    }

    @Bean
    public JavaMailSender getMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();        
        mailSender.setHost(environment.getRequiredProperty("email.host"));
        mailSender.setPort(Integer.parseInt(environment.getRequiredProperty("email.port")));
        mailSender.setUsername(environment.getRequiredProperty("email.user"));
        mailSender.setPassword(environment.getRequiredProperty("email.password"));        
        Properties javaMailProperties = new Properties();
        javaMailProperties.put("mail.smtp.ssl.trust", environment.getRequiredProperty("email.trust"));
        javaMailProperties.put("mail.smtp.starttls.enable", "true");
        javaMailProperties.put("mail.smtp.auth", "true");
        javaMailProperties.put("mail.transport.protocol", "smtp");
        javaMailProperties.put("mail.debug", "true");        
        mailSender.setJavaMailProperties(javaMailProperties);
        return mailSender;
    }

    @Bean
    public VelocityEngine getVelocityEngine() throws VelocityException, IOException {
        VelocityEngineFactory velocityEngineFactory = new VelocityEngineFactory();
        Properties props = new Properties();
        props.put("resource.loader", "class");
        props.put("class.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        velocityEngineFactory.setVelocityProperties(props);
        return velocityEngineFactory.createVelocityEngine();
    }
}
