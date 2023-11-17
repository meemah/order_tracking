import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:flutter/material.dart';

import '../shared/utils/constants/app_constants.dart';
import '../shared/utils/network_helper/network_data_response.dart';

class StatusViewModel extends ChangeNotifier {
  NetworkDataResponse<String> _status = NetworkDataResponse.completed("placed");

  NetworkDataResponse<String> get status => _status;

  set status(NetworkDataResponse<String> value) {
    _status = value;
    notifyListeners();
  }

  setOrderStatus() {
    final clientOptions = ably.ClientOptions(key: AppConstants.ablyKey);
    ably.Realtime realtime = ably.Realtime(options: clientOptions);
    realtime.connection.on().listen((ably.ConnectionStateChange event) async {
      if (event.current == ably.ConnectionState.connected) {
        final channel = realtime.channels.get('order');
        var messageStream = channel.subscribe();
        messageStream.listen((ably.Message message) {
          status = NetworkDataResponse.completed(message.data.toString());
        });
      }
    });
  }
}
