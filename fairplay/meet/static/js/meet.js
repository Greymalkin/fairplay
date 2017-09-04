(function($) {

    function init() {
        $('.setMeet').on('click', function(e){
            apiCall('/api/meet/' + $(this).data('meet') +'/set').done(function(data){
                location.replace('/admin/');
            });
            e.preventDefault();
        });
        $('.setRanking').on('click', function(){
            apiCall('/api/meet/' + $(this).data('meet') +'/toggle_ranking').done(function(data){
                location.reload(true);
            })
        });

        $('#active-meet-select').on('change', function(){
            console.log(this.value);
            apiCall('/api/meet/' + this.value +'/set').done(function(data){
                location.reload(true);
            })
        })
    }

    // Django CSRF (based on django doc)
    function findCookie(cookieName) {
        var cookieValue = null;
        if (document.cookie && document.cookie !== '') {
            var tastyCookies = document.cookie.split(';');
            for (var i = 0; i < tastyCookies.length; i++) {
                var tastyCookie = $.trim(tastyCookies[i]);
                // Does this cookie string begin with the name we want?
                if (tastyCookie.substring(0, cookieName.length + 1) == (cookieName + '=')) {
                    cookieValue = decodeURIComponent(tastyCookie.substring(cookieName.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }

    function isVerbSafe(verb) {
        // these HTTP methods do not require CSRF protection
        return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(verb));
    }

    // simplified AJAX with our local API
    function apiCall(url, data, verb) {
        // console.log(url);
        // console.log(data);
        var dataFormat = null;
        if (verb === undefined) {
            // default verbs: GET if no data, POST if data
            if (data) {
                verb = 'POST';
            } else {
                verb = 'GET';
            }
        }
        if (data && verb != 'GET') {
            data = JSON.stringify(data);
        }
        var callOptions = $.extend({
            url: url,
            data: data,
            type: verb
        }, djangoCsrfSettings);

        if (data) {
            callOptions.contentType = 'application/json';
        }

        // console.log('ajax options:', callOptions);
        return $.ajax(callOptions);
    }


    var djangoCSRFToken = findCookie('csrftoken');
    var djangoCsrfSettings = {
        crossDomain: false,
        beforeSend: function(jqxhr, settingsObject) {
            if (!isVerbSafe(settingsObject.type)) {
                // Send the token to same-origin, relative URLs only.
                // Send the token only if the method warrants CSRF protection
                // Using the CSRFToken value acquired earlier
                jqxhr.setRequestHeader("X-CSRFToken", djangoCSRFToken);
            }
        }
    };
    $(document).ready(init);

})(grp.jQuery);