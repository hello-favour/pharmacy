import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/services/stripepaymentservice.dart';

final stripePaymentController =
    StateNotifierProvider<StripePaymentController, bool>((ref) =>
        StripePaymentController(
            ref: ref, stripePaymentService: ref.watch(stripeServiceProvider)));

class StripePaymentController extends StateNotifier<bool> {
  final Ref _ref;
  final StripePaymentService _stripePaymentService;

  StripePaymentController(
      {required Ref ref, required StripePaymentService stripePaymentService})
      : _ref = ref,
        _stripePaymentService = stripePaymentService,
        super(false);

  Future<void> makePayment(BuildContext context, double amount) async {
    _stripePaymentService.makePayment(context, amount);
  }
}
