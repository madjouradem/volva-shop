import 'dart:convert';

encodeString(String text) {
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  String encoded = stringToBase64.encode(text);
  return encoded;
}

decodeString(String? encoded) {
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  if (encoded == null) {
    return '';
  } else {
    String decoded = stringToBase64.decode(encoded);
    return decoded;
  }
}
