import { NextFunction, Request, Response, Router } from "express";
import { isAdmin, isUser } from "@middlewares/auth.mdw";
import { getCpu, getNameCpus, getOptions, insertCpu, updateCpu } from "@controllers/products/cpu.controller";

const cpuRoute = Router();

cpuRoute.use(function (req, res, next) {
    res.header("Access-Control-Allow-Headers", "x-access-token, Origin, Content-Type, Accept");
    next();
});

cpuRoute.get('/', getCpu)
cpuRoute.post('/', insertCpu)
cpuRoute.patch('/', updateCpu)
cpuRoute.get('/getOptions', getOptions)
cpuRoute.get('/names', getNameCpus)

// cpuRoute.get('/test')

export default cpuRoute;