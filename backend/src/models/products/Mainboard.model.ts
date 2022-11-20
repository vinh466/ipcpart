
import { ProductId, Product } from "@type/models/product";
import { Connection, OkPacket, Pool, RowDataPacket } from "mysql2/promise";

interface MainboardModel {
    mainboardId: string;
    mainboardName: string;
    brand: string;
    chipset: string;
    form: string;
    ramCap: number;
    imgUrl: string;
    color: string;
    ramSlot: number;
    price: number;
    updatedAt?: Date;
    createdAt?: Date;
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
            mainboardId?: string
            productName?: string
            productBrand?: string
            chipset?: string
            socket?: string
            ramStandard?: string
            form?: string
            color?: string
            ramCap?: number
            ramSlot?: number
        }>{}
    } = {}) {
        const selectQuery = ("SELECT" +
            "`mainboards`.`mainboardId`," +
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
            (where.mainboardId ? `AND(\`mainboards\`.\`mainboardId\` = '${where.mainboardId}')` : '') +
            (where.productName ? `AND(\`product\`.\`productName\` LIKE '%${where.productName}%')` : '') +
            (where.productBrand ? `AND(\`product\`.\`productBrand\` LIKE '%${where.productBrand}%')` : '') +
            (where.chipset ? `AND(\`mainboards\`.\`chipset\`  LIKE '%${where.chipset}%')` : '') +
            (where.socket ? `AND(\`mainboard_chipset\`.\`socket\`  LIKE '%${where.socket}%')` : '') +
            (where.ramStandard ? `AND(\`mainboard_chipset\`.\`ramStandard\`  LIKE '%${where.ramStandard}%')` : '') +
            (where.form ? `AND(\`mainboards\`.\`form\` LIKE '%${where.form}%')` : '') +
            (where.color ? `AND(\`mainboards\`.\`color\`  LIKE '%${where.color}%')` : '') +
            (where.ramCap ? `AND(\`mainboards\`.\`ramCap\` LIKE '%${where.ramCap}%')` : '') +
            (where.ramSlot ? `AND(\`mainboards\`.\`ramSlot\` LIKE '%${where.ramSlot}%');` : '')
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
