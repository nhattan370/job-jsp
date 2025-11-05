package converter;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import enums.ApplyPostStatus;

@Converter(autoApply = true)
public class ApplyPostStatusConverter implements AttributeConverter<ApplyPostStatus, String> {

	@Override
	public String convertToDatabaseColumn(ApplyPostStatus attribute) {
		return attribute!=null ? attribute.getDescription() : null;
	}

	@Override
	public ApplyPostStatus convertToEntityAttribute(String dbData) {
		if(dbData==null) return null;
		for(ApplyPostStatus s: ApplyPostStatus.values()) {
			if(s.getDescription().equals(dbData)) { 
				return s;
			}
		}
		throw new IllegalArgumentException("Unknown Description " + dbData);
	}

}
