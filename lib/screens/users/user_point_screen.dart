import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../common/config.dart';
import '../../common/constants.dart';
import '../../generated/l10n.dart';
import '../../models/index.dart'
    show UserModel, UserPointHistoryResponse, UserPoints, UserRewardPoints;
import '../../services/index.dart' show ServerConfig;

class UserPointScreen extends StatefulWidget {
  @override
  State<UserPointScreen> createState() => _StateUserPoint();
}

class _StateUserPoint extends State<UserPointScreen> {
  final dateWidth = 100;
  final pointWidth = 50;
  final borderWidth = 0.5;

  Future<UserRewardPoints> getUserPoint(BuildContext context) async {
    try {
      // Get user model
      final userModel = Provider.of<UserModel>(context, listen: false);

      // Check if user is available
      if (userModel.user == null) {
        throw Exception("User is not logged in");
      }

      // Make API request
      final response = await http.get(
        Uri.parse(
            'https://hakkaexpress.com/wp-json/yith-points/v1/user/${userModel.user!.id}'),
      );

      // Check if the response is successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response body
        return UserRewardPoints.fromJson(json.decode(response.body));
      } else {
        // If the server does not respond with a 200 status, throw an error
        throw Exception('Failed to load user points');
      }
    } catch (e) {
      // Handle any errors
      throw Exception('Error fetching user points: $e');
    }
  }

  Future<UserPointHistoryResponse> getPointsHistory(
      BuildContext context) async {
    try {
      // Get user model
      final userModel = Provider.of<UserModel>(context, listen: false);

      // Check if user is available
      if (userModel.user == null) {
        throw Exception("User is not logged in");
      }

      // Make API request
      final response = await http.get(
        Uri.parse(
            'https://hakkaexpress.com/wp-json/yith-points/v1/point-history/${userModel.user!.id}'),
      );

      // Check if the response is successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response body
        return UserPointHistoryResponse.fromJson(json.decode(response.body));
      } else {
        // If the server does not respond with a 200 status, throw an error
        throw Exception('Failed to load user points history');
      }
    } catch (e) {
      // Handle any errors
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
            style: const TextStyle(
              // color: Theme.of(context).colorScheme.secondary,
              color: Colors.white,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              // color: Theme.of(context).colorScheme.secondary,
              color: Colors.white,
            ),
          ),
        ),
        body: FutureBuilder<UserRewardPoints>(
          future: getUserPoint(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Align(
                alignment: Alignment.center,
                child: kLoadingWidget(context),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    "${snapshot.error}",
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            }

            if (!snapshot.hasData) {
              return const Center(
                child: Text(
                    'Could not retreive data for the user'), // Or any message you want to show.
              );
            }

            // Data is available, now display the user points.
            final userPoints = snapshot.data;

            return Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      trailing: Text(
                        userPoints!.total_points!.toString(),
                        // 'points',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 35,
                                ),
                      ),
                      title: Text(
                        S.of(context).myPoints,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Divider(indent: 15.0, endIndent: 15.0),
                    const Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Points History',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        FutureBuilder<UserPointHistoryResponse>(
                          future: getPointsHistory(context),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Align(
                                alignment: Alignment.center,
                                child: kLoadingWidget(context),
                              );
                            }

                            if (snapshot.hasError) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    "${snapshot.error}",
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                              );
                            }

                            if (!snapshot.hasData) {
                              return const Center(
                                child: Text(
                                  'No data available. Please try again later.',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              );
                            }

                            if (snapshot.data!.pointHistory.isEmpty) {
                              return const Center(
                                child: Text(
                                  'No point history found for this user.',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              );
                            }

                            final pointsHistory = snapshot.data!.pointHistory;

                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: pointsHistory.length,
                              itemBuilder: (context, index) {
                                final event = pointsHistory[index];

                                return ListTile(
                                  trailing: CircleAvatar(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
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
                                      : capitalizeFirstLetter(
                                          event.description)),
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
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
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
