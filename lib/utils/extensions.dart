import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

late final _dateFormat = DateFormat('dd MMM HH:mm', /*'en'*/);

String setTime(DateTime dateTime, BuildContext context) {
  // final Duration timePassed = DateTime.now().difference(dateTime);
  // final minutesDiff = timePassed.inMinutes;
  //
  // if (minutesDiff == 0) {
  //   return /*context.l10n.*/'justNow';
  // }
  //
  // if (minutesDiff < 60) {
  //   return /*context.l10n.lastTimeInMinutes(minutesDiff)*/ '$minutesDiff min ago';
  // }
  //
  // final hoursDiff = timePassed.inHours;
  // if (hoursDiff < 3) {
  //   return /*context.l10n.lastTimeInHours(hoursDiff)*/ '$hoursDiff hour ago';
  // }
  //
  final String createdAt = _dateFormat.format(dateTime);
  return createdAt;
}
