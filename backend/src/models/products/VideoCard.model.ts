

import { ProductId, Product } from "@type/models/product";
import { Connection, OkPacket, Pool, RowDataPacket } from "mysql2/promise";

interface VideoCardModel extends Product {
    chipsetName: string;
    coreClock: number;
    boostClock: number;
    color: string;
    length: number;
    memory: number;
}
interface VideoCardRowData extends VideoCardModel, RowDataPacket { }

export default class User {
    Database: Pool;

    constructor(Database: Pool) {
        this.Database = Database
    }

    async getVideoCards({
        page = 1,
        pageSize = 50,
        where = <{
            productId?: string,
            productName?: string,
            productBrand?: string,
            chipsetName?: string,
            coreClock?: string,
            boostClock?: string,
            color?: string,
            length?: number,
            memory?: number,
        }>{}
    } = {}) {
        const selectQuery = ("SELECT" +
            "`product`.`productId`," +
            "`product`.`productName`," +
            "`product`.`productPhoto`," +
            "`product`.`productBrand`," +
            "`product`.`productType`," +
            "`product`.`price`," +
            "`video_cards`.`chipsetName`," +
            "`video_cards`.`coreClock`," +
            "`video_cards`.`boostClock`," +
            "`video_cards`.`color`," +
            "`video_cards`.`length`," +
            "`video_cards`.`memory`," +
            "`product`.`updatedAt`," +
            "`product`.`createdAt`," +
            "`product`.`deletedAt`"
        );

        const relationQuery = (
            "FROM `video_cards` " +
            "LEFT OUTER JOIN`products` as `product` ON`product`.`productId` = `video_cards`.`videocardId`" +
            "WHERE(`product`.`deletedAt` IS NULL)"
        );

        const whereQuery = ('' +
            (where.productId ? `AND(\`product\`.\`productId\` = '${where.productId}')` : '') +
            (where.productName ? `AND(\`product\`.\`productName\` LIKE '%${where.productName}%')` : '') +
            (where.productBrand ? `AND(\`product\`.\`productBrand\` LIKE '%${where.productBrand}%')` : '') +
            (where.chipsetName ? `AND(\`video_cards\`.\`chipsetName\`  LIKE '%${where.chipsetName}%')` : '') +
            (where.coreClock ? `AND(\`video_cards\`.\`coreClock\`  LIKE '%${where.coreClock}%')` : '') +
            (where.boostClock ? `AND(\`video_cards\`.\`boostClock\`  LIKE '%${where.boostClock}%')` : '') +
            (where.color ? `AND(\`video_cards\`.\`color\`  LIKE '%${where.color}%')` : '') +
            (where.length ? `AND(\`video_cards\`.\`length\`  LIKE '%${where.length}%')` : '') +
            (where.memory ? `AND(\`video_cards\`.\`memory\`  LIKE '%${where.memory}%')` : '')
        );
        try {
            // Get total query record
            const query = selectQuery + relationQuery + whereQuery
            console.log(query)
            let [rawRecords, meta] = await this.Database.query<VideoCardRowData[]>(query);
            // calculate pagination
            const total = rawRecords.length
            let start = (page - 1) * pageSize;
            if (start > total) start = Math.ceil(total / pageSize - 1) * pageSize
            const currPage = start / pageSize + 1;
            rawRecords = rawRecords.slice(start, start + 1 * pageSize)

            const records: VideoCardModel[] = rawRecords;
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
