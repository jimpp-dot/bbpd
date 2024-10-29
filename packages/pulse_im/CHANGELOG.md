Change Log
==========


## Version 1.6.8

_2023-04-07_

* bbim_client sendimage 消息空安全

## Version 1.6.7

_2023-03-29_

* Merge pull request #15 from olaola-chat/dev_jsg_v2 
* 会话列表中消息全部删除后不再修改sentTime=0


## Version 1.6.6

_2023-03-21_

* getHistoryMessages添加参数支持拉取已删除的会话消息
* 多设备同步已读消息，优化未读数通知
feat(cmd): 命令消息，支持持久化。场景eg：日志上报. (#14)&& 修复im，未初始化的情况，导致 socketAddress，空安全导致的错误。
* feat(cmd): 命令消息，支持持久化。场景eg：日志上报.
* fix(connect): 修复im，未初始化的情况，导致 socketAddress，空安全导致的错误。

## Version 1.6.5

_2023-03-14_

* getHistoryMessages添加参数支持拉取已删除的会话消息
* 多设备同步已读消息，优化未读数通知

## Version 1.6.4

_2023-01-29_

* bugfix，避免在相同的网络类型，出现变更时，im做无谓的断线重连操作

## Version 1.6.3

_2023-01-11_

* 增加IM socket状态回调
* database close加入async同步

## Version 1.6.2

_2022-11-03_

1. 使用桌面端兼容库sqflite_common_ffi和device_info，桌面端不会挤掉原IM的登录态
2. 支持空安全
3. lofi功能支持
   1. 增加已读功能 https://github.com/olaola-chat/cli-bbim/commit/ab0f1c9f94c07f07c2bb717cac10200aafa959d8
   2. 支持发送消息失败重发 https://github.com/olaola-chat/cli-bbim/commit/78f3b2d13e031fc98301bffde9b64f4576857250
   3. 修改小号引起的bug https://github.com/olaola-chat/cli-bbim/commit/5f00893faeabe1aeb6aa31c2c6f735e978c67ffe
4. 修复java.lang.llegalStateException Reply already submitted报错 https://github.com/olaola-chat/cli-bbim/commit/c84ae70479193a207382f70e5dfb4989193e6d13
5. 删除多余分支，主要合并lofi和pc(桌面端)项目分支修改，及bug修复
