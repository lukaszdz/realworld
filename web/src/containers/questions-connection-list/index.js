import { gql } from '@apollo/client';

export function QuestionsConnectionList({ questionsConnection }) {
  if (!questionsConnection || questionsConnection.edges.length === 0)
    return null;

  return (
    <ul>
      {questionsConnection.edges.map(edge => (
        <li key={edge.node.id}>{edge.node.body}</li>
      ))}
    </ul>
  );
}

QuestionsConnectionList.fragments = {
  question: gql`
    fragment QuestionsConnectionListQuestion on Question {
      id
      body
    }
  `,
};
