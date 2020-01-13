// this is the interface for our page to communicate with presenter
import 'package:flutter/material.dart';
import 'package:mvvm_builder/component_builder.dart';
import 'package:mvvm_builder_example/presenter.dart';
import 'package:mvvm_builder_example/view_model.dart';

// this is the interface to expose methods to our presenter
// such as showMessage...
class CounterPageView {

}


class MyHomePage extends StatefulWidget  {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements CounterPageView {

  @override
  Widget build(BuildContext context) {
    return MVVMPage<MyPresenter, MyViewModel>(
      presenter: MyPresenter(new MyViewModel(), this),
      // this creates your presenter here
      // ---------------------
      // the presenter expose all methods your view can interact with such as onTouchCounter...
      // the model expose all values to create our view in a dumb way
      // ---------------------
      builder: (context, presenter, model) { // ---> this build your page with viewModel and presenter available
        return Scaffold(
          appBar: AppBar(
            // ---------------------
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            // ---------------------
            title: Text(model.title),
          ),
          body:
          Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  model.counter,
                  style: Theme
                    .of(context)
                    .textTheme
                    .display1,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: presenter.incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}