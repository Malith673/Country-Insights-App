import 'package:country_insights_app/providers/graphQL_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final countriesProvider =
    FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final client = ref.watch(graphQLClientProvider);

  const String countriesQuery = """
    query GetCountries {
      countries {
        name
        emoji
        capital
        continent {
          name
        }
      }
    }
  """;

  final result = await client.query(
    QueryOptions(
      document: gql(countriesQuery),
    ),
  );

  if (result.hasException) {
    throw result.exception!;
  }

  final List countries = result.data!['countries'];
  return countries.cast<Map<String, dynamic>>();
});
