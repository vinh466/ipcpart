
export interface User {
    username: string;
    email: string;
    roles: Role
    password: string;
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
}