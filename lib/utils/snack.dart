import 'package:devfigstyle/types/enums.dart';
import 'package:devfigstyle/utils/flash_helper.dart';
import 'package:flutter/material.dart';

Future showSnack({
  @required BuildContext context,
  @required String message,
  SnackType type = SnackType.info,
}) {
  if (type == SnackType.error) {
    return FlashHelper.errorBar(context, message: message);
  } else if (type == SnackType.success) {
    return FlashHelper.successBar(context, message: message);
  }

  return FlashHelper.infoBar(context, message: message);
}
