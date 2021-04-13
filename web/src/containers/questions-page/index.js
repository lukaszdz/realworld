import * as React from 'react';
import { useQuery, gql } from '@apollo/client';
import { CreateQuestionForm } from '../create-question-form';
import { QuestionsConnectionList } from '../questions-connection-list';

export const QuestionsPageQuery = gql`
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

export function QuestionsPage() {
  const query = useQuery(QuestionsPageQuery, { variables: { first: 10 } });
  console.log(query);

  return (
    <>
      <CreateQuestionForm />
      <QuestionsConnectionList {...query.data} />
    </>
  );
}
