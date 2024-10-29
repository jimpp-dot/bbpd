import 'dart:io';

import 'package:shared/shared.dart';
import 'package:path/path.dart';

class Trie {
  List<String>? _words;
  final Node rootNode = Node();
  bool _inited = false;

  initWords(List<String> words) {
    _words = words;

    _words?.forEach((word) {
      _insertWord(word);
    });

    _inited = true;
  }

  _insertWord(String word) {
    Node currentNode = rootNode;
    int index = 0;
    List<int> runes = word.runes.toList();

    while (index < runes.length) {
      int rune = runes[index];
      String character = String.fromCharCode(rune);
//      Log.d(character);
      index++;

      currentNode = _insert2Node(currentNode, character);
    }
  }

  Node _insert2Node(Node parentNode, String character) {
    if (parentNode.char == character) {
      return parentNode;
    }

    if (parentNode.children.isNotEmpty) {
      for (int i = 0; i < parentNode.children.length; i++) {
        Node child = parentNode.children[i];
        if (child.char == character) {
          return child;
        }
      }
    }

    Node node = Node(char: character);
    parentNode.children.add(node);
    return node;
  }

  bool search(String text) {
    if (!_inited) {
      return false;
    }

    String orgText = text;

    text = _filterOutUnimportanctSymbols(text);
    List<int> runes = text.runes.toList();
    int iStart = 0;
    int index = 0;
    Node? currentNode = rootNode;

    while (index < runes.length) {
      int rune = runes[index];
      String character = String.fromCharCode(rune);
//      Log.d(character);
      index++;

      currentNode = _searchNode(currentNode, character);
      if (currentNode == null) {
        //在child节点里面找不到匹配项时
        iStart++;
        index = iStart;
        currentNode = rootNode;
      } else if (currentNode.isLeaf) {
        _report(orgText);
        return true;
      }
    }

    return false;
  }

  Node? _searchNode(Node? currentNode, String character) {
    if (currentNode != null && currentNode.children.isNotEmpty) {
      for (int i = 0; i < currentNode.children.length; i++) {
        Node child = currentNode.children[i];
        if (child.char == character) {
          return child;
        }
      }
    }

    return null;
  }

  void _report(String text) async {
    try {
      XhrResponse xhrResponse = await Xhr.postJson(
          "${System.domain}report/dirty", {'text': text},
          throwOnError: false);
      BaseResponse response = BaseResponse.parse(xhrResponse);
      Log.d('report_dirty resp = ${response.success}');
    } catch (e) {
      Log.d('report_dirty error... $e');
    }
  }
}

class Node {
  String? char;
  List<Node> children = [];

  Node({this.char});

  bool get isLeaf => children.isEmpty;
}

List<String> _symbols = [
  ' ',
  ',',
  '.',
  '(',
  ')',
  '[',
  ']',
  '?',
  '|',
  '+',
  '-',
  '*',
  '/',
  '%',
  '&',
  '*',
  '#',
  '@',
  '^',
  '=',
  '{',
  '}',
  '。',
  '，',
  '！',
  '？',
  '~',
  '_',
  '<',
  '>',
  '…',
  '"',
  '“',
  '”',
  '〝',
  '〞',
  "'"
]; //TODO 补充需要去除的标点符号表
List<int> _symbolCodes =
    _symbols.map((String symbol) => symbol.codeUnits[0]).toList();

StringBuffer buffer = StringBuffer();

String _filterOutUnimportanctSymbols(String text) {
  buffer.clear();
  for (var rune in text.runes) {
    if (!_symbolCodes.contains(rune)) {
      buffer.writeCharCode(rune);
    }
  }

  return buffer.toString();
}

Trie trie = Trie();

Future<File> _getDirtyWordsFile() async {
  String baseDir = join(Constant.documentsDirectory.path, 'dirty');
  Directory directory = await Directory(baseDir).create(recursive: true);
  File file = File(join(directory.path, 'dirty.log'));
  return file;
}

void initSensitiveWords() async {
  List<String> finalWords = [];

  File dirtyWordsFile = await _getDirtyWordsFile();
  String dirtyFilePath = dirtyWordsFile.path;
  String url = '${System.imageDomain}dirty.log';
  try {
    await DownloadManager.download(url, dirtyFilePath);
    if (!dirtyWordsFile.existsSync()) {
      return;
    }
    String dirtyWordsStr = dirtyWordsFile.readAsStringSync();
    List<String> sensitiveWords = dirtyWordsStr.split('\n');
    for (var word in sensitiveWords) {
      word = word.trim();
      if (word.isNotEmpty && !finalWords.contains(word)) {
        finalWords.add(word);
      }
    }

    trie.initWords(finalWords);
  } catch (e) {
    Log.d(e);
  }
}
