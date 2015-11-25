function connectSign(device) {
    var $ = grp.jQuery;

    var data = {
        "device": device,
    };

    $.post('/ledsign/', JSON.stringify(data))
    .success(function(data) {
        alert("Sign successfully connected!");
    })
    .error(function(data) {
        alert("Could not connect sign! \n"+data);
    });
}
