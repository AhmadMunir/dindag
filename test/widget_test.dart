// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:dindag/services/company_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dindag/main.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
  
  test('testing fetch companies', () async {
    final company = CompanyService(MockClient((request) async {
      var json = {
        "status": true,
        "message": null,
        "data": [
          {
            "id": "1ec15d7b-25ed-655c-8cec-9828a6243bba",
            "name": "CV. Hidup Sejahtera Bersama",
            "phone": "085155399882",
            "bussiness_entity": "CV",
            "bussiness_type": "kuliner",
            "npwp": "350800000000",
            "nib": "918392388108192381",
            "address": "Jl. Gn Ijen Tompokersan Lumajang",
            "postal_code": "673511",
            "total_employee": "10",
            "male_employee": "4",
            "female_employee": "4",
            "foreign_employee": "2",
            "vehicle_type": "car",
            "total_vehicle": "4",
            "land_ownership": "pribadi",
            "user_id": "1ec143db-5ac1-6c56-ba19-00f48d5ca7a1",
            "created_at": "2021-09-15T03:47:49.000000Z",
            "updated_at": "2021-09-15T05:56:40.000000Z",
            "deleted_at": null,
            "owners": [
              {
                "id": "1ec15d83-e3cc-6854-b32a-9828a6243bba",
                "company_id": "1ec15d7b-25ed-655c-8cec-9828a6243bba",
                "card_id": "35082100000004",
                "phone_number": "085155399882",
                "whatsapp": "085155399882",
                "email": "falahkun@aol.com",
                "first_name": "Budi Setyo",
                "last_name": "Hermawan",
                "created_at": "2021-09-15T03:51:44.000000Z",
                "updated_at": "2021-09-15T04:16:35.000000Z",
                "deleted_at": null
              }
            ],
            "licenses": [
              {
                "id": "1ec16aca-ffdf-66e6-b97f-9828a6243bba",
                "license_id": "1ec143db-5bbe-6014-8549-00f48d5ca7a1",
                "company_id": "1ec15d7b-25ed-655c-8cec-9828a6243bba",
                "expired_date": null,
                "id_number": "9120019021406",
                "agency_provider": "Dinas Penanaman Modal dan Pelayanan Terpadu Satu Pintu Kabupaten Jember - Lembaga Pengelola dan Penyelenggara OSS",
                "qualification": "-",
                "classification": "-",
                "equivalent": "-",
                "created_at": "2021-09-16T05:12:28.000000Z",
                "updated_at": "2021-09-16T05:12:28.000000Z",
                "deleted_at": null,
                "license": {
                  "id": "1ec143db-5bbe-6014-8549-00f48d5ca7a1",
                  "name": "NIB (Nomor Induk Berusaha)",
                  "created_at": null,
                  "updated_at": null,
                  "deleted_at": null
                }
              }
            ]
          },
          {
            "id": "1ec16026-d4c2-641c-95fc-00f48d5ca7a1",
            "name": "CV. Hidup Sejahtera Bersama",
            "phone": "085155399882",
            "bussiness_entity": "CV",
            "bussiness_type": "fashion",
            "npwp": "350800000000",
            "nib": "918392388108192381",
            "address": "Jl. Gn Ijen Tompokersan Lumajang",
            "postal_code": "673511",
            "total_employee": "10",
            "male_employee": "4",
            "female_employee": "4",
            "foreign_employee": "2",
            "vehicle_type": "car",
            "total_vehicle": "4",
            "land_ownership": "pribadi",
            "user_id": "1ec143db-5ac1-6c56-ba19-00f48d5ca7a1",
            "created_at": "2021-09-15T08:53:42.000000Z",
            "updated_at": "2021-09-15T08:53:42.000000Z",
            "deleted_at": null,
            "owners": [],
            "licenses": []
          }
        ]
      };

      return Response(jsonEncode(json), 200);
    }));

    final response = await company.getAll();

    debugPrint(response.message);

    expect(response.status, true);
  });
}
