import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:visitor_pass/Services/api-list.dart';
import 'package:visitor_pass/domain/profile_repository.dart';
import 'package:visitor_pass/main.dart';
import '../Services/server.dart';
import '../Models/profile_model.dart';
import '../Models/user_updated_model.dart';

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

  updateUserProfile(dynamic fileData, bool type, BuildContext context, {String? fileName}) async {
    // UserService userService = UserService();

    if (phoneController.text.isNotEmpty &&
        phoneController.text != await prefs.getString("phone")) {
      bool shouldProceed = await _showPhoneChangeDialog(context);
      if (!shouldProceed) {
        return;
      }
    }
    profileUpdateLoader = true;
    update();

    try {
      if (type) {
       
        try {
          if (fileData is String) {
            print("1==============fileData:");
            // Original mobile approach with filepath
            server.multipartRequest(
              endPoint: "${APIList.server}/api/v1/profile?upload_type=online",//CNPS
              filepath: fileData,
            ).then((response) {
              if (response != null) {
                _handleProfileUpdateResponse(response);
              }
            });
          } else if (fileData is Uint8List) {
              // Web approach with bytes
            server.multipartRequestWithBytes(
              endPoint: "${APIList.server}/api/v1/profile?upload_type=online",//CNPS
              bytes: fileData,
              fileName: fileName ?? "profile_image${prefs.getString("user-id")}_${DateTime.now().millisecondsSinceEpoch}.jpg",
            ).then((response) {
              if (response != null) {
                _handleProfileUpdateResponse(response);
              }
            });
          }
        } catch (e) {
          print('Error uploading file: $e');
        }
      }

      if (addressController.text.isNotEmpty ||
          firstNameController.text.isNotEmpty ||
          lastNameController.text.isNotEmpty ||
          phoneController.text.isNotEmpty) {
        
        final result = await profileRepository.updateUserProfile(
          address: addressController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          phoneNumber: phoneController.text,
        );

        result.fold(
          (failure) {
            // Handle failure
            print('Profile update failed: $failure');
          },
          (UserUpdatedModel success) async {
            if (phoneController.text.isNotEmpty &&
                phoneController.text != prefs.getString("phone")) {
              await prefs.clear();
              return;
            }
            
            if (prefs.getString("profile") != "") {
              var profileData = Profile.fromJson(
                  jsonDecode(prefs.getString("profile") ?? ""));
              Profile newp = profileData.copyWith(
                last_name: success.lastName ?? profileData.last_name,
                first_name: success.firstName ?? profileData.first_name,
                address: success.address ?? profileData.address,
                phone: success.phoneNumber ?? profileData.phone,
              );

              await prefs.setString(
                'profile',
                jsonEncode(newp.toJson()),
              );
            }
            
            profileUpdateLoader = false;
            update();
            Get.back();
          },
        );
      } else {
        profileUpdateLoader = false;
        update();
        Get.back();
      }
    } catch (e) {
      print('Error updating profile: $e');
      profileUpdateLoader = false;
      update();
      Get.back();
    }
  }

  void _handleProfileUpdateResponse(dynamic response) async {
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
}
