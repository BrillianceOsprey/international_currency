import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/currency/data/currency_repository.dart';
import 'package:starter_app/src/features/currency/domain/currency.dart';
import 'package:starter_app/src/shared/constants/app_size.dart';
import 'package:starter_app/src/shared/utils/flutter_extension.dart';
import 'package:starter_app/src/shared/utils/logger/logger.dart';

final currencyProvider = StateProvider<Currency?>((ref) => null);

class SearchPage extends StatefulHookConsumerWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  TextEditingController controller = TextEditingController();
  Currency? currency;
  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(10));
    final getCurrency = ref.watch(currencyRepositoryProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.inversePrimary,
        title: const Text(
          'Search',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                label: const Text('Search somthing.....'),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  borderSide: BorderSide(color: context.colorScheme.primary),
                ),
              ),
              onChanged: (value) {
                controller.text = value;
              },
              onFieldSubmitted: (value) async {
                setState(() async {
                  ref.read(currencyProvider.notifier).state =
                      await getCurrency.getCurrency(symbol: controller.text);
                  logger.t(ref.watch(currencyProvider));
                });
              },
            ),
          ),
          ref.watch(currencyProvider) == null
              ? const SizedBox(
                  child: Text('No data'),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      if (ref.watch(currencyProvider)!.image.isEmpty)
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: borderRadius,
                          ),
                          child: SizedBox(
                            height: 50,
                            child: Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 80,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                        ),
                      if (ref.watch(currencyProvider)!.image.isNotEmpty)
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: borderRadius,
                          ),
                          child: SvgPicture.network(
                            ref.watch(currencyProvider)!.image,
                            height: 30,
                            width: 30,
                          ),
                        ),
                      gapW12,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ref.watch(currencyProvider)?.name ?? '',
                              style: context.textTheme.titleMedium,
                            ),
                            Text(
                              ref.watch(currencyProvider)?.symbol ?? '',
                              style: context.textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
