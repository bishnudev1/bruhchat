import app from "./app.js";
import http from 'http';
import { Server } from 'socket.io';
import cors from 'cors';
import connectDB from "./conn/conn.js";
import Chat from "./models/chats_model.js";



const server = http.createServer(app);
const io = new Server(server);
const port = 3000;

io.on('connection', (socket) => {
    console.log(`New user has joined ${socket.id}`);

    socket.on("message", data => {
        const message = new Chat({
            sender: data.sender,
            message: data.message
        });
        message.save().then(() => console.log("New message saved")).catch((err) => console.log(err));
        io.emit("message", message);
    });

});

app.use(cors());

import chatRouter from './routes/chat_routers.js';;

app.use("/api/v1", chatRouter);

app.get('/', (req, res) => {
    res.send("Server is working (-_-)")
});

server.listen(port, () => {
    connectDB();
    console.log(`Server is running on http://localhost:${port}`);
});