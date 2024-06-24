import * as React from 'react';
import { Button } from '.';

export default { title: 'Ui/Button', component: Button };
const Template = args => <Button {...args} />;
export const Main = Template.bind({});
Main.args = { children: 'The Button', disabled: false };
