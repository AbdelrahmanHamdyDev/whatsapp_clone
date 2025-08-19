import 'package:whatsapp_clone/Model/chat.dart';
import 'package:whatsapp_clone/Model/message.dart';
import 'package:whatsapp_clone/Model/status.dart';
import 'package:whatsapp_clone/Model/user.dart';

List<UserModel> dummyUsers = [
  UserModel(
    id: "1",
    name: "Khalid",
    avatarUrl:
        "https://miro.medium.com/v2/resize:fit:1300/0*sUouC2_-sIPRPtts.jpg",
    status: UserStatus.online,
    statuses: StatusModel(
      id: "s1",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT9g26bqWmv63enK6Xpf62EOaPh1-XYvwgPw&s",
      createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
    ),
  ),
  UserModel(
    id: "2",
    name: "Zytronic",
    status: UserStatus.offline,
    avatarUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo3qiOvqZQJ9t1Y45K_WlCIVFD9_tOckbkgg&s",
  ),
  UserModel(
    id: "3",
    name: "حماده",
    status: UserStatus.offline,
    avatarUrl:
        "https://assets.mycast.io/characters/the-rooster-2773467-normal.jpg?1631022001",
    statuses: StatusModel(
      id: "s3",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO_wF30agrN601LWaijIxcG2hmzh8h66-xRA&s",
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    ),
  ),
  UserModel(
    id: "4",
    name: "Medhat",
    avatarUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiwAVIeCE8LhwSsGpkhGzjkfVfMfeioGTznw&s",
    status: UserStatus.offline,
  ),
];

final List<Chat> dummyChats = [
  Chat(
    id: "c1",
    userId: "1", //Khalid
    lastUpdated: DateTime.now().subtract(const Duration(minutes: 2)),
  ),
  Chat(
    id: "c2",
    userId: "2", //Zytronic
    lastUpdated: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  Chat(
    id: "c3",
    userId: "4", //Medhat
    lastUpdated: DateTime.now().subtract(const Duration(minutes: 10)),
  ),
];

final List<Message> dummyMessages = [
  Message(
    id: "m1",
    chatId: "c1", //Khalid
    senderId: "me",
    text: "لو فاضي رن عليا ديسكورد انا فاتح",
    timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  Message(
    id: "m2",
    chatId: "c1", //Khalid
    senderId: "1",
    text: "هفطر واجيلك",
    timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
  ),
  Message(
    id: "m3",
    chatId: "c1", //Khalid
    senderId: "me",
    text: "I’m working on new Flutter app",
    timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
  ),
  Message(
    id: "m4",
    chatId: "c1", //Khalid
    senderId: "1",
    text: "That’s awesome 🚀",
    timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
  ),
  Message(
    id: "m5",
    chatId: "c2",
    senderId: "2", //Zytronic
    text:
        """Welcome to Zytronic\nWe are pleased to announce that Guitara Group has officially rebranded into ZYTRONiC, a transformation that reflects our commitment to innovation, growth, and professionalism. As part of this new chapter, we are also launching an enhanced application process designed to ensure fairness, transparency, and efficiency in recruitment. This rebrand marks not just a change in name, but a stronger vision for the future — where ideas turn into wealth.""",
    timestamp: DateTime.now().subtract(const Duration(days: 1)),
  ),
];
