class Trip {
  String? message;
  String? trip_id;
  String? user_id;
  String? start_date;
  String? end_date;
  String? location_name;
  String? latitude;
  String? longitude;
  String? cost;
  String? trip_image;
  String? trip_image_2;
  String? trip_image_3;

  Trip(
      {this.message,
      this.trip_id,
      this.user_id,
      this.start_date,
      this.end_date,
      this.location_name,
      this.latitude,
      this.longitude,
      this.cost,
      this.trip_image,
      this.trip_image_2,
      this.trip_image_3
      });

  Trip.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    trip_id = json['trip_id'];
    user_id = json['user_id'];
    start_date = json['start_date'];
    end_date = json['end_date'];
    location_name = json['location_name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    cost = json['cost'];
    trip_image = json['trip_image'];
    trip_image_2 = json['trip_image_2'];
    trip_image_3 = json['trip_image_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['trip_id'] = this.trip_id;
    data['user_id'] = this.user_id;
    data['start_date'] = this.start_date;
    data['end_date'] = this.end_date;
    data['location_name'] = this.location_name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['cost'] = this.cost;
    data['trip_image'] = this.trip_image;
    data['trip_image_2'] = this.trip_image_2;
    data['trip_image_3'] = this.trip_image_3;
    return data;
  }
}
