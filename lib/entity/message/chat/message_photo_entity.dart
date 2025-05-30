import 'package:photo_manager/photo_manager.dart';

class MessagePhotoEntity {
  String id;
  String albumName;
  List<AssetEntity>? images;

  MessagePhotoEntity({
    this.id = "1",
    this.albumName = "",
    required this.images,
  });
}
