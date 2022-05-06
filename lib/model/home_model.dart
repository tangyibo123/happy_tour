/*
config	      Object	NonNull
bannerList	  Array	  NonNull
localNavList	Array	  NonNull
gridNav	      Object	NonNull
subNavList	  Array	  NonNull
salesBox	    Object	NonNull
 */
import 'package:happy_tour/model/config_model.dart';
import 'package:happy_tour/model/sales_box_model.dart';
import 'package:happy_tour/model/common_model.dart';
import 'package:happy_tour/model/grid_nav_model.dart';

class HomeModel {
  late final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final List<CommonModel> subNavList;
  final GridNavModel gridNav;
  final SalesBoxModel salesBox;

  HomeModel({
        required this.config,
        required this.bannerList,
        required this.localNavList,
        required this.subNavList,
        required this.gridNav,
        required this.salesBox});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    var localNavListJson = json['localNavList'] as List;
    List<CommonModel> localNavList =
    localNavListJson.map((i) => CommonModel.fromJson(i)).toList();

    var bannerListJson = json['bannerList'] as List;
    List<CommonModel> bannerList =
    bannerListJson.map((i) => CommonModel.fromJson(i)).toList();

    var subNavListJson = json['subNavList'] as List;
    List<CommonModel> subNavList =
    subNavListJson.map((i) => CommonModel.fromJson(i)).toList();

    return HomeModel(
      localNavList: localNavList,
      bannerList: bannerList,
      subNavList: subNavList,
      config: ConfigModel.fromJson(json['config']),
      gridNav: GridNavModel.fromJson(json['gridNav']),
      salesBox: SalesBoxModel.fromJson(json['salesBox']),
    );
  }
}