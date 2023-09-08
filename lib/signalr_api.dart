// Autogenerated from Pigeon (v4.2.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import
import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

/// Transport method of the signalr connection.
enum Transport {
  auto,
  serverSentEvents,
  longPolling,
}

/// SignalR connection status
enum ConnectionStatus {
  connecting,
  connected,
  reconnecting,
  disconnected,
  connectionSlow,
  connectionError,
}

class ConnectionOptions {
  ConnectionOptions({
    this.baseUrl,
    this.hubName,
    this.queryString,
    this.hubMethods,
    this.headers,
    this.transport,
  });

  String? baseUrl;
  String? hubName;
  String? queryString;
  List<String?>? hubMethods;
  Map<String?, String?>? headers;
  Transport? transport;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['baseUrl'] = baseUrl;
    pigeonMap['hubName'] = hubName;
    pigeonMap['queryString'] = queryString;
    pigeonMap['hubMethods'] = hubMethods;
    pigeonMap['headers'] = headers;
    pigeonMap['transport'] = transport?.index;
    return pigeonMap;
  }

  static ConnectionOptions decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return ConnectionOptions(
      baseUrl: pigeonMap['baseUrl'] as String?,
      hubName: pigeonMap['hubName'] as String?,
      queryString: pigeonMap['queryString'] as String?,
      hubMethods: (pigeonMap['hubMethods'] as List<Object?>?)?.cast<String?>(),
      headers: (pigeonMap['headers'] as Map<Object?, Object?>?)
          ?.cast<String?, String?>(),
      transport: pigeonMap['transport'] != null
          ? Transport.values[pigeonMap['transport']! as int]
          : null,
    );
  }
}

class StatusChangeResult {
  StatusChangeResult({
    this.connectionId,
    this.status,
    this.errorMessage,
  });

  String? connectionId;
  ConnectionStatus? status;
  String? errorMessage;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['connectionId'] = connectionId;
    pigeonMap['status'] = status?.index;
    pigeonMap['errorMessage'] = errorMessage;
    return pigeonMap;
  }

  static StatusChangeResult decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return StatusChangeResult(
      connectionId: pigeonMap['connectionId'] as String?,
      status: pigeonMap['status'] != null
          ? ConnectionStatus.values[pigeonMap['status']! as int]
          : null,
      errorMessage: pigeonMap['errorMessage'] as String?,
    );
  }
}

class _SignalRHostApiCodec extends StandardMessageCodec {
  const _SignalRHostApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is ConnectionOptions) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return ConnectionOptions.decode(readValue(buffer)!);

      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class SignalRHostApi {
  /// Constructor for [SignalRHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  SignalRHostApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _SignalRHostApiCodec();

  Future<String> connect(ConnectionOptions arg_connectionOptions) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.SignalRHostApi.connect', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap = await channel
        .send(<Object?>[arg_connectionOptions]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else if (replyMap['result'] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyMap['result'] as String?)!;
    }
  }

  Future<String> reconnect() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.SignalRHostApi.reconnect', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(null) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else if (replyMap['result'] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyMap['result'] as String?)!;
    }
  }

  Future<void> stop() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.SignalRHostApi.stop', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(null) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<bool> isConnected() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.SignalRHostApi.isConnected', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(null) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else if (replyMap['result'] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyMap['result'] as bool?)!;
    }
  }

  Future<String> invokeMethod(
      String arg_methodName, List<String?> arg_arguments) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.SignalRHostApi.invokeMethod', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_methodName, arg_arguments])
            as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else if (replyMap['result'] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyMap['result'] as String?)!;
    }
  }
}

class _SignalRPlatformApiCodec extends StandardMessageCodec {
  const _SignalRPlatformApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is StatusChangeResult) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return StatusChangeResult.decode(readValue(buffer)!);

      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class SignalRPlatformApi {
  static const MessageCodec<Object?> codec = _SignalRPlatformApiCodec();

  Future<void> onStatusChange(StatusChangeResult statusChangeResult);
  Future<void> onNewMessage(String hubName, String message);
  static void setup(SignalRPlatformApi? api,
      {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.SignalRPlatformApi.onStatusChange', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.SignalRPlatformApi.onStatusChange was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final StatusChangeResult? arg_statusChangeResult =
              (args[0] as StatusChangeResult?);
          assert(arg_statusChangeResult != null,
              'Argument for dev.flutter.pigeon.SignalRPlatformApi.onStatusChange was null, expected non-null StatusChangeResult.');
          await api.onStatusChange(arg_statusChangeResult!);
          return;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.SignalRPlatformApi.onNewMessage', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.SignalRPlatformApi.onNewMessage was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final String? arg_hubName = (args[0] as String?);
          assert(arg_hubName != null,
              'Argument for dev.flutter.pigeon.SignalRPlatformApi.onNewMessage was null, expected non-null String.');
          final dynamic arg_message = (args[1] as dynamic);
          assert(arg_message != null,
              'Argument for dev.flutter.pigeon.SignalRPlatformApi.onNewMessage was null, expected non-null String.');
          await api.onNewMessage(arg_hubName!, arg_message!);
          return;
        });
      }
    }
  }
}
