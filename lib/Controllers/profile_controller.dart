import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:visitor_pass/Services/api-list.dart';
import 'package:visitor_pass/domain/profile_repository.dart';
import 'package:visitor_pass/main.dart';
import '/services/server.dart';
import '../Models/profile_model.dart';

@lazySingleton
class ProfileController extends GetxController {
  final ProfileRepository profileRepository;
  ProfileController(this.profileRepository);
  // UserService userService = UserService();
  Server server = Server();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController userNameCurrentController = TextEditingController();

  String? userID;
  String? employeeID;

  bool profileLoader = true;
  bool profileUpdateLoader = false;
  bool commonLoader = false;
  Profile profileUser = Profile();
  String? role;
  // List<Department>? allDepartments;
  // List<Designation>? allDesignations;

  // @override
  // void onInit() {
  //   getUserProfile();
  //   super.onInit();
  // }

  getUserProfile() async {
    // server.getRequest(endPoint: APIList.profile).then((response) async{
    // UserService userService = UserService();

    if (prefs.getString("profile") != "") {
      profileLoader = false;
      // final jsonResponse = json.decode(response.body);
      var profileData =
          Profile.fromJson(jsonDecode(prefs.getString("profile") ?? ""));
      profileUser = profileData;
      emailController.text = profileUser.email.toString();
      firstNameController.text = profileUser.first_name.toString();
      lastNameController.text = profileUser.last_name.toString();
      phoneController.text = profileUser.phone.toString();
      addressController.text =
          profileUser.address == null ? "" : profileUser.address.toString();
      userNameCurrentController.text = profileUser.username.toString();
      // role = profileData.data?.profile?.role;
      // allDepartments = profileData.data?.profile?.allDepartments;
      // allDesignations = profileData.data?.profile?.allDesignations;
      employeeID = profileUser.id.toString();
      Future.delayed(const Duration(milliseconds: 10), () {
        update();
      });
    }
    //  else {
    //   profileLoader = false;
    //   Future.delayed(const Duration(milliseconds: 10), () {
    //     update();
    //   });
    // }
    // });
  }

  updateUserProfile(filepath, type, context) async {
    // UserService userService = UserService();

    if (phoneController.text.isNotEmpty &&
        phoneController.text != await prefs.getString("phone")) {
      bool shouldProceed = await _showPhoneChangeDialog(context);
      if (!shouldProceed) {
        return;
      }
    }
    profileUpdateLoader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });

    if (type) {
      server
          .multipartRequest(
        endPoint: "${APIList.server}/api/v1/profile?upload_type=local",
        filepath: filepath,
      )
          .then((response) async {
        if (response != null && response.statusCode == 200) {
          if (prefs.getString("profile") != "") {
            var profileData =
                Profile.fromJson(jsonDecode(prefs.getString("profile") ?? ""));
            Profile newp = profileData.copyWith(
                image: json.decode(response.body)['file_url']);
            await prefs.setString('profile', jsonEncode(newp.toJson()));
            profileUpdateLoader = false;

            Future.delayed(const Duration(milliseconds: 10), () {
              update();
            });

            Get.back();
          }
        } else {
          profileUpdateLoader = false;

          Future.delayed(const Duration(milliseconds: 10), () {
            update();
          });
          Get.back();
        }
        getUserProfile();
      });
    }

    if (addressController.text != "" ||
        firstNameController.text != "" ||
        lastNameController.text != "" ||
        phoneController.text != "") {
      final r = profileRepository.updateUserProfile(
        address: addressController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneController.text,
      );

      r.then((result) {
        result.fold(
          (failure) {},
          (success) async {
            // UserService userService = UserService();
            if (phoneController.text.isNotEmpty &&
                phoneController.text != prefs.getString("phone")) {
              // emailController.clear();
              // firstNameController.clear();
              // lastNameController.clear();
              // addressController.clear();
              // phoneController.clear();

              // Phoenix.rebirth(context);
              // Get.find<GlobalController>().userLogout();
              // await userService.removeSharedPreferenceData();
              await prefs.clear();

              return;
            }
            if (prefs.getString("profile") != "") {
              var profileData = Profile.fromJson(
                  jsonDecode(prefs.getString("profile") ?? ""));
              Profile newp = profileData.copyWith(
                last_name: success.lastName,
                first_name: success.firstName,
                address: success.address,
                phone: success.phoneNumber,
              );

              await prefs.setString(
                'profile',
                jsonEncode(newp.toJson()),
              );

              getUserProfile();
            }
            // Get.rawSnackbar(
            //   snackPosition: SnackPosition.TOP,
            //   title: 'Success',
            //   message: 'Mis a jour du profile reussie',
            //   backgroundColor: AppColor.greenColor.withOpacity(.9),
            //   maxWidth: ScreenSize(context!).mainWidth / 1.004,
            //   margin: const EdgeInsets.only(
            //     bottom: 20,
            //     left: 20,
            //     right: 20,
            //   ),
            // );
            profileUpdateLoader = false;

            Future.delayed(const Duration(milliseconds: 10), () {
              update();
            });
            getUserProfile();

            Get.back();
          },
        );
      }).catchError((error) {
        profileUpdateLoader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(message: 'Please enter valid input');
      });
    }
  }
}

Future<bool> _showPhoneChangeDialog(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Attention!'),
            content: Text(
                'Changer votre numéro de téléphone vous déconnectera immédiatement. Voulez-vous continuer ?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Continue'),
              ),
            ],
          );
        },
      ) ??
      false;
}

class UserUpdatedModel {
  final String? firstName;
  final String? lastName;
  final String? address;
  final String? phoneNumber;
  UserUpdatedModel({
    this.firstName,
    this.lastName,
    this.address,
    this.phoneNumber,
  });
}
