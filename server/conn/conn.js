import mongoose, { connections } from "mongoose";

const connectDB = async () => {
    const { connection } = await mongoose.connect("mongodb://localhost:27017/bruhchat", {
        useNewUrlParser: true,
        useUnifiedTopology: true
    });

    if (connection) {
        console.log("Connected to DB");
    }
}

export default connectDB;