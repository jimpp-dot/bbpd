import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 贡献题目
class ContributeWord extends StatefulWidget {
  const ContributeWord({super.key});

  @override
  _ContributeWordState createState() {
    return _ContributeWordState();
  }
}

class _ContributeWordState extends State<ContributeWord>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final GlobalKey<_PageState> _guessKey = GlobalKey();
  final GlobalKey<_PageState> _underKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _onSubmit() async {
    String word;
    String prompt;
    String url;
    Map<String, String> body = {};
    if (_tabController.index == 0) {
      word = _guessKey.currentState?.wordController.text.trim() ?? '';
      prompt = _guessKey.currentState?.promptController.text.trim() ?? '';
      url = '${System.domain}roomguess/contribute';
      body['word'] = word;
      body['prompt'] = prompt;
    } else {
      word = _underKey.currentState?.wordController.text.trim() ?? '';
      prompt = _underKey.currentState?.promptController.text.trim() ?? '';
      url = '${System.domain}roomunder/contribute';
      body['word_a'] = word;
      body['word_b'] = prompt;
    }
    if (word.isEmpty || prompt.isEmpty) {
      Toast.showCenter(context, R.string('content_can_not_null'));
      return;
    }
    if (word.length > 6 || prompt.length > 6) {
      Toast.showCenter(context, R.string('content_too_long'));
      return;
    }

    XhrResponse response = await Xhr.postJson(url, body, throwOnError: false);
    if (response.error == null) {
      Map res = response.value();
      if (res['success'] == true) {
        Toast.showCenter(context, R.string('submit_success'));
        Navigator.of(context).pop();
      } else {
        if (res['msg'] != null) {
          Toast.showCenter(context, res['msg']);
        }
      }
    } else {
      Toast.showCenter(context, response.error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(R.string('contribute_word')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CommonTabBar(
            tabs: [
              Tab(
                text: R.string('room_game_guess'),
              ),
              Tab(
                text: R.string('room_game_under'),
              ),
            ],
            controller: _tabController,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: R.color.mainTextColor,
            indicatorWeight: 1,
            labelPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Page(
                  key: _guessKey,
                  type: Page.TYPE_GUESS,
                ),
                Page(
                  key: _underKey,
                  type: Page.TYPE_UNDER,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          BottomButton.of(title: R.string('submit'), onTap: _onSubmit),
    );
  }
}

class Page extends StatefulWidget {
  static const String TYPE_GUESS = 'guess';
  static const String TYPE_UNDER = 'under';

  final String type;

  const Page({super.key, required this.type});

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  late TextEditingController wordController;
  late TextEditingController promptController;

  @override
  void initState() {
    super.initState();
    wordController = TextEditingController();
    promptController = TextEditingController();
  }

  @override
  void dispose() {
    wordController.dispose();
    promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.type == Page.TYPE_GUESS
                ? R.string('contribute_guess_word_label')
                : R.string('contribute_under_word1_label'),
            style: TextStyle(
              fontSize: 16,
              color: R.color.secondTextColor,
            ),
          ),
          Container(
            height: 48,
            margin: const EdgeInsets.only(top: 8, bottom: 12),
            padding: const EdgeInsets.only(left: 12, right: 12),
            alignment: AlignmentDirectional.centerStart,
            decoration: BoxDecoration(
              color: R.color.dividerColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextField(
              controller: wordController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.type == Page.TYPE_GUESS
                    ? R.string('contribute_guess_word_hint')
                    : R.string('contribute_under_word1_hint'),
                hintStyle: TextStyle(
                  color: R.color.thirdTextColor,
                  fontSize: 14,
                ),
                counterText: '',
              ),
              textInputAction: TextInputAction.done,
              style: TextStyle(
                fontSize: 14,
                color: R.color.mainTextColor,
              ),
              autofocus: false,
              autocorrect: false,
              maxLines: 1,
              maxLength: 20,
            ),
          ),
          Text(
            widget.type == Page.TYPE_GUESS
                ? R.string('contribute_guess_prompt_label')
                : R.string('contribute_under_word2_label'),
            style: TextStyle(
              fontSize: 16,
              color: R.color.secondTextColor,
            ),
          ),
          Container(
            height: 48,
            margin: const EdgeInsets.only(top: 8, bottom: 12),
            padding: const EdgeInsets.only(left: 12, right: 12),
            alignment: AlignmentDirectional.centerStart,
            decoration: BoxDecoration(
              color: R.color.dividerColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextField(
              controller: promptController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.type == Page.TYPE_GUESS
                    ? R.string('contribute_guess_prompt_hint')
                    : R.string('contribute_under_word2_hint'),
                hintStyle: TextStyle(
                  color: R.color.thirdTextColor,
                  fontSize: 14,
                ),
                counterText: '',
              ),
              textInputAction: TextInputAction.done,
              style: TextStyle(
                fontSize: 14,
                color: R.color.mainTextColor,
              ),
              autofocus: false,
              autocorrect: false,
              maxLines: 1,
              maxLength: 20,
            ),
          ),
          Text(
            R.string('example'),
            style: TextStyle(
              fontSize: 16,
              color: R.color.secondTextColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              widget.type == Page.TYPE_GUESS
                  ? R.string('contribute_guess_eg')
                  : R.string('contribute_under_eg'),
              style: TextStyle(
                fontSize: 14,
                color: R.color.secondTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
