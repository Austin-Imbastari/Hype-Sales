import React from 'react';
import { MdAttachMoney, MdShoppingCart } from 'react-icons/md';

function Headers(props) {

  return <React.Fragment>
    <div className="rows">
      <div className="col-sm header-row">
        <div className='wicked-container'>
          <MdAttachMoney className="money-sign" size="1.4rem"/>
          <h5 className="nav-heading">Wicked Sales</h5>
        </div>
        <div className='cart-container'>
          <span className="item-count">
            {props.cartItemCount} Items
          </span>
          <MdShoppingCart className="shopping-cart" size="1.6rem"/>
        </div>
      </div>
    </div>
  </React.Fragment>;
}

export default Headers;
