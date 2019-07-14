package JSON;

public class JqGridJSONObject {

	private String[] keyName;
	private String[] keyValue;

	public void putKey(String cols) {
		String[] str = cols.split(",");
		keyName = new String[str.length];
		keyValue = new String[str.length];
		for (int i = 0; i < str.length; i++) {
			keyName[i] = str[i];
			keyValue[i] = str[i];
		}
	}

	public void setOption(String ops) {
		String[] option = ops.split(",");
		for (int i = 0; i < keyValue.length; i++) {
			switch (option[i]) {
			case "0":
				keyValue[i] += "";
				break;
			case "1":
				keyValue[i] += ",\tsortable:false";
				break;
			case "2":
				keyValue[i] += "";
				break;
			}
		}
	}

	public String getValue() {
		String line = "[";
		for (String str : keyValue) {
			line += "{ name:'" + str + "'},";
		}
		line = line.substring(0, line.length() - 1);
		line += "]";
		return line;
	}

	public String getKey() {
		String keys = "[";
		for (String str : keyName) {
			keys += "\"" + str + "\",";
		}
		keys = keys.substring(0, keys.length() - 1);
		keys += "]";
		return keys;
	}
}
