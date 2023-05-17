import 'questions.dart';
class QuestionBank {
  int _questionNumber=0;
  final List<Questions> _listOfQuestions=[
    Questions("Java is pure Object Oriented Programming language?",true),
    Questions('C++ is slower as compared to java in terms of performance and speed?',false),
    Questions('Java contains pointers?',false),
    Questions('It is not possible to achieve inheritance of structures in c++?',false),
    Questions('Super classes are also called Parent classes/Base classes.',true),
    Questions('Assignment operator is evaluated Left to Right.',false),
    Questions('Constructor overloading is not possible in Java.',false),
    Questions('The JRE deletes objects when it determines that they are no longer being used. This process is called Garbage Collection.',true),
    Questions('All binary operators except for the assignment operators are evaluated from Left to Right',true),
    Questions('Java programming is not statically-typed, means all variables should not first be declared before they can be used.',false),
  ];

  int getListLength()
  {
    return _listOfQuestions.length;
  }

  int getQuestionNum()
  {
    return _questionNumber;
  }
  void increaseQNum()
  {
    if(_questionNumber<_listOfQuestions.length-1) {
      _questionNumber++;
    }
  }

  Questions getQuestions()
  {
    return _listOfQuestions[_questionNumber];
  }

}