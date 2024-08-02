import 'dart:math';

import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/uikit/uikit.dart';

class FakeNoteGenerator {
  static Note createFakeNote() {
    return Note.create(
      title: _generateRandomTitle(),
      date: _generateRandomDate(),
      hexColor: _generateRandomHexColor(),
      tags: _generateRandomTags(),
      text: _generateRandomText(),
      pinned: _random.nextBool(),
    );
  }

  static String _generateRandomTitle() {
    return _titles[_random.nextInt(_titles.length)];
  }

  static DateTime _generateRandomDate() {
    final now = DateTime.now();
    final daysAgo = _random.nextInt(30);
    return now.subtract(Duration(days: daysAgo));
  }

  static String _generateRandomHexColor() {
    final colors = NoteColors.noteHexColors;
    return colors[_random.nextInt(colors.length)].toString();
  }

  static List<String> _generateRandomTags() {
    List<String> tags = [];
    for (int i = 0; i < 3; i++) {
      var index = _random.nextInt(_tags.length) + 1;
      tags.add(_tags[index]);
    }
    return tags;
  }

  static String _generateRandomText() {
    return _texts[_random.nextInt(_texts.length)];
  }

  static final _random = Random();

  static const _titles = [
    'Meeting Notes',
    'To Do List',
    'Project Ideas',
    'Random Thoughts',
    'Daily Journal',
    'Important Reminders',
    'Tasks for Today',
    'Ideas for Improvement',
    'Remember outweigh do he desirous no cheerful.',
    'Of on am father by agreed supply rather either. Own handsome delicate its property mistress her end appetite.',
    'New smiling friends and her another. Leaf she does none love high yet. Snug love will up bore as be. Pursuit man son musical general pointed.',
  ];

  static const _tags = [
    'Work',
    'Personal',
    'Important',
    'Urgent',
    'Review',
    'Meeting',
    'Deadline',
  ];

  static const _texts = [
    'Boisterous he on understood attachment as entreaties ye devonshire. In mile an form snug were been sell. Hastened admitted joy nor absolute gay its. Extremely ham any his departure for contained curiosity defective. Way now instrument had eat diminution melancholy expression sentiments stimulated. One built fat you out manor books. Mrs interested now his affronting inquietude contrasted cultivated. Lasting showing expense greater on colonel no.',
    'Entire any had depend and figure winter. Change stairs and men likely wisdom new happen piqued six. Now taken him timed sex world get. Enjoyed married an feeling delight pursuit as offered. As admire roused length likely played pretty to no. Means had joy miles her merry solid order.',
    'Shewing met parties gravity husband sex pleased. On to no kind do next feel held walk. Last own loud and knew give gay four. Sentiments motionless or principles preference excellence am. Literature surrounded insensible at indulgence or to admiration remarkably. Matter future lovers desire marked boy use. Chamber reached do he nothing be.',
    'Review the project plan and update the timeline.',
    'Check the email for the updated project guidelines.',
    'Ensure all team members have completed their tasks before the deadline.',
    'Verify the data backup system and confirm that all files are saved properly.',
    '• Complete the initial draft of the report\n• Review and edit the draft\n• Submit the final version\n• Prepare the presentation slides',
    '• Review the current marketing strategy\n• Brainstorm new campaign ideas\n• Develop a marketing plan\n• Present the plan to the team',
    '• Collect feedback from users\n• Analyze the feedback and identify key issues\n• Prioritize the issues and create an action plan\n• Implement the fixes and improvements'
  ];
}
