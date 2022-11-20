

import { ProductId, Product } from "@type/models/product";
import { Connection, OkPacket, Pool, RowDataPacket } from "mysql2/promise";

interface MouseModel {

    mouseId: string;
    mouseName: string;
    imgUrl: string;
    brand: string;
    trackingMethod: string;
    conectType: string;
    dpi: number;
    hand: string;
    color: string;
    price: number;
    updatedAt?: Date;
    createdAt?: Date;
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
            mouseId?: string,
            productName?: string,
            productBrand?: string,
            trackingMethod?: string,
            connectType?: string,
            dpi?: number,
            hand?: string,
            color?: string,
        }>{}
    } = {}) {
        const selectQuery = ("SELECT" +
            "`mouses`.`mouseId`," +
            "`product`.`productName`," +
            "`product`.`productPhoto`," +
            "`product`.`productBrand`," +
            "`product`.`productType`," +
            "`product`.`price`," +
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
            (where.mouseId ? `AND (\`mouses\`.\`mouseId\` = '${where.mouseId}')` : '') +
            (where.productName ? `AND (\`product\`.\`productName\` LIKE '%${where.productName}%')` : '') +
            (where.productBrand ? `AND (\`product\`.\`productBrand\` LIKE '%${where.productBrand}%')` : '') +
            (where.trackingMethod ? `AND (\`mouses\`.\`trackingMethod\` LIKE '%${where.trackingMethod}%')` : '') +
            (where.connectType ? `AND (\`mouses\`.\`connectType\` LIKE '%${where.connectType}%')` : '') +
            (where.dpi ? `AND (\`mouses\`.\`dpi\` LIKE '%${where.dpi}%')` : '') +
            (where.hand ? `AND (\`mouses\`.\`hand\` LIKE '%${where.hand}%')` : '') +
            (where.color ? `AND (\`mouses\`.\`color\` LIKE '%${where.color}%')` : '')
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
            // rawRecords.forEach(element => {
            //     const obj = element as CpuModel
            //     records.push(nestedConvert(obj as CpuModel))
            // });
            // // const limitQuery = `LIMIT ${start},${pageSize}`;
            // // const [records, metadata] = await Database.query(selectQuery + relationQuery + whereQuery + limitQuery, {});
            return { records, total, currPage }
        } catch (err) {
            console.log(err)
            return false;
        }
    }
}
