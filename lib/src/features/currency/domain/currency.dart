// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'currency.g.dart';

@JsonSerializable()
class Currency extends Equatable {
  final String name;
  final String symbol;
  final String network;
  final String extra_id;
  final String image;
  @JsonKey(name: 'warnings_from', defaultValue: [])
  final List<String> warningsFrom;
  @JsonKey(name: 'warnings_to', defaultValue: [])
  final List<String> warningsTo;
  final String? validation_address;
  final String? validation_extra;
  final String? address_explorer;
  final String? tx_explorer;
  final String confirmations_from;
  final String? contract_address;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  const Currency({
    required this.name,
    required this.symbol,
    required this.network,
    required this.extra_id,
    required this.image,
    required this.warningsFrom,
    required this.warningsTo,
    this.validation_address,
    this.validation_extra,
    this.address_explorer,
    this.tx_explorer,
    required this.confirmations_from,
    this.contract_address,
  });

  @override
  List<Object> get props {
    return [
      name,
      symbol,
      network,
      extra_id,
      image,
      warningsFrom,
      warningsTo,
      validation_address ?? '',
      validation_extra ?? '',
      address_explorer ?? '',
      tx_explorer ?? '',
      confirmations_from,
      contract_address ?? '',
    ];
  }

  Currency copyWith({
    String? name,
    String? symbol,
    String? network,
    String? extra_id,
    String? image,
    List<String>? warningsFrom,
    List<String>? warningsTo,
    String? validation_address,
    String? validation_extra,
    String? address_explorer,
    String? tx_explorer,
    String? confirmations_from,
    String? contract_address,
  }) {
    return Currency(
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      network: network ?? this.network,
      extra_id: extra_id ?? this.extra_id,
      image: image ?? this.image,
      warningsFrom: warningsFrom ?? this.warningsFrom,
      warningsTo: warningsTo ?? this.warningsTo,
      validation_address: validation_address ?? this.validation_address,
      validation_extra: validation_extra ?? this.validation_extra,
      address_explorer: address_explorer ?? this.address_explorer,
      tx_explorer: tx_explorer ?? this.tx_explorer,
      confirmations_from: confirmations_from ?? this.confirmations_from,
      contract_address: contract_address ?? this.contract_address,
    );
  }

  @override
  bool get stringify => true;
}
