import 'dart:convert';

import 'package:shared/shared.dart';

class JobValue {
  String? label;
  int value;
  List<JobValue>? data;
  JobValue({this.label, this.value = 0, this.data});

  @override
  String toString() {
    return '{"label": "$label", "value": $value,"data":$data}';
  }

  static JobValue fromJson(Map json) {
    JobValue jobValue = JobValue();
    jobValue.label = json['label'];
    jobValue.value = json['value'];
    if (json['data'] != null && json['data'] is List) {
      jobValue.data = [];
      for (Map item in json['data']) {
        jobValue.data?.add(fromJson(item));
      }
    }
    return jobValue;
  }
}

class Job {
  static final List<JobValue> _jobs = [];
  static String _curLan = '';

  static Future init() async {
    await data;
  }

  static Future<List<JobValue>> get data async {
    if (needInit()) {
      _jobs.clear();
      _curLan = Translations.getLan();
      String jsonStr = await Translations.load(
          'job_data', ComponentManager.MANAGER_PERSONALDATA);
      List? res = json.decode(jsonStr);
      if (res != null) {
        for (var item in res) {
          _jobs.add(JobValue.fromJson(item));
        }
      }
    }
    return _jobs;
  }

  static bool needInit() => _jobs.isEmpty || _curLan != Translations.getLan();

  static String getLabel(int id) {
    String lable = '';
    if (_jobs.isNotEmpty) {
      for (var job in _jobs) {
        if (job.value == id) {
          lable = job.label ?? '';
        } else if (job.data != null && job.data!.isNotEmpty) {
          for (var item in job.data!) {
            if (item.value == id) {
              lable = item.label ?? '';
            }
          }
        }
      }
    }
    return lable;
  }
}
