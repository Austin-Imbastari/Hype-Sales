import React from 'react';

class HomePage extends React.Component {
  constructor(props) {
    super(props);
    this.state = {

    };
    this.clickHandler = this.clickHandler.bind(this);
  }

  clickHandler() {
    const params = { displayHeader: true };
    this.props.setView('catalog', params);
  }

  render() {
    return (
      <React.Fragment>
        <div className="homepage-container">
          <h1 className="hp-text">
          Welcome, this site is a demo and no real purchases  will be made.
          Click the button to view Hype Sales.
          </h1>
          <button onClick={this.clickHandler} className="hp-btn">Click Me!</button>
        </div>
      </React.Fragment>
    );
  }
}

export default HomePage;
