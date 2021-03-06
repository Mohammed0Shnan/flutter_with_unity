// import 'package:barter/generated/l10n.dart';
// import 'package:barter/module_auth/enums/user_type.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class UserTypeSelector extends StatelessWidget {
//   final Function(UserRole) onUserChange;
//   final UserRole currentUserType;

//   UserTypeSelector({
//     @required this.onUserChange,
//     @required this.currentUserType,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned.fill(
//           child: Center(
//             child: Container(
//               width: 300,
//               child: AnimatedAlign(
//                   duration: Duration(seconds: 1),
//                   alignment: currentUserType == UserRole.ROLE_USER
//                       ? AlignmentDirectional.centerStart
//                       : AlignmentDirectional.centerEnd,
//                   child: Container(
//                     width: 150,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: Theme.of(context).primaryColor,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(' '),
//                     ), // For Sizing
//                   )),
//             ),
//           ),
//         ),
//         Positioned.fill(
//           child: Center(
//             child: Container(
//               width: 300,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     width: 150,
//                     child: FlatButton(
//                       onPressed: () {
//                         onUserChange(UserRole.ROLE_USER);
//                       },
//                       child: Text(
//                         'User',
//                        // S.of(context).captain,
//                         style: TextStyle(
//                           color: currentUserType == UserRole.ROLE_USER
//                               ? Colors.white
//                               : Theme.of(context).brightness == Brightness.dark
//                                   ? Colors.white
//                                   : Colors.black87,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 150,
//                     child: FlatButton(
//                       onPressed: () {
//                         onUserChange(UserRole.ROLE_COMPANY);
//                       },
//                       child: Text(
//                        'Company',
//                       //  S.of(context).storeOwner,
//                         style: TextStyle(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
