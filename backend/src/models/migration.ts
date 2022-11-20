import { cpuData, cpuGenData, cpuProcessorData, cpuTypeData, socketData } from "@assets/rawdata/cpu";
import { producerData } from "@assets/rawdata/producer";
import { ramData, ramStandardData } from "@assets/rawdata/ram";
import { mainboardChipsetData, mainboardData } from "@assets/rawdata/mainboard";
import { gpuChipsetData, videCardData } from "@assets/rawdata/videoCard";
import { PoolConnection, RowDataPacket } from "mysql2/promise";
import { Models } from ".";
import { monitorData } from "@assets/rawdata/monitor";
import { mouseData } from "@assets/rawdata/mouse";
import { storageDriveData } from "@assets/rawdata/storageDrive";

export async function migration() {
    await producerGenarate();
    await cpuFamilyGenarate();
    await cpuGenerationGenarate();
    await socketTypeGenarate();
    await cpuTypeGenarate();
    await ramStandartGenarate();
    await mainboardChipsetGenarate();
    await gpuChipsetGenarate();
    await cpuGenarate();
    await mainboardGenarate();
    await ramGenarate();
    await monitorGenarate();
    await mouseGenarate();
    await videocardGenarate();
    await storageDriveGenarate();
}
function getRandomInt(max: number) {
    return Math.floor(Math.random() * max);
}
async function producerGenarate() {
    const [result, meta] = await Models.Database.query<RowDataPacket[]>('select * from `producers`');
    if (!result[0])
        Models.Database.query('Insert into `producers` value ?', [producerData.map((obj) => {
            return Object.values(obj)
        })]);
}
async function cpuFamilyGenarate() {
    const [result, meta] = await Models.Database.query<RowDataPacket[]>('select * from `cpu_familys`');
    if (!result[0])
        Models.Database.query('Insert into `cpu_familys` value ?', [cpuProcessorData.map((obj) => {
            return Object.values(obj)
        })]);
}
async function cpuGenerationGenarate() {
    const [result, meta] = await Models.Database.query<RowDataPacket[]>('select * from `cpu_generations`');
    if (!result[0])
        Models.Database.query('Insert into `cpu_generations` value ?', [cpuGenData.map((obj) => {
            return Object.values(obj)
        })]);
}
async function socketTypeGenarate() {
    const [result, meta] = await Models.Database.query<RowDataPacket[]>('select * from `socket_types`');
    if (!result[0])
        Models.Database.query('Insert into `socket_types` value ?', [socketData.map((obj) => {
            return Object.values(obj)
        })]);
}
async function cpuTypeGenarate() {
    const [result, meta] = await Models.Database.query<RowDataPacket[]>('select * from `cpu_types`');
    if (!result[0])
        Models.Database.query('Insert into `cpu_types` (`gen`, `processor`, `brand`, `socket`) value ?', [cpuTypeData.map((obj) => {
            return Object.values(obj)
        })]);
}
async function ramStandartGenarate() {
    const [result, meta] = await Models.Database.query<RowDataPacket[]>('select * from `ram_standards`');
    if (!result[0])
        Models.Database.query('Insert into `ram_standards` value ?', [ramStandardData.map((obj) => {
            return Object.values(obj)
        })]);
}
async function mainboardChipsetGenarate() {
    const [result, meta] = await Models.Database.query<RowDataPacket[]>('select * from `mainboard_chipsets`');
    if (!result[0])
        Models.Database.query('Insert into `mainboard_chipsets` value ?', [mainboardChipsetData.map((obj) => {
            return Object.values(obj)
        })]);
}
async function gpuChipsetGenarate() {
    const [result, meta] = await Models.Database.query<RowDataPacket[]>('select * from `gpu_chipsets`');
    if (!result[0])
        Models.Database.query('Insert into `gpu_chipsets` (chipsetBrand ,memoryType ,chipsetName ) value ?', [gpuChipsetData.map((obj) => {
            return Object.values(obj)
        })]);
}
async function productGenarate(conn: PoolConnection, productData: {
    productId: string,
    productName: string,
    productBrand: string,
    productPhoto: string,
    productType: string,
    price: number,
    inStock: number,
    updatedAt?: any
    deletedAt?: any
    createdAt?: any
}) {
    return new Promise(async (resolve, rejects) => {
        try {
            var CURRENT_TIMESTAMP = { toSqlString: function () { return 'CURRENT_TIMESTAMP()'; } };
            productData.updatedAt = null
            productData.createdAt = CURRENT_TIMESTAMP
            productData.deletedAt = null
            await conn.query<RowDataPacket[]>('insert into `products` value ?', [[Object.values(productData)]]);
            resolve(true);
        } catch (e) {
            rejects(e);
        }

    })
}
async function cpuGenarate() {
    const [result, meta] = await Models.Database.query<RowDataPacket[]>('select * from `cpus`');
    if (!result[0]) {
        console.time("cpuGenarate Time");
        try {
            const conn = await Models.Database.getConnection();
            try {
                await conn.beginTransaction()
                cpuData.forEach(async (cpu) => {
                    let cpuId = cpu.cpuId;
                    let productData = {
                        productId: cpuId,
                        productName: cpu.name,
                        productBrand: cpu.brand,
                        productPhoto: cpu.imgUrl,
                        productType: 'cpu',
                        price: cpu.price * 25.000,
                        inStock: getRandomInt(200),
                    }
                    let cpuType = {
                        brand: cpu.brand,
                        processor: cpu.processor,
                        gen: cpu.gen,
                        socket: cpu.socket,
                    }
                    let [result, meta] = await conn.query<RowDataPacket[]>("SELECT `cpuTypeId` FROM cpu_types WHERE brand =? And processor =? And gen =? And socket=?;", Object.values(cpuType))
                    let cpuData = {
                        cpuId: cpuId,
                        cpuTypeId: result[0].cpuTypeId,
                        coreCount: cpu.coreCount,
                        coreClock: cpu.coreClock,
                        coreBoost: cpu.boostClock,
                        thread: 0,
                        tdp: cpu.TDP,
                        iGpu: cpu.iGpu,
                    }
                    await productGenarate(conn, productData);
                    await conn.query<RowDataPacket[]>('insert into `cpus` value ?', [[Object.values(cpuData)]])

                })
                conn.commit();
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
        console.timeEnd("cpuGenarate Time");
    }
}
async function mainboardGenarate() {
    const [result, meta] = await Models.Database.query<RowDataPacket[]>('select * from `mainboards`');
    if (!result[0]) {
        console.time("mainboardsGenarate Time");
        try {
            const conn = await Models.Database.getConnection();
            try {
                await conn.beginTransaction()
                mainboardData.forEach(async (mainboard) => {
                    let mainboardId = mainboard.mainboardId;
                    let productData = {
                        productId: mainboardId,
                        productName: mainboard.mainboardName,
                        productBrand: mainboard.brand,
                        productPhoto: mainboard.imgUrl,
                        productType: 'mainboard',
                        price: mainboard.price * 25.000,
                        inStock: getRandomInt(200),
                    }
                    let mainboardData = {
                        mainboardId,
                        chipset: mainboard.chipset,
                        form: mainboard.form,
                        color: mainboard.color,
                        ramCap: mainboard.ramCap,
                        ramSlot: mainboard.ramSlot,
                    }
                    await productGenarate(conn, productData);
                    await conn.query<RowDataPacket[]>('insert into `mainboards` value ?', [[Object.values(mainboardData)]])

                })
                conn.commit();
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
        console.timeEnd("mainboardsGenarate Time");
    }
}

async function ramGenarate() {
    const [result, meta] = await Models.Database.query<RowDataPacket[]>('select * from `rams`');
    if (!result[0]) {
        console.time("ramsGenarate Time");
        try {
            const conn = await Models.Database.getConnection();
            try {
                await conn.beginTransaction()
                ramData.forEach(async (ram) => {
                    let ramId = ram.ramId;
                    let productData = {
                        productId: ramId,
                        productName: ram.ramName,
                        productBrand: ram.brand,
                        productPhoto: ram.imgUrl,
                        productType: 'ram',
                        price: ram.price * 25.000,
                        inStock: getRandomInt(200),
                    }
                    let ramData = {
                        ramId,
                        capacity: ram.capacity,
                        speed: ram.speed,
                        standard: ram.standard,
                        module: ram.module,
                        color: ram.color,
                        latency: ram.latency,
                        cas: ram.cas,
                        pricePerGb: ram.pricePerGb * 25.000,
                    }
                    await productGenarate(conn, productData);
                    await conn.query<RowDataPacket[]>('insert into `rams` value ?', [[Object.values(ramData)]])

                })
                conn.commit();
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
        console.timeEnd("ramsGenarate Time");
    }
}
async function monitorGenarate() {
    const [result, meta] = await Models.Database.query<RowDataPacket[]>('select * from `monitors`');
    if (!result[0]) {
        console.time("monitorsGenarate Time");
        try {
            const conn = await Models.Database.getConnection();
            try {
                await conn.beginTransaction()
                monitorData.forEach(async (monitor) => {
                    let monitorId = monitor.monitorId;
                    let productData = {
                        productId: monitorId,
                        productName: monitor.monitorName,
                        productBrand: monitor.brand,
                        productPhoto: monitor.imgUrl,
                        productType: 'monitor',
                        price: monitor.price * 25.000,
                        inStock: getRandomInt(200),
                    }
                    let monitorData = {
                        monitorId,
                        screenSize: monitor.screenSize,
                        resolution: monitor.resolution,
                        refreshRate: monitor.refreshRate,
                        responseTime: monitor.responseTime,
                        panelType: monitor.panelType,
                        ratio: monitor.ratio,
                    }
                    await productGenarate(conn, productData);
                    await conn.query<RowDataPacket[]>('insert into `monitors` value ?', [[Object.values(monitorData)]])

                })
                conn.commit();
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
        console.timeEnd("monitorsGenarate Time");
    }
}
async function mouseGenarate() {
    const [result, meta] = await Models.Database.query<RowDataPacket[]>('select * from `mouses`');
    if (!result[0]) {
        console.time("mousesGenarate Time");
        try {
            const conn = await Models.Database.getConnection();
            try {
                await conn.beginTransaction()
                mouseData.forEach(async (mouse) => {
                    let mouseId = mouse.mouseId;
                    let productData = {
                        productId: mouseId,
                        productName: mouse.mouseName,
                        productBrand: mouse.brand,
                        productPhoto: mouse.imgUrl,
                        productType: 'mouse',
                        price: mouse.price * 25.000,
                        inStock: getRandomInt(200),
                    }
                    let mouseData = {
                        mouseId,
                        trackingMethod: mouse.trackingMethod,
                        conectType: mouse.conectType,
                        dpi: mouse.dpi,
                        hand: mouse.hand,
                        color: mouse.color,
                    }
                    await productGenarate(conn, productData);
                    await conn.query<RowDataPacket[]>('insert into `mouses` value ?', [[Object.values(mouseData)]])

                })
                conn.commit();
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
        console.timeEnd("mousesGenarate Time");
    }
}
async function videocardGenarate() {
    const [result, meta] = await Models.Database.query<RowDataPacket[]>('select * from `video_cards`');
    if (!result[0]) {
        console.time("videocardsGenarate Time");
        try {
            const conn = await Models.Database.getConnection();
            try {
                await conn.beginTransaction()
                videCardData.forEach(async (videocard) => {
                    let videocardId = videocard.videoCardId;
                    let productData = {
                        productId: videocardId,
                        productName: videocard.videoCardName,
                        productBrand: videocard.brand,
                        productPhoto: videocard.imgUrl,
                        productType: 'video card',
                        price: videocard.price * 25.000,
                        inStock: getRandomInt(200),
                    }
                    let videocardData = {
                        videocardId,
                        chipsetName: videocard.chipsetName,
                        coreClock: videocard.coreClock,
                        boostClock: videocard.boostClock,
                        color: videocard.color,
                        length: videocard.length,
                        memory: videocard.memory,
                    }
                    await productGenarate(conn, productData);
                    await conn.query<RowDataPacket[]>('insert into `video_cards` value ?', [[Object.values(videocardData)]])

                })
                conn.commit();
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
        console.timeEnd("videocardsGenarate Time");
    }
}
async function storageDriveGenarate() {
    const [result, meta] = await Models.Database.query<RowDataPacket[]>('select * from `storage_drives`');
    if (!result[0]) {
        console.time("storageDrivesGenarate Time");
        try {
            const conn = await Models.Database.getConnection();
            try {
                await conn.beginTransaction()
                storageDriveData.forEach(async (storageDrive) => {
                    let storageDriveId = storageDrive.storageDriveId;
                    let productData = {
                        productId: storageDriveId,
                        productName: storageDrive.storageDriveName,
                        productBrand: storageDrive.brand,
                        productPhoto: storageDrive.imgUrl,
                        productType: 'storage drive',
                        price: storageDrive.price * 25.000,
                        inStock: getRandomInt(200),
                    }
                    let storageDriveData = {
                        storageDriveId,
                        type: storageDrive.type,
                        capacity: storageDrive.capacity,
                        maxRead: storageDrive.maxRead,
                        maxWrite: storageDrive.maxWrite,
                        cache: storageDrive.cache,
                        form: storageDrive.form,
                        interface: storageDrive.interface,
                        pricePerGb: storageDrive.pricePerGb * 25000,

                    }
                    await productGenarate(conn, productData);
                    await conn.query<RowDataPacket[]>('insert into `storage_drives` value ?', [[Object.values(storageDriveData)]])

                })
                conn.commit();
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
        console.timeEnd("storageDrivesGenarate Time");
    }
}