import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';

import 'model/match_ticket_model.dart';

class TicketDetailSubPage extends StatefulWidget {
  //0：可使用，1已使用 2已过期
  final int state;
  final String type;

  const TicketDetailSubPage(
      {super.key, required this.state, required this.type});

  @override
  _TicketDetailSubPageState createState() => _TicketDetailSubPageState();
}

class _TicketDetailSubPageState extends State<TicketDetailSubPage>
    with AutomaticKeepAliveClientMixin<TicketDetailSubPage> {
  @override
  bool get wantKeepAlive => true;

  late TicketDetailSource _source;

  @override
  void initState() {
    super.initState();
    _source = TicketDetailSource(widget.state, widget.type);
  }

  @override
  void dispose() {
    _source.dispose();
    super.dispose();
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return LoadingFooter(
        hasMore: false,
        loadMore: () => {},
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return Center(
        child: ErrorData(
          error: _source.errorMsg,
          onTap: () {
            _source.refresh();
          },
        ),
      );
    }
    if (status == IndicatorStatus.empty) {
      return Center(
        child: ErrorData(
          error: BaseK.K.no_data,
          onTap: () {
            _source.refresh();
          },
        ),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _source.errorMsg, loadMore: _source.loadMore);
    } else {
      return LoadingFooter(
          hasMore: _source.hasMore, loadMore: _source.loadMore);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicatorFactory.of(
      onRefresh: () => _source.refresh(),
      child: Container(
        color: R.color.secondBgColor,
        padding: EdgeInsetsDirectional.only(
            start: 20,
            end: 20,
            top: 20,
            bottom: MediaQuery.of(context).padding.bottom),
        child: LoadingMoreList(
          ListConfig<TicketDetailItem>(
            itemBuilder: (c, item, index) => _buildListItem(index, item),
            lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
            sourceList: _source,
            indicatorBuilder: _indicatorBuilder,
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(int index, TicketDetailItem item) {
    String img = item.image;
    String bg = item.imageBg;
    String title = item.name;
    String source = item.sourceDesc;
    String time = item.timeDesc;
    String cornerDesc = item.periodDesc;
    int count = item.num;
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 12),
      padding: const EdgeInsetsDirectional.only(end: 16),
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(12),
                bottomStart: Radius.circular(12)),
            child: Stack(
              children: [
                CachedNetworkImage(
                    imageUrl: bg, width: 90, height: 90, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: CachedNetworkImage(
                      imageUrl: img, width: 80, height: 80, fit: BoxFit.cover),
                ),
                if (cornerDesc.isNotEmpty)
                  PositionedDirectional(
                    start: 0,
                    top: 0,
                    child: Container(
                      height: 18,
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xFF202020),
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(8),
                            bottomEnd: Radius.circular(8)),
                      ),
                      child: Text(
                        cornerDesc,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, color: R.color.mainTextColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  source,
                  style:
                      TextStyle(fontSize: 13, color: R.color.secondTextColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  time,
                  style:
                      TextStyle(fontSize: 13, color: R.color.secondTextColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (count > 0)
            const SizedBox(
              width: 12,
            ),
          if (count > 0)
            NumText(
              'x$count',
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xFFFDA252),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w800,
              ),
            )
        ],
      ),
    );
  }
}
