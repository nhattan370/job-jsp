package customValidator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import dto.UserRegisterDTO;

public class PasswordMatchesValidator implements ConstraintValidator<PasswordMatches, UserRegisterDTO> {

    @Override
    public boolean isValid(UserRegisterDTO userRegisterDTO, ConstraintValidatorContext context) {
        if (userRegisterDTO.getPassword() == null || userRegisterDTO.getConfirmPassword() == null) {
            return false;
        }
        boolean isValid = userRegisterDTO.getPassword().equals(userRegisterDTO.getConfirmPassword());
        if (!isValid) {
            context.disableDefaultConstraintViolation();
            context.buildConstraintViolationWithTemplate(context.getDefaultConstraintMessageTemplate())
                   .addPropertyNode("confirmPassword")
                   .addConstraintViolation();
        }
        return isValid;
    }
}

