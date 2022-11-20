

import { ProductId, Product } from "@type/models/product";
import { Connection, OkPacket, Pool, RowDataPacket } from "mysql2/promise";

interface ProductModel extends Product {
}
interface ProductRowData extends ProductModel, RowDataPacket { }

export default class User {
    Database: Pool;

    constructor(Database: Pool) {
        this.Database = Database
    }

    create(product: Product, callback: Function) {
        const queryString = "INSERT INTO ProductOrder (product_id, customer_id, product_quantity) VALUES (?, ?, ?)"

    };
}
