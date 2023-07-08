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
    sentAt: {
        type: Date,
        default: Date.now()
    }
});

const chat = new mongoose.model("chats", chatSchema);

export default chat;