import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getXDemo/helper/string_helper.dart';
import 'package:getXDemo/models/covid_model.dart';
import 'package:getXDemo/models/news_model.dart';
import 'package:getXDemo/setting/setting.dart';
import 'package:getXDemo/widget/web_view_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeController extends GetxController {
  // Khai báo biến
  final lstNews = <NewsModel>[].obs;
  final lstWorldCovid = <WorldCovid>[].obs;
  final lstCovidTotal = <CovidTotalModel>[].obs;
  final lstGridViewCovidData = <GridCovidModel>[].obs;
  final isReadFeed = true.obs;
  final txtGlobal = AppSetting.global.obs;
  final isGlobal = false.obs;
  final indexState = 0.obs;
  final linkNews = "".obs;
  final isLoading = true.obs;
  final filterType = AppSetting.filterName.obs;
  double lastOffsetSearchCountry = 0.0;
  ScrollController lstCountryController;

  @override
  void onInit() {
    fetchData();
    lstCountryController = ScrollController();
    super.onInit();
  }

  @override
  void onClose() {
    lstCountryController.dispose();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      await AppSetting.dataService.getListNews().then((value) {
        if (value.isNotEmpty) lstNews.assignAll(value);
        print(lstNews);
      }).then((value) {
        AppSetting.dataService.getListTotalCovid().then((value) {
          if (value.isNotEmpty) {
            lstCovidTotal.assignAll(value);
          }

          AppSetting.dataService
              .getlistWorldCovid(lstCovidTotal[0])
              .then((value) {
            lstWorldCovid.assignAll(value);
          });
          AppSetting.dataService
              .searchCovidModelFromList(lstCovidTotal, 'Vietnam')
              .then((value) {
            lstGridViewCovidData.assignAll(value);

            isLoading.value = false;
            filterListSearch(filterType.value);
            this.update();
          });
        });
      });
    } catch (e) {
      isLoading.value = false;
      this.update();
    }
  }

  onTapCarouse(int index) {
    showCupertinoModalBottomSheet(
      expand: true,
      context: Get.context,
      backgroundColor: Colors.transparent,
      builder: (context, scrollController) => CustomWebView(
          scrollController: scrollController, url: lstNews[index].link),
    );
  }

  onTapMenu({bool changeGlobal, String nameCountry}) async {
    isReadFeed.value = false;
    isGlobal.value = changeGlobal;

    if (isGlobal.value) {
      if (nameCountry != AppSetting.global) {
        lstGridViewCovidData.assignAll(await AppSetting.dataService
            .searchCovidModelFromList(lstCovidTotal, txtGlobal.value));
      } else {
        txtGlobal.value = nameCountry;
      }
    } else {
      lstGridViewCovidData.assignAll(await AppSetting.dataService
          .searchCovidModelFromList(lstCovidTotal, 'Vietnam'));
    }
    update();
  }

  onTapCountry(int index) async {
    lstGridViewCovidData.assignAll(await AppSetting.dataService
        .searchCovidModelFromList(
            lstCovidTotal, lstCovidTotal[index].countryText));
    txtGlobal.value = lstCovidTotal[index].countryText;
    update();
  }

  filterListSearch(String value) {
    filterType.value = value;
    update();
    switch (filterType.value) {
      case AppSetting.filterName:
        lstCovidTotal.sort((a, b) => ((a?.countryText ?? "").toLowerCase())
            .compareTo((b?.countryText ?? "").toLowerCase()));
        update();
        break;
      case AppSetting.totalRecovered:
        lstCovidTotal.sort((a, b) =>
            StringHelper.convertStringValueToInt(b?.totalRecoveredText ?? "0")
                .compareTo(StringHelper.convertStringValueToInt(
                    a?.totalRecoveredText ?? "0")));
        update();
        break;
      case AppSetting.totalDeath:
        lstCovidTotal.sort((a, b) =>
            StringHelper.convertStringValueToInt(b?.totalDeathsText ?? "0")
                .compareTo(StringHelper.convertStringValueToInt(
                    a?.totalDeathsText ?? "0")));
        update();
        break;
      case AppSetting.totalCase:
        lstCovidTotal.sort((a, b) =>
            StringHelper.convertStringValueToInt(b?.totalCasesText ?? "0")
                .compareTo(StringHelper.convertStringValueToInt(
                    a?.totalCasesText ?? "0")));
        update();
        break;
      default:
    }
  }
}
