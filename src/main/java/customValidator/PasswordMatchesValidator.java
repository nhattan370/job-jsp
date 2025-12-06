package customValidator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import dto.UserDTO;

public class PasswordMatchesValidator implements ConstraintValidator<PasswordMatches, UserDTO> {

    @Override
    public boolean isValid(UserDTO userDTO, ConstraintValidatorContext context) {
        if (userDTO.getPassword() == null || userDTO.getConfirmPassword() == null) {
            return false;
        }
        return userDTO.getPassword().equals(userDTO.getConfirmPassword());
    }
}

