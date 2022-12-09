

import { ProductId, Product } from "@type/models/product";
import { convertWhereQuery, extractData } from "@utils/convert.util";
import { Connection, OkPacket, Pool, RowDataPacket } from "mysql2/promise";

interface CpuTypeModel {

    cpuTypeId?: number;
    brand: string;
    processor: string;
    gen: string;
    socket: string;
    updatedAt?: Date;
    createdAt?: Date;
}
interface CpuTypeRowData extends CpuTypeModel, RowDataPacket { }

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
            brand?: string;
            processor?: string;
            gen?: string;
            socket?: string;
        }>{}
    }) {
        // query = extractData(query)
        console.log(query);
        const brandsQuery = "SELECT DISTINCT brand from cpu_types  " + convertWhereQuery([
            { col: 'processor', value: query.processor, operator: 'eq', sqlLogical: 'AND' },
            { col: 'gen', value: query.gen, operator: 'eq', sqlLogical: 'AND' },
            { col: 'socket', value: query.socket, operator: 'eq', sqlLogical: 'AND' },
        ])
        const processorsQuery = "SELECT DISTINCT processor from cpu_types " + convertWhereQuery([
            { col: 'brand', value: query.brand, operator: 'eq', sqlLogical: 'AND' },
            { col: 'gen', value: query.gen, operator: 'eq', sqlLogical: 'AND' },
            { col: 'socket', value: query.socket, operator: 'eq', sqlLogical: 'AND' },
        ])
        const gensQuery = "SELECT DISTINCT gen from cpu_types " + convertWhereQuery([
            { col: 'brand', value: query.brand, operator: 'eq', sqlLogical: 'AND' },
            { col: 'processor', value: query.processor, operator: 'eq', sqlLogical: 'AND' },
            { col: 'socket', value: query.socket, operator: 'eq', sqlLogical: 'AND' },
        ])
        const socketsQuery = "SELECT DISTINCT socket from cpu_types  " + convertWhereQuery([
            { col: 'brand', value: query.brand, operator: 'eq', sqlLogical: 'AND' },
            { col: 'processor', value: query.processor, operator: 'eq', sqlLogical: 'AND' },
            { col: 'gen', value: query.gen, operator: 'eq', sqlLogical: 'AND' },
        ])


        if (Object.keys(query).length > 0) {
            try {

                const [brandOptions, brandMeta] = await this.Database.query(brandsQuery, [query.brand])
                const [processorOptions, processorMeta] = await this.Database.query(processorsQuery, [query.brand])
                const [genOptions, genMeta] = await this.Database.query(gensQuery, [query.brand])
                const [socketOptions, socketMeta] = await this.Database.query(socketsQuery, [query.socket, query.processor, query.gen])

                const options = {
                    brand: Object.values(brandOptions).map((value) => value.brand),
                    processor: Object.values(processorOptions).map((value) => value.processor),
                    gen: Object.values(genOptions).map((value) => value.gen),
                    socket: Object.values(socketOptions).map((value) => value.socket)
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
