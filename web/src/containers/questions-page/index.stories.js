import * as React from 'react';
import { QuestionsPage, QuestionsPageQuery } from '.';

export default { title: 'QuestionsPage', component: QuestionsPage };
export const Main = () => <QuestionsPage />;
Main.parameters = {
  nextRouter: { params: { first: 10 } },
  apolloClient: {
    mocks: [
      {
        request: {
          query: QuestionsPageQuery,
          variables: { first: 10 },
        },
        result: {
          data: {
            questionsConnection: {
              edges: [
                {
                  node: {
                    id: '200',
                    body:
                      'Et ut rerum. Exercitationem magni ut. Vitae iusto molestias. Est accusantium ea. At aut iusto. Est officia temporibus. Dolores provident maxime. Nobis atque aliquam. Aut impedit reprehenderit. Consequatur eos quia.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '199',
                    body:
                      'Amet ab doloribus. Recusandae natus temporibus. Rem quidem quae. Quasi unde ullam. Labore itaque rerum. Esse dolor tempore. Cumque impedit dolorem. Tenetur et et. Voluptatum tenetur qui. Dolores quod quibusdam.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '198',
                    body:
                      'Libero nam autem. Ut sit hic. Magni sunt qui. Rerum inventore consequatur. A laborum temporibus. Aut commodi corrupti. Quidem amet et. Iste laborum commodi. Ipsa quae cum. Illum esse quam.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '197',
                    body:
                      'Suscipit ut laudantium. Odio repellat dignissimos. Ut facilis ea. Doloremque aliquam nemo. Sint deserunt id. Ullam earum quod. Est dolorem ut. Et error officia. Possimus eum quo. Rerum repellat in.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '196',
                    body:
                      'Voluptas odit at. Autem voluptate numquam. Repudiandae sit iusto. Dicta eligendi quo. Error aut ducimus. Id quos dignissimos. Et provident molestiae. Itaque debitis necessitatibus. Expedita esse in. Magnam rem porro.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '195',
                    body:
                      'Aut et possimus. Reprehenderit eveniet officiis. Quia laboriosam omnis. Voluptas quas ab. Autem nisi odio. Aut velit et. Omnis sapiente molestiae. Voluptates ut asperiores. Provident tenetur iure. Repellat quaerat similique.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '194',
                    body:
                      'Fugiat sint est. Maxime officia a. Eaque iusto beatae. Dolores omnis ut. Nisi saepe soluta. Velit itaque consequatur. Id totam vel. Quia ipsa perspiciatis. Et quas quaerat. Expedita reprehenderit quaerat.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '193',
                    body:
                      'Dolorum quam esse. Occaecati similique dolor. Adipisci illum commodi. Eligendi sunt nam. Quis voluptatum est. Nesciunt repellendus tenetur. Vero beatae exercitationem. Eos illum enim. Ad sit quisquam. Nam modi nihil.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '192',
                    body:
                      'Corrupti qui aperiam. Dolor reprehenderit minus. Ut autem ut. Enim vero dolorem. Praesentium nostrum ipsum. Quis est quas. Quis omnis est. Nam eum hic. Autem rem modi. Aut explicabo ab.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '191',
                    body:
                      'Blanditiis iste modi. Cum ducimus eos. Molestiae quam labore. Nihil repellendus molestiae. Nostrum eveniet dolorem. Necessitatibus eius esse. Vitae et mollitia. Dolorem est est. Veritatis rerum aspernatur. Aperiam culpa maiores.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '190',
                    body:
                      'Nihil ut est. Dolor repellat perspiciatis. Ut dolore illo. Perferendis ut eaque. Vel earum quis. Cum blanditiis ad. Maiores quisquam et. Ea sunt atque. Facere ut quisquam. Aliquid rem nostrum.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '189',
                    body:
                      'Nulla voluptatem consectetur. Vel dolor maiores. Molestias vero et. Voluptas voluptatum non. Voluptatum delectus consequatur. Velit accusantium est. Iusto architecto qui. Quaerat accusamus omnis. Voluptatem ipsa molestiae. Quis vero fugit.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '55',
                    body:
                      'Suscipit occaecati repudiandae. Culpa non ut. Libero et non. Illo quisquam inventore. Vel voluptas dignissimos. Eligendi error nihil. Corrupti corporis qui. Illo eum dolorem. Occaecati vero dolore. Et architecto consequatur.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '54',
                    body:
                      'Officiis ea et. Quis omnis aut. Repellendus eum totam. Iusto voluptas in. Eos incidunt autem. Animi officia aut. At eos tempore. Optio vero et. Libero earum sunt. Et molestiae optio.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '53',
                    body:
                      'Quae reiciendis sit. Delectus illum iste. Tempora ut non. Quod dolor quo. Illo nam saepe. Praesentium qui beatae. Nam voluptate tempore. Excepturi et amet. Omnis nulla eveniet. Voluptatem quas perferendis.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '52',
                    body:
                      'Et iure eius. Occaecati perspiciatis delectus. Placeat voluptate est. Qui deserunt quo. Est sit aspernatur. Ducimus quo animi. Quidem sit similique. Dolores quo placeat. Officia natus et. Sit optio asperiores.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '51',
                    body:
                      'Debitis et dolorem. Qui ut veniam. Est iusto officiis. Iusto quisquam pariatur. Tenetur vitae est. Omnis quas enim. Deserunt quaerat nemo. Eum beatae qui. Dolorum enim modi. Inventore doloremque labore.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '50',
                    body:
                      'Eligendi non consectetur. Qui odio nulla. Deserunt dolorum quia. Et minus voluptas. Nam est consectetur. Exercitationem et quaerat. Ullam quaerat est. Ut voluptas omnis. Accusantium rerum non. Voluptas qui hic.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '49',
                    body:
                      'Iure veniam saepe. Fuga atque tempora. Excepturi est veniam. Qui odio maxime. Vero nihil tenetur. Sit voluptate aut. Aut voluptas amet. Est dolores molestiae. Voluptate ut distinctio. Quod corporis accusantium.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '48',
                    body:
                      'Itaque eos et. Delectus vitae consequuntur. Aliquid laborum enim. Veritatis consequatur qui. Non qui aut. Quasi consequatur at. Aut libero perferendis. Consequuntur qui et. Iusto recusandae eos. Dolorem sed esse.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '47',
                    body:
                      'Aut enim voluptatem. Cumque deleniti doloribus. Expedita nisi quos. Iste est qui. Inventore aut fuga. Vel doloribus dolor. Et ut et. Dolor eum velit. Numquam sint quibusdam. Ad ut eaque.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '46',
                    body:
                      'Asperiores est veniam. Quis et tempore. Tempore reprehenderit qui. Et veniam explicabo. Tenetur incidunt quo. Possimus excepturi corporis. Corporis libero perspiciatis. Doloribus non voluptas. Voluptas numquam deserunt. Id alias labore.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '45',
                    body:
                      'Aut possimus dolor. Eveniet deserunt ipsam. Velit perferendis expedita. Vero nihil velit. Eveniet dignissimos saepe. Vel odit sit. Architecto repudiandae enim. Quod reprehenderit et. Sint consequatur voluptatum. Eos magni vel.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '44',
                    body:
                      'Ut aut aperiam. Animi sed voluptatem. Repellendus quis inventore. Esse et assumenda. Corporis eum et. Inventore odio quia. Et reiciendis repellat. Facere exercitationem dolores. Dolorum pariatur qui. Inventore nemo saepe.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '43',
                    body:
                      'Saepe cupiditate autem. Nulla dolor qui. Quae libero magnam. Qui voluptatum ipsum. Et qui explicabo. Veritatis aliquid expedita. Dignissimos et molestiae. Tenetur debitis est. Tempora quaerat nostrum. Omnis nihil harum.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
                {
                  node: {
                    id: '1',
                    body:
                      'Quas vel atque. Tempore id mollitia. Laudantium sed deserunt. Nihil quaerat cupiditate. Id sit dolor. Odio ipsum asperiores. Distinctio sint consequatur. Error repudiandae ut. A ad cum. Rerum similique et.',
                    __typename: 'Question',
                  },
                  __typename: 'QuestionEdge',
                },
              ],
              __typename: 'QuestionConnection',
            },
          },
        },
      },
    ],
  },
};
