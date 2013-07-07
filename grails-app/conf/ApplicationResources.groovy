modules = {
    application {
        resource url:'js/application.js'
    }

    base {
        resource url:'http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css', exclude:'minify'
        resource url:'http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css', exclude:'minify'
        //resource url:'http://netdna.bootstrapcdn.com/bootswatch/2.3.2/cerulean/bootstrap.min.css', exclude:'minify'
        //resource url:'http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css', exclude:'minify'
        resource url:'http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css'
        resource id:'app.css', url: 'css/app.css'

        resource url:'http://code.jquery.com/jquery-1.10.1.min.js', exclude:'minify'
        resource url:'http://code.jquery.com/jquery-migrate-1.2.1.min.js', exclude:'minify'
        resource url:'http://code.jquery.com/ui/1.10.3/jquery-ui.js'
        resource url:'http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js', exclude:'minify'
    }
}