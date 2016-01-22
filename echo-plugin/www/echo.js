
var exec = require('cordova/exec'),
    utils = require('cordova/utils');

module.exports = function(successCallback, errorCallback, message) {
    var action = 'echo';
    var args = [ message ];

    exec(successCallback, errorCallback, "Echo", action, args);
};
