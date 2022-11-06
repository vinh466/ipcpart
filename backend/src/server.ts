import express, { Express } from "express";
import dotenv from 'dotenv'
import Route from '@routes/index.route';
import cors from 'cors';
import { morganLogger } from "@middlewares/logger.mdw";
import { Database } from "@models/Database";

dotenv.config();
const PORT = process.env.PORT || 3005;

const app = express();
// parse requests of content-type - application/json
app.use(express.json());
// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));

app.use(cors());

app.use(morganLogger);

app.use('/api', Route);

runApp(app);


async function runApp(app: Express) {
    try {
        await Database.authenticate();
        console.log('Database is running !!!')

        app.listen(PORT, () => {
            console.log('Server running on ' + 'http://localhost:' + PORT);
        });
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }

}