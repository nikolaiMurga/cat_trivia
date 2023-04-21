class RandomFactResponse {
  String? text;
  String? createdAt;

  RandomFactResponse({
    this.text,
    this.createdAt,
  });

  RandomFactResponse.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    createdAt = json['createdAt'];
  }
}
