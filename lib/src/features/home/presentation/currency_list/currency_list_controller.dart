import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_app/src/features/currency/data/currency_repository.dart';
import 'package:starter_app/src/features/currency/domain/currency.dart';
part 'currency_list_controller.g.dart';

@riverpod
class CurrencyListController extends _$CurrencyListController {
  Future<List<Currency>> _fetchFirstCategoryData() async {
    final repository = ref.read(currencyRepositoryProvider);
    final result = await repository.getAllCurrencyList();
    return result;
  }

  @override
  FutureOr<List<Currency>> build() {
    return _fetchFirstCategoryData();
  }
}

@riverpod
class GetCurrencyController extends _$GetCurrencyController {
  Future<Currency?> _getCurrency({required String symbol}) async {
    final repository = ref.read(currencyRepositoryProvider);
    final result = await repository.getCurrency(symbol: symbol);
    return result;
  }

  @override
  FutureOr<Currency?> build({required String symbol}) {
    return _getCurrency(symbol: symbol);
  }
}
