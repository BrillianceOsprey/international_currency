// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:starter_app/src/features/search/domain/cart.dart';
// import 'package:starter_app/src/features/search/provider/cart_provider.dart';
// import 'package:starter_app/src/shared/constants/app_size.dart';
// import 'package:starter_app/src/shared/utils/extensions/media_query_extension.dart';

// class CartDetailPage extends StatefulHookConsumerWidget {
//   final Cart cart;
//   const CartDetailPage({
//     super.key,
//     required this.cart,
//   });

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _CartDetailPageState();
// }

// class _CartDetailPageState extends ConsumerState<CartDetailPage> {
//   final TextEditingController quantityController = TextEditingController();

//   @override
//   void initState() {
//     quantityController.text = widget.cart.quantity.toString();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text('Cart Detail Page'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(
//           Sizes.p16,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (widget.cart.product.imageUrl.isEmpty)
//               Container(
//                 decoration: const BoxDecoration(
//                   color: Color(0xFFD9D9D9),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(10),
//                   ),
//                 ),
//                 child: SizedBox(
//                   height: context.screenHeight * 0.15,
//                   child: Center(
//                     child: Icon(
//                       Icons.broken_image,
//                       size: 80,
//                       color: Colors.grey.shade500,
//                     ),
//                   ),
//                 ),
//               ),
//             if (widget.cart.product.imageUrl.isNotEmpty)
//               Image.network(
//                 widget.cart.product.imageUrl,
//                 height: 200,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             const SizedBox(
//               height: Sizes.p16,
//             ),
//             Text(
//               widget.cart.product.productName,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             gapH8,
//             Text(
//               'ERP Code: ${widget.cart.product.erpCode}',
//             ),
//             gapH8,
//             Text(
//               'Price: ${widget.cart.product.price} MMK',
//             ),
//             gapH8,
//             Text(
//               'Quantity: ${widget.cart.quantity}',
//             ),
//             gapH12,
//             Row(
//               children: [
//                 const Text('Quantity: '),
//                 SizedBox(
//                   width: 50,
//                   child: TextField(
//                     controller: quantityController,
//                     keyboardType: TextInputType.number,
//                   ),
//                 ),
//                 gapH16,
//                 Expanded(
//                   child: Column(
//                     children: [
//                       ElevatedButton(
//                         onPressed: () async {
//                           showDialog(
//                             context: context,
//                             builder: (context) {
//                               return AlertDialog.adaptive(
//                                 title: const Text('Updated'),
//                                 content: const Text(
//                                   'You successfully updated quantity',
//                                 ),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () async {
//                                       await ref
//                                           .read(cartNotifierProvider.notifier)
//                                           .updateCartData(
//                                               widget.cart,
//                                               int.parse(
//                                                   quantityController.text))
//                                           .then((value) {
//                                         Navigator.of(context).pop();
//                                         Navigator.of(context).pop();
//                                       });
//                                     },
//                                     child: const Text('Ok'),
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         },
//                         child: const Text('Update Quantity'),
//                       ),
//                       ElevatedButton(
//                         onPressed: () async {
//                           showDialog(
//                             context: context,
//                             builder: (context) {
//                               return AlertDialog.adaptive(
//                                 title: const Text('Delete'),
//                                 content: const Text(
//                                   'You deleted successfully',
//                                 ),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () async {
//                                       await ref
//                                           .read(cartNotifierProvider.notifier)
//                                           .deleteCartData(widget.cart)
//                                           .then((value) {
//                                         Navigator.of(context).pop();
//                                         Navigator.of(context).pop();
//                                       });
//                                     },
//                                     child: const Text('Ok'),
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         },
//                         child: const Text('Delete'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
