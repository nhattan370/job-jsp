package customValidator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import model.Company;
import security.CustomUserDetails;
import service.CompanyService;

public class UniqueEmailCompanyValidator implements ConstraintValidator<UniqueEmailCompany, String> {
    @Autowired
    private CompanyService companyService;

    @Override
    public boolean isValid(String email, ConstraintValidatorContext context) {
    	if(email==null||email.trim().isEmpty()) return true;
    	email=email.trim();
    	
    	Company existingCompany = companyService.findByEmail(email);
    	if(existingCompany==null) return true;
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	if(auth==null || auth.getPrincipal()==null || auth.getPrincipal().equals("anonymousUser")) return false;
    		
    	CustomUserDetails details = (CustomUserDetails) auth.getPrincipal();
    	int currentCompanyId = details.getUser().getCompany().getId();
    	
        return existingCompany.getId().equals(currentCompanyId);
    }
}
