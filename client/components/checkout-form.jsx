import React from 'react';

class CheckOutForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      creditCard: '',
      shippingAddress: '',
      name: ''
    };
    this.addPeriod = this.addPeriod.bind(this);
    this.orderPlaced = this.orderPlaced.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleChangeCredit = this.handleChangeCredit.bind(this);
    this.handleChangeShippingAddress = this.handleChangeShippingAddress.bind(this);
  }

  addPeriod(oldprice) {
    var numberPrice = oldprice / 100;
    var newNumber = numberPrice.toFixed(2);
    return newNumber;
  }

  orderPlaced() {
    const order = {
      name: this.state.name,
      shippingAddress: this.state.shippingAddress,
      creditCard: this.state.creditCard
    };
    this.props.placeOrder(order);
  }

  handleChange() {
    this.setState({ name: event.target.value });
  }

  handleChangeCredit() {
    this.setState({ creditCard: event.target.value });
  }

  handleChangeShippingAddress() {
    this.setState({ shippingAddress: event.target.value });
  }

  render() {
    return (
      <React.Fragment>
        <form className="form">
          <h1>My Cart</h1>
          <h4 className="form-total">
          Total Price ${this.addPeriod(this.props.totalPrice)}
          </h4>
          <div className="form-group ">
            <label htmlFor="name">Name</label>
            <input value={this.state.name} onChange={this.handleChange} type="text" className="form-control" id="name" placeholder="Enter name"></input>
          </div>
          <div className="form-group">
            <label htmlFor="credit">Credit Card</label>
            <input value={this.state.creditCard} onChange={this.handleChangeCredit} type="text" className="form-control" id="credit" placeholder="000-0000-0000-0000"></input>
          </div>
          <div className="form-group">
            <label htmlFor="shipping">Shipping Address</label>
            <input value={this.state.shippingAddress} onChange={this.handleChangeShippingAddress} type="text" className="form-control" id="shipping" placeholder="address.."></input>
          </div>
          <button onClick={this.orderPlaced} onChange={this.handleChange} className="square_btn"> Place Order!</button>
        </form>
      </React.Fragment>
    );
  }
}

export default CheckOutForm;
