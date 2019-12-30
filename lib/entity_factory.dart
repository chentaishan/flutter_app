import 'package:flutter_app/bean/girl_entity.dart';
import 'package:flutter_app/bean/home_list_bean_entity.dart';
import 'package:flutter_app/bean/banner_bean_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "GirlEntity") {
      return GirlEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeListBeanEntity") {
      return HomeListBeanEntity.fromJson(json) as T;
    } else if (T.toString() == "BannerBeanEntity") {
      return BannerBeanEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}