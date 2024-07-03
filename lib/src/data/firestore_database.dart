import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_hero/src/data/database_repository.dart';
import 'package:dev_hero/src/features/quiz/domain/leaderboard.dart';
import 'package:dev_hero/src/features/quiz/domain/quiz_game.dart';
import 'package:dev_hero/src/features/quiz/domain/score.dart';

class FirestoreDatabase implements DatabaseRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirestoreDatabase(this._firebaseFirestore);

  @override
  Future<List<QuizGame>> getQuizgames() async {
    final snapshot = await _firebaseFirestore.collection('quizGames').get();
    return snapshot.docs.map((doc) => QuizGame.fromMap(doc.data())).toList();
  }

  @override
  Future<void> addScore(Score score, QuizGame quizGame) {
    return _firebaseFirestore
        .collection('leaderboards')
        .doc(quizGame.id)
        .update({
      'scores': FieldValue.arrayUnion([score.toMap()]),
    });
  }

  @override
  Future<Leaderboard?> getLeaderboard(QuizGame quizGame) async {
    final snapshot = await _firebaseFirestore
        .collection('leaderboards')
        .doc(quizGame.id)
        .get();
    final map = snapshot.data();
    if (map == null) {
      return null;
    } else {
      return Leaderboard.fromMap(map);
    }
  }
}
