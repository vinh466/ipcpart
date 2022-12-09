import { User } from "./models/user";
export { }
declare global {

    namespace NodeJS {
        interface ProcessEnv {
            NODE_ENV: 'dev' | 'prod';
            PORT?: number;
        }
    }

    namespace Express {
        export interface Request {
            body: {
                user: User;
            }
            username?: string;
            role?: string;
            isAdmin?: boolean;
        }
    }

}
