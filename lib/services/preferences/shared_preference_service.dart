import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SharedPreferenceService{
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  SharedPreferenceService(){
  }

   Future<bool> setStartPreferencePage(routeName)async{
     SharedPreferences prefs = await _prefs;
    prefs.setString("prefrent_start_page", routeName);
    return prefs.commit();
   }

 Future<String> getStartPreferencePage()async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   String routeNamed= prefs.getString("prefrent_start_page")??'';
   return routeNamed;
 }

}