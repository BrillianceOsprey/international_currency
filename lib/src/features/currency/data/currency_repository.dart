import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_app/src/features/currency/domain/currency.dart';
import 'package:starter_app/src/shared/utils/dio_client/dio_client.dart';
import 'package:starter_app/src/shared/utils/logger/logger.dart';
part 'currency_repository.g.dart';

class CurrencyRepository {
  CurrencyRepository({
    Dio? dioClient,
  }) : _client = dioClient ??= DioClient().instance;

  final Dio _client;

  Future<List<Currency>> getAllCurrencyList() async {
    final dio = Dio();
    final response = await dio.get(
      'https://api.simpleswap.io/get_all_currencies',
      queryParameters: {
        'api_key': 'd284bb0a-fe9b-4dd0-8bb8-943e85b42fc3',
      },
    );
    List<Currency> currencyList = [];
    final responseData = response.data as List;
    logger.t(responseData);
    currencyList = responseData.map((e) => Currency.fromJson(e)).toList();

    logger.t(currencyList);

    return currencyList;
  }

  Future<Currency?> getCurrency({required String symbol}) async {
    logger.t('called getCurrency');

    // final dio = Dio();
    final response = await _client.get(
      '/get_currency',
      queryParameters: {
        'api_key': 'd284bb0a-fe9b-4dd0-8bb8-943e85b42fc3',
        'symbol': symbol,
      },
    );
    logger.t(response);

    Currency? currency;
    final responseData = response.data as Map<String, dynamic>;
    currency = Currency.fromJson(responseData);
    logger.f(responseData);
    logger.w(currency);

    return currency;
  }
}

@riverpod
CurrencyRepository currencyRepository(CurrencyRepositoryRef ref) {
  return CurrencyRepository();
}
