import React from 'react';
import Headers from './header';
import ProductDetails from './product-details';
import ProductList from './product-list';
import CartSummary from './cart-summary';

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
    // console.log(product);
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
    const displayName = this.state.view.name;
    let display;

    if (displayName === 'catalog') {
      display = <ProductList setView={this.setView}/>;
    } else if (displayName === 'detail') {
      display = <ProductDetails addToCart={this.addToCart} productId={this.state.view.params} setView={this.setView}/>;
    } else if (displayName === 'cart') {
      display = <CartSummary cartItems={this.state.cart} setView={this.setView} />;
    } else {
      display = <p>Nothing to display</p>;
    }

    return (
      <React.Fragment>
        <Headers cartItemCount={this.state.cart.length} setView={this.setView}/>
        {display}
      </React.Fragment>
    );
  }
}
