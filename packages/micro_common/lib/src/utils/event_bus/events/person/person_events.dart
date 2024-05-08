import '../../../../../micro_common.dart';
import '../../i_event.dart';

class GoToPopularPeopleEvent extends IEvent {
  const GoToPopularPeopleEvent();
}

class GoToPersonDetailsEvent extends IEvent {
  const GoToPersonDetailsEvent({
    required this.id,
    required this.knownFor,
  });

  final int id;
  final List<KnownForEntity> knownFor;
}
