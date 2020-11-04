import React from 'react';
import { MdAttachMoney } from 'react-icons/md';

function Headers(props) {

  return <React.Fragment>
    <div className="row">
      <div className="col-sm header-row">
        <MdAttachMoney className="money-sign" size="1.4rem"/>
        <h5 className="nav-heading">Wicked Sales</h5>
      </div>
    </div>
  </React.Fragment>;
}

export default Headers;
