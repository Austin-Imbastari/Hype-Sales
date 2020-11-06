import React from 'react';

class ProductDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      product: null
    };
  }

  componentDidMount() {
    this.getProductsId(this.props.productId);
  }

  getProductsId(productId) {
    fetch(`/api/products/${productId}`)
      .then(res => res.json())
      .then(json => {
        this.setState({ product: json });
      });
  }

  addPeriod(oldprice) {
    var numberPrice = oldprice / 100;
    var newNumber = numberPrice.toFixed(2);
    return newNumber;
  }

  render() {
    if (!this.state.product) {
      return null;
    }

    return (
      <React.Fragment>
        <div className="card-details">
          <div className="container-list">
            <div>
              <a className='back-to-catalog' href=''> Back to catalog </a>
            </div>
            <div className="image-short-container">
              <div className="image-detail">
                <img className="image" src={this.state.product.image}></img>
              </div>
              <div className="short-des">
                <h5 className="card-title"> {this.state.product.name} </h5>
                <p className="card-text">${this.addPeriod(this.state.product.price)} </p>
                <p className="card-des"> {this.state.product.shortDescription} </p>
                <button className="square_btn"> Add to Cart </button>
              </div>
            </div>
            <div className="long-des">
              <p className="card-des-long"> {this.state.product.longDescription} </p>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default ProductDetails;
