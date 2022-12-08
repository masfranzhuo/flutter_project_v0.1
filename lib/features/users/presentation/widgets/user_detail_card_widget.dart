import 'package:flutter/material.dart';
import 'package:flutter_project/core/extensions/date_time_extension.dart';
import 'package:flutter_project/features/users/models/user.dart';
import 'package:flutter_project/ui/extensions/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDetailCardWidget extends StatelessWidget {
  final User user;

  const UserDetailCardWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16.r, 16.r, 16.r, 0),
              child: ClipOval(
                child: Image.network(
                  user.picture,
                  errorBuilder: (context, obj, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.r, 8.r, 16.r, 0),
              child: Text(
                '${context.translate('model.user.title')}: ${user.title}',
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.r, 8.r, 16.r, 0),
              child: Text(
                '${context.translate('model.user.name')}: ${user.firstName} ${user.lastName}',
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.r, 8.r, 16.r, 0),
              child: Text(
                '${context.translate('model.user.email')}: ${user.email}',
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.r, 8.r, 16.r, 0),
              child: Text(
                '${context.translate('model.user.gender')}: ${user.gender}',
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.r, 8.r, 16.r, 0),
              child: Text(
                '${context.translate('model.user.dateOfBirth')}: ${user.dateOfBirth!.toDate()},',
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.r, 8.r, 16.r, 0),
              child: Text(
                '${context.translate('model.user.joinFrom')}: ${user.registerDate!.toDate()},',
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.r, 8.r, 16.r, 16.r),
              child: Text(
                '${context.translate('model.user.address')}: ${user.location?.country}, ${user.location?.state}, ${user.location?.city}, ${user.location?.street}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
