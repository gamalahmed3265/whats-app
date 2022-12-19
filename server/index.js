
const http = require('http');
const server=http.createServer();
const {Server}=require('socket.io');
const io=new Server(server);
// const express = require('express');
// const mongose = require('mongoose');

// const app=express();
const port=process.env.PORT || 3700;

// app.use(express.json());
// username: gamal
// password dikcfBguzwGxHuOO


// app.set("views","views");
// app.use(express.static("views"));
// app.get('/',(req,res)=>{
//   return res.send("hhh");
// });

io.on('connection', (socket) => {
    console.log('someone connected!');
    console.log(socket.id,"has join");
    // var myroom=socket.handshake.query.uid;
    // console.log(myroom);

    socket.on("position-change",(data)=>{
      io.emit("position-change",(data)=>{
      });

      socket.on("disconnect",()=>{

      });
    });
    });


// const DB="mongodb+srv://gamal:dikcfBguzwGxHuOO@cluster0.uk9jh.mongodb.net/myFirstDatabase?retryWrites=true&w=majority";
// mongose.connect(DB).then(()=>{
//   console.log("mongose DB");
// }).catch((e)=>{
//   console.log(e.toString());
// });

server.listen(port,"0.0.0.0",()=>{
    console.log(`server start ${port}`);
});














// app.set("views","views");
// app.use(express.static('views'));

//
// const server=app.listen(port,()=>{
//     console.log(`server is started on : ${port}`);
// })
//
// const io=require('socket.io')(server);
//
// app.set("views","./views");
// app.use(express.static('views'));
// app.get('/',(req,res)=>{
//     return res.rander('index.html')
// });
//
//
// io.on('connection', (socket) => {
//     console.log('someone connected!',socket.id);
//
//     });





//     server.listen(port,()=>{
//         console.log("server start");
//     });
// var http = require('http');
// const cors = require('cors');
// const app=express();
//
//
//
//
// var server=http.createServer(app);
// var io=require('socket.io')(server);
//
// app.use(express.json());
// app.use(cors());






 // stream.on('message',data=>{
    // console.log(data);
    // })

// app.set("views","./views");
// app.use(express.static('views'));
// app.get('/',(req,res)=>{
//     return res.rander('index.html')
// });



// io.on('connection', (socket) => {
//     console.log('someone connected!');
//     // console.log(socket.id,"has join");
//     var myroom=socket.handshake.query.uid;
//     console.log(myroom);
//     socket.on("/test",(msg)=>{
//         console.log(msg);
//     })
//     });



























// const express=require("express");
// const app=express();
// const server=require("http").createServer(app);
// const io=require("socket.io")(server,{

// });
// app.get("/",(req,res)=>{
//   console.log(res);
//   res.render("home");
// })

// server.listen(3001,()=>{
//   console.log("server Runing");
// });

// io.on("connection",(socket)=>{
//   console.log("welcome"+socket.id);
// })
