

import { ProductId, Product } from "@type/models/product";
import { Connection, OkPacket, Pool, RowDataPacket } from "mysql2/promise";

interface MonitorModel extends Product {
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
            productBrand?: string
            screenSize?: string
            resolution?: string
            refreshRate?: string
            responseTime?: string
            panelType?: string
            ratio?: string
        }>{}
    } = {}) {
        const selectQuery = ("SELECT" +
            "`product`.`productId`," +
            "`product`.`productName`," +
            "`product`.`productPhoto`," +
            "`product`.`productBrand`," +
            "`product`.`productType`," +
            "`product`.`price`," +
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
            (where.productBrand ? `AND(\`product\`.\`productBrand\` LIKE '%${where.productBrand}%')` : '') +
            (where.screenSize ? `AND(\`monitor\`.\`screenSize\`  LIKE '%${where.screenSize}%')` : '') +
            (where.resolution ? `AND(\`monitor\`.\`resolution\`  LIKE '%${where.resolution}%')` : '') +
            (where.refreshRate ? `AND(\`monitor\`.\`refreshRate\` LIKE '%${where.refreshRate}%')` : '') +
            (where.responseTime ? `AND(\`monitor\`.\`responseTime\`  LIKE '%${where.responseTime}%')` : '') +
            (where.panelType ? `AND(\`monitor\`.\`panelType\` LIKE '%${where.panelType}%')` : '') +
            (where.ratio ? `AND(\`monitor\`.\`ratio\` LIKE '%${where.ratio}%');` : '')
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
            // rawRecords.forEach(element => {
            //     const obj = element as CpuModel
            //     records.push(nestedConvert(obj as CpuModel))
            // });
            return { records, total, currPage }
        } catch (err) {
            console.log(err)
            return false;
        }
    }
}
