import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/home/presentation/currency_list/currency_list_controller.dart';
import 'package:starter_app/src/shared/constants/app_size.dart';
import 'package:starter_app/src/shared/utils/flutter_extension.dart';

class CurrencyListView extends StatefulHookConsumerWidget {
  const CurrencyListView({
    super.key,
  });

  @override
  ConsumerState<CurrencyListView> createState() => _CurrencyListViewState();
}

class _CurrencyListViewState extends ConsumerState<CurrencyListView> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(currencyListControllerProvider);

    const borderRadius = BorderRadius.all(Radius.circular(10));

    return switch (state) {
      AsyncData(:final value) when value.isNotEmpty => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: value.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  if (value[index].image.isEmpty)
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
                  if (value[index].image.isNotEmpty)
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: borderRadius,
                      ),
                      child: SvgPicture.network(
                        value[index].image,
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
                          value[index].name,
                          style: context.textTheme.titleMedium,
                        ),
                        Text(
                          value[index].symbol,
                          style: context.textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError(:final error, stackTrace: var _) => Center(
          child: SizedBox(
            height: 200,
            child: Center(
              child: Text(
                error.toString(),
              ),
            ),
          ),
        ),
      _ => const SizedBox(),
    };
  }
}
