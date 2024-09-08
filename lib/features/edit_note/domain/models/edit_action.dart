enum EditAction {
  title,
  color,
  tags,
  noteText,
  pinned,
}

typedef EditActionRecord = ({EditAction action, dynamic data});
