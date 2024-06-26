import 'package:angkas_clone_app/screens/messaging/inbox_screen.dart';
import 'package:angkas_clone_app/screens/registration/number_verification_screen.dart';
import 'package:angkas_clone_app/screens/rider-side/rider_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomNavigationDrawer extends ConsumerWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountProvider);

    return Drawer(
      width: 264,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/sidebar_header.png'),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      'assets/images/profile_placeholder.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        '${account.firstName!} ${account.lastName}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('History'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PassengerHistoryScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark_border_outlined),
            title: const Text('Saved Places'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment_outlined),
            title: const Text('Payment Options'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.headset_mic_outlined),
            title: const Text('Support'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat_bubble_outline),
            title: const Text('Inbox'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InboxScreen()));
            },
          ),
        ],
      ),
    );
  }
}
