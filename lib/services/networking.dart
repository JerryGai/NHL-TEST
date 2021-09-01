import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetWorking {
  Uri url;
  NetWorking(this.url);
  Future getJsonData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return convert.jsonDecode(data);
    } else {
      return {
        //return the error codes and do something later
        response.statusCode,
      };
    }
  }
}
