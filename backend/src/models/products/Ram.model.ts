

import { ProductId, Product } from "@type/models/product";
import { convertRegexpQuery } from "@utils/convert.util";
import { Connection, OkPacket, Pool, RowDataPacket } from "mysql2/promise";
import { SERVERNAME } from "server";

interface RamModel extends Product {
    productId: string;
    productName: string;
    productType: string;
    productPhoto: string;
    productBrand: string;
    price: number;
    capacity: number;
    speed: number;
    standard: string;
    latency: number;
    module: string;
    cas: number;
    pricePerGb: number;
    color: string;
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
            productId?: string,
            productName?: string,
            productBrand?: string[],
            capacity?: string[],
            speed?: string[],
            standard?: string[],
            module?: string[],
            color?: string[],
            latency?: string[],
            cas?: string[],
            pricePerGb?: string[],
        }>{}
    } = {}) {
        const selectQuery = ("SELECT" +
            "`product`.`productId`," +
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
            (where.productId ? `AND(\`product\`.\`productId\` = '${where.productId}')` : '') +
            (where.productName ? `AND(\`product\`.\`productName\` LIKE '%${where.productName}%')` : '') +
            (where.productBrand ? `AND(\`product\`.\`productBrand\` REGEXP '${convertRegexpQuery(where.productBrand)}')` : '') +
            (where.capacity ? `AND(\`rams\`.\`capacity\`  REGEXP '${convertRegexpQuery(where.capacity)}')` : '') +
            (where.speed ? `AND(\`rams\`.\`speed\`  REGEXP '${convertRegexpQuery(where.speed)}')` : '') +
            (where.standard ? `AND(\`rams\`.\`standard\`  REGEXP '${convertRegexpQuery(where.standard)}')` : '') +
            (where.module ? `AND(\`rams\`.\`module\`  REGEXP '${convertRegexpQuery(where.module)}')` : '') +
            (where.color ? `AND(\`rams\`.\`color\`  REGEXP '${convertRegexpQuery(where.color)}')` : '') +
            (where.latency ? `AND(\`rams\`.\`latency\`  REGEXP '${convertRegexpQuery(where.latency)}')` : '') +
            (where.cas ? `AND(\`rams\`.\`cas\`  REGEXP '${convertRegexpQuery(where.cas)}')` : '') +
            (where.pricePerGb ? `AND(\`rams\`.\`pricePerGb\`  REGEXP '${convertRegexpQuery(where.pricePerGb)}')` : '')
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
            rawRecords.forEach(element => {
                const obj = element as RamModel
                obj.productPhoto = SERVERNAME + obj.productPhoto;
            });
            return { records, total, currPage }
        } catch (err) {
            console.log(err)
            return false;
        }
    }
}
