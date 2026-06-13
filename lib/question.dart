class Question {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  Question({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

// 10 question
final List<Question> allQuestions = [
  Question(
    question: "What is the capital Bharat?",
    options: ["Kolkata", "Bengaluru", "New Delhi", "Mumbai"],
    correctIndex: 3,
    explanation: "Bharat/India's capital city is New Delhi",
  ),
  Question(
    question: 'Which planet is known as the Red Planet?',
    options: ['Earth', 'Venus', 'Mars', 'Jupiter'],
    correctIndex: 2,
    explanation:
        'Mars is called the Red Planet due to iron oxide on its surface.',
  ),
  Question(
    question: 'What is 5 × 6?',
    options: ['11', '30', '25', '56'],
    correctIndex: 1,
    explanation: '5 multiplied by 6 equals 30.',
  ),
  Question(
    question: 'Which language is primarily used for Flutter?',
    options: ['Kotlin', 'Swift', 'Dart', 'JavaScript'],
    correctIndex: 2,
    explanation: 'Dart is the programming language used by Flutter.',
  ),
  Question(
    question: 'What does HTTP stand for?',
    options: [
      'HyperText Transfer Protocol',
      'HighText Transfer Protocol',
      'Hyper Transfer Text Protocol',
      'HyperText Transmission Protocol',
    ],
    correctIndex: 0,
    explanation: 'HTTP stands for HyperText Transfer Protocol.',
  ),
  Question(
    question: 'Which animal is known as the King of the Jungle?',
    options: ['Tiger', 'Elephant', 'Lion', 'Giraffe'],
    correctIndex: 2,
    explanation: 'Lion is popularly known as the King of the Jungle.',
  ),
  Question(
    question: 'What is H2O commonly known as?',
    options: ['Salt', 'Water', 'Oxygen', 'Hydrogen'],
    correctIndex: 1,
    explanation: 'H2O is the chemical formula for water.',
  ),
  Question(
    question: 'What does CPU stand for?',
    options: [
      'Central Processing Unit',
      'Computer Performance Unit',
      'Central Program Unit',
      'Control Processing Unit',
    ],
    correctIndex: 0,
    explanation:
        "A Central Processing Unit (CPU) is the primary chip in a computer that performs instructions from programs by executing basic arithmetic, logic, control, and input/output (I/O) operations",
  ),
  Question(
    question: 'Which instrument has keys, pedals and strings?',
    options: ['Guitar', 'Piano', 'Violin', 'Flute'],
    correctIndex: 1,
    explanation: 'The piano has keys, pedals and strings inside it.',
  ),
  Question(
    question: 'What gas do plants absorb from the atmosphere?',
    options: ['Oxygen', 'Nitrogen', 'Carbon Dioxide', 'Hydrogen'],
    correctIndex: 2,
    explanation: 'Plants absorb carbon dioxide (CO2) for photosynthesis.',
  ),
];
