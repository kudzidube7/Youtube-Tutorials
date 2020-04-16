import 'package:flutter/material.dart';
import 'package:simple_state_handling/models/dog.dart';
import 'package:simple_state_handling/services/api.dart';

enum LoadingStates { done, loading, error }

class DogNotifier with ChangeNotifier {
  final Api<Dog> _dogApi;
  DogNotifier(this._dogApi);

  Dog _dog = Dog.initial();
  Dog get dog => _dog;

  Future<void> fetchDog() async {
    try {
      _dog = await _dogApi.fetch();
      notifyListeners();
    } catch (e) {
      // You could also hold a state of loading during the fetch
      // That could also have some kind of error state which
      // We can set here
      print(e);
    }
  }
}
