package util;

import java.text.Normalizer;

public class SearchUtil {
	public static String standardizeKeySearch(String input) {
		if(input==null) return "";
		String key = input.trim().toLowerCase();
		key = Normalizer.normalize(key, Normalizer.Form.NFD);
        key = key.replace("đ", "d").replace("Đ", "D");
        key = key.replaceAll("[^a-z0-9\\s]", "");
        key = key.replaceAll("\\s+", " ");
		return key;
	}
}
