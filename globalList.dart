import 'package:flutter/material.dart';

class FavoriteVillager {
  String? villagerName;

  FavoriteVillager({required this.villagerName});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteVillager &&
          runtimeType == other.runtimeType &&
          villagerName == other.villagerName;

  @override
  int get hashCode => villagerName.hashCode;
}
