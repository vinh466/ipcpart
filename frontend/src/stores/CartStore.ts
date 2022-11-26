import type { Cart } from '@/types/api/cart'
import { defineStore } from 'pinia'

export interface Purchase {
    id: string;
    name: string;
    photo: string;
    type: string;
    price: number;
    quantity: number
}

interface CartState {
    contents: Record<string, Purchase>
}

export interface CartPreview {
    productId: string;
    productName: string;
    productPhoto: string;
    productType: string;
    price: number;
    quantity: number;
    totalPrice: number;
}

export const useCartStore = defineStore({
    id: 'CartStore',

    state: (): CartState => ({
        contents: JSON.parse(localStorage.getItem('CART_STORAGE') as string) ?? {}
    }),

    getters: {
        count(): number {
            return Object.keys(this.contents).reduce((acc, id) => {
                return acc + this.contents[id].quantity
            }, 0)
        },

        payAmount(): number {
            return Object.keys(this.contents).reduce((acc, id) => {
                return acc + this.contents[id].price * this.contents[id].quantity
            }, 0)
        },

        cartItems(): CartPreview[] {
            return Object.keys(this.contents).map(productId => {
                const purchase = this.contents[productId]
                return {
                    productId: purchase.id,
                    productName: purchase.name,
                    productPhoto: purchase.photo,
                    productType: purchase.type,
                    price: purchase.price,
                    quantity: purchase.quantity,
                    totalPrice: purchase.quantity * purchase.price,
                }
            })
        }
    },

    actions: {
        save() {
            localStorage.setItem('CART_STORAGE', JSON.stringify(this.contents))
        },
        update() {
            this.contents = JSON.parse(localStorage.getItem('CART_STORAGE') as string) ?? {}
        },

        add(productId: string, newQuantity?: number) {
            if (this.contents[productId]) {
                if (newQuantity) this.contents[productId].quantity = newQuantity
                else this.contents[productId].quantity += 1
            }
            this.save();
            return;
        },
        remove(productId: string) {
            if (!this.contents[productId]) {
                return
            }

            if (this.contents[productId].quantity > 1) {
                this.contents[productId].quantity -= 1
                // delete this.contents[productId]
            }
            this.save();
        },
        addToCart(product: Purchase) {
            if (this.contents[product.id]) {
                // this.contents[product.id].quantity += 1
                return;
            } else {
                this.contents[product.id] = {
                    id: product.id,
                    name: product.name,
                    photo: product.photo,
                    type: product.type,
                    price: product.price,
                    quantity: product.quantity
                }
            }
            this.save();
        },
        removeFromCart(productId: string) {
            if (this.contents[productId]) {
                delete this.contents[productId]
            }
            this.save();
            return;
        },
    }
})