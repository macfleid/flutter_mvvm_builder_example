import 'package:mvvm_builder/presenter_builder.dart';
import 'package:mvvm_builder_example/view_model.dart';

import 'counter_page_view.dart';


// The presenter is responsible of all page business logic
// you can use this without flutter framework and test all your business logic without UI
class MyPresenter extends Presenter<MyViewModel, CounterPageView> {

  int counts = 0;

  MyPresenter(MyViewModel model, CounterPageView view) : super(model, view);

  @override
  Future onInit() async {
    this.viewModel.title = 'Flutter Demo Home Page';
    this.viewModel.counter = "$counts";
    this.refreshView(); // call this at the end if onInit takes time
  }

  @override
  Future onDestroy() {
    //TODO implement onDestroy
  }

  incrementCounter() {
    this.counts++;
    this.viewModel.counter = "$counts";
    // you can call refresh view to fully refresh your page at this point
    // else you can bind streams in your model and create Widgets with StreamBuilder
    this.refreshView();
  }
}