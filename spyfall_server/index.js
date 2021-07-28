var express = require('express');
var socket = require('socket.io');

// App setup
var app = express();
const port = process.env.PORT || 4000;
var server = app.listen(port, function() {
    console.log('listening for requests on port ' + port + ',');
});

// Static files
app.use(express.static('public'));

function newGameId() {
    var result = '';
    var chars  = 'abcdefghijklmnopqrstuvwxyz0123456789';
    var charsL = chars.length;
    for (var i = 0; i < 5; i++ ) {
        result += chars.charAt(Math.floor(Math.random() * charsL));
    }
    return result;
}

function newSeed() {
    return Math.random().toString(36).substring(7);
}

var players = new Map();

var usernames = new Map();

// Socket setup & pass server
var io = socket(server);
io.on('connection', (socket) => {

    console.log('made socket connection', socket.id);

    socket.once('disconnect', function() {
        //usernames.delete(socket.id);
        for (let [key, value] of players) {
            value = value.filter(i => i != socket.id); //please work
            if (value.length == 0) players.delete(key);
        }
    });

    socket.on('hostGame', (username) => {

        let gameId = newGameId();
        socket.join(gameId);
        players.set(gameId, [socket.id]);

        //usernames.set(socket.id, username);
        socket.username = username;

        socket.emit('hostingStarted', gameId);
        console.log('Hosting on ' + gameId);
    });

    socket.on('joinGame', ({gameId, username}) => {
        try {
            socket.join(gameId);
            players.get(gameId).push(socket.id);

            //usernames.set(socket.id, username);
            socket.username = username;

            io.to(gameId).emit('updatePlayers', players.get(gameId));

        } catch {
            socket.emit('joinGameError');
        }
    });

    socket.on('startGame', (gameId) => {
        io.to(gameId).emit('gameStarted', newSeed());
    });

});