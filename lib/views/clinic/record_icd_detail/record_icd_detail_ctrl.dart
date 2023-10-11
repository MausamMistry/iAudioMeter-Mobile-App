import 'package:get/get.dart';

class RecordICDDetailController extends GetxController {
  List records = [
    {
      "title": "Infective otitis externa, unspecified",
      "subMenu": [
        {
          "title": "Diffuse otitis externa, right ear",
          "favorties": "H60.311",
          "isSelected": true,
        },
        {
          "title": "Diffuse otitis externa, left ear",
          "favorties": "H60.312",
          "isSelected": false,
        }
      ],
      "isActive": true
    },
    {
      "title": "Impacted Cerumen Wax in ear",
      "subMenu": [
        {
          "title": "Diffuse otitis externa, right ear",
          "favorties": "H60.311",
          "isSelected": false,
        },
        {
          "title": "Diffuse otitis externa, left ear",
          "favorties": "H60.312",
          "isSelected": false,
        }
      ],
      "isActive": false
    }
  ];
}
