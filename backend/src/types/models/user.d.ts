
export interface User {
    username: string;
    email: string;
    roles: Role
    name?: string;
    lastname?: string;
    password?: string;
    address?: string;
    city?: string;
    phone?: string;
    createAt?: Date;
    updatedAt?: Date;
}

export interface UserSignIn {
    username: string;
    password: string;
}

export interface UserSignUp {
    username: string;
    password: string;
    email?: string;
    roles?: Role
    name?: string;
    lastname?: string;
    password?: string;
    address?: string;
    city?: string;
    phone?: string;
}


export interface UserUpdateData {
    username?: string;
    email?: string;
    name?: string;
    lastname?: string;
    password?: string;
    roles?: string;
    address?: string;
    city?: string;
    phone?: string;
} 