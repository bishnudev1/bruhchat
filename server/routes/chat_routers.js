import express from 'express';
import { getAllChats } from '../controllers/chat_controllers.js';

const router = express.Router();

router.route('/chats').get(getAllChats);

export default router;