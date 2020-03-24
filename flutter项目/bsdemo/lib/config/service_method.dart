import 'package:bsdemo/config/HttpHeaders.dart';
import "package:dio/dio.dart";
import 'dart:async';
import './servic_url.dart';

/**
 * response = await dio.post("/test", data: {"id": 12, "name": "wendu"});
 */
Future request(url,{formData})async{
  
    try{
      print('开始获取数据...............');
      Response response;
      Dio dio = new Dio();
      dio.options.headers = httpHeaders;
      if(formData==null){
          response = await dio.post(servicePath[url]);
      }else{
          print("====参数=====");
           print(formData);
          response = await dio.post(servicePath[url],data:formData);
          // print(response);
      }

      
      if(response.statusCode==200){
        return response.data;
      }else{
          throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
      }
    }catch(e){
        return print(e);
    }  
}

/**
 * response = await dio.get("/test", queryParameters: {"id": 12, "name": "wendu"});
 */
Future requestGet(url,{formData})async{
    try{
      print('开始获取数据...............');
      Response response;
      Dio dio = new Dio();
      // dio.options.headers = httpHeaders;
      if(formData==null){
          response = await dio.get(servicePath[url]);
      }else{
          response = await dio.get(servicePath[url],queryParameters:formData);

          //  print(response.data);
      }

     
      if(response.statusCode==200){
        return response.data;
      }else{
          throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
      }
    }catch(e){
        return print(e);
    }  
}
/*
request('homePageBelowConten',1).then((val){
         print(val);
      });
*/

/*
Future getHomePageContent() async{

  try{
    print('开始获取首页数据...............');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded") as String;
    var formData = {'lon':'115.02932','lat':'35.76189'};
    response = await dio.post(servicePath['homePageContext'],data:formData);
    if(response.statusCode==200){
      return response.data;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  }catch(e){
    return print('ERROR:======>${e}');
  }
  }
*/