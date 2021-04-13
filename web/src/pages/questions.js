import * as React from 'react';
import { useQuery, gql } from '@apollo/client';
import { CreateQuestionForm } from '../containers/create-question-form';
import { QuestionsConnectionList } from '../containers/questions-connection-list';

const QuestionsPageQuery = gql`
  query QuestionsPageQuery {
    questionsConnection {
      edges {
        node {
          ...QuestionsConnectionListQuestion
        }
      }
    }
  }
  ${QuestionsConnectionList.fragments.question}
`;

export default function QuestionsPage() {
  const query = useQuery(QuestionsPageQuery, { variables: { first: 10 } });

  return (
    <>
      <CreateQuestionForm />
      <QuestionsConnectionList {...query.data} />
    </>
  );
}
