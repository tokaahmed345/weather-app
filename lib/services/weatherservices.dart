import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wheather/models/weathermodel.dart';

class Weatherservices {
  final Dio dio;
  final String baseurl =
      'http://api.weatherapi.com/v1'; //لان الومين والمسار ممكن يتغير كده احسن عشان لو حبيت اغيره
  final String apikey = '8aedc400106d4d1ba5b211303241008';
  Weatherservices(this.dio);
  


  // Future<WeatherModel?> getcurrentweather({required String cityname}) async {
  //   //get data from api from model
  //   // try {
  //   Response response =
  //       await dio.get('$baseurl/forecast.json?key=$apikey&q=$cityname&days=1');
  //   if (response.statusCode == 200) {
  //     // meanssuccess
  //     WeatherModel weatherdata = WeatherModel.fromjson(response);
  //   } else {
  //     final String erromessage = response.data['error']['message'];
  //     throw Exception(erromessage);
  //   }
  // WeatherModel weatherdata =
  //     WeatherModel.fromjson(response); //create object from model
  // return weatherdata;
  // } catch (e) {
  //   return null; //handel exception ممكن يحصل اكسيبشن اليوزر ممكن ينسى يدخل برامتر ريكويرد فى الكويرى او يدخل حاجه غلط فاهندل الاكسيبشن عن طريق التراى
  // }
  //}
//}

//لو حصل اكسيبشن هينفذه عادى ويدينى ريسبونس بس الريسبونس ده فيه ايرور هيروح ييجيب الكيز الى ف اوبجيكت السيرفيس مش هيلاقلى حاجه عشان الريسبونس

//بستخدم الstatuscode هو بارقام كل مجموعه بتمثل حاجه وكل رقم ف المجموعه بيمثل ابرور  معين
//غير التراى والماتش بدانا نستخدم اسيتس كود واتشيك عليه
//الديو بتهندل الاكسيبشن للستيتس ركود وتشيك ولكن استخدم اف مع الاتش تى اتى  بى
//

  Future<WeatherModel?> getcurrentweather({required String cityname}) async {
    //get data from api from model
    try {
      Response response = await dio
          .get('$baseurl/forecast.json?key=$apikey&q=$cityname&days=1');
      WeatherModel weatherdata =
          WeatherModel.fromjson(response.data); //create object from model
      return weatherdata;
    } on DioException catch (e) {
      //بهندل لو الايرور تبع الدابو او تبع الريكويست
      //فى حاله حصل ايرور اوردى الدايو بتعرفه
      final String errormessage = e.response?.data['error']['message'] ??'oops there was an error,try later'; // وبعدين اعمل اكسيس عللى الداتا الى جايه من الريسبونس الى ف ابرور يظهرها وممكن اصلا ميرجعش ريسبونس ممكن وانا بكتب امسح حاجه ف اليو ار ال  ففلى الحاله دى مش بيبقا فيه ريسبونسس   eبتحتوى على  كل الايرور الى حصل فلى الريسبونس

      throw Exception(errormessage);
    } catch (e) {
      log(e.toString()); //بيتعرض الايرور ليا لما اعمل ديباج مش هتظهر لليوزر

      throw Exception('Opps there was an error,try later');
    }
  }
}
//?تعنى  ان لو الريسبونس كان بنال  متنفذش الى بعد علامه الاستفهام   = e
//لو مش بنال  نفذلى بعد علامه الاستفهام
//لو بنال نفذلى الة بعد علامتين الاتفهام لو مش بنال هاتلى الماسدج الى ف الريسبونس
//null??"oops there is an error,try later";//لو بنال  نفذ الماسدج دى لازم عشا الفاريبول مش هيقبل نال لو محطتش علامتن الاستفهام
