

import { ProductId, Product } from "@type/models/product";
import { convertRegexpQuery } from "@utils/convert.util";
import { Connection, OkPacket, Pool, RowDataPacket } from "mysql2/promise";
import { SERVERNAME } from "server";

interface MonitorModel extends Product {
    productId: string;
    productName: string;
    productType: string;
    productPhoto: string;
    productBrand: string;
    price: number;
    inStock: number;
    screenSize: string;
    resolution: string;
    refreshRate: string;
    responseTime: string;
    panelType: string;
    ratio: string;
}


interface MonitorRowData extends MonitorModel, RowDataPacket { }

export default class User {
    Database: Pool;

    constructor(Database: Pool) {
        this.Database = Database
    }

    async getMonitors({
        page = 1,
        pageSize = 50,
        where = <{
            productId?: string
            productName?: string
            productBrand?: string[]
            screenSize?: string[]
            resolution?: string[]
            refreshRate?: string[]
            responseTime?: string[]
            panelType?: string[]
            ratio?: string[]
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
            "`monitors`.`screenSize`," +
            "`monitors`.`resolution`," +
            "`monitors`.`refreshRate`," +
            "`monitors`.`responseTime`," +
            "`monitors`.`panelType`," +
            "`monitors`.`ratio`," +
            "`product`.`updatedAt`," +
            "`product`.`createdAt`," +
            "`product`.`deletedAt`"
        );

        const relationQuery = (
            "FROM `monitors` " +
            "LEFT OUTER JOIN`products` as `product` ON`product`.`productId` = `monitors`.`monitorId`" +
            "WHERE(`product`.`deletedAt` IS NULL)"
        );

        const whereQuery = ('' +
            (where.productId ? `AND(\`product\`.\`productId\` = '${where.productId}')` : '') +
            (where.productName ? `AND(\`product\`.\`productName\` LIKE '%${where.productName}%')` : '') +
            (where.productBrand ? `AND(\`product\`.\`productBrand\` REGEXP '${convertRegexpQuery(where.productBrand)}')` : '') +
            (where.screenSize ? `AND(\`monitors\`.\`screenSize\`  REGEXP '${convertRegexpQuery(where.screenSize)}')` : '') +
            (where.resolution ? `AND(\`monitors\`.\`resolution\`  REGEXP '${convertRegexpQuery(where.resolution)}')` : '') +
            (where.refreshRate ? `AND(\`monitors\`.\`refreshRate\` REGEXP '${convertRegexpQuery(where.refreshRate)}')` : '') +
            (where.responseTime ? `AND(\`monitors\`.\`responseTime\`  REGEXP '${convertRegexpQuery(where.responseTime)}')` : '') +
            (where.panelType ? `AND(\`monitors\`.\`panelType\` REGEXP '${convertRegexpQuery(where.panelType)}')` : '') +
            (where.ratio ? `AND(\`monitors\`.\`ratio\` REGEXP '${convertRegexpQuery(where.ratio)}');` : '')
        );
        try {
            // Get total query record
            const query = selectQuery + relationQuery + whereQuery
            console.log(query)
            let [rawRecords, meta] = await this.Database.query<MonitorRowData[]>(query);
            // calculate pagination
            const total = rawRecords.length
            let start = (page - 1) * pageSize;
            if (start > total) start = Math.ceil(total / pageSize - 1) * pageSize
            const currPage = start / pageSize + 1;
            rawRecords = rawRecords.slice(start, start + 1 * pageSize)

            const records: MonitorModel[] = rawRecords;
            rawRecords.forEach(element => {
                const obj = element as MonitorModel
                obj.productPhoto = SERVERNAME + obj.productPhoto;
            });
            return { records, total, currPage }
        } catch (err) {
            console.log(err)
            return false;
        }
    }
}
