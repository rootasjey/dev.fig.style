import 'package:auto_route/auto_route.dart';
import 'package:devfigstyle/router/app_router.gr.dart';
import 'package:devfigstyle/state/user.dart';

class AdminAuthGuard extends AutoRouteGuard {
  @override
  Future<bool> canNavigate(
    List<PageRouteInfo> pendingRoutes,
    StackRouter router,
  ) async {
    if (stateUser.isUserConnected && stateUser.canManageQuotes) {
      return true;
    }

    router.root.navigate(HomeRoute());
    return false;
  }
}
