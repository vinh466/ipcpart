export interface ProductId {
    productId: string,
}

export interface Product extends ProductId {
    productName: string,
    productBrand: string,
    productPhoto: string,
    productType: string,
    price: number,
    inStock: number,
    updatedAt: string,
    createdAt: string,
    deletedAt: string,
}
