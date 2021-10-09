class Reaction {
  String? id;
  String? postId;
  String? userId;
  String? reactionType;

  Reaction({
    this.id,
    this.postId,
    this.userId,
    this.reactionType = 'Love',
  });

  Map<String, dynamic> toJson() {
    return {
      'type': reactionType,
      'postId': postId,
    };
  }
}
