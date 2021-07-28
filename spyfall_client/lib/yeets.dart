import 'package:yeet/yeet.dart';

import 'homepage.dart';
import 'hostpage.dart';
import 'joinpage.dart';

final yeet = Yeet(
  children: [
    Yeet(
      path: '/',
      builder: (_) => HomePage(),
    ),
    Yeet(
      path: '/host/',
      builder: (_) => HostPage(),
    ),
    Yeet(
      path: '/join/',
      builder: (_) => JoinPage(),
    ),
    Yeet(
      path: ':_(.*)', //wut
      builder: (_) => HomePage(),
    ),
  ],
);
