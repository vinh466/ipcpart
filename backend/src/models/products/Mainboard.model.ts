
import { ProductId, Product } from "@type/models/product";
import { convertRegexpQuery } from "@utils/convert.util";
import { Connection, OkPacket, Pool, RowDataPacket } from "mysql2/promise";
import { SERVERNAME } from "server";

interface MainboardModel extends Product {
    productId: string;
    productName: string;
    productType: string;
    productPhoto: string;
    productBrand: string;
    chipset: string;
    form: string;
    socket: string;
    ramCap: number;
    ramStandard: string;
    color: string;
    ramSlot: number;
    price: number;
}
interface MainboardRowData extends MainboardModel, RowDataPacket { }

export default class User {
    Database: Pool;

    constructor(Database: Pool) {
        this.Database = Database
    }

    async getMainboards({
        page = 1,
        pageSize = 50,
        where = <{
            productId?: string;
            productName?: string;
            productBrand?: string[];
            chipset?: string[];
            socket?: string[];
            ramStandard?: string[];
            form?: string[];
            color?: string[];
            ramCap?: string[];
            ramSlot?: string[];
        }>{}
    } = {}) {
        const selectQuery = ("SELECT" +
            "`product`.`productId`," +
            "`product`.`productName`," +
            "`product`.`productPhoto`," +
            "`product`.`productBrand`," +
            "`product`.`productType`," +
            "`product`.`price`," +
            "`mainboards`.`chipset`," +
            "`mainboard_chipset`.`socket`," +
            "`mainboard_chipset`.`ramStandard`," +
            "`mainboards`.`form`," +
            "`mainboards`.`color`," +
            "`mainboards`.`ramCap`," +
            "`mainboards`.`ramSlot`," +
            "`product`.`updatedAt`," +
            "`product`.`createdAt`," +
            "`product`.`deletedAt`"
        );

        const relationQuery = (
            "FROM `mainboards` " +
            "LEFT OUTER JOIN`products` AS `product` ON`product`.`productId` = `mainboards`.`mainboardId`" +
            "LEFT OUTER JOIN`mainboard_chipsets` AS `mainboard_chipset` ON`mainboard_chipset`.`chipsetName` = `mainboards`.`chipset`" +
            "WHERE(`product`.`deletedAt` IS NULL)"
        );

        const whereQuery = ('' +
            (where.productId ? `AND(\`product\`.\`productId\` = '${where.productId}')` : '') +
            (where.productName ? `AND(\`product\`.\`productName\` LIKE '%${where.productName}%')` : '') +
            (where.productBrand ? `AND(\`product\`.\`productBrand\` REGEXP '${convertRegexpQuery(where.productBrand)}')` : '') +
            (where.chipset ? `AND(\`mainboards\`.\`chipset\`  REGEXP '${convertRegexpQuery(where.chipset)}')` : '') +
            (where.socket ? `AND(\`mainboard_chipset\`.\`socket\`  REGEXP '${convertRegexpQuery(where.socket)}')` : '') +
            (where.ramStandard ? `AND(\`mainboard_chipset\`.\`ramStandard\`  REGEXP '${convertRegexpQuery(where.ramStandard)}')` : '') +
            (where.form ? `AND(\`mainboards\`.\`form\` REGEXP '${convertRegexpQuery(where.form)}')` : '') +
            (where.color ? `AND(\`mainboards\`.\`color\`  REGEXP '${convertRegexpQuery(where.color)}')` : '') +
            (where.ramCap ? `AND(\`mainboards\`.\`ramCap\` REGEXP '${convertRegexpQuery(where.ramCap)}')` : '') +
            (where.ramSlot ? `AND(\`mainboards\`.\`ramSlot\` REGEXP '${convertRegexpQuery(where.ramSlot)}');` : '')
        );
        try {
            // Get total query record
            const query = selectQuery + relationQuery + whereQuery
            console.log(query)
            let [rawRecords, meta] = await this.Database.query<MainboardRowData[]>(query);
            // calculate pagination
            const total = rawRecords.length
            let start = (page - 1) * pageSize;
            if (start > total) start = Math.ceil(total / pageSize - 1) * pageSize
            const currPage = start / pageSize + 1;
            rawRecords = rawRecords.slice(start, start + 1 * pageSize)

            const records: MainboardModel[] = rawRecords;
            rawRecords.forEach(element => {
                const obj = element as MainboardModel
                obj.productPhoto = SERVERNAME + obj.productPhoto;
            });
            return { records, total, currPage }
        } catch (err) {
            console.log(err)
            return false;
        }
    }
}
