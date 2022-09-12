import 'package:flutter_sound_lite/public/flutter_sound_player.dart';
import 'package:seven_minutes/JoinGroup/JoinGroupManager.dart';
import 'package:seven_minutes/activityLog/ActivityLogManager.dart';
import 'package:seven_minutes/groupUsers/GroupUsersManager.dart';
import 'package:seven_minutes/groupUsers/UsersGroupModel.dart';
import 'package:seven_minutes/login/UserManager.dart';
import 'package:seven_minutes/pitem/GetPrayerPostsManager.dart';
import 'package:seven_minutes/qitem/GetPostsManager.dart';
import 'package:seven_minutes/register/RegisterAsAmemberManager.dart';
import 'package:seven_minutes/register/RegisterGroupLeaderManager.dart';
import 'package:seven_minutes/sitem/GetSunnahPostsManager.dart';

import '../getlogs/GetLogsManager.dart';
import '../oneDayOneRaku/GetMTStockManager.dart';
import '../oneDayOneRaku/GetMTStockModel.dart';
import '../oneDayOneRaku/GetMTStockModel.dart';
import '../qitem/GetPosts.dart';

class Overseer {
  Map<dynamic, dynamic> repository = {};

  static FlutterSoundPlayer? playeraudio;
  static String cat_id = "2";
  static String audio_file = "";
  static String csrf_token_overseer = "";
 // static int? logged_in_user_id;
  static String logged_in_user_st = "";
  static String register_status = "";
  static String email = "";
  static String groupUniqueId = "";
  static String activityLogMessage = "";
  static String joinGroupMessage = "";
  static String confirmMemberRequest = "";
  static String phoneNumber = "";
  static String groupName = "";
  static String groupId = "";
  static String password = "";
  static String confirmPassword = "";
  static String firstName = "";
  static String lastName = "";
  static String gender = "Male";
  static int playtime = 0;
  static String message = "";
  static String userMessageDetails = "";
  static String login_status = "";
  static String topicId = "0";
  static String groupStatusCode = "";
  static String user_rule = "user";
  static bool is_user_valid = false;
  static bool isSwitched = false;
  static bool is_user_Registered = false;
  static bool is_GroupLeader_Registered = false;
  static bool addActivity = false;
  static bool groupMemberRequest = false;
  static bool confirmGroupMemberRequest = false;
  static int jumpToIndex = 1000;

  static bool isGroupMember = false;
  static bool isGroupLeader = false;
  static bool isLoadingDone = false;
  static String roleName = "";
  static int userId = 0;
  static String userName = "";
  static List<int> dataIndexList = List<int>.empty();
  static List<int> scrollJumpToList = List<int>.empty();


  static String userAction = "";
  static List<Data1> myGroupData  = new List<Data1>.empty();
  static List<GetPosts> quranAactivePostList  = new List<GetPosts>.empty();
  static List<AdminMaterails> myAdminMaterialList  = new List.empty();
  static List<AdminProjects> myAdminProjects  = new List.empty();
  static List<AdminTools> myAdminToolList  = new List.empty();

  Overseer() {
    register(UserManager, UserManager());
    register(RegisterGroupLeaderManager, RegisterGroupLeaderManager());
    register(RegisterAsAMemberManager, RegisterAsAMemberManager());
    register(GetPostsManager, GetPostsManager());
    register(GetSunnahPostsManager, GetSunnahPostsManager());
    register(GetPrayerPostsManager, GetPrayerPostsManager());
    register(GetPrayerPostsManager, GetPrayerPostsManager());
    register(GroupUsersManager, GroupUsersManager());
    register(ActivityManager, ActivityManager());
    register(JoinGroupManager, JoinGroupManager());
    register(GetLogsManager,GetLogsManager());
    register(GetMTStockManager,GetMTStockManager());


// register managers
  }

  static printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  // register the manager to this overseer to store in repository
  register(name, object) {
    repository[name] = object;
  }

  // get the required manager from overseer when needed
  fetch(name) {
    return repository[name];
  }
}
