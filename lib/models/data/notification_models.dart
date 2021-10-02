class NotificationModels {
  String timeGroup;
  List<NotificationBodyModels> notificationBodyModels;

  NotificationModels(this.timeGroup, this.notificationBodyModels);
}

class NotificationBodyModels {
  bool isRead;
  String imgPath;
  String notification;
  String type;
  String time;

  NotificationBodyModels(this.isRead, this.imgPath, this.notification, this.type, this.time);
}

List<NotificationModels> getDummyModels() {
  return <NotificationModels>[
    NotificationModels(
      "TODAY",
      <NotificationBodyModels>[
        NotificationBodyModels(
          false,
          "assets/img/default/avatar.png",
          "Mia is commented your post",
          "FA-1",
          "1 hour ago",
        ),
        NotificationBodyModels(
          false,
          "assets/img/default/avatar.png",
          "Mia post new videos",
          "FA-1",
          "2 hour ago",
        ),
        NotificationBodyModels(
          true,
          "assets/img/default/avatar.png",
          "Mia accept your friend request",
          "FA-1",
          "3 hour ago",
        ),
      ],
    ),
    NotificationModels(
      "YESTERDAY",
      <NotificationBodyModels>[
        NotificationBodyModels(
          true,
          "assets/img/default/avatar.png",
          "Mia is commented your post",
          "FA-1",
          "30-02-2021 10:00",
        ),
        NotificationBodyModels(
          true,
          "assets/img/default/avatar.png",
          "James create new goal",
          "GOAL",
          "30-02-2021 09:00",
        ),
        NotificationBodyModels(
          true,
          "assets/img/default/avatar.png",
          "Mia rejected  a PO",
          "PO#208",
          "30-02-2021 08:00",
        ),
      ],
    ),
  ];
}
