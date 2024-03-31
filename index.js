// const express = require("express");
// const {Server} =require ('ws');
// // const app = express()
// const PORT =process.env.PORT || 3000;
// const server = express().use((req ,res)=>res.send ('hello world')).listen(PORT , ()=> console.log('listining'));
// const wss = new Server({server});

// wss.on('connection ',ws =>{
//   console.log('client connected');
//   ws.on('messege',messege => console.log(`Recived ${messege}`));
//   ws.on("close" , ()=>console.log('client dissconnected'));
// });
//routes
// app.get('/',(req , res) =>{
//   res.render("index.ejs")
// })

// app.get('/login',(req , res) =>{
//   res.render("login.ejs")
// })

// app.get('/register',(req , res) =>{
//   res.render("register.ejs")
// })
const express = require('express');
const app = express();


app.use(express.json());
const userRouter=require('./user');
app.use('/user',userRouter);


app.listen(3000,()=>console.log('your server is running on port 3000'));