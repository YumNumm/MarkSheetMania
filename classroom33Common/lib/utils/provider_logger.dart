import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ref: https://github.com/GitGud31/theme_riverpod_hive/blob/master/lib/log.dart
class ProvidersLogger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    //super.didAddProvider(provider, value, container);

    log(
      '''
    {
      "provider": "${provider.name ?? provider.runtimeType}",
      "value": "$value",
      "container: "$container"
    }''',
      name: 'didAddProvider',
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log(
      '''
    {
      "provider": "${provider.name ?? provider.runtimeType}",
      "newValue": "$newValue"
    }''',
      name: 'didUpdateProvider',
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase<dynamic> provider,
    ProviderContainer containers,
  ) {
    //super.didDisposeProvider(provider, containers);

    log(
      '''
    {
      "provider": "${provider.name ?? provider.runtimeType}",
      "containers": "$containers"
    }''',
      name: 'didDisposeProvider',
    );
  }
}
