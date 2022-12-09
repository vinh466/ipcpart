

import { ProductId, Product } from "@type/models/product";
import { convertWhereQuery } from "@utils/convert.util";
import { Connection, OkPacket, Pool, RowDataPacket } from "mysql2/promise";

interface MainboardChipsetModel {

    chipsetName: string;
    socket: string;
    ramStandard: string;
}
interface MainboardChipsetRowData extends MainboardChipsetModel, RowDataPacket { }

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
            socket?: string,
            ramStandard?: string,
        }>{}
    }) {
        // query = extractData(query)
        console.log(query);
        const brandsQuery = "SELECT DISTINCT brand from producers  "
        const chipsetNamesQuery = "SELECT DISTINCT chipsetName from mainboard_chipsets  " + convertWhereQuery([
            { col: 'chipsetName', value: query.chipsetName, operator: 'eq', sqlLogical: 'AND' },
            { col: 'socket', value: query.socket, operator: 'eq', sqlLogical: 'AND' },
            { col: 'ramStandard', value: query.ramStandard, operator: 'eq', sqlLogical: 'AND' },
        ])
        const processorsQuery = "SELECT DISTINCT socket from mainboard_chipsets " + convertWhereQuery([
            { col: 'chipsetName', value: query.chipsetName, operator: 'eq', sqlLogical: 'AND' },
            { col: 'socket', value: query.socket, operator: 'eq', sqlLogical: 'AND' },
            { col: 'ramStandard', value: query.ramStandard, operator: 'eq', sqlLogical: 'AND' },
        ])
        const gensQuery = "SELECT DISTINCT ramStandard from mainboard_chipsets " + convertWhereQuery([
            { col: 'chipsetName', value: query.chipsetName, operator: 'eq', sqlLogical: 'AND' },
            { col: 'socket', value: query.socket, operator: 'eq', sqlLogical: 'AND' },
            { col: 'ramStandard', value: query.ramStandard, operator: 'eq', sqlLogical: 'AND' },
        ])


        if (Object.keys(query).length > 0) {
            try {

                const [brandOptions, brandMeta] = await this.Database.query(brandsQuery)
                const [chipsetNameOptions, chipsetNameMeta] = await this.Database.query(chipsetNamesQuery)
                const [processorOptions, processorMeta] = await this.Database.query(processorsQuery)
                const [genOptions, genMeta] = await this.Database.query(gensQuery)

                const options = {
                    brand: Object.values(brandOptions).map((value) => value.brand),
                    chipset: Object.values(chipsetNameOptions).map((value) => value.chipsetName),
                    socket: Object.values(processorOptions).map((value) => value.socket),
                    ramStandard: Object.values(genOptions).map((value) => value.ramStandard),
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
