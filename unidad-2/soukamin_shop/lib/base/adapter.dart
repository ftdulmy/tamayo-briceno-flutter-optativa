import 'package:soukamin_shop/base/response.dart';

abstract interface class Adapter<I, O> {
  Response<O> execute(I input);
}
