import 'package:dindag/models/data/notification_models.dart';
import 'package:dindag/views/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> with TickerProviderStateMixin {
  TabController? tabController;

  List<NotificationModels> notificationModels = getDummyModels();

  @override
  void initState() {
    super.initState();

    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
        title: "Notification",
        actions: [
          Container(
            padding: EdgeInsets.only(
              right: 20,
            ),
            child: Icon(Icons.cancel_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.blue,
                      controller: tabController,
                      tabs: [
                        Tab(
                          text: "Direct",
                        ),
                        Tab(
                          text: "Overall",
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Make all as read",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 50),
              height: MediaQuery.of(context).size.height * 0.9,
              child: TabBarView(
                controller: tabController,
                children: [
                  listNotification(context, notificationModels),
                  listNotification(context, notificationModels),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container listNotification(BuildContext context, List<NotificationModels> notificationModels) {
    return Container(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: notificationModels.length,
        itemBuilder: (context, index) {
          return Container(
            // padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    notificationModels[index].timeGroup,
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: notificationModels[index].notificationBodyModels.length,
                    itemBuilder: (context, ind) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage(
                                        notificationModels[index].notificationBodyModels[ind].imgPath,
                                      ),
                                    ),
                                  ),
                                  notificationModels[index].notificationBodyModels[ind].isRead
                                      ? Container(
                                          height: 0,
                                          width: 0,
                                        )
                                      : Align(
                                          alignment: Alignment.topLeft,
                                          child: Icon(
                                            Icons.fiber_manual_record,
                                            color: Colors.indigo,
                                            size: 15,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    notificationModels[index].notificationBodyModels[ind].notification,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 0.5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        child: Text(
                                          notificationModels[index].notificationBodyModels[ind].type,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        notificationModels[index].notificationBodyModels[ind].time,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
