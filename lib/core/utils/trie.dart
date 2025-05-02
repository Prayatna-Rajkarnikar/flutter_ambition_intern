class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class Trie {
  final TrieNode root = TrieNode();

  void insert(String word) {
    TrieNode node = root;
    for (var char in word.toLowerCase().split('')) {
      node = node.children.putIfAbsent(char, () => TrieNode());
    }
    node.isEndOfWord = true;
  }

  List<String> search(String prefix) {
    TrieNode node = root;
    for (var char in prefix.toLowerCase().split('')) {
      if (!node.children.containsKey(char)) return [];
      node = node.children[char]!;
    }
    List<String> results = [];
    _dfs(node, prefix.toLowerCase(), results);
    return results;
  }

  void _dfs(TrieNode node, String prefix, List<String> results) {
    if (node.isEndOfWord) results.add(prefix);
    for (var entry in node.children.entries) {
      _dfs(entry.value, prefix + entry.key, results);
    }
  }
}
