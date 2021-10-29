import 'package:hive/hive.dart';

part 'plugin_model.g.dart';

@HiveType(typeId: 0)
class PluginModel {
  @HiveField(0)
  String icon;

   @HiveField(1)
  String name;

   @HiveField(2)
  String url;

   @HiveField(3)
  bool isCheck;

  PluginModel({required this.icon, required this.name, required this.url, this.isCheck = false});
}
