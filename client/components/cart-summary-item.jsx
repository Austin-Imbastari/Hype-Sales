import React from 'react';

function CartSummaryItem(props) {

  function addPeriod(oldprice) {
    var numberPrice = oldprice / 100;
    var newNumber = numberPrice.toFixed(2);
    return newNumber;
  }

  return (
    <React.Fragment>
      <div className="card-item-container">
        <div className="card-item">
          <img className="image" src={props.item.image}></img>
          <div className="card-body">
            <h5 className="card-title">{props.item.name} </h5>
            <p className="card-text">${addPeriod(props.item.price)} </p>
            <p className="card-des"> {props.item.shortDescription} </p>
          </div>
        </div>
      </div>
    </React.Fragment>
  );
}

export default CartSummaryItem;
