
import dotenv from 'dotenv'
import { ProductId, Product } from "@type/models/product";
import { Connection, OkPacket, Pool, RowDataPacket } from "mysql2/promise";

interface ProductModel extends Product {
}
interface ProductRowData extends ProductModel, RowDataPacket { }
dotenv.config();
const SERVERNAME = process.env.SERVERNAME || 'localhost';
export default class User {
    Database: Pool;

    constructor(Database: Pool) {
        this.Database = Database
    }

    async getProducts({
        page = 1,
        pageSize = 50,
        where = <{
            productId?: string
            productName?: string
            productBrand?: string
            productType?: string
        }>{}
    } = {}) {
        const selectQuery = ("SELECT" +
            "`productId`," +
            "`productName`," +
            "`productBrand`," +
            "`productPhoto`," +
            "`productType`," +
            "`price`," +
            "`inStock`," +
            "`updatedAt`," +
            "`createdAt`"
        );

        const relationQuery = (
            "FROM`products`" +
            "WHERE(`products`.`deletedAt` IS NULL)"
        );

        const whereQuery = ('' +
            (where.productId ? `AND(\`products\`.\`productId\` = '${where.productId}')` : '') +
            (where.productType ? `AND(\`products\`.\`productType\` = '${where.productType}')` : '') +
            (where.productBrand ? `AND(\`products\`.\`productBrand\` = '${where.productBrand}')` : '') +
            (where.productName ? `AND(\`products\`.\`productName\` = '${where.productName}')` : '') +
            'ORDER BY createdAt'
        );
        try {
            // Get total query record
            const query = selectQuery + relationQuery + whereQuery
            console.log(query)
            let [rawRecords, meta] = await this.Database.query<ProductRowData[]>(query);
            // calculate pagination
            const total = rawRecords.length
            let start = (page - 1) * pageSize;
            if (start > total) start = Math.ceil(total / pageSize - 1) * pageSize
            const currPage = start / pageSize + 1;
            rawRecords = rawRecords.slice(start, start + 1 * pageSize)

            const records: ProductModel[] = rawRecords;
            rawRecords.forEach(element => {
                const obj = element as ProductModel
                obj.productPhoto = SERVERNAME + obj.productPhoto;
            });
            return { records, total, currPage }
        } catch (err) {
            console.log(err)
            return false;
        }
    }
}
