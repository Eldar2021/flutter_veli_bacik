import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_300_400/src/page_view/one/one_page.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';

class PageScreen extends StatefulWidget {
  const PageScreen({Key? key}) : super(key: key);

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build istadi PageScreen');
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PageScreen'),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            const OnePage(),
            Container(
              color: Colors.brown,
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 50,
          child: BottomAppBar(
            color: Colors.blueAccent,
            
            child: TabBar(
              controller: controller,
              labelColor: Colors.brown,
              unselectedLabelColor: Colors.green,
              indicatorColor: Colors.amber,
              tabs: const [
                Tab(
                  icon: Icon(Icons.ac_unit),
                ),
                Tab(
                  icon: Icon(Icons.account_balance_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PolicyEx extends RetryClient {
  PolicyEx(Client inner)
      : super(
          inner,
          delay: (val) => const Duration(seconds: 2),
          when: (response) => response.statusCode == 401 ? true : false,
          onRetry: (req, res, retryCount) async {
            if (retryCount == 0 && res?.statusCode == 401) {
              var rfToken = 'RefreshToken.readToken()';
              // ignore: unnecessary_null_comparison
              if (rfToken != null) {
                Map<String, String> headers = {
                  'Content-Type': 'application/json'
                };
                final msg = jsonEncode({"token": rfToken});
                final Uri url = Uri(
                  scheme: 'ApiConst.scheme',
                  host: 'ApiConst.host',
                  port: 3000,
                  path: 'ApiConst.refreshToken',
                );
                try {
                  final _response =
                      await Client().post(url, headers: headers, body: msg);
                  if (_response.statusCode == 200) {
                    // final data = jsonDecode(_response.body);
                    // final AuthUser user = AuthUser.fromJson(data);
                    // req.headers['Authorization'] =
                    //     'Bearer ${user.accessToken.token}';
                    // await CacheToken.setToken(user.accessToken.token);
                    // await RefreshToken.setToken(user.refreshToken);
                    // debugPrint("рефреш токен жакшы иштеди!!!!");
                  } else {
                    // debugPrint("рефреш токен жакшы иштеген жок");
                    // sl.get<AuthCubit>().error();
                  }
                } catch (e) {
                  // debugPrint("рефреш токен маселе $e");
                  // sl.get<AuthCubit>().error();
                }
              } else {
                // debugPrint("рефреш токен жок");
                // sl.get<AuthCubit>().error();
              }
            } else {
              // final newToken = await CacheToken.readToken();
              // req.headers['Authorization'] = 'Bearer $newToken';
            }
          },
        );
}

class CunTxf extends TextFormField {
  CunTxf({Key? key}) : super(key: key);
}
