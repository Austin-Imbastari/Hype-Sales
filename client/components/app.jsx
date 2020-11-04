import React from 'react';
import Headers from './header';
import ProductList from './product-list';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {

    };
  }

  render() {
    return (
      <React.Fragment>
        <Headers />
        <ProductList />
      </React.Fragment>
    );
  }
}
