package JSON;

public class JqGridJSONObject {

	private String[] keyName;

	public void putKey(String cols) {
		String[] str = cols.split(",");
		keyName = new String[str.length];
		for (int i = 0; i < str.length; i++) {
			keyName[i] = str[i];
		}
	}

	public void setOption(String ops) {
		String[] option = ops.split(",");
		for (int i = 0; i < keyName.length; i++) {
			switch (option[i]) {
			case "0":
				keyName[i] += "";
				break;
			case "1":
				keyName[i] += ",\tsortable:false";
				break;
			case "2":
				keyName[i] += "";
				break;
			}
		}
	}

	public String getValue() {
		String line = "[\n";
		for (String str : keyName) {
			line += "{ name:'" + str + "'},\n";
		}
		line = line.substring(0, line.length() - 1);
		line += "\n]";
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
