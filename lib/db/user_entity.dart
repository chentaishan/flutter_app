class UserEntity {
	String name;
	int id;
	String age;

	UserEntity({this.name, this.id, this.age});

	UserEntity.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		id = json['id'];
		age = json['age'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name'] = this.name;
		data['age'] = this.age;
		return data;
	}
}
