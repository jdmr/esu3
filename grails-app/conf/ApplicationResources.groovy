modules = {
    application {
        resource url:'js/application.js'
    }

    base {
        dependsOn("jquery,jquery-ui,bootstrap")
        resource url:'http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css', exclude:'minify'
        resource url:'http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css'
        resource id:'app.css', url: 'css/app.css'
    }
}