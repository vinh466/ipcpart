<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/vinh466/ipcpart">
    <img src="/tmp/pcpart.png" alt="Logo" width="100" height="100">
  </a>

  <h3 align="center">IPcPart Project</h3>

  <p align="center">
    This is a full stack webapp project with Typescript, Vue 3, Express, MySql !
    <br /> 
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#features">Features</a></li>
    <li><a href="#built-with">Built With</a></li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#screenshots">Screenshots</a></li>
  </ol>
</details>

## Features

- Frontend - Vue.js

  - User registration
  - User login/logout
  - Add to cart
  - Checkout
  - Browse products
  - Manage users
  - Manage staffs

- Backend
  - CURD product, order, user, staff
  - MySql interaction
  - Auth with jwt

## Built With

> #### Server side

- [node](https://nodejs.org/)
- [express](http://expressjs.com/)
- [typescript](https://www.typescriptlang.org/)
- [express validator](https://express-validator.github.io/)
- [mysql2](https://www.npmjs.com/package/mysql2)
- [jwt](https://jwt.io/)
- [cors](https://www.npmjs.com/package/cors)
- [bcryptjs](https://www.npmjs.com/package/bcryptjs)
- [uuidv4](https://www.npmjs.com/package/uuidv4)

> #### Cilent side

- [vue 3](https://vuejs.org/)
- [typescript](https://www.typescriptlang.org/)
- [vue-router](https://router.vuejs.org/)
- [vue-validate](https://vee-validate.logaretm.com/)
- [fortawesome](https://fortawesome.com/)
- [axios](https://axios-http.com/vi/docs/intro)
- [pinia](https://pinia.vuejs.org/)
- [yup](https://www.npmjs.com/package/yup)
- [sass](https://sass-lang.com/)
- [vite](https://vitejs.dev/)
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Getting Started

### Prerequisites

Ensure [Node.js](https://nodejs.org/en/) and [NPM](https://www.npmjs.com/) are installed\_

> You will need to npm install in each directory in order to install the node module needed for each part of the project
> Directories Include: Root, Server & Client

Ensure [Mysql server](https://dev.mysql.com/downloads/mysql/) are installed and set up as backend/config/mysql.config.ts (fixable)

```js
// backend/config/mysql.config.ts
export default {
  host: 'localhost',
  port: 3360,
  user: 'root',
  password: '',
  database: 'ipcpart',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
};
```

### Installation

1. Clone or Download the repository (Depending on whether you are using SSH or HTTPS)

```bash
$ git clone https://github.com/vinh466/ipcpart.git
$ cd ipcpart
```

2. Install dependencies

```bash
$ npm install
```

3. Start the application

```bash
$ npm run dev
```

Then access Frontend - Client with `http://localhost:3001`, Frontend - Admin with `http://localhost:3001/admin` and Backend with `http://localhost:3005` via your Postman.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->

## Usage

| Service        | Endpoint                                                   |
| -------------- | ---------------------------------------------------------- |
| Backend        | [http://localhost:3005/api](http://localhost:3005/api)     |
| User Frontend  | [http://localhost:3001/](http://localhost:3001/)           |
| Admin Frontend | [http://localhost:3001/admin](http://localhost:3001/admin) |

There are three users in the database initially. You can use them to login Frontend/Backend.

| Service | Username | Password |
| ------- | -------- | -------- |
| Admin   | admin    | 123123   |
| Staff   | nv1      | 123123   |
| User    | vinhvinh | 123123   |

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## Contributing

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->

## Contact

Vinh Nguyen - [@fb](https://www.facebook.com/vinh466) - vinh466@gmail.com

Project Link: [https://github.com/vinh466/mevn-contactbook](https://github.com/vinh466/ipcpart.git)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Screenshots -->

## Screenshots

<a href="/frontend/public/image/home-category-3.png" target="_blank">
  <img src="/frontend/public/image/home-category-3.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/home-category-4.png" target="_blank">
  <img src="/frontend/public/image/home-category-4.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>

<a href="/frontend/public/image/home-category-1.png" target="_blank">
  <img src="/frontend/public/image/home-category-1.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/home-category-5.png" target="_blank">
  <img src="/frontend/public/image/home-category-5.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>

<a href="/frontend/public/image/home-category-2.png" target="_blank">
  <img src="/frontend/public/image/home-category-2.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/home-category-6.png" target="_blank">
  <img src="/frontend/public/image/home-category-6.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/home-product-detail.png" target="_blank">
  <img src="/frontend/public/image/home-product-detail.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/admin-order.png" target="_blank">
  <img src="/frontend/public/image/admin-order.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/cart-checkout.png" target="_blank">
  <img src="/frontend/public/image/cart-checkout.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/home-section-3.png" target="_blank">
  <img src="/frontend/public/image/home-section-3.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/pcpart.png" target="_blank">
  <img src="/frontend/public/image/pcpart.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/admin-product.png" target="_blank">
  <img src="/frontend/public/image/admin-product.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/cart.png" target="_blank">
  <img src="/frontend/public/image/cart.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/home-search-name.png" target="_blank">
  <img src="/frontend/public/image/home-search-name.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/home-section-4.png" target="_blank">
  <img src="/frontend/public/image/home-section-4.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/signin.png" target="_blank">
  <img src="/frontend/public/image/signin.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/admin-staff.png" target="_blank">
  <img src="/frontend/public/image/admin-staff.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/home-section-1.png" target="_blank">
  <img src="/frontend/public/image/home-section-1.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/home-section-5.png" target="_blank">
  <img src="/frontend/public/image/home-section-5.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/signup.png" target="_blank">
  <img src="/frontend/public/image/signup.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/admin-user.png" target="_blank">
  <img src="/frontend/public/image/admin-user.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/home-section-2.png" target="_blank">
  <img src="/frontend/public/image/home-section-2.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>
<a href="/frontend/public/image/home-section-6.png" target="_blank">
  <img src="/frontend/public/image/home-section-6.png" height="160" alt="" width="18%" style="object-fit: contain;">
</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>
