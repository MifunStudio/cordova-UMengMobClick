var exec = require('cordova/exec');

var UMengMobClick = module.exports = {

    BATCH: 'batch',
    INTERVAL: 'interval',
    YES: 'yes',
    NO: 'no',

    setLogEnabled: function(flag) {
        if(!flag) {
            flag = UMengMobClick.YES;
        }
        exec(null, null, "UMengMobClick", "setLogEnabled", [flag]);
    },
    startWithAppKey: function(appKey, reportPolicy, channelId, successCallback, errorCallback) {
        exec(successCallback, errorCallback, "UMengMobClick", "startWithAppKey", [appKey, reportPolicy, channelId]);
    },
    customEvent: function(eventId, successCallback, errorCallback) {
        exec(successCallback, errorCallback, "UMengMobClick", "customEvent", [eventId]);
    }
};
