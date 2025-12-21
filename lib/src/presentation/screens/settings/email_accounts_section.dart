import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pennypilot/src/presentation/providers/email_provider.dart';
import 'package:pennypilot/src/presentation/providers/auth_provider.dart';

class EmailAccountsSection extends ConsumerWidget {
  const EmailAccountsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // In a real implementation this would come from a provider listing all accounts
    // For now, we mock the logic or use the single auth user if logged in
    final authService = ref.watch(authServiceProvider);
    final connectedEmails = authService.connectedEmails;

    if (connectedEmails.isEmpty) {
      return ListTile(
        leading: const Icon(Icons.no_accounts),
        title: const Text('No accounts connected'),
        trailing: TextButton(
          onPressed: () => ref.read(emailServiceProvider).signIn(),
          child: const Text('Connect'),
        ),
      );
    }

    return Column(
      children: [
        ...connectedEmails.map((email) => ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.email),
          ),
          title: Text(email),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () => authService.signOut(email: email),
          ),
        )),
        
        ListTile(
          leading: const Icon(Icons.add_circle_outline),
          title: const Text('Add another account'),
          onTap: () => ref.read(emailServiceProvider).signIn(),
        ),
      ],
    );
  }
}
