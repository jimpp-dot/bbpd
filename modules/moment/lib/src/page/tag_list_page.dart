import 'package:shared/shared.dart' hide TagItem;
import 'package:flutter/material.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';

typedef TagTaped = void Function(String tag);

class TagListPage extends StatefulWidget {
  final TagTaped? onTagTaped;
  final int id;

  const TagListPage({super.key, required this.id, this.onTagTaped});

  @override
  _TagListPageState createState() => _TagListPageState();
}

class _TagListPageState extends State<TagListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Future<DataRsp<TagDetail>>? _response;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    _response = Api.getTagDetail(widget.id);
  }

  _onTagTaped(String tag) {
    if (widget.onTagTaped != null) {
      widget.onTagTaped!(tag);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<DataRsp<TagDetail>>(
      future: _response,
      builder:
          (BuildContext context, AsyncSnapshot<DataRsp<TagDetail>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          DataRsp<TagDetail>? response = snapshot.data;

          if (response != null &&
              response.success == true &&
              response.data != null) {
            if (response.data!.tags.isEmpty) {
              return EmptyWidget(
                  desc: K.moment_tag_empty,
                  textColor: R.colors.secondTextColor);
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: response.data!.tags.length,
              itemBuilder: (context, index) {
                return _buildTagItem(response.data!.tags[index]);
              },
            );
          } else {
            return ErrorData(
              onTap: () {
                setState(() {
                  _init();
                });
              },
              fontColor: R.colors.secondTextColor,
            );
          }
        } else {
          // 请求未结束，显示loading
          return const Loading();
        }
      },
    );
  }

  Widget _buildTagItem(String tag) {
    return Container(
      height: 44,
      alignment: AlignmentDirectional.centerStart,
      child: TagItem(
        tag: tag,
        supportDark: true,
        background: R.colors.secondBgColor,
        textStyle: TextStyle(
          color: R.colors.mainTextColor,
          fontSize: 13,
        ),
        onTap: () => _onTagTaped(tag),
      ),
    );
  }
}
