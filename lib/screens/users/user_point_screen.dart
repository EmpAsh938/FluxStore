import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../common/config.dart';
import '../../common/constants.dart';
import '../../generated/l10n.dart';
import '../../models/index.dart' show UserModel, UserPoints, UserRewardPoints;
import '../../services/index.dart' show ServerConfig;

class UserPointScreen extends StatefulWidget {
  @override
  State<UserPointScreen> createState() => _StateUserPoint();
}

// Fake data for events
List<Map<String, String>> events = [
  {
    'points': '10',
    'description': 'Event 1 - Earned points!',
    'date': '2025-03-26',
  },
  {
    'points': '20',
    'description': 'Event 2 - Earned points!',
    'date': '2025-03-25',
  },
  {
    'points': '30',
    'description': 'Event 3 - Earned points!',
    'date': '2025-03-24',
  },
];

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

            // if (snapshot.hasError) {
            //   return Center(
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 20,
            //       ),
            //       child: Text(
            //         "${snapshot.error}",
            //         style: const TextStyle(color: Colors.red),
            //       ),
            //     ),
            //   );
            // }

            // if (!snapshot.hasData) {
            //   return const Center(
            //     child: Text(
            //         'Could not retreive data for the user'), // Or any message you want to show.
            //   );
            // }

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
                        // snapshot.data!.points.toString(),
                        'points',
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
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        S.of(context).events,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        for (var event in events)
                          ListTile(
                            trailing: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Text(
                                // event.points!,
                                '00',
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
                            title: Text(event['description']!),
                            subtitle: Text(
                              // event.date!,
                              'date',
                              style: TextStyle(
                                fontSize: 11,
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.6),
                              ),
                            ),
                          )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
