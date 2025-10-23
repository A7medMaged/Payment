# Payment

Payment is a Flutter app demonstrating a simple checkout flow integrated with Stripe for payment handling. The project includes:

- A checkout UI with cart and payment sheet flows
- A small data layer that creates Stripe PaymentIntents via the Stripe REST API using Dio
- A lightweight service layer wrapping Stripe SDK interactions
- State management with Cubit (flutter_bloc)
- Dependency injection using GetIt

This README explains how to set up, run, and troubleshoot the project locally.

## Table of contents

- Requirements
- Project structure
- Dependency injection (GetIt)
- Stripe configuration
- Common problems & troubleshooting
- How to contribute

## Requirements

- Flutter SDK (see `flutter --version`; project used Flutter 3.35.x when authored)
- Dart SDK (bundled with Flutter)
- A connected device or emulator to run the app
- Internet access for Stripe API requests


## Project structure (high level)

- `lib/main.dart` - app entry; initializes bindings, DI and Stripe publishable key
- `lib/core/utils/` - utilities and services
  - `di.dart` - GetIt setup and registrations
  - `dio_factory.dart` - a singleton Dio factory used to call Stripe REST API
  - `stripe_service.dart` - wraps HTTP calls and Stripe SDK flows
- `lib/features/checkout/` - checkout feature with data, logic, presentation
  - `data/models/` - data models (PaymentIntentRequest/Response and nested models)
  - `data/repos/` - repository interfaces and implementations that call the Stripe service
  - `logic/cubit/` - Cubit state management for payment flow
  - `presentation/views/` - UI screens and widgets (cart, payment sheet, thank you view)

## Dependency injection (GetIt)

The app uses GetIt to register a single `Dio` instance, a `StripeService`, `CheckoutRepoImpl` and `PaymentCubit`. DI is initialized by calling `setupDependencyInjection()` in `main.dart` before the app starts.

If you add new services, register them in `lib/core/utils/di.dart`.

## Stripe configuration and flow

High level:

1. The app makes a POST request to Stripe's REST API to create a PaymentIntent using Dio (server-side secret key). The response contains a `client_secret`.
2. The app calls `Stripe.instance.initPaymentSheet(...)` with that `client_secret` to initialize the native payment sheet.
3. The app calls `Stripe.instance.presentPaymentSheet()` to show the native payment UI.

Important notes:

- Stripe's PaymentIntent `amount` must be expressed in the smallest currency unit (e.g., cents for USD). Sending a decimal string like `"50.97"` will cause a 400 error. Convert to integer cents (50.97 -> 5097) before creating the PaymentIntent.
- Ensure `Stripe.publishableKey` is set (in `main.dart`) before presenting any Stripe UI.
- Call `WidgetsFlutterBinding.ensureInitialized()` before calling Stripe APIs or initializing DI.

## Common problems & troubleshooting

- Error: "No payment sheet has been initialized yet. You must call `initPaymentSheet` before `presentPaymentSheet`."

  - Cause: The app called `presentPaymentSheet()` before `initPaymentSheet()` completed or `initPaymentSheet()` failed (e.g., missing `client_secret`).
  - Fix: Ensure `initPaymentSheet` is awaited and that the PaymentIntent `client_secret` is non-empty. The code in `lib/core/utils/stripe_service.dart` now awaits initialization and throws a clear error when `client_secret` is missing.

- DioException 400 (bad response)

  - Cause: Stripe rejects the PaymentIntent creation request. Most common reason is incorrect `amount` format or invalid `currency`.
  - Fix: Send `amount` as integer in the smallest currency unit and ensure `currency` is a valid ISO currency code (lowercase). Example: `{'amount': 5097, 'currency': 'usd'}`.

- Runtime error: UnimplementedError in model `fromJson`

  - Cause: Some generated model stubs lacked implementations for `fromJson`/`toJson`.
  - Fix: The repository includes working implementations for `Tip` and `Metadata` parsing. If you see similar errors, implement tolerant parsing in the model.

- GetIt "not registered" error
  - Cause: Accessing an object from GetIt before it is registered, or using `GetIt.instance()` incorrectly.
  - Fix: Call `setupDependencyInjection()` during app startup (already done in `main.dart`) and ensure `GetIt getIt = GetIt.instance;` is used (not `GetIt.instance()`).

## Development tips

- Logging: Add `debugPrint` or log statements in `lib/core/utils/stripe_service.dart` to inspect raw Stripe responses during development.
- Tests: Consider adding model unit tests to validate `fromJson` behavior for variations of Stripe responses.
- Secrets: Never commit your Stripe secret key. Use environment variables or a safe secret management process for production.

## Contributing

1. Fork the repo
2. Create a feature branch
3. Run and test locally
4. Open a pull request with a clear description of changes



