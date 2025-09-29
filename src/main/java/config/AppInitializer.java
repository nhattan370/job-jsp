package config;

import java.util.logging.Logger;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import share.ColorExample;

public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
	
	private final Logger logger = Logger.getLogger(AppInitializer.class.getName());

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[]{DatabaseConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[] { WebConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}
}
