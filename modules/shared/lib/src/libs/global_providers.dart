import 'package:shared/provider/profile_payload.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders = [
  ChangeNotifierProvider(create: (_) => ProfilePayload(), lazy: false),
];
