import mongoose from "mongoose";

const chatSchema = new mongoose.Schema({
    sender: {
        type: String,
        required: true
    },
    message: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true
    },
    createdAt: {
        type: String,
        required: true
    }
});

const chat = new mongoose.model("chats", chatSchema);

export default chat;