

import { ProductId, Product } from "@type/models/product";
import { Connection, OkPacket, Pool, RowDataPacket } from "mysql2/promise";

interface GpuChipsetModel {

    chipsetName: string;
    memoryType: string;
    chipsetBrand: string;
}
interface GpuChipsetRowData extends GpuChipsetModel, RowDataPacket { }

export default class User {
    Database: Pool;

    constructor(Database: Pool) {
        this.Database = Database
    }

    create(product: Product, callback: Function) {
        const queryString = "INSERT INTO ProductOrder (product_id, customer_id, product_quantity) VALUES (?, ?, ?)"

    };
    async getOption({
        query = <{
            chipsetName?: string,
        }>{}
    }) {
        // query = extractData(query)
        console.log(query);
        const brandsQuery = "SELECT DISTINCT brand from producers  "
        const gensQuery = "SELECT DISTINCT chipsetName from gpu_chipsets "


        if (Object.keys(query).length > 0) {
            try {
                const [brandOptions, brandMeta] = await this.Database.query(brandsQuery)
                const [genOptions, genMeta] = await this.Database.query(gensQuery)

                const options = {
                    brand: Object.values(brandOptions).map((value) => value.brand),
                    chipsetName: Object.values(genOptions).map((value) => value.chipsetName),
                }
                return options

            } catch (error) {
                console.log(error)
                return false;
            }
        } else {
            return false
        }

    }
}
