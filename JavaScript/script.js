var cache = new Array();
var selected = -1;

/*
*   name : function load(event)
*   part : Search
*   brief : Send request to the server and display the result
*   param : event   Contains the keycode of the keyboard key
*/
function load(event) {
    if (event.keyCode == 40 || event.keyCode == 38 || event.keyCode == 13){
        choose(selected, event.keyCode);
    }else {
        selected = -1;
        var txt = $("#txtSearch").val();
        if (txt != "") {
            $("#loupe").hide();
            $("#loader").show();
            $.getJSON(
                "../Serveur/data.php", 
                {
                    "action":"getSearch",
                    "contenu":txt
                },
                /*
                *   brief : Display the result if it's possible
                *   param : result   type : Array
                *                    brief: Contains the result of the request
                */
                function(result){
                    cache = result;
                    $("#suggest").empty();
                    if (result.feedback == "ok") {
                        for (i = 0; i < result.result.length; i++) {
                            $("#suggest").append("<li class=\"liSearch\" id=\"res" + i + "\" onclick=\'choose(" + i + ")\'> " + result.result[i].tag_name + " </li>");
                        }
                    } else {
                        $("#suggest").append("<li>Can't connect to the database</li>");
                    }
                    $("#loader").hide();
                    $("#suggest").show();
                    $("#loupe").show();
                }
            );
        } else {
            cache.result = [];
            $("#suggest").hide();
        }
    }
}

/*
*   name : choose(key, keyboard = 0)
*   part : Search
*   brief : Select the result ( with mouse or keyboard)
*   param : key         The element which is currently selected
*           keyboard    Equal to zero if not given else contains the keycode of the keyboard key
*/
function choose(key, keyboard = 0) {
    switch(keyboard) {
        case 40:
            if (key < cache.result.length - 1){
                selected++;
                $("#res" + key).css("background-color","white");
                key++;
                $("#txtSearch").val(cache.result[key].tag_name);
                $("#res" + key).css("background-color","lightgrey");
            }
            break;
        case 38:
            if (key > 0){
                selected--;
                $("#res" + key).css("background-color","white");
                key--;
                $("#txtSearch").val(cache.result[key].tag_name);
                $("#res" + key).css("background-color","lightgrey");
            }
            break;
        default:
            console.log(keyboard);
            $("#txtSearch").val(cache.result[key].tag_name);
            cache.result = [];
            $("#suggest").hide();
            break;
    }
}