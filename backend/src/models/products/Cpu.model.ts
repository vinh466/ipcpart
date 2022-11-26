import { Product, ProductId } from "@type/models/product";
import { convertRegexpQuery, nestedConvert } from "@utils/convert.util";
import { Connection, escape, OkPacket, Pool, RowDataPacket } from "mysql2/promise";
import { SERVERNAME } from "server";

interface CpuModel extends Product {
    productId: string;
    productName: string;
    cpuTypeId: number;
    productPhoto: string;
    productType: string;
    productBrand: string;
    processor: string;
    gen: string;
    codename: string;
    coreCount: number;
    coreClock: string;
    coreBoost: string;
    thread: number;
    socket: string;
    tdp: string;
    iGpu: string;
    price: number;
}
interface CpuRowData extends CpuModel, RowDataPacket { }

export default class Cpu {
    Database: Pool;

    constructor(Database: Pool) {
        this.Database = Database
    }

    async getCpus({
        page = 1,
        pageSize = 50,
        where = <{
            productId?: string,
            cpuName?: string,
            brand?: string[],
            processor?: string[],
            gen?: string[],
            socket?: string[],
            igpu?: string[],
        }>{}
    } = {}) {
        const selectQuery = ("SELECT" +
            "`product`.`productId`," +
            "`product`.`productName`," +
            "`product`.`productPhoto`," +
            "`product`.`productBrand`," +
            "`product`.`productType`," +
            "`product`.`price`," +
            "`Cpu_Type`.`processor`," +
            "`Cpu_Type`.`gen`," +
            "`Cpu_Type->Cpu_Generation`.`codename`," +
            "`Cpu_Type`.`socket`," +
            "`Cpus`.`coreCount`," +
            "`Cpus`.`coreClock`," +
            "`Cpus`.`coreBoost`," +
            "`Cpus`.`thread`," +
            "`Cpus`.`tdp`," +
            "`Cpus`.`iGpu`," +
            "`product`.`updatedAt`," +
            "`product`.`createdAt`," +
            "`product`.`deletedAt`"
        );

        const relationQuery = (
            "FROM `cpus` " +
            "LEFT OUTER JOIN `Cpu_Types` AS `Cpu_Type` ON`Cpus`.`cpuTypeId` = `Cpu_Type`.`cpuTypeId`" +
            "LEFT OUTER JOIN `Cpu_Generations` AS `Cpu_Type->Cpu_Generation` ON`Cpu_Type`.`gen` = `Cpu_Type->Cpu_Generation`.`gen`" +
            "LEFT OUTER JOIN`products` as `product` ON`product`.`productId` = `cpus`.`cpuId`" +
            "WHERE(`product`.`deletedAt` IS NULL)"
        );

        const whereQuery = ('' +
            (where.productId ? `AND (\`product\`.\`productId\` = '${where.productId}')` : '') +
            (where.cpuName ? `AND (\`product\`.\`productName\` LIKE '%${where.cpuName}%')` : '') +
            (where.brand ? `AND (\`product\`.\`productBrand\` REGEXP '${convertRegexpQuery(where.brand)}')` : '') +
            (where.processor ? `AND (\`Cpu_Type\`.\`processor\` REGEXP '${convertRegexpQuery(where.processor)}')` : '') +
            (where.gen ? `AND (\`Cpu_Type\`.\`gen\` REGEXP '${convertRegexpQuery(where.gen)}')` : '') +
            (where.socket ? `AND (\`Cpu_Type\`.\`socket\` REGEXP '${convertRegexpQuery(where.socket)}')` : '') +
            (where.igpu ? `AND (\`cpus\`.\`iGpu\` REGEXP '${convertRegexpQuery(where.igpu)}')` : '')
        );
        try {
            // Get total query record
            const query = selectQuery + relationQuery + whereQuery
            console.log(query)
            let [rawRecords, meta] = await this.Database.query<CpuRowData[]>(query);
            // calculate pagination
            const total = rawRecords.length
            let start = (page - 1) * pageSize;
            if (start > total) start = Math.ceil(total / pageSize - 1) * pageSize
            const currPage = start / pageSize + 1;
            rawRecords = rawRecords.slice(start, start + 1 * pageSize)

            const records: CpuModel[] = rawRecords;
            rawRecords.forEach(element => {
                const obj = element as CpuModel
                obj.productPhoto = SERVERNAME + obj.productPhoto;
            });
            // // const limitQuery = `LIMIT ${start},${pageSize}`;
            // // const [records, metadata] = await Database.query(selectQuery + relationQuery + whereQuery + limitQuery, {});
            return { records, total, currPage }
        } catch (err) {
            console.log(err)
            return false;
        }
    }

    async getNameCpus(sreachString: string) {
        const query = "SELECT Cpus.cpuName " +
            "FROM `Cpus` AS`Cpus`" +
            "WHERE(`Cpus`.`deletedAt` IS NULL)" +
            `AND(\`Cpus\`.\`cpuName\` LIKE '%${escape(sreachString)}%')\;`

        try {
            const [list, meta] = await this.Database.query<CpuRowData[]>(query)

            return list as Array<CpuModel>
        } catch (error) {
            console.log(error)
            return false;
        }
    }
    create(callback: Function) { };
}