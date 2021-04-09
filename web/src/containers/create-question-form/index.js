import React from 'react';
import { useMutation, gql } from '@apollo/client';

function formReducer(state, partial) {
  return { ...state, ...partial };
}

const DEFAULT_FORM = { body: '', tagIds: [] };

export function CreateQuestionForm() {
  const [form, setForm] = React.useReducer(formReducer, DEFAULT_FORM);
  const [createQuestion] = useMutation(
    CreateQuestionFormCreateQuestionMutation,
    {
      update(cache, response) {
        cache.modify({
          fields: {
            questionsConnection(questionsConnection) {
              const newQuestionRef = cache.writeFragment({
                data: response.data.createQuestion.question,
                fragment: gql`
                  fragment CreateQuestionFormNewQuestion on Question {
                    id
                    body
                  }
                `,
              });

              return {
                ...questionsConnection,
                edges: [newQuestionRef, ...questionsConnection.edges],
              };
            },
          },
        });
      },
    }
  );

  const handleChange = event => {
    event.preventDefault();
    event.stopPropagation();

    const { name, value } = event.currentTarget;

    setForm({ [name]: value });
  };

  const handleSubmit = event => {
    event.preventDefault();
    createQuestion({ variables: { input: form } }).then(() =>
      setForm(DEFAULT_FORM)
    );
  };

  return (
    <form onSubmit={handleSubmit}>
      <div>
        <label>Body</label>
        <textarea name="body" onChange={handleChange} value={form.body} />
      </div>
      <div>
        <button type="submit">Create Question</button>
      </div>
    </form>
  );
}

const CreateQuestionFormCreateQuestionMutation = gql`
  mutation CreateQuestionFormCreateQuestionMutation(
    $input: CreateQuestionInput!
  ) {
    createQuestion(input: $input) {
      question {
        id
        body
      }
    }
  }
`;
