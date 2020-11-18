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

  function checkOut() {
    (props.setView('checkout-disclaimer', { totalPrice: totalPrice }));
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
      <div className="cart-summary-container">
        <div>
          <div onClick={catalogclick} className='back-to-catalog'>
            <p className="text-summary"> Back to catalog </p>
          </div>
          {cartItems}
        </div>
        <div className="checkout-box">
          <h4 className="total-price">
          Total Price ${addPeriod(totalPrice)}
          </h4>
          <button onClick={checkOut} className="square_btn checkout-btn"> Checkout </button>
        </div>
      </div>
    </React.Fragment>
  );
}

export default CartSummary;
