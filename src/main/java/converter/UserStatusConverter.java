package converter;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import enums.UserStatus;

@Converter(autoApply = true)
public class UserStatusConverter implements AttributeConverter<UserStatus, String> {

	@Override
	public String convertToDatabaseColumn(UserStatus status) {
		return status!=null ? status.getStatus() : null;
	}

	@Override
	public UserStatus convertToEntityAttribute(String dbData) {
		if(dbData==null) return null;
		for(UserStatus s : UserStatus.values()) {
			if(s.getStatus().equals(dbData)) {
				return s;
			}
		}
		throw new IllegalArgumentException("Unknown value " + dbData);
	}
	
}
