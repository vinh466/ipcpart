

import { ProductId, Product } from "@type/models/product";
import { Connection, OkPacket, Pool, RowDataPacket } from "mysql2/promise";

interface RamModel {

    ramId: string;
    ramName: string;
    brand: string;
    capacity: number;
    speed: number;
    standard: string;
    latency: number;
    module: string;
    pricePerGb: number;
    color: string;
    cas: number;
    price: number;
    updatedAt?: Date;
    createdAt?: Date;
}
interface RamRowData extends RamModel, RowDataPacket { }

export default class User {
    Database: Pool;

    constructor(Database: Pool) {
        this.Database = Database
    }


    async getRams({
        page = 1,
        pageSize = 50,
        where = <{
            ramId?: string,
            productName?: string,
            productBrand?: string,
            capacity?: number,
            speed?: string,
            standard?: string,
            module?: string,
            color?: string,
            latency?: number,
            cas?: number,
            pricePerGb?: number,
        }>{}
    } = {}) {
        const selectQuery = ("SELECT" +
            "`rams`.`ramId`," +
            "`product`.`productName`," +
            "`product`.`productPhoto`," +
            "`product`.`productBrand`," +
            "`product`.`productType`," +
            "`product`.`price`," +
            "`rams`.`capacity`," +
            "`rams`.`speed`," +
            "`rams`.`standard`," +
            "`rams`.`module`," +
            "`rams`.`color`," +
            "`rams`.`latency`," +
            "`rams`.`cas`," +
            "`rams`.`pricePerGb`," +
            "`product`.`updatedAt`," +
            "`product`.`createdAt`," +
            "`product`.`deletedAt`"
        );

        const relationQuery = (
            "FROM `rams` " +
            "LEFT OUTER JOIN`products` as `product` ON`product`.`productId` = `rams`.`ramId`" +
            "WHERE(`product`.`deletedAt` IS NULL)"
        );

        const whereQuery = ('' +
            (where.ramId ? `AND(\`rams\`.\`ramId\` = '${where.ramId}')` : '') +
            (where.productName ? `AND(\`product\`.\`productName\` LIKE '%${where.productName}%')` : '') +
            (where.productBrand ? `AND(\`product\`.\`productBrand\` LIKE '%${where.productBrand}%')` : '') +
            (where.capacity ? `AND(\`rams\`.\`capacity\`  LIKE '%${where.capacity}%')` : '') +
            (where.speed ? `AND(\`rams\`.\`speed\`  LIKE '%${where.speed}%')` : '') +
            (where.standard ? `AND(\`rams\`.\`standard\`  LIKE '%${where.standard}%')` : '') +
            (where.module ? `AND(\`rams\`.\`module\`  LIKE '%${where.module}%')` : '') +
            (where.color ? `AND(\`rams\`.\`color\`  LIKE '%${where.color}%')` : '') +
            (where.latency ? `AND(\`rams\`.\`latency\`  LIKE '%${where.latency}%')` : '') +
            (where.cas ? `AND(\`rams\`.\`cas\`  LIKE '%${where.cas}%')` : '') +
            (where.pricePerGb ? `AND(\`rams\`.\`pricePerGb\`  LIKE '%${where.pricePerGb}%')` : '')
        );
        try {
            // Get total query record
            const query = selectQuery + relationQuery + whereQuery
            console.log(query)
            let [rawRecords, meta] = await this.Database.query<RamRowData[]>(query);
            // calculate pagination
            const total = rawRecords.length
            let start = (page - 1) * pageSize;
            if (start > total) start = Math.ceil(total / pageSize - 1) * pageSize
            const currPage = start / pageSize + 1;
            rawRecords = rawRecords.slice(start, start + 1 * pageSize)

            const records: RamModel[] = rawRecords;
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
