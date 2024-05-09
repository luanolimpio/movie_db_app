abstract class PersonDetailsEvent {
  const PersonDetailsEvent();
}

class GetPersonDetailsEvent extends PersonDetailsEvent {
  const GetPersonDetailsEvent({required this.id});

  final int id;
}