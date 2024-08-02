import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scriby_app/common/widgets/widgets.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/uikit/uikit.dart';

class NotesSliverGrid extends StatefulWidget {
  const NotesSliverGrid({
    super.key,
    required this.notes,
    required this.onCardPressed,
  });

  final List<Note> notes;
  final void Function(BuildContext context, Note note) onCardPressed;

  @override
  State<NotesSliverGrid> createState() => _NotesSliverGridState();
}

class _NotesSliverGridState extends State<NotesSliverGrid> {
  List<Note> _prevNotes = [];

  @override
  void didUpdateWidget(covariant NotesSliverGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    _prevNotes = oldWidget.notes;
  }

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemBuilder: (context, i) {
        final Note note = widget.notes[i];
        final bool isNewNote = !_prevNotes.contains(note);

        return isNewNote
            ? AnimationConfiguration.staggeredGrid(
                delay: const Duration(milliseconds: 0),
                duration: const Duration(milliseconds: 225),
                position: i,
                columnCount: 2,
                child: FadeInAnimation(
                  curve: Curves.linear,
                  // duration: const Duration(milliseconds: 2000), // 450
                  child: GestureDetector(
                    onDoubleTap: () => widget.onCardPressed(context, note),
                    child: NoteCard(
                      note: note,
                      key: ValueKey(note),
                    ),
                  ),
                ),
              )
            : GestureDetector(
                onDoubleTap: () => widget.onCardPressed(context, note),
                child: NoteCard(
                  key: ValueKey(note),
                  note: note,
                ),
              );
      },
      childCount: widget.notes.length,
    );
  }
}

// class NotesSliverGrid extends StatefulWidget {
//   const NotesSliverGrid({
//     super.key,
//     required this.notes,
//     required this.onCardPressed,
//   });

//   final List<Note> notes;
//   final void Function(BuildContext context, Note note) onCardPressed;

//   @override
//   State<NotesSliverGrid> createState() => _NotesSliverGridState();
// }

// class _NotesSliverGridState extends State<NotesSliverGrid>
//     with TickerProviderStateMixin {
//   final List<Note> _notes = [];
//   final Map<Note, AnimationController> _controllers = {};

//   @override
//   void initState() {
//     super.initState();
//     _initializeNotes();
//   }

//   void _initializeNotes() {
//     _notes.addAll(widget.notes);
//     for (var note in _notes) {
//       _controllers[note] = AnimationController(
//         duration: const Duration(milliseconds: 500),
//         vsync: this,
//       )..forward();
//     }
//   }

//   @override
//   void didUpdateWidget(covariant NotesSliverGrid oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _updateNotes();
//   }

//   void _updateNotes() {
//     final newNotes = List.from(widget.notes);

//     // Удаление старых заметок с анимацией
//     for (var note in _notes) {
//       if (!newNotes.contains(note)) {
//         final controller = _controllers[note]!;
//         controller.reverse().then((_) {
//           if (mounted) {
//             setState(() {
//               _notes.remove(note);
//               _controllers[note]?.dispose();
//               _controllers.remove(note);
//             });
//           }
//         });
//       }
//     }

//     // Добавление новых заметок с анимацией
//     for (var note in newNotes) {
//       if (!_notes.contains(note)) {
//         setState(() {
//           _notes.insert(0, note); // Добавляем в начало списка
//           _controllers[note] = AnimationController(
//             duration: const Duration(milliseconds: 500),
//             vsync: this,
//           )..forward();
//         });
//       }
//     }
//   }

//   @override
//   void dispose() {
//     for (var controller in _controllers.values) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SliverMasonryGrid.count(
//       crossAxisCount: 2,
//       mainAxisSpacing: 10,
//       crossAxisSpacing: 10,
//       itemBuilder: (context, i) {
//         final Note note = _notes[i];
//         final animation = _controllers[note]!;

//         return FadeTransition(
//           opacity: animation,
//           child: GestureDetector(
//             onDoubleTap: () => widget.onCardPressed(context, note),
//             child: NoteCard(
//               note: note,
//               key: ValueKey(note.id), // Уникальный идентификатор
//             ),
//           ),
//         );
//       },
//       childCount: _notes.length,
//     );
//   }
// }
