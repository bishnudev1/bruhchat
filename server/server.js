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

app.get('/', (req, res) => {
    res.send("Server is working (-_-)")
});

app.get('/chats', async (req, res) => {
    const chats = await Chat.find();
    res.status(200).json({
        data: chats
    });
});

server.listen(port, () => {
    connectDB();
    console.log(`Server is running on http://localhost:${port}`);
});