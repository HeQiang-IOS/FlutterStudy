import 'dart:io';

import 'package:basic_project/config/service_url.dart';
import 'package:dio/dio.dart';

Future request(url, {formData}) async {
  try{
    Response response;
    Dio dio = Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded") as String;
    if (formData == null ) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况-----');
    }
  } catch(e){
    return print('Error ==> ${e}');
  }
}