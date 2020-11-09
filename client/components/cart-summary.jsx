import React from 'react';
import CartSummaryItem from './cart-summary-item';

function addPeriod(oldprice) {
  var numberPrice = oldprice / 100;
  var newNumber = numberPrice.toFixed(2);
  return newNumber;
}

function CartSummary(props) {

  function catalogclick() {
    props.setView('catalog', null);
  }

  var totalPrice = 0;
  props.cartItems.forEach(item => { totalPrice += item.price; });

  var cartItems = null;
  if (props.cartItems) {
    cartItems = props.cartItems.map(item => <CartSummaryItem key={item.cartItemId} item={item} />);
  } else {
    cartItems = <h1>No Items in the Cart</h1>;
  }

  return (
    <React.Fragment>
      <div>
        <div onClick={catalogclick} className='back-to-catalog'>
          <p> Back to catalog </p>
        </div>
        <h4 className="total-price">
          Total Price ${addPeriod(totalPrice)}
        </h4>
      </div>
      {cartItems}
    </React.Fragment>
  );
}

export default CartSummary;
