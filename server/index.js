require('dotenv/config');
const express = require('express');
const db = require('./database');
const ClientError = require('./client-error');
const staticMiddleware = require('./static-middleware');
const sessionMiddleware = require('./session-middleware');
// const { json } = require('express');
const app = express();

app.use(staticMiddleware);
app.use(sessionMiddleware);

app.use(express.json());

app.get('/api/health-check', (req, res, next) => {
  db.query('select \'successfully connected\' as "message"')
    .then(result => res.json(result.rows[0]))
    .catch(err => next(err));
});

app.get('/api/products', (req, res, next) => {
  const sql =
  `select
    "productId",
    "name",
    "price",
    "image",
    "shortDescription"
    from "products"`;
  db.query(sql)
    .then(result => {
      const product = result.rows;
      res.status(200);
      res.json(product);
    }).catch(err => {
      console.error(err);
      res.status(500).json({
        error: 'An unexpected error occurred.'
      });
    });
});

app.get('/api/products/:productId', (req, res, next) => {
  const value = [req.params.productId];
  const sql =
    `select
    "productId",
    "name",
    "price",
    "image",
    "longDescription",
    "shortDescription"
    from "products"
    where "productId" = $1`;
  db.query(sql, value)
    .then(result => {
      const product = result.rows[0];
      res.json(product);
    }).catch(err => {
      console.error(err);
      res.status(500).json({
        error: 'An unexpected error occurred.'
      });
    });
});

app.get('/api/carts', (req, res, next) => {
  const sql =
    `select *
    from "carts"`;

  db.query(sql)
    .then(result => {
      const cart = result.rows;
      res.json(cart);
    }).catch(err => {
      console.error(err);
      res.status(500).json({
        error: 'An unexpected error occurred.'
      });
    });
});

app.get('/api/cartItems', (req, res, next) => {
  const sql =
    `select *
    from "cartItems"`;

  db.query(sql)
    .then(result => {
      const cartItems = result.rows;
      res.json(cartItems);
    }).catch(err => {
      console.error(err);
      res.status(500).json({
        error: 'An unexpected error occurred.'
      });
    });
});

app.post('/api/cart', (req, res, next) => {
  var proId = parseInt(req.body.productId);
  var values = [proId];

  // var price = req.body.price;
  // const numberPrice = price * 100;
  console.log('proId: ' + proId);
  // console.log('numberPrice ' + price);

  if (!Number.isInteger(proId) || proId < 0) {
    res.status(400).json({
      error: 'invalid id'
    });
    return;
  }
  const sql =
  `select
  "price"
  from "products"
  where "productId" = $1`;

  db.query(sql, values)
    .then(result => {
      var rowPrice = result.rows;
      var arrayPrice = rowPrice.map(a => a.price);
      var indexPrice = arrayPrice[0];
      // console.log(indexPrice);
      if (result.rows.length === 0) {
        throw new ClientError('oh no , an unexpected error occurred.', 404);
      }

      if (req.session.cartId) {
        var priceCartId = {
          cartId: arrayCartId,
          price: indexPrice
        };
      }
      const sqlCart =
      ` insert into "carts" ("cartId", "createdAt")
          values (default, default)
          returning "cartId" `;

      return db.query(sqlCart)
        .then(result2 => {
          // console.log('result2.rows[0]: ' + result2.rows[0]);
          // var rowCartId = result2.rows;
          var arrayCartId = result2.rows[0].cartId;
          req.session.cartId = arrayCartId;
          // console.log('req.session.cartId: ', req.session.cartId);

          var priceCartId = {
            cartId: arrayCartId,
            price: indexPrice
          };
          console.log(priceCartId);

          const sql3 = `insert into "cartItems" ("cartId", "productId", "price")
          values ($1, $2, $3)
          returning "cartItemId"`;

          const values3 = [arrayCartId, proId, indexPrice];
          return db.query(sql3, values3)
            .then(result3 => {
              // console.log('result3: ', result3);

              const cartItemId = result3.rows[0].cartItemId;
              const sql4 =
              `select "c"."cartItemId",
                  "c"."price",
                  "p"."productId",
                  "p"."image",
                  "p"."name",
                  "p"."shortDescription"
              from "cartItems" as "c"
              join "products" as "p" using ("productId")
            where "c"."cartItemId" = $1`;
              const values4 = [cartItemId];

              return db.query(sql4, values4)
                .then(result4 => {
                  // console.log(result4);
                  res.status(201).json(
                    result4.rows[0]
                  );
                });
            });
        });
    }).catch(error => {
      console.error(error);
    });
});

app.use('/api', (req, res, next) => {
  next(new ClientError(`cannot ${req.method} ${req.originalUrl}`, 404));
});

app.use((err, req, res, next) => {
  if (err instanceof ClientError) {
    res.status(err.status).json({ error: err.message });
  } else {
    console.error(err);
    res.status(500).json({
      error: 'an unexpected error occurred'
    });
  }
});

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log('Listening on port', process.env.PORT);
});
