// ignore_for_file: unused_local_variable

class ChatSettingsModel {
  final String? nameSection;
  final String? title;
  final String? icon;
  final String? subTitle;

  const ChatSettingsModel(
      {this.nameSection, this.title, this.icon, this.subTitle});
}

// class Solution {
//   int climbStairs(int n) {
//     if (n == 1) {
//       return 1;
//     } else if (n == 2) {
//       return 2;
//     }

//     int first = 1;
//     int second = 2;
//     int result = 0;

//     for (int i = 3; i <= n; i++) {
//       result = first + second;
//       first = second;
//       second = result;
//     }

//     return result;
//   }
// }
// class Solution {
//   int minCostClimbingStairs(List<int> cost) {
//     if (cost.length == 2) {
//       return cost[1] < cost[0] ? cost[1] : cost[0];
//     } else if (cost.length == 1) {
//       return cost[0];
//     }

//     int first = cost[0];
//     int second = cost[1];
//     int result = 0;

//     for (int i = 2; i < cost.length; i++) {
//       result = first + second;
//       first = second;
//       second = result;
//     }

//     return result < first ? result : first;
//   }
// }

// class Solution {
//   int minCostClimbingStairs(List<int> cost) {
//     if (cost.length == 0) {
//       return 0;
//     } else if (cost.length == 1) {
//       return cost[0];
//     }

//     int first = cost[0];
//     int second = cost[1];

//     for (int i = 2; i < cost.length; i++) {
//       int currentCost = cost[i] + (first < second ? first : second);
//       first = second;
//       second = currentCost;
//     }

//     return first < second ? first : second;
//   }
// }

class HouseRobber {
  int rob(List<int> nums) {
    if (nums.length < 2) {
      return nums[0];
    }

    List<int> dp = List<int>.filled(nums.length, 0);

    dp[0] = nums[0];
    dp[1] = nums[0] > nums[1] ? nums[0] : nums[1];

    for (int i = 2; i < nums.length; i++) {
      dp[i] =
          (dp[i - 2] + nums[i]) > dp[i - 1] ? (dp[i - 2] + nums[i]) : dp[i - 1];
    }

    return dp[nums.length - 1];
  }
}
