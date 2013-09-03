modules = {
    application {
        resource url:'js/application.js'
    }

    base {
        resource url:'http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.no-icons.min.css', exclude:'minify'
        resource url:'http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css', exclude:'minify'
        resource url:'http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css'
        resource id:'app.css', url: 'css/app.css'

        resource url:'http://code.jquery.com/jquery-1.10.1.min.js', exclude:'minify'
        resource url:'http://code.jquery.com/jquery-migrate-1.2.1.min.js', exclude:'minify'
        resource url:'http://code.jquery.com/ui/1.10.3/jquery-ui.js'
        resource url:'http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js', exclude:'minify'
    }
}