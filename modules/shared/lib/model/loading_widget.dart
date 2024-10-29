import 'package:shared/component/errorData.dart';
import 'package:shared/component/no_data.dart';
import 'package:shared/model/base_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared/k.dart' as BaseK;

typedef LoadingWidgetBuilder<T> = Widget Function(BuildContext context, T data);
typedef FutureBuilder<DataRsp> = Future Function();

class LoadingWidget<T> extends StatefulWidget {
  final FutureBuilder<DataRsp<T>>? futureBuilder;
  final LoadingWidgetBuilder<T>? builder;

  const LoadingWidget({Key? key, this.futureBuilder, this.builder})
      : super(key: key);

  @override
  LoadingWidgetState<T> createState() => LoadingWidgetState<T>();
}

class LoadingWidgetState<T> extends State<LoadingWidget<T>> {
  DataRsp<T>? _rsp;

  @override
  void initState() {
    super.initState();
    load();
  }

  load() {
    if (widget.futureBuilder == null) return;

    widget.futureBuilder!().then((rsp) {
      _rsp = rsp;
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.builder == null) {
      return const SizedBox();
    } else if (_rsp == null) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (_rsp?.success != true) {
      return Center(
        child: SingleChildScrollView(
          child: ErrorData(
            onTap: load,
            error: _rsp?.msg ?? BaseK.K.server_return_error_retry,
          ),
        ),
      );
    } else if (_rsp?.isEmpty ?? true) {
      return Center(
        child: SingleChildScrollView(
            child: EmptyWidget(
          onTap: load,
        )),
      );
    } else {
      return widget.builder!(context, _rsp!.data as T);
    }
  }
}
