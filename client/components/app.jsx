import React from 'react';
import Headers from './header';
import ProductDetails from './product-details';
import ProductList from './product-list';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: { name: 'catalog', params: {} }
    };
    this.setView = this.setView.bind(this);
  }

  setView(x, p) {
    this.setState({ view: { name: x, params: p } });
  }

  render() {
    const isCatalog = this.state.view.name === 'catalog';
    let display;

    if (isCatalog) {
      display = <ProductList setView={this.setView}/>;
    } else {
      display = <ProductDetails productId={this.state.view.params} />;
    }

    return (
      <React.Fragment>
        <Headers />
        {display}
      </React.Fragment>
    );
  }
}
