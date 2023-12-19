// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      network: json['network'] as String,
      extra_id: json['extra_id'] as String,
      image: json['image'] as String,
      warningsFrom: (json['warnings_from'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      warningsTo: (json['warnings_to'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      validation_address: json['validation_address'] as String?,
      validation_extra: json['validation_extra'] as String?,
      address_explorer: json['address_explorer'] as String?,
      tx_explorer: json['tx_explorer'] as String?,
      confirmations_from: json['confirmations_from'] as String,
      contract_address: json['contract_address'] as String?,
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'name': instance.name,
      'symbol': instance.symbol,
      'network': instance.network,
      'extra_id': instance.extra_id,
      'image': instance.image,
      'warnings_from': instance.warningsFrom,
      'warnings_to': instance.warningsTo,
      'validation_address': instance.validation_address,
      'validation_extra': instance.validation_extra,
      'address_explorer': instance.address_explorer,
      'tx_explorer': instance.tx_explorer,
      'confirmations_from': instance.confirmations_from,
      'contract_address': instance.contract_address,
    };
