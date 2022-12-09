export interface RefreshToken {
    refreshToken: string;
    username: string;
    expiryDate: Date;
}
export interface Token {
    username: string;
    role: string;
    exp: number;
}