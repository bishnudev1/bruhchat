import Chat from "../models/chats_model.js";

export const getAllChats = async (req, res) => {
    const response = await Chat.find();
    res.status(200).json({
        data: response
    });
}