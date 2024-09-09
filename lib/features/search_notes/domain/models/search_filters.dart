import 'package:equatable/equatable.dart';

class SearchFilters extends Equatable {
  const SearchFilters({required bool pinnedOnly}) : _pinnedOnly = pinnedOnly;

  final bool _pinnedOnly;

  SearchFilters copyWith({bool? pinnedOnly}) {
    return SearchFilters(
      pinnedOnly: pinnedOnly ?? _pinnedOnly,
    );
  }

  bool areDefault() {
    return (_pinnedOnly == false);
  }

  bool get pinnedOnly => _pinnedOnly;

  @override
  List<Object?> get props => [_pinnedOnly];
}
