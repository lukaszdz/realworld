import styled from 'styled-components';

export const Button = styled.button`
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  padding: 12px 18px;

  background-color: #fd4752;
  border-radius: 4px;

  border-width: 0;

  font-family: 'Lato', sans-serif;
  font-style: normal;
  font-weight: bold;
  font-size: 12px;
  line-height: 18px;

  letter-spacing: 0.5px;

  color: #ffffff;
  &:hover {
    background-color: #fd1c2a;
  }
  &:active {
    background-color: #e30210;
  }
  &:disabled {
    background-color: #fd4752;
    opacity: 0.6;
  }
`;
