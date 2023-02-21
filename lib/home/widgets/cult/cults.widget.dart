import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/cult/providers/cults.provider.dart';
import 'package:app/home/widgets/cult/cult.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CultsWidget extends ConsumerWidget {
  const CultsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;

    final c = ref.watch(asyncCultsProvider);

    Widget separator() {
      return const SizedBox(height: 15.0);
    }

    return c.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (cults) => Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: SizedBox(
          height: height * 0.75,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  final cult = cults[i];

                  return GestureDetector(
                    onTap: () => {},
                    child: CultWidget(cult: cult),
                  );
                },
                separatorBuilder: (c, i) => separator(),
                itemCount: cults.length,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
