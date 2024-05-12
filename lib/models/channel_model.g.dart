// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelModel _$ChannelModelFromJson(Map<String, dynamic> json) => ChannelModel(
      channelName: json['channelName'] as String,
      channelId: json['channelId'] as String,
      adminId: json['adminId'] as String,
      memberCount: json['memberCount'] as int? ?? 0,
      isPrivate: json['isPrivate'] as bool? ?? false,
      channelImage: json['channelImage'] as String?,
      createdAt: json['createdAt'] as int,
      updatedAt: json['updatedAt'] as int?,
    );

Map<String, dynamic> _$ChannelModelToJson(ChannelModel instance) =>
    <String, dynamic>{
      'channelName': instance.channelName,
      'channelId': instance.channelId,
      'adminId': instance.adminId,
      'isPrivate': instance.isPrivate,
      'memberCount': instance.memberCount,
      'channelImage': instance.channelImage,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
