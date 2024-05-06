abstract class PersonEvent {
  const PersonEvent();
}

class GetPopularPeopleEvent extends PersonEvent {
  const GetPopularPeopleEvent();
}

class GetPersonDetailsEvent extends PersonEvent {
  const GetPersonDetailsEvent({required this.id});

  final int id;
}
