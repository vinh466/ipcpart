import express, { Express } from "express";
import Route from '@routes/index.route';
import cors from 'cors';

import { morganLogger } from "@middlewares/logger.mdw";

export default (): Express => {
    const app: Express = express();

    app.use('/images', express.static('public/images'))
    app.use(express.json());
    app.use(express.urlencoded({ extended: true }));
    app.use(cors());
    app.use(morganLogger);
    app.use('/api', Route);

    return app;
}

