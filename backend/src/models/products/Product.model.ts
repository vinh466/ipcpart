
import dotenv from 'dotenv'
import { ProductId, Product } from "@type/models/product";
import { Connection, OkPacket, Pool, RowDataPacket } from "mysql2/promise";
import { convertRegexpQuery, convertWhereQuery, extractData } from '@utils/convert.util';
import { ResultSetHeader } from 'mysql2';
import { CURRENT_TIMESTAMP } from '..';

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
            productId?: string[]
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
            "`createdAt`," +
            "`deletedAt`"
        );

        const relationQuery = (
            "FROM`products`"
        );

        where = extractData(where);
        const whereQuery = convertWhereQuery([
            { col: 'products.deletedAt', value: 'NULL', operator: 'is', sqlLogical: 'AND' },
            { col: 'products.productType', value: where.productType?.replace('-', ' '), operator: 'REGEXP', sqlLogical: 'AND' },
            [
                { col: 'products.productId', value: where.productId, operator: 'REGEXP', sqlLogical: 'OR' },
                { col: 'products.productBrand', value: where.productBrand, operator: 'REGEXP', sqlLogical: 'OR' },
                { col: 'products.productName', value: where.productName, operator: 'REGEXP', sqlLogical: 'OR' },
            ],
        ])
        const whereQuery_bk = ('' +
            (where.productId ? `AND(\`products\`.\`productId\` REGEXP '${convertRegexpQuery(where.productId)}')` : '') +
            (where.productType ? `AND(\`products\`.\`productType\` LIKE '%${where.productType.replace('-', ' ')}%')` : '') +
            (where.productBrand ? `OR(\`products\`.\`productBrand\` LIKE '%${where.productBrand}%')` : '') +
            (where.productName ? `OR(\`products\`.\`productName\` LIKE '%${where.productName}%')` : '') +
            'ORDER BY createdAt'
        );
        try {
            // Get total query record
            const query = selectQuery + relationQuery + whereQuery + 'ORDER BY createdAt'
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

    async removeProduct(productId: string) {
        const removeProductQuery = 'UPDATE `products` SET deletedAt = ? WHERE productId = ?'
        try {
            const conn = await this.Database.getConnection();
            try {
                await conn.beginTransaction()
                const result = await conn.query<ResultSetHeader>({ sql: removeProductQuery }, [CURRENT_TIMESTAMP, productId,])
                conn.commit();
                console.log(result);
                return result
            } catch (error) {
                await conn.rollback();
                throw error
            } finally {
                conn.release();
            }
        } catch (error) {
            console.log(error)
            return null
        }
    }

}
