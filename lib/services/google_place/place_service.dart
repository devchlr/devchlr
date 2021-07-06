import 'package:google_place/google_place.dart';


class GooglePlaceService {
  var googlePlace = GooglePlace('AIzaSyAiQTUGR-d1caKdrGYAA9OT05OzMQxTZko');

  Future getPlaceSugestion(String value)async{
    List<AutocompletePrediction> predictions = [];
    List<String> descriptions=[];
    if(value.length>1){
      var result = await googlePlace.autocomplete.get(value);
      if (result != null && result.predictions != null) {
        predictions = result.predictions!;
        predictions.forEach((element) {
          descriptions.add(element.description!);
        });
        return descriptions;
      }
    }
  }
}