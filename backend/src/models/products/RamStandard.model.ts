

import { ProductId, Product } from "@type/models/product";
import { convertWhereQuery } from "@utils/convert.util";
import { Connection, OkPacket, Pool, RowDataPacket } from "mysql2/promise";

interface RamStandardModel {

    ramStandard: string;
}
interface RamStandardRowData extends RamStandardModel, RowDataPacket { }

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
            standard?: string,
        }>{}
    }) {
        // query = extractData(query)
        console.log(query);
        const brandsQuery = "SELECT DISTINCT brand from producers  "
        const gensQuery = "SELECT DISTINCT ramStandard from ram_standards "


        if (Object.keys(query).length > 0) {
            try {
                const [brandOptions, brandMeta] = await this.Database.query(brandsQuery)
                const [genOptions, genMeta] = await this.Database.query(gensQuery)

                const options = {
                    brand: Object.values(brandOptions).map((value) => value.brand),
                    standard: Object.values(genOptions).map((value) => value.ramStandard),
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
