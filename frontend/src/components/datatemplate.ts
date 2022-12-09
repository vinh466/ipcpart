import type { Order } from "@/types/api/products/order"
import type { UserItem } from "@/types/api/system/user";

export const productTableHeading = {
    productName: 'Tên',
    productBrand: 'Hãng',
    productPhoto: 'Ảnh',
    productType: 'Loại',
    price: 'Giá',
    inStock: 'Kho',
}
export const product = [
    {
        productId: "0705d5d7-7cff-4fa6-a712-1b21eb757808",
        productName: "Razer DeathAdder Essential",
        productBrand: "Razer",
        productPhoto: "http://localhost:3005/images/products/mouse/430bfeab57e003dfb6c1d292339e1df8.256p.jpg",
        productType: "mouse",
        price: 474.5,
        inStock: 144,
        updatedAt: null,
        createdAt: "2022-11-20T12:15:09.000Z"
    },
    {
        productId: "0f2802ca-113a-4c8b-b7d2-59affeb2e895",
        productName: "Glorious MODEL O",
        productBrand: "Glorious",
        productPhoto: "http://localhost:3005/images/products/mouse/ab7f3f6e7b4d49a7dbaec72d7ec00b2b.256p.jpg",
        productType: "mouse",
        price: 1118.75,
        inStock: 96,
        updatedAt: null,
        createdAt: "2022-11-20T12:15:09.000Z"
    },
    {
        productId: "10fb9239-5190-4479-9b43-feed314f8a01",
        productName: "Logitech G305 (White)",
        productBrand: "Logitech",
        productPhoto: "http://localhost:3005/images/products/mouse/e5ae54669b6dc857c4d03a26e70ed9d5.256p.jpg",
        productType: "mouse",
        price: 949.75,
        inStock: 102,
        updatedAt: null,
        createdAt: "2022-11-20T12:15:09.000Z"
    },
    {
        productId: "156209a7-a0dc-4fcf-870d-bdb154183e41",
        productName: "Verbatim 98113",
        productBrand: "Verbatim",
        productPhoto: "http://localhost:3005/images/products/mouse/e68c83700ec204d722f08c0a5c2a0b81.256p.jpg",
        productType: "mouse",
        price: 124.75,
        inStock: 172,
        updatedAt: null,
        createdAt: "2022-11-20T12:15:09.000Z"
    },
    {
        productId: "1cc1dcbf-5caa-4c1a-81c7-c44de0ff1e7f",
        productName: "Razer Mamba Elite",
        productBrand: "Razer",
        productPhoto: "http://localhost:3005/images/products/mouse/c2346112fa183f5096da60261edf05c2.256p.jpg",
        productType: "mouse",
        price: 998.75,
        inStock: 4,
        updatedAt: null,
        createdAt: "2022-11-20T12:15:09.000Z"
    },
    {
        productId: "24203417-6b82-40ae-8dec-cb7dedbfe5cd",
        productName: "SteelSeries Rival 3",
        productBrand: "SteelSeries",
        productPhoto: "http://localhost:3005/images/products/mouse/24c3004e0bf166466ca2e8cf1ab55490.256p.jpg",
        productType: "mouse",
        price: 524.75,
        inStock: 115,
        updatedAt: null,
        createdAt: "2022-11-20T12:15:09.000Z"
    },
    {
        productId: "2c231c7d-6385-428f-842d-92294b45c5da",
        productName: "Razer Basilisk V3 Pro",
        productBrand: "Razer",
        productPhoto: "http://localhost:3005/images/products/mouse/b5ae883a17a1d332780a63f64f8df4b0.256p.jpg",
        productType: "mouse",
        price: 3999.75,
        inStock: 191,
        updatedAt: null,
        createdAt: "2022-11-20T12:15:09.000Z"
    },
    {
        productId: "2ecc1c1f-639b-4087-8a7c-1a84aba3edc2",
        productName: "Glorious MODEL O",
        productBrand: "Glorious",
        productPhoto: "http://localhost:3005/images/products/mouse/89c77ccaf0bdca3bde6bcc2d3890f6cb.256p.jpg",
        productType: "mouse",
        price: 1118.75,
        inStock: 79,
        updatedAt: null,
        createdAt: "2022-11-20T12:15:09.000Z"
    },
    {
        productId: "3acd7f96-c641-4cf8-9e68-f32a30eee1de",
        productName: "Razer Lancehead Tournament Edition Mercury",
        productBrand: "Razer",
        productPhoto: "http://localhost:3005/images/products/mouse/41gHyYVxVwL.jpg",
        productType: "mouse",
        price: 5999.75,
        inStock: 171,
        updatedAt: null,
        createdAt: "2022-11-20T12:15:09.000Z"
    },
    {
        productId: "41f8edde-621f-4a55-a773-0602e5d53358",
        productName: "Logitech G700s",
        productBrand: "Logitech",
        productPhoto: "http://localhost:3005/images/products/mouse/51VdAZz7I9L.jpg",
        productType: "video card",
        price: 10500,
        inStock: 28,
        updatedAt: null,
        createdAt: "2022-11-20T12:15:09.000Z"
    }
]

export const order: Order[] = [
    {
        orderId: "orderIdasdasd-asdasdas-dasda",
        "username": "vinhvinh",
        "email": "vinh466@gmail.com",
        "name": "Vinh",
        "lastname": "Nguyen",
        "address": "123/321 Xuan Khanh Ninh Kieu",
        "city": "Cần Thơ",
        "phone": "0334680701",
        status: 'compeleted',
        "paymentMethod": "cod",
        "paymentTotal": 69276.75,
        "orderItems": [
            {
                "productId": "02b53d23-f67b-4ece-a0f1-88ccb91294d9",
                "productName": "MSI PRO B660M-A DDR4",
                "productPhoto": "http://localhost:3005/images/products/mainboard/cfd365831befdd481872962fb2c0d799.256p.jpg",
                "productType": "mainboard",
                "price": 3249.75,
                "quantity": 1,
                "totalPrice": 3249.75
            },
            {
                "productId": "1198b9d6-7a84-4aab-9e1c-09f6f91c18e1",
                "productName": "MSI B550M PRO-VDH WIFI",
                "productPhoto": "http://localhost:3005/images/products/mainboard/57b4a5399dc626e9c5786f786aeb94ac.256p.jpg",
                "productType": "mainboard",
                "price": 2999.75,
                "quantity": 1,
                "totalPrice": 2999.75
            },
            {
                "productId": "0749c7f1-55d9-4455-ac82-d7519f52bfe2",
                "productName": "Asus ROG STRIX Z690-A GAMING WIFI D4",
                "productPhoto": "http://localhost:3005/images/products/mainboard/519E97-55L.jpg",
                "productType": "mainboard",
                "price": 7749.75,
                "quantity": 1,
                "totalPrice": 7749.75
            },
            {
                "productId": "03601ea7-597f-4c27-889c-05fe7a30b146",
                "productName": "AMD Threadripper 3960X",
                "productPhoto": "http://localhost:3005/images/products/cpu/amd-threadripper-3960x.jpg",
                "productType": "cpu",
                "price": 50252.5,
                "quantity": 1,
                "totalPrice": 50252.5
            },
            {
                "productId": "c712eac4-b11e-4c67-a678-9003da39dc78",
                "productName": "Dell S2522HG",
                "productPhoto": "http://localhost:3005/images/products/monitor/0e0a67d72fdd4d79c18d9edd25bf8a5d.256p.jpg",
                "productType": "monitor",
                "price": 5025,
                "quantity": 1,
                "totalPrice": 5025
            }
        ]
    }]


export const user: UserItem[] = [{
    username: 'vinhvinh',
    avatar: 'string',
    email: 'string',
    name: 'string',
    lastname: 'string',
    address: 'string',
    city: 'string',
    phone: 'string',
    role: ['user'],

}]