
import dotenv from 'dotenv'
import { Product } from "@type/models/product";
import { Connection, OkPacket, Pool, ResultSetHeader, RowDataPacket } from "mysql2/promise";
import { Order as IOdder, OrderForm, OrderItem, OrderStatus, OrderStatusCode, OrderUpdateForm } from '@type/models/order';
import { v4 as uuidv4 } from 'uuid';
import { convertRegexpQuery, convertSetUpdateQuery, convertWhereQuery, extractData } from '@utils/convert.util';

interface OrderModel extends Product, IOdder { }

interface OrderRowData extends OrderModel, RowDataPacket { }
dotenv.config();
const SERVERNAME = process.env.SERVERNAME || 'localhost';
export default class Order {
    Database: Pool;

    constructor(Database: Pool) {
        this.Database = Database
    }
    async getOrders({
        page = 1,
        pageSize = 50,
        where = <{
            username?: string;
            user?: string;
            orderId?: string;
            city?: string[];
            name?: string[];
            lastname?: string[];
            status?: string[];
            address?: string[];
            phone?: string[];
            paymentMethod?: string[];
        }>{}
    } = {}) {
        const selectQuery = "SELECT" +
            "`orders`.`orderId`," +
            "`users`.`username`," +
            "`users`.`email`," +
            "`users`.`name`," +
            "`users`.`lastname`," +
            "`orders`.`paymentMethod`," +
            "`paymentTotal`," +
            "`orders`.`city`," +
            "`orders`.`status`," +
            "`orders`.`address`," +
            "`orders`.`phone`," +
            "JSON_ARRAYAGG(JSON_OBJECT(" +
            "'productId',`products`.`productId`," +
            "'productPhoto',`products`.`productPhoto`," +
            "'productName',`products`.`productName`," +
            "'price', `order_items`.`price`," +
            "'quantity', `order_items`.`quantity`)" +
            ") as 'orderItems'," +
            "`orders`.`createdAt`," +
            "`orders`.`updatedAt`," +
            "`orders`.`deletedAt`"
        const relationQuery =
            "FROM `orders`" +
            "JOIN `users` ON `users`.`username` = `orders`.`username`" +
            "JOIN `order_items` ON `order_items`.`orderId` = `orders`.`orderId`" +
            "JOIN `products` ON `order_items`.`productId` = `products`.`productId`"

        where = extractData(where)
        const whereQuery = convertWhereQuery([
            { col: 'orders.deletedAt', value: 'NULL', operator: 'is', sqlLogical: 'AND' },
            { col: 'orders.status', value: where.status, operator: 'REGEXP', sqlLogical: 'AND' },
            { col: 'orders.username', value: where.user, operator: 'eq', sqlLogical: 'AND' },
            [
                { col: 'orders.username', value: where.username, operator: 'eq', sqlLogical: 'OR' },
                { col: 'orders.orderId', value: where.orderId, operator: 'eq', sqlLogical: 'OR' },
                { col: 'orders.paymentMethod', value: where.paymentMethod, operator: 'REGEXP', sqlLogical: 'OR' },
                { col: 'orders.city', value: where.city, operator: 'REGEXP', sqlLogical: 'OR' },
                { col: 'users.name', value: where.name, operator: 'REGEXP', sqlLogical: 'OR' },
                { col: 'users.lastname', value: where.lastname, operator: 'REGEXP', sqlLogical: 'OR' },
                { col: 'orders.address', value: where.address, operator: 'REGEXP', sqlLogical: 'OR' },
                { col: 'orders.phone', value: where.phone, operator: 'REGEXP', sqlLogical: '' },
            ],
        ])

        const whereQuery2 = ('WHERE(`orders`.`deletedAt` IS NULL) ' +
            (where.username ? `OR (\`users\`.\`username\` = '${where.username}')` : '') +
            (where.orderId ? `OR (\`orders\`.\`orderId\` = '${where.orderId}')` : '') +
            (where.paymentMethod ? `OR (\`orders\`.\`paymentMethod\` REGEXP '${convertRegexpQuery(where.paymentMethod)}')` : '') +
            (where.city ? `OR (\`orders\`.\`city\` REGEXP '${convertRegexpQuery(where.city)}')` : '') +
            (where.status ? `OR (\`orders\`.\`status\` REGEXP '${convertRegexpQuery(where.status)}')` : '') +
            (where.address ? `OR (\`orders\`.\`address\` REGEXP '${convertRegexpQuery(where.address)}')` : '') +
            (where.phone ? `OR (\`orders\`.\`phone\` REGEXP '${convertRegexpQuery(where.phone)}')` : '') +
            "GROUP BY `orders`.`orderId`"
        );

        try {
            // Get total query record
            const query = selectQuery + relationQuery + whereQuery + ' GROUP BY `orders`.`orderId` ORDER BY `orders`.`createdAt` DESC;'
            console.log(query)
            let [rawRecords, meta] = await this.Database.query<OrderRowData[]>(query);
            // calculate pagination
            const total = rawRecords.length
            let start = (page - 1) * pageSize;
            if (start > total) start = Math.ceil(total / pageSize - 1) * pageSize
            const currPage = start / pageSize + 1;
            rawRecords = rawRecords.slice(start, start + 1 * pageSize)

            rawRecords.forEach(async (element) => {
                const obj = element as OrderModel
                obj.orderItems = await JSON.parse(obj.orderItems as string);
            });
            return { records: rawRecords, total, currPage }
        } catch (err) {
            console.log(err)
            return false;
        }
    }
    async insertOne(order: OrderForm) {
        const addOrderQuery = "INSERT INTO `orders`(`orderId`, `username`, `phone`, `paymentMethod`, `paymentTotal`, `status`, `address`, `city`) VALUES (?);"
        const addOrderItemQuery = "INSERT INTO `order_items`(`orderId`, `productId`, `quantity`, `price`) VALUES ?;"
        try {
            const conn = await this.Database.getConnection();
            try {
                await conn.beginTransaction()
                const orderId = uuidv4()

                const [result, meta] = await conn.query<ResultSetHeader>(
                    { sql: addOrderQuery },
                    [[
                        orderId,
                        order.username,
                        order.phone,
                        order.paymentMethod,
                        order.paymentTotal,
                        OrderStatusCode.PENDING,
                        order.address,
                        order.city
                    ]]
                )
                const orderItems = order.orderItems.map((value, index) => {
                    return [
                        orderId,
                        value.productId,
                        value.quantity,
                        value.price,
                    ]
                })
                console.log(orderItems);
                await conn.query<ResultSetHeader>({ sql: addOrderItemQuery }, [orderItems])
                conn.commit();
                console.log(result);
                return result
            } catch (error) {
                await conn.rollback();
                throw error
            } finally {
                conn.release();
            }
        } catch (error) {
            console.log(error)
            return null
        }
    }
    async update(orderId: string, data: OrderUpdateForm) {
        console.log(data);
        try {
            const setUpdateQuery = convertSetUpdateQuery(data)
            if (!setUpdateQuery) throw new Error('No update field')
            const query = "UPDATE`orders`" +
                "SET" +
                setUpdateQuery +
                ` WHERE\`orderId\` = '${orderId}';`
            console.log(query);
            const [result, meta] = await this.Database.query<ResultSetHeader>({ sql: query })
            return result
        } catch (error) {
            console.log(error)
            return null
        }
    }
}
