import React from 'react';
import ProductListItem from './product-list-item';

class ProductList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      value: []
    };
  }

  componentDidMount() {
    this.getProducts();
  }

  getProducts() {
    fetch('/api/products')
      .then(res => res.json())
      .then(json => {
        this.setState({ value: json });
      });
  }

  addPeriod() {
    debugger;
    var numberPrice = this.props.value.price / 100;
    var newNumber = numberPrice.toFixed(2);
  }

  render() {
    var items = this.state.value;
    var listItems = items.map(product => <ProductListItem key={product.productId} value={product} />);
    return (
      <div className="container">
        <div className="row">
          {listItems}
        </div>
      </div>
    );
  }
}

export default ProductList;
