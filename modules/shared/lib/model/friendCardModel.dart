import 'package:shared/model/chatMatchItem.dart';
import 'package:flutter/foundation.dart';

import 'chat_match_card_model.dart';

class FriendCardModel with ChangeNotifier {
  final int _maxTagCount = 15;
  List<int> selectedTagIDs = [];
  List<ChatTag> chatMatchTags = [];
  String? description;

  String? audioRemoteUrl;
  int? duration;
  String audioBase64 = '';

  String userDialog = '';
  int selectedDialogId = 0;
  String? title;
  String? subtitle;
  String? content;

  List<TagColor> tagColors = [];

  int videoId = 0;

  String? audioLocal;

  FriendCardModel({this.audioRemoteUrl, this.description, this.duration});

  int _currentStep = 1;

  int get currentStep => _currentStep;

  bool _isRecording = false;

  bool get isRecording => _isRecording;

  set isRecording(bool value) {
    _isRecording = value;
  }

  void nextStep() {
    _currentStep++;
    notifyListeners();
  }

  void forwardStep() {
    _currentStep--;
    notifyListeners();
  }

  bool isTagSelected(int id) {
    return selectedTagIDs.contains(id);
  }

  bool addTag(int id, String icon, String name, List<TagColor> tagColors,
      {bool notify = true}) {
    if (this.tagColors.isEmpty) this.tagColors.addAll(tagColors);
    if (selectedTagIDs.length >= _maxTagCount) {
      return true;
    }
    if (!selectedTagIDs.contains(id)) {
      selectedTagIDs.add(id);
      chatMatchTags.add(ChatTag(name, icon, id: id));
      if (notify) notifyListeners();
    }
    return false;
  }

  void removeTag(int id) {
    bool removed = selectedTagIDs.remove(id);
    chatMatchTags.removeWhere((element) => element.id == id);
    if (removed) {
      notifyListeners();
    }
  }

  void setDescription(String text) {
    description = text;
    notifyListeners();
  }

  void setAudioUrl(String text) {
    audioRemoteUrl = text;
    notifyListeners();
  }

  void setDuration(int duration) {
    this.duration = duration;
    notifyListeners();
  }

  void setUserDialog(String lines) {
    userDialog = lines;
    notifyListeners();
  }

  void setSelectedDialogId(
      int id, String dialogContent, String dialogTitle, String dialogSubTitle) {
    selectedDialogId = id;
    title = dialogTitle;
    content = dialogContent;
    subtitle = dialogSubTitle;

    notifyListeners();
  }
}
