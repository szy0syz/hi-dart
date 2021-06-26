import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Usage: dart totals.dart <inputFile.csv>');
    exit(1);
  }

  final inputFile = args.first;
  // 要注意FS异常，一般这么做：
  // 先检查文件是否存在，再去读它。
  final lines = File(inputFile).readAsLinesSync();
  final totalDurationByTag = <String, double>{};

  // 不要表头
  lines.removeAt(0);

  var totalDutation = 0.0;
  for (var line in lines) {
    final values = line.split(',');
    final durationStr = values[3].replaceAll('"', '');
    final duration = double.parse(durationStr);
    final tag = values[5].replaceAll('"', '');
    final previousTotal = totalDurationByTag[tag];

    if (previousTotal == null) {
      totalDurationByTag[tag] = duration;
    } else {
      totalDurationByTag[tag] = previousTotal + duration;
    }

    totalDutation += duration;
  }

  for (var entry in totalDurationByTag.entries) {
    final durationFormatted = entry.value.toStringAsFixed(1);
    final tag = entry.key == '' ? 'Unallocated' : entry.key;
    print('$tag: ${durationFormatted}h');
  }

  print('\nTotalDutation: ${totalDutation.toStringAsFixed(1)}h');
}
