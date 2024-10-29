import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/model/option_beans.dart';

class RoomSubTypeSelectWidget extends StatelessWidget {
  final List<OptionItem>? items;
  final ValueChanged<OptionItem>? onItemSelect;

  const RoomSubTypeSelectWidget({super.key, this.items, this.onItemSelect});

  @override
  Widget build(BuildContext context) {
    if (items?.isEmpty ?? true) return const SizedBox();

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, childAspectRatio: 74 / 80),
      itemBuilder: (s, index) {
        return RoomSubTypeSelectItemWidget(
          item: items![index],
          onItemSelect: onItemSelect,
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items!.length,
      padding: const EdgeInsets.all(0.0),
    );
  }
}

class RoomSubTypeSelectItemWidget extends StatelessWidget {
  final OptionItem item;
  final ValueChanged<OptionItem>? onItemSelect;

  const RoomSubTypeSelectItemWidget(
      {super.key, required this.item, this.onItemSelect});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemSelect == null ? null : () => onItemSelect!(item),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(item.icon ?? ""),
              width: 40,
              height: 40,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              item.name ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 11),
            )
          ],
        ),
      ),
    );
  }
}
