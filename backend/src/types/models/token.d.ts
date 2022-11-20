export interface RefreshToken {
    refreshToken: string;
    username: string;
    expiryDate: Date;
}
export interface Token {
    username: string;
    exp: number;
}