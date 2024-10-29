import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class RoomIncomeScreen extends StatefulWidget {
  final int rid;

  const RoomIncomeScreen({super.key, required this.rid});

  @override
  _State createState() => _State();
}

class _State extends State<RoomIncomeScreen> {
  List? _data;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _load() async {
    try {
      XhrResponse response = await Xhr.postJson(
        "${System.domain}room/ca" "sh/",
        {'rid': widget.rid.toString()},
        throwOnError: true,
      );
      Map res = response.value();
      if (!mounted) return;
      setState(() {
        _data = res['data'];
      });
    } catch (e) {
      Fluttertoast.toastException(exp: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(R.string('room_income_statistics')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_data == null || _data!.isEmpty) {
      return EmptyWidget(
        onTap: _load,
      );
    }
    return ListView.builder(
      itemCount: _data!.length,
      itemExtent: 45.0,
      itemBuilder: (BuildContext context, int index) {
        Map item = _data!.elementAt(index);
        return Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: R.color.dividerColor, width: 0.0))),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "${item['date']}",
                  style: TextStyle(
                    color: R.color.thirdTextColor,
                  ),
                ),
              ),
              Text(
                "${MoneyConfig.moneyNum(Util.parseInt(item['money']), fractionDigits: 2)}${MoneyConfig.moneyName}",
                style: TextStyle(
                  color: R.color.thirdTextColor,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
