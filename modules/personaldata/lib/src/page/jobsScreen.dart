import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/module/job.dart';
import 'package:shared/shared.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const JobsScreen(),
      settings: const RouteSettings(name: '/jobs'),
    ));
  }
}

class _State extends State<JobsScreen> {
  int _index = 0;
  List<JobValue>? _jobs;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    _jobs = await Job.data;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    JobValue? current = _jobs == null ? JobValue() : _jobs?[_index];
    return Scaffold(
      appBar: BaseAppBar(R.string('choose_job')),
      body: _jobs == null || _jobs?.isEmpty == true
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : Row(
              children: <Widget>[
                Expanded(
                  child: ListView(
                      itemExtent: 60.0,
                      children: _jobs?.map((JobValue value) {
                            return InkWell(
                              child: Container(
                                alignment: AlignmentDirectional.centerStart,
                                padding: const EdgeInsets.only(left: 16.0),
                                decoration: BoxDecoration(
                                    color: current == value
                                        ? R.color.secondBgColor
                                        : R.color.mainBgColor,
                                    border: Border(
                                        bottom: BorderSide(
                                            color: R.color.dividerColor,
                                            width: 0.0))),
                                child: Text(
                                  value.label ?? '',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: R.color.mainTextColor),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  _index = _jobs?.indexOf(value) ?? 0;
                                });
                              },
                            );
                          }).toList() ??
                          []),
                ),
                Container(
                    color: R.color.dividerColor,
                    width: 1 / Util.devicePixelRatio),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: R.color.secondBgColor,
                    child: ListView(
                        itemExtent: 60.0,
                        children: _jobs?[_index].data?.map((JobValue value) {
                              return InkWell(
                                child: Container(
                                  alignment: AlignmentDirectional.centerStart,
                                  padding: const EdgeInsets.only(left: 16.0),
                                  decoration: BoxDecoration(
                                      color: R.color.secondBgColor,
                                      border: Border(
                                          bottom: BorderSide(
                                              color: R.color.dividerColor,
                                              width: 0.0))),
                                  child: Text(
                                    value.label ?? '',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: R.color.mainTextColor),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).pop(value);
                                },
                              );
                            }).toList() ??
                            []),
                  ),
                )
              ],
            ),
    );
  }
}
