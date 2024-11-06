import 'package:country_insights_app/providers/country_provider.dart';
import 'package:country_insights_app/views/country_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countriesAsyncValue = ref.watch(countriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Insights'),
      ),
      body: countriesAsyncValue.when(
        data: (countries) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return Column(
                  children: [
                    CountryDetailsWidget(
                      emoji: country['emoji'],
                      country: country['name'],
                      continent:
                          '${country['capital']}, ${country['continent']['name']}',
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                );

                // return ListTile(
                //   leading: Text(country['emoji'], style: TextStyle(fontSize: 24)),
                //   title: Text(country['name']),
                //   subtitle: Text(
                //       '${country['capital']}, ${country['continent']['name']}'),
                //   onTap: () {},
                // );
              },
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
