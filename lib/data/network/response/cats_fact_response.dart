class CatsFactResponse {
  String? text;
  String? createdAt;

  CatsFactResponse({
    this.text,
    this.createdAt,
  });

  CatsFactResponse.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    createdAt = json['createdAt'];
  }
}
