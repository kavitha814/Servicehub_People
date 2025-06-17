import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static Future<void> load() async {
    await dotenv.load(fileName: ".env");
  }
  
  static String get mongoUsername => dotenv.env['MONGO_USERNAME'] ?? '';
  static String get mongoPassword => dotenv.env['MONGO_PASSWORD'] ?? '';
  static String get mongoClusterUrl => dotenv.env['MONGO_CLUSTER_URL'] ?? '';
  static String get mongoDbName => dotenv.env['MONGO_DB_NAME'] ?? '';
  static String get mongoCollection => dotenv.env['MONGO_COLLECTION'] ?? '';
  
  static String get mongoConnectionString {
    return "mongodb+srv://$mongoUsername:$mongoPassword@$mongoClusterUrl/$mongoDbName?retryWrites=true&w=majority";
  }
}