import 'package:flutter/widgets.dart';
import 'package:flutter_cart_example/widgets/shared/load_error.dart';
import 'package:flutter_cart_example/widgets/shared/loading_indicator.dart';

class DataContainer extends StatelessWidget {
  final bool loading;
  final Error error;
  final Widget child;
  final Function onRetryPressed;

  const DataContainer({
    @required this.loading,
    @required this.error,
    @required this.child,
    this.onRetryPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return LoadingIndicator(
        loadingMessage: 'Loading...',
      );
    }
    if (error != null) {
      return LoadError(
        errorMessage: error.toString(),
        onRetryPressed: this.onRetryPressed,
      );
    }
    return child;
  }
}
