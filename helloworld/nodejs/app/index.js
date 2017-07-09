var http = require('http');

var os = require('os');

var ips = [];
var ifaces = os.networkInterfaces();

Object.keys(ifaces).forEach(function (ifname) {
    var alias = 0;

    ifaces[ifname].forEach(function (iface) {
        if ('IPv4' !== iface.family || iface.internal !== false) {
            return;
        }

        if (alias >= 1) {
            console.log(ifname + ':' + alias, iface.address);
        }
        else {
            console.log(ifname, iface.address);
            ips.push(iface.address);
        }
        ++alias;
    });
});


var server = http.createServer(function (request, response) {
    response.writeHead(200, {'Content-Type': 'text/plain'});
    response.end('Hello World!\nMy IP is ' + ips);
});

server.listen(3000, function () {
    console.log('Server running in localhost:3000');
});

