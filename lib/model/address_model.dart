class AddressModel {
  int? id;
  String? addressType;
  String? lname;
  String? contactPersonNumber;
  String? address;
  String? latitude;
  String? longitude;
  int? zoneId;
  String? method;
  String? contactPersonName;

  AddressModel(
      {this.id,
      this.addressType,
      this.lname,
      this.contactPersonNumber,
      this.address,
      this.latitude,
      this.longitude,
      this.zoneId,
      this.method,
      this.contactPersonName});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressType = json['address_type'];
    lname = json['location_name'];

    contactPersonNumber = json['building_no'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    zoneId = json['zone_id'];
    method = json['_method'];
    contactPersonName = json['street_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address_type'] = this.addressType;
    data['location_name'] = this.lname;

    data['building_no'] = this.contactPersonNumber;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['zone_id'] = this.zoneId;
    data['_method'] = this.method;
    data['street_no'] = this.contactPersonName;
    return data;
  }
}
