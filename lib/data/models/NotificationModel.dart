class NotificationModel {
  String? notificationId;
  String? notificationTitle;
  String? notificationBody;
  String? notificationReciverId;
  String? notificationDate;

  NotificationModel(
      {this.notificationId,
      this.notificationTitle,
      this.notificationBody,
      this.notificationReciverId,
      this.notificationDate});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    notificationReciverId = json['notification_reciver_id'];
    notificationDate = json['notification_date'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['notification_id'] = this.notificationId;
  //   data['notification_title'] = this.notificationTitle;
  //   data['notification_body'] = this.notificationBody;
  //   data['notification_reciver_id'] = this.notificationReciverId;
  //   data['notification_date'] = this.notificationDate;
  //   return data;
  // }
}
