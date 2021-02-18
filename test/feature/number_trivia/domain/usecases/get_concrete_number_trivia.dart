import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository{

}

void main(){
  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp((){
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });
  final theNumber = 1;
  final theNumberTrivia = NumberTrivia(text: 'test', number: 1);
  test(
    'should get trivia for the number from the repository',
      () async {
      //arrange
        when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
            .thenAnswer((_) async => Right(theNumberTrivia));
        //act
        final result = await usecase(number: theNumber);
        //assert
         expect(result, Right(theNumberTrivia));
         verify(mockNumberTriviaRepository.getConcreteNumberTrivia(theNumber));
         verifyNoMoreInteractions(mockNumberTriviaRepository);
      }
  );

}
