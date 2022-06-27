import 'package:easel_example/artworks/artworks.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final gorouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.index,
      // builder: (ctx, st) => const IndexPage(),
      pageBuilder: (context, st) => MaterialPage(
        key: st.pageKey,
        child: const IndexPage(),
      ),
    ),
    GoRoute(
      path: '/pixel',
      name: RouteNames.pixel,
      // builder: (ctx, st) => const PixelPage(),
      pageBuilder: (context, st) => MaterialPage(
        key: st.pageKey,
        child: const PixelPage(),
      ),
    ),
    GoRoute(
      path: '/line',
      name: RouteNames.line,
      // builder: (ctx, st) => const LinePage(),
      pageBuilder: (context, st) => MaterialPage(
        key: st.pageKey,
        child: const LinePage(),
      ),
    ),
    GoRoute(
      path: '/${RouteNames.segment}',
      name: RouteNames.segment,
      // builder: (ctx, st) => const LinePage(),
      pageBuilder: (context, st) => MaterialPage(
        key: st.pageKey,
        child: const SegmentPage(),
      ),
    ),
    GoRoute(
      path: '/triangle',
      name: RouteNames.triangle,
      // builder: (ctx, st) => const TrianglePage(),
      pageBuilder: (context, st) => MaterialPage(
        key: st.pageKey,
        child: const TrianglePage(),
      ),
    ),
    GoRoute(
      path: '/wireFrameTri',
      name: RouteNames.wireFrameTri,
      // builder: (ctx, st) => const WireFrameTriPage(),
      pageBuilder: (context, st) => MaterialPage(
        key: st.pageKey,
        child: const WireFrameTriPage(),
      ),
    ),
    GoRoute(
      path: '/filledTri',
      name: RouteNames.filledTri,
      // builder: (ctx, st) => const FilledTriPage(),
      pageBuilder: (context, st) => MaterialPage(
        key: st.pageKey,
        child: const FilledTriPage(),
      ),
    ),
    GoRoute(
      path: '/${RouteNames.circle}',
      name: RouteNames.circle,
      // builder: (ctx, st) => const CirclePage(),
      pageBuilder: (context, st) => MaterialPage(
        key: st.pageKey,
        child: const CirclePage(),
      ),
    ),
    // GoRoute(path: ),
  ],
  urlPathStrategy: UrlPathStrategy.path,
);
