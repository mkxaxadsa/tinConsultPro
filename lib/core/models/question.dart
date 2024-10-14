class Question {
  final String question;
  List<Answer> answers;
  Question({
    required this.question,
    required this.answers,
  });
}

class Answer {
  final String answer;
  final bool correct;
  bool active;

  Answer({
    required this.answer,
    required this.correct,
    this.active = false,
  });
}

List<Question> questionsList = [
  Question(question: 'What is inflation?', answers: [
    Answer(answer: 'Increase in the supply of money', correct: false),
    Answer(answer: 'Decrease in the general price level', correct: false),
    Answer(
        answer: 'Increase in the cost of living', correct: true), // Corrected
    Answer(answer: 'Decrease in the unemployment rate', correct: false),
  ]),
  Question(question: 'What does GDP stand for?', answers: [
    Answer(answer: 'Gross Domestic Price', correct: false),
    Answer(answer: 'General Demand Product', correct: false),
    Answer(answer: 'Gross Domestic Product', correct: true), // Corrected
    Answer(answer: 'General Demand Price', correct: false),
  ]),
  Question(
      question: 'Which of the following is not a function of money?',
      answers: [
        Answer(answer: 'Store of value', correct: false),
        Answer(answer: 'Unit of labor', correct: true), // Corrected
        Answer(answer: 'Medium of exchange', correct: false),
        Answer(answer: 'Unit of account', correct: false),
      ]),
  Question(question: 'What is fiscal policy?', answers: [
    Answer(
        answer: 'Government policy related to taxation and spending',
        correct: true), // Corrected
    Answer(answer: 'Monetary policy set by central banks', correct: false),
    Answer(answer: 'Policy related to foreign exchange rates', correct: false),
    Answer(answer: 'Policy regulating stock markets', correct: false),
  ]),
  Question(
      question:
          'Which of the following is a characteristic of a command economy?',
      answers: [
        Answer(
            answer: 'Private ownership of production resources',
            correct: false),
        Answer(
            answer: 'Centralized government control over production decisions',
            correct: true), // Corrected
        Answer(answer: 'Market-driven allocation of resources', correct: false),
        Answer(answer: 'Limited government intervention', correct: false),
      ]),
  Question(
      question: 'What is the role of the Federal Reserve in the United States?',
      answers: [
        Answer(answer: 'Fiscal policy implementation', correct: false),
        Answer(answer: 'Regulation of stock markets', correct: false),
        Answer(
            answer: 'Conducting monetary policy', correct: true), // Corrected
        Answer(answer: 'Enforcing antitrust laws', correct: false),
      ]),
  Question(
      question:
          'Which of the following is an example of expansionary monetary policy?',
      answers: [
        Answer(answer: 'Decreasing the money supply', correct: false),
        Answer(answer: 'Increasing interest rates', correct: false),
        Answer(answer: 'Selling government securities', correct: false),
        Answer(answer: 'Decreasing interest rates', correct: true), // Corrected
      ]),
  Question(
      question: 'What does the term \'opportunity cost\' refer to?',
      answers: [
        Answer(answer: 'The cost of buying a good or service', correct: false),
        Answer(
            answer: 'The benefit of choosing an alternative',
            correct: true), // Corrected
        Answer(answer: 'The total cost of production', correct: false),
        Answer(answer: 'The cost of raw materials', correct: false),
      ]),
  Question(
      question: 'Which of the following best describes a mixed economy?',
      answers: [
        Answer(
            answer: 'An economy where the government controls all production',
            correct: false),
        Answer(
            answer: 'An economy where production is based on supply and demand',
            correct: false),
        Answer(
            answer:
                'An economy that combines elements of market and command economies',
            correct: true), // Corrected
        Answer(
            answer: 'An economy with no government intervention',
            correct: false),
      ]),
  Question(question: 'What is the role of the World Bank?', answers: [
    Answer(
        answer: 'Providing loans and grants to developing countries',
        correct: true), // Corrected
    Answer(answer: 'Regulating international trade agreements', correct: false),
    Answer(answer: 'Setting global interest rates', correct: false),
    Answer(
        answer: 'Conducting research on global economic trends',
        correct: false),
  ]),
  Question(
      question: 'Which of the following is a characteristic of a recession?',
      answers: [
        Answer(answer: 'High inflation rates', correct: false),
        Answer(answer: 'Decreasing unemployment rates', correct: false),
        Answer(answer: 'Contraction of GDP', correct: true), // Corrected
        Answer(answer: 'Stable consumer spending', correct: false),
      ]),
  Question(
      question:
          'What is the function of central banks in managing monetary policy?',
      answers: [
        Answer(answer: 'Setting fiscal policy', correct: false),
        Answer(
            answer: 'Controlling inflation rates', correct: true), // Corrected
        Answer(answer: 'Regulating tax rates', correct: false),
        Answer(answer: 'Promoting economic growth', correct: false),
      ]),
  Question(
      question: 'Which of the following is an example of a trade barrier?',
      answers: [
        Answer(answer: 'Free trade agreement', correct: false),
        Answer(answer: 'Tariff on imports', correct: true), // Corrected
        Answer(answer: 'Currency exchange rate', correct: false),
        Answer(answer: 'Export subsidy', correct: false),
      ]),
  Question(question: 'What is the labor force participation rate?', answers: [
    Answer(
        answer:
            'Percentage of the population employed or actively seeking employment',
        correct: true), // Corrected
    Answer(
        answer: 'Percentage of the population employed in manufacturing',
        correct: false),
    Answer(answer: 'Rate of unemployment', correct: false),
    Answer(answer: 'Rate of inflation', correct: false),
  ]),
  Question(question: 'What is the purpose of antitrust laws?', answers: [
    Answer(answer: 'Regulating international trade', correct: false),
    Answer(
        answer: 'Preventing monopolies and promoting fair competition',
        correct: true), // Corrected
    Answer(answer: 'Controlling government spending', correct: false),
    Answer(answer: 'Reducing income inequality', correct: false),
  ]),
  Question(
      question:
          'Which of the following is a characteristic of a developed economy?',
      answers: [
        Answer(answer: 'High literacy rates', correct: true), // Corrected
        Answer(answer: 'Low per capita income', correct: false),
        Answer(answer: 'Limited access to healthcare', correct: false),
        Answer(answer: 'High infant mortality rates', correct: false),
      ]),
  Question(
      question: 'What is the difference between stocks and bonds?',
      answers: [
        Answer(
            answer:
                'Stocks represent ownership in a company; bonds represent debt',
            correct: true), // Corrected
        Answer(
            answer:
                'Stocks are issued by governments; bonds are issued by corporations',
            correct: false),
        Answer(
            answer: 'Stocks have fixed returns; bonds have variable returns',
            correct: false),
        Answer(
            answer:
                'Stocks are low-risk investments; bonds are high-risk investments',
            correct: false),
      ]),
  Question(question: 'What is a budget deficit?', answers: [
    Answer(
        answer: 'Government spending exceeds revenue in a fiscal year',
        correct: true), // Corrected
    Answer(
        answer: 'Government spending is less than revenue in a fiscal year',
        correct: false),
    Answer(answer: 'Total national debt', correct: false),
    Answer(answer: 'Trade deficit in a fiscal year', correct: false),
  ]),
  Question(
      question: 'Which of the following is an example of a regressive tax?',
      answers: [
        Answer(answer: 'Value-added tax (VAT)', correct: true), // Corrected
        Answer(answer: 'Progressive income tax', correct: false),
        Answer(answer: 'Corporate income tax', correct: false),
        Answer(answer: 'Wealth tax', correct: false),
      ]),
  Question(
      question: 'What is the role of the International Monetary Fund (IMF)?',
      answers: [
        Answer(answer: 'Providing humanitarian aid', correct: false),
        Answer(answer: 'Regulating global stock markets', correct: false),
        Answer(answer: 'Maintaining stable exchange rates', correct: false),
        Answer(
            answer:
                'Providing financial assistance and policy advice to countries',
            correct: true), // Corrected
      ]),
];
