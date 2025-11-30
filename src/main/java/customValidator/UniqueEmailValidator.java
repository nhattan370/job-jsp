package customValidator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import model.User;
import security.CustomUserDetails;
import service.UserService;

@Component
public class UniqueEmailValidator implements ConstraintValidator<UniqueEmail, String> {

    @Autowired
    private UserService userService;

    //Vừa dùng để đăng kí tài khoản mới -> Sẽ không sử dụng được auth
    //Dùng đề update -> Dùng được auth
    //Check email==null và email!= rỗng thì return true. Để NotBlank xử lí
    //email=email.trim()
    //Check email đã có chưa. Nếu chưa trả về true
    //Kiểm tra đăng nhập, nếu chưa đăng nhập
    @Override
    public boolean isValid(String email, ConstraintValidatorContext context) {
    	if(email==null||email.trim().isEmpty()) return true;
    	email=email.trim();
    	
    	User existingUser = userService.findByEmail(email);
    	if(existingUser==null) return true;
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	if(auth==null || auth.getPrincipal()==null || auth.getPrincipal().equals("anonymousUser")) return false;
    		
    	CustomUserDetails details = (CustomUserDetails) auth.getPrincipal();
    	int currentUserId = details.getUser().getId();
    	
        return existingUser.getId().equals(currentUserId);
    }
}

