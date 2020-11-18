import React from 'react';

class CheckoutDisclaimer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {

    };
    this.clickHandler = this.clickHandler.bind(this);
  }

  clickHandler() {
    const params = { displayHeader: true };
    this.props.setView('checkout', params);
  }

  render() {
    return (
      <React.Fragment>
        <div className="homepage-container">
          <h1 className="hp-text">
          Reminder please do not use personal information for the shipping options.
          </h1>
          <button onClick={this.clickHandler} className="hp-btn">Click Me!</button>
        </div>
      </React.Fragment>
    );
  }
}

export default CheckoutDisclaimer;
