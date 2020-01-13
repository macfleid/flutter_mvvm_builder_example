import 'package:mvvm_builder/mvvm_model.dart';

/// this class exetends MVVModel
/// add all the properties you want your view use for rendering
class MyViewModel extends MVVMModel {
  String title;
  String counter; // counter is a string as we want to hide type from view rendering
}
