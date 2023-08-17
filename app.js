const WebSocket = require('ws');

// 创建WebSocket服务器
const wss = new WebSocket.Server({ port: 3000 });

// 监听连接事件
wss.on('connection', (ws) => {
    console.log('Client connected');

    // 监听消息事件
    ws.on('message', (message) => {
        console.log('Received message:', message);

        // 向所有连接的客户端发送消息
        wss.clients.forEach((client) => {
            if (client.readyState === WebSocket.OPEN) {
                client.send(Buffer.from(message).toString());
            }
        });
    });

    // 监听关闭事件~
    ws.on('close', () => {
        console.log('Client disconnected');
    });
});
