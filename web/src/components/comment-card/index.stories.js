import React from 'react';
import { CommentCard } from '.';
import { withNextRouter } from 'storybook-addon-next-router';
import { action } from '@storybook/addon-actions';

export default {
  title: 'Cards/CommentCard',
  component: CommentCard,
  decorators: [withNextRouter],
};

export const renders = () => (
  <CommentCard
    author={{ username: 'lifeiscontent' }}
    body="Hello world!"
    createdAt={new Date(2000, 2, 1).toISOString()}
    id="1"
    onDelete={action('onDelete')}
  />
);

export const canDelete = () => (
  <CommentCard
    author={{ username: 'lifeiscontent' }}
    body="Hello world!"
    createdAt={new Date(2000, 2, 1).toISOString()}
    id="1"
    canDelete={{ value: true }}
    onDelete={action('onDelete')}
  />
);
