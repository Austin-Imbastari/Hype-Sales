import React from 'react';
import Headers from './header';
import ProductDetails from './product-details';
import ProductList from './product-list';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: { name: 'catalog', params: {} },
      cart: []
    };
    this.setView = this.setView.bind(this);
    this.addToCart = this.addToCart.bind(this);
  }

  getCartItems() {
    fetch('/api/cart')
      .then(res => res.json());
  }

  addToCart(product) {
    console.log(product);
    fetch('/api/cart', {
      method: 'POST',
      headers: {
        'Content-type': 'application/json'
      },
      body: JSON.stringify({
        productId: product.productId
      })
    })
      .then(result => result.json())
      .then(json => {
        const data = this.state.cart.slice();
        data.push(json);
        this.setState({
          cart: data
        });
      });
  }

  componentDidMount() {
    this.getCartItems();
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
      display = <ProductDetails addToCart={this.addToCart} productId={this.state.view.params} />;
    }

    return (
      <React.Fragment>
        <Headers cartItemCount={this.state.cart.length}/>
        {display}
      </React.Fragment>
    );
  }
}
