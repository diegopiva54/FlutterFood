import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../../constants/api.dart';
import '../../stores/auth.store.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthStore _authStore;
  FlutterSecureStorage storage = new FlutterSecureStorage();

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);

    _checkAuth().then((bool isAuthenticated) {
      if (isAuthenticated) {
        Navigator.pushReplacementNamed(context, '/restaurants');
        return;
      }
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    _authStore = Provider.of<AuthStore>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              child: Image.asset('assets/images/FlutterFood.png'),
            ),
            Container(
              height: 30,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _checkAuth() async {
    final String token = await storage.read(key: API_TOKEN);

    if (token != null) {
      final bool isAuthenticated = await _authStore.getMe();

      return true;
    }
    // await Future.delayed(Duration(seconds: 3));
    return false;
  }
}
