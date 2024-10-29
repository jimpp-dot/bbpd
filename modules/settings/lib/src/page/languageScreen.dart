import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/k.dart';

import '../../assets.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  static void show(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LanguageScreen()));
  }

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<LanguageScreen> {
  late Locale _currentLocale;
  int? _currentIndex;
  DialogLoadingController? _loadingController;
  late List<SupportLanguage> displayLanguages;

  @override
  void initState() {
    super.initState();
    _loadingController = DialogLoadingController();
    _currentLocale = Translations.currentLanguage;
    displayLanguages = SupportLanguage.supports.where((lan) {
      return !lan.valueEqual(SupportLanguage.ZH.locale);
    }).toList();
  }

  @override
  void dispose() {
    super.dispose();
    if (_loadingController != null) {
      _loadingController?.close();
      _loadingController = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.setting_language,
        actionTitle: K.setting_save,
        onPressed: _save,
      ),
      body: ListView.builder(
        itemExtent: 60,
        itemBuilder: (BuildContext context, int index) {
          SupportLanguage language = displayLanguages[index];
          return InkWell(
            child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(children: <Widget>[
                  Expanded(
                      child: Text(language.displayName,
                          style: TextStyle(
                              fontSize: 17,
                              color: R.color.mainTextColor,
                              fontWeight: FontWeight.w400))),
                  language.valueEqual(_currentLocale)
                      ? R.img(Assets.settings$ic_check_svg,
                          width: 16,
                          height: 16,
                          package: ComponentManager.MANAGER_SETTINGS)
                      : Container()
                ])),
            onTap: () {
              if (_currentLocale != language.locale) {
                _currentIndex = index;
                setState(() {
                  _currentLocale = language.locale;
                });
              }
            },
          );
        },
        itemCount: displayLanguages.length,
      ),
    );
  }

  void _save() async {
    if (Translations.currentLanguage != _currentLocale) {
      String lan = Translations.getLan(locale: _currentLocale);
      Config.set('current_language', lan);
      eventCenter.emit(EventConstant.ChangeLan, _currentLocale);
      _updateServerLan(lan);
    }
    _loadingController?.show(context: context, message: "");
    await Future.delayed(const Duration(milliseconds: 1000));
    _loadingController?.close();
    setState(() {});
  }

  void _updateServerLan(String lan) {
    try {
      String url = "${System.domain}account/updatelanguage?lan=$lan";
      Xhr.getJson(url);
    } catch (e) {
      Log.d(e.toString());
    }
  }
}
