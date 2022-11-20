import dotenv from 'dotenv'
import { connectionAuthenticate } from "@models/index";
import App from './app';
import { migration } from '@models/migration';
dotenv.config();
const PORT = process.env.PORT || 3005;


(async () => {
    console.clear();
    try {
        if (await connectionAuthenticate()) console.log('Database connection successful');
        migration();
        const app = App();

        app.listen(PORT, () => {
            console.log('Server running on ' + 'http://localhost:' + PORT);
        });
    } catch (error) {
        console.log('Unable to connect to the database:\n', error);
    }

})();