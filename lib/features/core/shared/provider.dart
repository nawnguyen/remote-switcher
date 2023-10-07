import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application/routes/route_notifier.dart';

final dioProvider = Provider((ref) => Dio());

final routerProvider = Provider<GoRouter>((ref) => RouterNotifier.init());
