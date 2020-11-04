import React from 'react';

function addPeriod(oldprice) {
  var numberPrice = oldprice / 100;
  var newNumber = numberPrice.toFixed(2);
  return newNumber;
}

function ProductListItem(props) {
  return <React.Fragment>
    <div className="col-md-4 card-container">
      <div className="card">
        <img className="image" src={props.value.image}></img>
        <div className="card-body">
          <h5 className="card-title">{props.value.name} </h5>
          <p className="card-text">${addPeriod(props.value.price)} </p>
          <p className="card-des"> {props.value.shortDescription} </p>
        </div>
      </div>
    </div>
  </React.Fragment>;
}

export default ProductListItem;
