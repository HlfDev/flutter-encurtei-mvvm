import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:encurtei_ly/app/features/home/home_navigator.dart';
import 'package:encurtei_ly/app/features/home/view_model/home_view_model_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ValueNotifier<HomeViewModelState> {
  final HomeNavigator navigator;
  HomeViewModel({required this.navigator}) : super(HomeInitialState());

  Future<List<Short>> getShortList() async {
    final user = FirebaseAuth.instance.currentUser;
    final _firestore = FirebaseFirestore.instance;

    final data = await _firestore.collection('users').doc(user!.uid).get();

    final List<Short> shortList =
        List<Short>.from(data['anuncios'].map((data) => Short.fromJson(data)).toList());

    return shortList;
  }
}

class Short {
  Short({required this.title});
  final String title;

  Short.fromJson(Map<String, dynamic> json) : title = json['title'];
}
