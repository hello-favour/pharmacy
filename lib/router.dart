import 'package:flutter/material.dart';
import 'package:pharmacy/views/home.dart';

final loggedOutRoute =
    RouteMap(routes: {'/': (_) => MaterialPage(child: SignIn())});

final loggedInRoute =
    RouteMap(routes: {'/': (_) => MaterialPage(child: Home())});
