import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_sensor_record.g.dart';

abstract class DataSensorRecord
    implements Built<DataSensorRecord, DataSensorRecordBuilder> {
  static Serializer<DataSensorRecord> get serializer =>
      _$dataSensorRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Temp')
  int get temp;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DataSensorRecordBuilder builder) =>
      builder..temp = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_sensor');

  static Stream<DataSensorRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DataSensorRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DataSensorRecord._();
  factory DataSensorRecord([void Function(DataSensorRecordBuilder) updates]) =
      _$DataSensorRecord;

  static DataSensorRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDataSensorRecordData({
  int temp,
}) =>
    serializers.toFirestore(
        DataSensorRecord.serializer, DataSensorRecord((d) => d..temp = temp));
