var tty = require('tty.js');

var app = tty.createServer({
  shell: 'bash',
  users: {
    testUser: 'testUserPwd'
  },
  port: 80
});

app.get('/testUser', function(req, res, next) {
  res.send('testUserPwd');
});

app.listen();
