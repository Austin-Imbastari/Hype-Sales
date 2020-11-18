import React from 'react';
import { MdAttachMoney, MdShoppingCart } from 'react-icons/md';

function Headers(props) {

  let display = null;
  function cartClick(e) {
    e.preventDefault();
    props.setView('cart', null);
  }

  if (props.displayHeader) {
    display =
    <React.Fragment>
      <div className="rows">
        <div className="col-sm header-row">
          <div className='wicked-container'>
            <MdAttachMoney className="money-sign" size="1.4rem"/>
            <h5 className="nav-heading">Hype Sales</h5>
          </div>
          <div className='cart-container'>
            <span className="item-count">
              {props.cartItemCount} Items
            </span>
            <MdShoppingCart onClick={cartClick} className="shopping-cart" size="1.6rem"/>
          </div>
        </div>
      </div>
    </React.Fragment>;
  }
  return display;
}

export default Headers;
