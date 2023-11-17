import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:flutter/material.dart';
import 'package:order_tracking/model/order_status.dart';
import 'package:order_tracking/shared/widgets/app_toast.dart';

import '../shared/utils/constants/app_constants.dart';
import '../shared/utils/network_helper/network_data_response.dart';

class StatusViewModel extends ChangeNotifier {
  NetworkDataResponse<OrderStatus> _status =
      NetworkDataResponse.completed(OrderStatus.placed);

  NetworkDataResponse<OrderStatus> get status => _status;

  set status(NetworkDataResponse<OrderStatus> value) {
    _status = value;
    notifyListeners();
  }

  String errorMessage = "Error Occured while tracking order, Try again";
  setOrderStatus() {
    final clientOptions = ably.ClientOptions(key: AppConstants.ablyKey);
    ably.Realtime realtime = ably.Realtime(options: clientOptions);
    realtime.connection.on().listen((ably.ConnectionStateChange event) async {
      if (event.current == ably.ConnectionState.connected) {
        final channel = realtime.channels.get('order');
        var messageStream = channel.subscribe();
        messageStream.listen((ably.Message message) {
          String statusMessage = message.data.toString();
          if (OrderStatus.values.toString().contains(statusMessage)) {
            status = NetworkDataResponse.completed(OrderStatus.values
                .firstWhere((element) =>
                    statusMessage.toLowerCase() == element.name.toLowerCase()));
          } else {
            var statusErrorMessage =
                "Status should be either placed,accepted,picked,transit,arrived,delivered";
            AppToast.showFlashToast(statusErrorMessage);
          }
        }).onError((e) {
          status = NetworkDataResponse.error(errorMessage);
          AppToast.showFlashToast(errorMessage);
        });
      } else if (event.current == ably.ConnectionState.disconnected ||
          event.current == ably.ConnectionState.failed) {
        status = NetworkDataResponse.error(errorMessage);
        AppToast.showFlashToast(errorMessage);
      }
    });
  }
}
