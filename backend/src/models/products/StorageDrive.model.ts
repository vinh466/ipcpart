

import { ProductId, Product } from "@type/models/product";
import { Connection, OkPacket, Pool, RowDataPacket } from "mysql2/promise";

interface StorageDriveModel extends Product {
    type: string;
    pricePerGb: number;
    capacity: string;
    cache: string;
    form: string;
    interface: string;
    maxRead: string;
    maxWrite: string;

}
interface StorageDriveRowData extends StorageDriveModel, RowDataPacket { }

export default class User {
    Database: Pool;

    constructor(Database: Pool) {
        this.Database = Database
    }


    async getStorageDrives({
        page = 1,
        pageSize = 50,
        where = <{
            productId?: string,
            productName?: string,
            productBrand?: string,
            type?: string,
            capacity?: string,
            maxRead?: string,
            maxWrite?: string,
            cache?: string,
            form?: string,
            interface?: string,
            pricePerGb?: string,
        }>{}
    } = {}) {
        const selectQuery = ("SELECT" +
            "`product`.`productId`," +
            "`product`.`productName`," +
            "`product`.`productPhoto`," +
            "`product`.`productBrand`," +
            "`product`.`productType`," +
            "`product`.`price`," +
            "`storage_drives`.`type`," +
            "`storage_drives`.`capacity`," +
            "`storage_drives`.`maxRead`," +
            "`storage_drives`.`maxWrite`," +
            "`storage_drives`.`cache`," +
            "`storage_drives`.`form`," +
            "`storage_drives`.`interface`," +
            "`storage_drives`.`pricePerGb`," +
            "`product`.`updatedAt`," +
            "`product`.`createdAt`," +
            "`product`.`deletedAt`"
        );

        const relationQuery = (
            "FROM `storage_drives` " +
            "LEFT OUTER JOIN`products` as `product` ON`product`.`productId` = `storage_drives`.`storageDriveId`" +
            "WHERE(`product`.`deletedAt` IS NULL)"
        );

        const whereQuery = ('' +
            (where.productId ? `AND(\`product\`.\`productId\` = '${where.productId}')` : '') +
            (where.productName ? `AND(\`product\`.\`productName\` LIKE '%${where.productName}%')` : '') +
            (where.productBrand ? `AND(\`product\`.\`productBrand\` LIKE '%${where.productBrand}%')` : '') +
            (where.type ? `AND(\`storage_drives\`.\`type\`  LIKE '%${where.type}%')` : '') +
            (where.capacity ? `AND(\`storage_drives\`.\`capacity\`  LIKE '%${where.capacity}%')` : '') +
            (where.maxRead ? `AND(\`storage_drives\`.\`maxRead\`  LIKE '%${where.maxRead}%')` : '') +
            (where.maxWrite ? `AND(\`storage_drives\`.\`maxWrite\`  LIKE '%${where.maxWrite}%')` : '') +
            (where.cache ? `AND(\`storage_drives\`.\`cache\`  LIKE '%${where.cache}%')` : '') +
            (where.form ? `AND(\`storage_drives\`.\`form\`  LIKE '%${where.form}%')` : '') +
            (where.interface ? `AND(\`storage_drives\`.\`interface\`  LIKE '%${where.interface}%')` : '') +
            (where.pricePerGb ? `AND(\`storage_drives\`.\`pricePerGb\`  LIKE '%${where.pricePerGb}%')` : '')
        );
        try {
            // Get total query record
            const query = selectQuery + relationQuery + whereQuery
            console.log(query)
            let [rawRecords, meta] = await this.Database.query<StorageDriveRowData[]>(query);
            // calculate pagination
            const total = rawRecords.length
            let start = (page - 1) * pageSize;
            if (start > total) start = Math.ceil(total / pageSize - 1) * pageSize
            const currPage = start / pageSize + 1;
            rawRecords = rawRecords.slice(start, start + 1 * pageSize)

            const records: StorageDriveModel[] = rawRecords;
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
