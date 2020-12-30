import 'package:flutter/material.dart';
import 'package:getXDemo/services/dataServices.dart';

class AppSetting {
  AppSetting._();
  static DataServices dataService = DataServices();

  //Text App

  static const txtLoading = 'Loading Data...';
  static const txtVn = 'VietNam';
  static const title = 'GetX-Covid-News';
  static const global = 'World';
  static const lastUpdate = 'Update';
  static const newDeath = 'New Deaths';
  static const totalDeath = 'Total Deaths';
  static const newCase = 'New Cases';
  static const totalCase = 'Total Cases';
  static const totalRecovered = 'Total Recovered';
  static const filterName = "Name";

  // Url
  static const vnexpressUrl = 'https://vnexpress.net/rss/suc-khoe.rss';
  static const covidApi = 'https://covid-19-tracking.p.rapidapi.com/v1';

  //Image
  static const iconLoadCovid = 'assets/icon/covidload.svg';
  static const iconCountry = 'assets/icon/country.svg';
  static const icondGlobal = 'assets/icon/global.svg';
  static const iconTotalCase = 'assets/icon/iconTotalCase.svg';
  static const icontotalRecovered = 'assets/icon/total.svg';
  static const iconNewCase = 'assets/icon/newCase.svg';
  static const iconNewDeath = 'assets/icon/newDeath.svg';
  static const iconTotalDeath = 'assets/icon/totalDeath.svg';
  static const iconLastUpdate = 'assets/icon/lastUpdate.svg';

  static Color backgroundColor = Color(0xFFBFDBF7);
  static Color backgroundColor1 = Color(0xFF022B3A);
  static Color backgroundColor4 = Colors.blueAccent.withOpacity(0.8);
  static Color backgroundColor2 = Color(0xFF1F7A8C);
  static Color backgroundColor3 = Color(0xFFE1E5F2);
}
