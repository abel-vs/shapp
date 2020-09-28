import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'firestore_service.dart';

abstract class Database {

}

class FirestoreDatabase implements Database {
  final _service = FirestoreService.instance;

}
