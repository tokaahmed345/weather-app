
class WeatherModel {
  String cityname;
  DateTime date;
  String? image;
  double temp;
  double maxtemp;
  double mintemp;
  String weathercondition;

  WeatherModel(
      {required this.cityname,
      required this.date,
      required this.image,
      required this.maxtemp,
      required this.mintemp,
      required this.temp,
      required this.weathercondition});



factory WeatherModel.fromjson(json){
  return WeatherModel(cityname: json["location"]["name"],
   date:  DateTime.parse(json["current"]["last_updated"]) ,
    image:json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
     maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"], 
     mintemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"], 
    temp:
    json["forecast"]["forecastday"][0]["day"]["avgtemp_c"] , 
     
     weathercondition:json["forecast"]["forecastday"][0]["day"]["condition"]["text"], 
     
      );
} 

}
