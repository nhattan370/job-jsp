package config;

import java.util.logging.Logger;

import javax.servlet.Filter;

import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import security.SecurityConfig;
import share.ColorExample;

public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
	
	private final Logger logger = Logger.getLogger(AppInitializer.class.getName());

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[]{DatabaseConfig.class, SecurityConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[] { WebConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}
	
    @Override
    protected Filter[] getServletFilters() {
        return new Filter[] { new DelegatingFilterProxy("springSecurityFilterChain") };
    }
}
