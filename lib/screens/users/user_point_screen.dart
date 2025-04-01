import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../common/config.dart';
import '../../common/constants.dart';
import '../../generated/l10n.dart';
import '../../models/index.dart'
    show
        PointHistory,
        UserModel,
        UserPointHistoryResponse,
        UserPoints,
        UserRewardPoints;
import '../../services/index.dart' show ServerConfig;

class UserPointScreen extends StatefulWidget {
  @override
  State<UserPointScreen> createState() => _StateUserPoint();
}

class _StateUserPoint extends State<UserPointScreen> {
  final dateWidth = 100;
  final pointWidth = 50;
  final borderWidth = 0.5;
  int totalCollectedPoints = 0;
  UserRewardPoints? userPoints;
  UserPointHistoryResponse? pointsHistory;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      // Fetch user points
      final userPointsResponse = await getUserPoint(context);

      // Fetch user points history
      final pointsHistoryResponse = await getPointsHistory(context);

      // If we successfully fetch the data, update the state
      setState(() {
        userPoints = userPointsResponse;
        pointsHistory = pointsHistoryResponse; // Fix here
        // Update total points collected
        totalCollectedPoints = pointsHistory!.pointHistory.length;
      });
    } catch (e) {
      // Handle errors if any
      print("Error fetching data: $e");
      // Optionally show an error message to the user
    }
  }

  Future<UserRewardPoints> getUserPoint(BuildContext context) async {
    try {
      // Get user model (assuming you're using provider for user data)
      final userModel = Provider.of<UserModel>(context, listen: false);

      // Check if user is available
      if (userModel.user == null) {
        throw Exception("User is not logged in");
      }

      // Make API request to get user points
      final response = await http.get(
        Uri.parse(
            'https://hakkaexpress.com/wp-json/yith-points/v1/user/${userModel.user!.id}'),
      );

      // Check if the response is successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response body and return the UserRewardPoints object
        return UserRewardPoints.fromJson(json.decode(response.body));
      } else {
        // If the server does not respond with a 200 status, throw an error
        throw Exception('Failed to load user points');
      }
    } catch (e) {
      // Handle any errors (e.g., network issues, JSON parsing errors)
      throw Exception('Error fetching user points: $e');
    }
  }

  Future<UserPointHistoryResponse> getPointsHistory(
      BuildContext context) async {
    try {
      // Get user model (assuming you're using provider for user data)
      final userModel = Provider.of<UserModel>(context, listen: false);

      // Check if user is available
      if (userModel.user == null) {
        throw Exception("User is not logged in");
      }

      // Make API request to get points history
      final response = await http.get(
        Uri.parse(
            'https://hakkaexpress.com/wp-json/yith-points/v1/point-history/${userModel.user!.id}'),
      );

      // Check if the response is successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response body and return the UserPointHistoryResponse object
        return UserPointHistoryResponse.fromJson(json.decode(response.body));
      } else {
        // If the server does not respond with a 200 status, throw an error
        throw Exception('Failed to load user points history');
      }
    } catch (e) {
      // Handle any errors (e.g., network issues, JSON parsing errors)
      throw Exception('Error fetching user points history: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        flexibleSpace: const Image(
          image: AssetImage('assets/images/app-bg.png'),
          fit: BoxFit.cover,
        ),
        title: Text(
          S.of(context).myPoints,
          style: const TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: userPoints != null && pointsHistory != null
          ? Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Card(
                      elevation: 2,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        width: 200,
                        height: 200,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Points',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'To Redeem',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              userPoints!.total_points!.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 35,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Total Collected: $totalCollectedPoints',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(indent: 15.0, endIndent: 15.0),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Points History',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: pointsHistory!.pointHistory.length,
                          itemBuilder: (context, index) {
                            final event = pointsHistory!.pointHistory[index];
                            return ListTile(
                              trailing: CircleAvatar(
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Text(
                                  event.amount,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                ),
                              ),
                              title: Text(event.description == ''
                                  ? capitalizeFirstLetter(
                                      event.action.split('_').join(' '))
                                  : capitalizeFirstLetter(event.description)),
                              subtitle: Text(
                                formatDate(event.dateEarning),
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.6),
                                ),
                              ),
                            );
                          },
                        ),
                        if (pointsHistory!.pointHistory.isEmpty)
                          const Center(
                            child: Text(
                              'No point history found for this user.',
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                      ],
                    )
                  ],
                ),
              ),
            )
          : Center(
              child: kLoadingWidget(
                  context)), // Display loading indicator until data is fetched
    );
  }

  String capitalizeFirstLetter(String text) {
    return text
        .split('_')
        .map((word) => word.isNotEmpty
            ? '${word[0].toUpperCase()}${word.substring(1)}'
            : '')
        .join(' ');
  }

  String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    return DateFormat('MMMM d, y').format(date);
  }
}
