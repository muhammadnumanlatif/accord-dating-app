


//*Userdata list
class UserData {
  final String userName;
  final int userAge;
  final String userIntro;
  final String userImageUrl;
  final List<String> userIntrestingList;

  UserData({
    required this.userImageUrl,
    required this.userName,
    required this.userAge,
    required this.userIntro,
    required this.userIntrestingList,
  });
}

//*List for UserData
List<UserData> userData = [
  UserData(
      userName: 'Mona',
      userAge: 42,
      userIntro: 'I am honest person',
      userImageUrl:
      'https://cdn-0.generatormix.com/images/thumbs/random-instagrammers.jpg',
      userIntrestingList: ['Horse Riding', 'Travel']),
  UserData(
      userName: 'Rob',
      userAge: 25,
      userIntro: 'I am stylish boy',
      userImageUrl:
      'https://cdn-0.generatormix.com/images/thumbs/random-comedians.jpg',
      userIntrestingList: ['Travel', 'Sports']),
  UserData(
      userName: 'Ana',
      userAge: 33,
      userIntro: 'I am athletic lady',
      userImageUrl:
      'https://cdn-0.generatormix.com/images/thumbs/random-volleyball-players.jpg',
      userIntrestingList: ['Running', 'High Jump']),
  UserData(
      userName: 'Mike',
      userAge: 35,
      userIntro: 'I am music creator',
      userImageUrl:
      'https://cdn-0.generatormix.com/images/thumbs/random-musicians.jpg',
      userIntrestingList: ['Guitar', 'Jazz']),
  UserData(
      userName: 'Smith',
      userAge: 28,
      userIntro: 'I am the Rock Star',
      userImageUrl:
      'https://cdn-0.generatormix.com/images/thumbs/random-pop-singers.jpg',
      userIntrestingList: ['Jazz', 'Rock']),
];