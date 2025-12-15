package customValidator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.apache.commons.beanutils.BeanUtils;

import dto.UserRegisterDTO;

/*
 * public class PasswordMatchesValidator implements
 * ConstraintValidator<PasswordMatches, UserRegisterDTO> {
 * 
 * @Override public boolean isValid(UserRegisterDTO userRegisterDTO,
 * ConstraintValidatorContext context) { if (userRegisterDTO.getPassword() ==
 * null || userRegisterDTO.getConfirmPassword() == null) { return false; }
 * boolean isValid =
 * userRegisterDTO.getPassword().equals(userRegisterDTO.getConfirmPassword());
 * if (!isValid) { context.disableDefaultConstraintViolation();
 * context.buildConstraintViolationWithTemplate(context.
 * getDefaultConstraintMessageTemplate()) .addPropertyNode("confirmPassword")
 * .addConstraintViolation(); } return isValid; } }
 */
public class PasswordMatchesValidator
	implements ConstraintValidator<PasswordMatches, Object> {
	
	private String passwordField;
	private String confirmPasswordField;
	
	@Override
	public void initialize(PasswordMatches constraintAnnotation) {
		this.passwordField = constraintAnnotation.passwordField();
		this.confirmPasswordField = constraintAnnotation.confirmPasswordField();
	}
	
	@Override
	public boolean isValid(Object value, ConstraintValidatorContext context) {
		try {
		    Object password = BeanUtils.getProperty(value, passwordField);
		    Object confirmPassword = BeanUtils.getProperty(value, confirmPasswordField);
		
		    if (password == null || confirmPassword == null) {
		        return false;
		    }
		
		    boolean isValid = password.equals(confirmPassword);
		
		    if (!isValid) {
		        context.disableDefaultConstraintViolation();
		        context.buildConstraintViolationWithTemplate(
		                context.getDefaultConstraintMessageTemplate())
		               .addPropertyNode(confirmPasswordField)
		               .addConstraintViolation();
		    }
		
		    return isValid;
		} catch (Exception ex) {
		    return false;
		}
	}
}


