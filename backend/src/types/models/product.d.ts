export interface ProductId {
    productId: string,
}

export interface Product {
    productId: string;
    productName: string;
    productBrand: string;
    productPhoto: string;
    productType: string;
    discount?: double;
    price: double;
    inStock: number;
    updatedAt: Date;
    createdAt: Date;
    deletedAt: Date;
    review?: {
        rate?: number;
        total?: number;
    };
}
