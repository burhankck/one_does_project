
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:one_does_project/presentation/resources/color_manager.dart';
import 'package:one_does_project/presentation/resources/values_manager.dart';

class IconManager {
  
  static Icon add = Icon(
    LineIcons.plus,
    size: AppSizeHeight.s24,
  );

  
  static Icon globe = const Icon(LineIcons.globe);
  

  static Icon building = const Icon(LineIcons.building);
  static Icon language = const Icon(Icons.language_outlined);
  static Icon check = Icon(
    Icons.check,
    color: ColorManager.instance.green,
  );

  static IconData user = LineIcons.user;
  static IconData hospital = LineIcons.hospitalSymbol;
  static IconData subject = LineIcons.sms;
  static IconData message = LineIcons.commentDotsAlt;
  static IconData comment = LineIcons.comment;
  static IconData lock = LineIcons.lock;
  static IconData exit = LineIcons.alternateSignOut;

  static IconData send = LineIcons.paperPlane;

  static IconData identificationCard = LineIcons.identificationCard;
  static IconData birthdayCake = LineIcons.birthdayCake;
  static IconData phone = LineIcons.phone;
  static IconData bloodType = Icons.bloodtype;
  static IconData identificationCardAlternate =
      LineIcons.alternateIdentificationCard;



  
  
 
  static IconData flask = LineIcons.flask;
  static Icon stethoscope = Icon(
    LineIcons.stethoscope,
    color: ColorManager.instance.primary,
  );

  static IconData stethoscopes = LineIcons.stethoscope;

 
  static Icon alternateMedicalFile36 = Icon(
    LineIcons.alternateMedicalFile,
    size: 36,
    color: ColorManager.instance.primary,
  );

  static IconData xRay = LineIcons.xRay;

  static IconData arrowLeft = LineIcons.arrowLeft;
  static IconData arrowRight = LineIcons.arrowRight;
  static IconData clock = LineIcons.clock;
  static IconData search = LineIcons.search;

  static Icon calendarPrimary = Icon(
    LineIcons.calendar,
    size: 28,
    color: ColorManager.instance.primary,
  );
}