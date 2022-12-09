

import { ProductId, Product } from "@type/models/product";
import { convertRegexpQuery } from "@utils/convert.util";
import { Connection, OkPacket, Pool, RowDataPacket } from "mysql2/promise";
import { SERVERNAME } from "server";

interface MouseModel extends Product {
    productId: string;
    productName: string;
    productType: string;
    productPhoto: string;
    productBrand: string;
    price: number;
    inStock: number;
    trackingMethod: string;
    conectType: string;
    dpi: number;
    hand: string;
    color: string;
}


interface MouseRowData extends MouseModel, RowDataPacket { }

export default class User {
    Database: Pool;

    constructor(Database: Pool) {
        this.Database = Database
    }

    async getMouses({
        page = 1,
        pageSize = 50,
        where = <{
            productId?: string,
            productName?: string,
            productBrand?: string[],
            trackingMethod?: string[],
            connectType?: string[],
            dpi?: string[],
            hand?: string[],
            color?: string[],
        }>{}
    } = {}) {
        const selectQuery = ("SELECT" +
            "`product`.`productId`," +
            "`product`.`productName`," +
            "`product`.`productPhoto`," +
            "`product`.`productBrand`," +
            "`product`.`productType`," +
            "`product`.`price`," +
            "`product`.`inStock`," +
            "`mouses`.`trackingMethod`," +
            "`mouses`.`connectType`," +
            "`mouses`.`dpi`," +
            "`mouses`.`hand`," +
            "`mouses`.`color`," +
            "`product`.`updatedAt`," +
            "`product`.`createdAt`," +
            "`product`.`deletedAt`"
        );

        const relationQuery = (
            "FROM `mouses` " +
            "LEFT OUTER JOIN`products` as `product` ON`product`.`productId` = `mouses`.`mouseId`" +
            "WHERE(`product`.`deletedAt` IS NULL)"
        );

        const whereQuery = ('' +
            (where.productId ? `AND (\`product\`.\`productId\` = '${where.productId}')` : '') +
            (where.productName ? `AND (\`product\`.\`productName\` LIKE '%${where.productName}%')` : '') +
            (where.productBrand ? `AND (\`product\`.\`productBrand\` REGEXP '${convertRegexpQuery(where.productBrand)}')` : '') +
            (where.trackingMethod ? `AND (\`mouses\`.\`trackingMethod\` REGEXP '${convertRegexpQuery(where.trackingMethod)}')` : '') +
            (where.connectType ? `AND (\`mouses\`.\`connectType\` REGEXP '${convertRegexpQuery(where.connectType)}')` : '') +
            (where.dpi ? `AND (\`mouses\`.\`dpi\` REGEXP '${convertRegexpQuery(where.dpi)}')` : '') +
            (where.hand ? `AND (\`mouses\`.\`hand\` REGEXP '${convertRegexpQuery(where.hand)}')` : '') +
            (where.color ? `AND (\`mouses\`.\`color\` REGEXP '${convertRegexpQuery(where.color)}')` : '')
        );
        try {
            // Get total query record
            const query = selectQuery + relationQuery + whereQuery
            console.log(query)
            let [rawRecords, meta] = await this.Database.query<MouseRowData[]>(query);
            // calculate pagination
            const total = rawRecords.length
            let start = (page - 1) * pageSize;
            if (start > total) start = Math.ceil(total / pageSize - 1) * pageSize
            const currPage = start / pageSize + 1;
            rawRecords = rawRecords.slice(start, start + 1 * pageSize)

            const records: MouseModel[] = rawRecords;
            rawRecords.forEach(element => {
                const obj = element as MouseModel
                obj.productPhoto = SERVERNAME + obj.productPhoto;
            });
            // // const limitQuery = `LIMIT ${start},${pageSize}`;
            // // const [records, metadata] = await Database.query(selectQuery + relationQuery + whereQuery + limitQuery, {});
            return { records, total, currPage }
        } catch (err) {
            console.log(err)
            return false;
        }
    }
}
