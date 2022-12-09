import { deleteStaff, getAllStaff, getOne, createStaff, updateStaff } from "@controllers/staff.controller";
import { isAdmin, isStaff, isUser } from "@middlewares/auth.mdw";
import { NextFunction, Request, Response, Router } from "express";

const staffRoute = Router();

staffRoute.use(function (req, res, next) {
    res.header("Access-Control-Allow-Headers", "x-access-token, Origin, Content-Type, Accept");
    next();
});

staffRoute
    // .get('/', isStaff, getOne)
    .get('/admin/', isAdmin, getAllStaff)
    .post('/admin/', isAdmin, createStaff)
    .patch('/admin/', isAdmin, updateStaff)
    .delete('/admin/', isAdmin, deleteStaff)
// .post('/admin/', isAdmin, insertOne)
// .patch('/admin/', isAdmin, updateOrder)

export default staffRoute;